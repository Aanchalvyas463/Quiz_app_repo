CREATE TABLE ai_feedback (
    ai_feedback_id INT PRIMARY KEY AUTO_INCREMENT,
    user_response_id INT,
    ai_generated_feedback TEXT,
    accuracy_score INT,
    relevance_score int,
    clarity_score int,
    completeness_score int,
    logical_flow_score int,
    test_score int,
    feedback_date TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
    FOREIGN KEY (user_response_id) REFERENCES user_response(user_response_id) ON DELETE CASCADE
);