create table skill(
skill_id INT PRIMARY KEY auto_increment,
domain_id INT,
skill_name varchar(200),
foreign key (domain_id) references domain(domain_id)
); 
