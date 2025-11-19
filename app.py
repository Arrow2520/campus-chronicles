from flask import Flask, jsonify, request, render_template
from flask_cors import CORS
import mysql.connector

app = Flask(__name__)
CORS(app)

db_config = {
    'host': '127.0.0.1',
    'user': 'root',
    'password': '',  # Enter your password here if you have one
    'database': 'campus_chronicles_db'
}


def get_db_connection():
    return mysql.connector.connect(**db_config)


# --- PAGE ROUTES (Renders HTML) ---

@app.route('/')
def home():
    return render_template('index.html')


@app.route('/hostels')
def hostels_page():
    try:
        conn = get_db_connection()
        cursor = conn.cursor(dictionary=True)

        # Join places with images to get the main image
        query = """
                SELECT p.*, i.image_url
                FROM places p
                         LEFT JOIN images i ON p.id = i.place_id
                WHERE p.category = 'Hostel'
                GROUP BY p.id \
                """
        cursor.execute(query)
        hostels_data = cursor.fetchall()

        cursor.close()
        conn.close()

        # Pass the data to the HTML template
        return render_template('hostels.html', hostels=hostels_data)
    except Exception as e:
        return str(e)


@app.route('/landmarks')
def landmarks_page():
    try:
        conn = get_db_connection()
        cursor = conn.cursor(dictionary=True)

        # Get everything that IS NOT a hostel
        query = """
                SELECT p.*, i.image_url
                FROM places p
                         LEFT JOIN images i ON p.id = i.place_id
                WHERE p.category != 'Hostel'
                GROUP BY p.id \
                """
        cursor.execute(query)
        landmarks_data = cursor.fetchall()

        cursor.close()
        conn.close()

        return render_template('landmarks.html', landmarks=landmarks_data)
    except Exception as e:
        return str(e)


# --- API ROUTES (For specific data fetching if needed) ---

@app.route('/api/search', methods=['GET'])
def search_places():
    query = request.args.get('q', '')
    if not query:
        return jsonify([])
    try:
        conn = get_db_connection()
        cursor = conn.cursor(dictionary=True)
        sql_query = "SELECT name, slug, category FROM places WHERE name LIKE %s"
        cursor.execute(sql_query, (f"%{query}%",))
        results = cursor.fetchall()
        cursor.close()
        conn.close()
        return jsonify(results)
    except Exception as e:
        return jsonify({"error": str(e)})


@app.route('/place/<slug>')
def place_detail(slug):
    try:
        conn = get_db_connection()
        cursor = conn.cursor(dictionary=True)

        # 1. Fetch the specific place details
        cursor.execute("SELECT * FROM places WHERE slug = %s", (slug,))
        place = cursor.fetchone()

        if not place:
            return "Place not found", 404

        # 2. Fetch all images associated with this place
        cursor.execute("SELECT image_url FROM images WHERE place_id = %s", (place['id'],))
        images = cursor.fetchall()

        cursor.close()
        conn.close()

        return render_template('details.html', place=place, images=images)
    except Exception as e:
        return str(e)


if __name__ == '__main__':
    app.run(debug=True)