from flask import Flask, jsonify, request, render_template
from flask_cors import CORS
import mysql.connector
from flask_jwt_extended import (
    JWTManager,
    create_access_token,
    jwt_required,
    get_jwt_identity,
    get_jwt
)
from werkzeug.security import generate_password_hash, check_password_hash

app = Flask(__name__)
CORS(app, supports_credentials=True)

# NEW: Setup for JWT (JSON Web Tokens)
app.config["JWT_SECRET_KEY"] = "super-secret-key-change-this"
app.config["JWT_COOKIE_CSRF_PROTECT"] = False
jwt = JWTManager(app)

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

@app.route('/login')
def login_page():
    return render_template('login.html')

@app.route('/signup')
def signup_page():
    return render_template('signup.html')

@app.route('/profile')
def profile_page():
    return render_template('profile.html')


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
    conn = get_db_connection()
    cursor = conn.cursor(dictionary=True)

    cursor.execute("SELECT * FROM places WHERE slug = %s", (slug,))
    place = cursor.fetchone()
    if not place:
        cursor.close()
        conn.close()
        return "Place not found", 404

    cursor.execute("SELECT image_url FROM images WHERE place_id = %s", (place['id'],))
    images = cursor.fetchall()

    cursor.execute("""
                   SELECT c.comment_text,
                          c.created_at,
                          COALESCE(u.name, u.email) AS display_name
                   FROM comments c
                   JOIN users u ON c.user_id = u.id
                   WHERE c.place_id = %s
                   ORDER BY c.created_at DESC
                   """, (place['id'],))

    comments = cursor.fetchall()

    cursor.close()
    conn.close()

    return render_template(
        'details.html',
        place=place,
        images=images,
        comments=comments
    )



@app.route('/api/register', methods=['POST'])
def register():
    data = request.json
    email = data.get('email')
    roll_number = data.get('roll_number')
    password = data.get('password')

    if not email or not password:
        return jsonify({"error": "Missing fields"}), 400

    hashed_password = generate_password_hash(password)

    try:
        conn = get_db_connection()
        cursor = conn.cursor()
        cursor.execute("SELECT id FROM users WHERE email = %s", (email,))
        if cursor.fetchone():
            return jsonify({"error": "Email already exists"}), 409

        cursor.execute("INSERT INTO users (email, roll_number, password_hash, role) VALUES (%s, %s, %s, 'user')",
                       (email, roll_number, hashed_password))
        conn.commit()
        cursor.close()
        conn.close()
        return jsonify({"message": "Success"}), 201
    except Exception as e:
        return jsonify({"error": str(e)}), 500


@app.route('/api/login', methods=['POST'])
def login():
    data = request.json
    user_identifier = data.get('user_identifier')
    password = data.get('password')

    conn = get_db_connection()
    cursor = conn.cursor(dictionary=True)
    query = "SELECT * FROM users WHERE email = %s OR roll_number = %s"
    cursor.execute(query, (user_identifier, user_identifier))
    user = cursor.fetchone()
    cursor.close()
    conn.close()

    if user and check_password_hash(user['password_hash'], password):
        access_token = create_access_token(
            identity=str(user['id']),
            additional_claims={
                "role": user["role"],
                "email": user["email"]
            }
        )

        return jsonify(access_token=access_token, role=user['role'], email=user['email'])

    return jsonify({"error": "Invalid credentials"}), 401


# NEW: Admin Delete Route
@app.route('/api/places/<int:place_id>', methods=['DELETE'])
@jwt_required()
def delete_place(place_id):
    user_id = int(get_jwt_identity())
    claims = get_jwt()

    if claims["role"] != "admin":
        return jsonify({"error": "Admins only"}), 403

    conn = get_db_connection()
    cursor = conn.cursor()
    cursor.execute("DELETE FROM places WHERE id = %s", (place_id,))
    conn.commit()
    conn.close()

    return jsonify({"message": "Deleted successfully"})



# NEW: Add Comment Route
@app.route('/api/places/<int:place_id>/comments', methods=['POST'])
@jwt_required()
def add_comment(place_id):
    user_id = int(get_jwt_identity())

    data = request.get_json()
    comment_text = data.get("comment")

    if not comment_text:
        return jsonify({"error": "Empty comment"}), 400

    conn = get_db_connection()
    cursor = conn.cursor()
    cursor.execute(
        "INSERT INTO comments (user_id, place_id, comment_text) VALUES (%s, %s, %s)",
        (user_id, place_id, comment_text)
    )
    conn.commit()
    conn.close()

    return jsonify({"message": "Comment added"}), 201

@app.route('/api/profile', methods=['GET'])
@jwt_required()
def get_profile():
    user_id = int(get_jwt_identity())

    conn = get_db_connection()
    cursor = conn.cursor(dictionary=True)
    cursor.execute(
        "SELECT email, roll_number, name FROM users WHERE id = %s",
        (user_id,)
    )
    user = cursor.fetchone()
    cursor.close()
    conn.close()

    return jsonify(user)

@app.route('/api/profile', methods=['PUT'])
@jwt_required()
def update_profile():
    user_id = int(get_jwt_identity())
    data = request.get_json()
    name = data.get("name")

    if not name:
        return jsonify({"error": "Name cannot be empty"}), 400

    conn = get_db_connection()
    cursor = conn.cursor()
    cursor.execute(
        "UPDATE users SET name = %s WHERE id = %s",
        (name, user_id)
    )
    conn.commit()
    cursor.close()
    conn.close()

    return jsonify({"message": "Profile updated"})


if __name__ == '__main__':
    app.run(debug=True)