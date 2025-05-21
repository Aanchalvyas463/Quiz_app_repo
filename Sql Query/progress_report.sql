CREATE TABLE progress_report (
    progress_id INT PRIMARY KEY AUTO_INCREMENT,
    user_id CHAR(36),
    test_id INT,
    total_question INT,
    correct_answer INT,
    accuracy_percent DECIMAL(5,2),
    weak_topic TEXT,
    attempted_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
    FOREIGN KEY (user_id) REFERENCES user_details(user_id) ON DELETE CASCADE,
    FOREIGN KEY (test_id) REFERENCES test_detail(test_id) ON DELETE CASCADE
);