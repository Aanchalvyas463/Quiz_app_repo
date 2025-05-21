CREATE TABLE test_detail (
    test_id INT PRIMARY KEY AUTO_INCREMENT,
    user_id CHAR(36),
    skill_id INT,
    test_score DECIMAL(5,2),
    is_public BOOLEAN,
    rating TINYINT CHECK (rating BETWEEN 1 AND 5),
    review_comment TEXT,
    test_date_time TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
    FOREIGN KEY (user_id) REFERENCES user_details(user_id) ON DELETE CASCADE,
    FOREIGN KEY (skill_id) REFERENCES skill(skill_id) ON DELETE CASCADE
);
