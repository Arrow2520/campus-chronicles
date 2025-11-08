from flask import Flask, jsonify, request  # Import 'request'
from flask_cors import CORS
import mysql.connector

app = Flask(__name__)
CORS(app)

db_config = {
    'host': '127.0.0.1',
    'user': 'root',
    'password': '',
    'database': 'campus_chronicles_db'
}


# --- API Endpoints (Routes) ---

@app.route('/')
def index():
    return "Hello, the Campus Chronicles API is running!"


# NEW: Search endpoint
# Example: /api/search?q=Clock
@app.route('/api/search', methods=['GET'])
def search_places():
    query = request.args.get('q', '')  # Get search term from query parameter
    if not query:
        return jsonify([])

    try:
        conn = mysql.connector.connect(**db_config)
        cursor = conn.cursor(dictionary=True)

        # Use LIKE for a simple "starts with" search
        sql_query = "SELECT name, slug FROM places WHERE name LIKE %s"
        # The % after the query is a wildcard for SQL
        cursor.execute(sql_query, (query + '%',))

        results = cursor.fetchall()
        cursor.close()
        conn.close()
        return jsonify(results)
    except Exception as e:
        return jsonify({"error": str(e)})


# NEW: Get a single place by its slug
# Example: /api/places/clock-tower
@app.route('/api/places/<string:slug>', methods=['GET'])
def get_place_by_slug(slug):
    try:
        conn = mysql.connector.connect(**db_config)
        cursor = conn.cursor(dictionary=True)

        # First, get the place details
        cursor.execute("SELECT * FROM places WHERE slug = %s", (slug,))
        place = cursor.fetchone()

        if not place:
            return jsonify({"error": "Place not found"}), 404

        # Next, get all images for that place
        cursor.execute("SELECT image_url FROM images WHERE place_id = %s", (place['id'],))
        images = cursor.fetchall()

        # Add the image URLs to our place dictionary
        place['images'] = [image['image_url'] for image in images]

        cursor.close()
        conn.close()
        return jsonify(place)
    except Exception as e:
        return jsonify({"error": str(e)})


# --- Run the App ---
if __name__ == '__main__':
    app.run(debug=True)