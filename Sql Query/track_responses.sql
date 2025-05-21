CREATE TABLE track_responses (
    track_id INT PRIMARY KEY AUTO_INCREMENT,
    user_id CHAR(36),
    user_response_id INT,
    access_time TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
    FOREIGN KEY (user_id) REFERENCES user_details(user_id) ON DELETE CASCADE,
    FOREIGN KEY (user_response_id) REFERENCES user_response(user_response_id) ON DELETE CASCADE
);