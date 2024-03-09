-- Create UserRole table
CREATE TABLE UserRole (
    role_id INT PRIMARY KEY AUTO_INCREMENT,
    role_name VARCHAR(255) NOT NULL
);

-- Create User table
CREATE TABLE User (
    user_id INT PRIMARY KEY AUTO_INCREMENT,
    username VARCHAR(255) NOT NULL,
    password VARCHAR(255) NOT NULL, -- Consider hashing passwords for security
    email VARCHAR(255) NOT NULL UNIQUE,
    university_id VARCHAR(255) NOT NULL,
    role_id INT,
    FOREIGN KEY (role_id) REFERENCES UserRole(role_id)
);

-- Create OfficeSpace table
CREATE TABLE OfficeSpace (
    office_id INT PRIMARY KEY AUTO_INCREMENT,
    location VARCHAR(255) NOT NULL,
    size FLOAT NOT NULL,
    features TEXT,
    is_occupied BOOLEAN NOT NULL DEFAULT FALSE
);

-- Create Request table
CREATE TABLE Request (
    request_id INT PRIMARY KEY AUTO_INCREMENT,
    user_id INT NOT NULL,
    office_id INT NOT NULL,
    status VARCHAR(255) NOT NULL,
    created_at DATETIME DEFAULT CURRENT_TIMESTAMP,
    FOREIGN KEY (user_id) REFERENCES User(user_id),
    FOREIGN KEY (office_id) REFERENCES OfficeSpace(office_id)
);

-- Create Assignment table
CREATE TABLE Assignment (
    assignment_id INT PRIMARY KEY AUTO_INCREMENT,
    user_id INT NOT NULL,
    office_id INT NOT NULL,
    start_date DATE NOT NULL,
    end_date DATE NOT NULL,
    FOREIGN KEY (user_id) REFERENCES User(user_id),
    FOREIGN KEY (office_id) REFERENCES OfficeSpace(office_id)
);

-- Create SystemSettings table
CREATE TABLE SystemSettings (
    setting_id INT PRIMARY KEY AUTO_INCREMENT,
    setting_name VARCHAR(255) NOT NULL,
    setting_value VARCHAR(255) NOT NULL
);
