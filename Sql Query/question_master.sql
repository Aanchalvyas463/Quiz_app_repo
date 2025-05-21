create table question_master(
question_id INT primary key auto_increment,
skill_id int,
question_text text,
difficulty_level ENUM('Easy', 'Medium', 'Hard'),
standard_answer TEXT,
created_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
FOREIGN KEY (skill_id) REFERENCES skill(skill_id) ON DELETE CASCADE
);