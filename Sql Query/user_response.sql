CREATE TABLE user_response (
    user_response_id INT PRIMARY KEY AUTO_INCREMENT,
    test_id INT,
    question_id INT,
    audio_file_path VARCHAR(455),
    transcribed_text TEXT,
    question_status ENUM('Answered', 'Skipped', 'Unanswered'),
    submitted_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
    FOREIGN KEY (test_id) REFERENCES test_detail(test_id) ON DELETE CASCADE,
    FOREIGN KEY (question_id) REFERENCES question_master(question_id) ON DELETE CASCADE
);