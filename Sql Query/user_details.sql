create table user_details(
user_id CHAR(36) PRIMARY KEY,
first_name VARCHAR(100),
last_name VARCHAR(100),
email_id VARCHAR(255) UNIQUE,
login_password VARCHAR(355),
user_role ENUM('User', 'Programmer', 'Organization'),
profile_url VARCHAR(355),
created_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP
);
