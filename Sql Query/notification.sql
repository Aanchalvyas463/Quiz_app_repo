create table notification(
notification_id INT PRIMARY KEY auto_increment,
user_id CHAR(36),
message_content TEXT,
is_delivered BOOLEAN,
is_read BOOLEAN,
created_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
FOREIGN KEY (user_id) REFERENCES user_details(user_id) ON DELETE CASCADE
);
