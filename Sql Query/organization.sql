CREATE TABLE organization (
    org_id INT PRIMARY KEY AUTO_INCREMENT,
    company_name VARCHAR(255),
    created_by_user CHAR(36),
    company_url VARCHAR(255),
    address TEXT,
    contact_no VARCHAR(20),
    about_org TEXT,
    created_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
    FOREIGN KEY (created_by_user) REFERENCES user_details(user_id) ON DELETE SET NULL
);
