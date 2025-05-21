from flask import Flask, request, jsonify
import os
import uuid
import shutil
import mysql.connector
from werkzeug.utils import secure_filename
from flask_cors import CORS


app = Flask(__name__)
CORS(app)


# Configure upload folder
UPLOAD_FOLDER = 'uploads/'
app.config['UPLOAD_FOLDER'] = UPLOAD_FOLDER
os.makedirs(UPLOAD_FOLDER, exist_ok=True)

# Database connection
conn = mysql.connector.connect(
    host="localhost",
    user="root",
    password="Aanchalvyas463",  # Replace with your actual password
    database="quiz_app"
)
cursor = conn.cursor()

@app.route('/register', methods=['POST'])
def register():
    try:
        # Retrieve form data
        first_name = request.form.get('first_name')
        last_name = request.form.get('last_name')
        email_id = request.form.get('email_id')
        login_password = request.form.get('login_password')
        user_role = request.form.get('user_role')

        # Validate user_role
        if user_role not in ['User', 'Programmer', 'Organization']:
            return jsonify({'error': 'Invalid user_role'}), 400

        # Retrieve and save image
        image = request.files.get('image')
        if image:
            filename = secure_filename(f"{uuid.uuid4()}_{image.filename}")
            image_path = os.path.join(app.config['UPLOAD_FOLDER'], filename)
            image.save(image_path)
            profile_url = f"http://localhost:5000/{UPLOAD_FOLDER}{filename}"
        else:
            profile_url = None

        # Generate unique user_id
        user_id = str(uuid.uuid4())

        # Insert into user_details table
        user_sql = """
            INSERT INTO user_details (user_id, first_name, last_name, email_id, login_password, user_role, profile_url)
            VALUES (%s, %s, %s, %s, %s, %s, %s)
        """
        user_values = (user_id, first_name, last_name, email_id, login_password, user_role, profile_url)
        cursor.execute(user_sql, user_values)
        conn.commit()

        # If user_role is 'Organization', insert into organization table
        if user_role == 'Organization':
            company_name = request.form.get('company_name')
            company_url = request.form.get('company_url')
            address = request.form.get('address')
            contact_no = request.form.get('contact_no')
            about_org = request.form.get('about_org')

            org_sql = """
                INSERT INTO organization (company_name, created_by_user, company_url, address, contact_no, about_org)
                VALUES (%s, %s, %s, %s, %s, %s)
            """
            org_values = (company_name, user_id, company_url, address, contact_no, about_org)
            cursor.execute(org_sql, org_values)
            conn.commit()

        return jsonify({'message': 'User registered successfully', 'user_id': user_id}), 201

    except Exception as e:
        conn.rollback()
        return jsonify({'error': str(e)}), 500
    

@app.route('/domains', methods=['GET'])
def get_domains():
    try:
        cursor = conn.cursor(dictionary=True)
        cursor.execute("SELECT * FROM domain")
        domains = cursor.fetchall()
        return jsonify(domains), 200
    except Exception as e:
        return jsonify({'error': str(e)}), 500
    finally:
        cursor.close()


@app.route('/skills/domains/<int:domain_id>', methods=['GET'])
def get_skills_by_domain(domain_id):
    try:
        # Create a new cursor using dictionary format
        cursor = conn.cursor(dictionary=True)
        
        # Execute SQL query to fetch skills for the given domain_id
        cursor.execute("SELECT * FROM skill WHERE domain_id = %s", (domain_id,))
        skills = cursor.fetchall()
        
        # Check if any skills were found
        if skills:
            return jsonify(skills), 200
        else:
            return jsonify({'message': 'No skills found for the given domain_id'}), 404
    except Exception as e:
        # Handle any errors that occur during the database query
        return jsonify({'error': str(e)}), 500
    finally:
        # Close the cursor
        cursor.close()

@app.route('/add_notifications', methods=['POST'])
def add_notification():
    if not request.is_json:
        return jsonify({"error": "Request must be JSON"}), 415
    data = request.get_json()
    data = request.get_json()
    user_id = data.get('user_id')
    message_content = data.get('message_content')
    is_delivered = data.get('is_delivered', 0)
    is_read = data.get('is_read', 0)

    if not user_id or not message_content:
        return jsonify({'error': 'user_id and message_content are required'}), 400

    cursor = mysql.connection.cursor()
    insert_query = """
        INSERT INTO notification (user_id, message_content, is_delivered, is_read)
        VALUES (%s, %s, %s, %s)
    """
    cursor.execute(insert_query, (user_id, message_content, is_delivered, is_read))
    mysql.connection.commit()
    cursor.close()

    return jsonify({'message': 'Notification added successfully'}), 201


@app.route('/add_test_detail', methods=['POST'])
def add_test_detail():
    if not request.is_json:
        return jsonify({"error": "Request must be JSON"}), 415

    data = request.get_json()
    user_id = data.get('user_id')
    skill_id = data.get('skill_id')

    if not user_id or not skill_id:
        return jsonify({'error': 'user_id and skill_id are required'}), 400

    try:
        cursor = mysql.connection.cursor()
        insert_query = """
            INSERT INTO test_detail (user_id, skill_id)
            VALUES (%s, %s)
        """
        cursor.execute(insert_query, (user_id, skill_id))
        mysql.connection.commit()
        cursor.close()

        return jsonify({'message': 'Test detail added successfully'}), 201
    except Exception as e:
        return jsonify({'error': str(e)}), 500



if __name__ == '__main__':
    app.run(debug=True, host='0.0.0.0', port=5000)

