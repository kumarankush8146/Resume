--DROP TABLE Users;
--DROP TABLE General_Tasks;
--DROP TABLE User_Tasks;
--DROP TABLE Goals;
--DROP TABLE Frequency;
--DROP TABLE Transactions;



-- Users table (Parents & childs)
CREATE TABLE Users (
    user_id NUMBER GENERATED AS IDENTITY PRIMARY KEY,
    name VARCHAR2(255) NOT NULL,
    email VARCHAR2(255) UNIQUE,
    role VARCHAR2(50) CHECK (role IN ('parent', 'child')) NOT NULL,
    REWARD_POINTS NUMBER(10,2) DEFAULT 0.0,
    created_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP
);

-- System generated tasks
CREATE TABLE General_Tasks (
    task_id NUMBER GENERATED AS IDENTITY PRIMARY KEY,
    title VARCHAR2(255) NOT NULL,
    description VARCHAR2(255),
    reward_points NUMBER(10,2) NOT NULL,
    created_by VARCHAR2(10) DEFAULT 'SYSTEM', --system 
    created_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP
);


-- tasks table (Task listing - parent created tasks)
CREATE TABLE User_Tasks (
    task_id NUMBER GENERATED AS IDENTITY PRIMARY KEY,
    created_by NUMBER, -- generally parent user id
    title VARCHAR2(255) NOT NULL,
    description VARCHAR2(255),
    reward_points NUMBER(10,2) NOT NULL,
    assigned_to NUMBER,-- should be child from user table
    due_date TIMESTAMP,
    completion_date TIMESTAMP,
    priority VARCHAR2(10) CHECK (priority IN ('low', 'medium', 'high')),
    progress NUMBER(3,0) DEFAULT 0,  -- progress percentage (0 to 100), function/trigger can update this
    status VARCHAR2(20) CHECK (status IN ('assigned', 'in_progress', 'submitted', 'approved', 'rejected', 'paid', 'overdue')),
    frequency VARCHAR2(20),  -- e.g., 'daily', 'weekly', 'monthly'
    category VARCHAR2(50),  -- e.g., 'study', 'chores', 'homework'
    created_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
    CONSTRAINT fk_ut_created_by FOREIGN KEY (created_by) REFERENCES Users(user_id),
    CONSTRAINT fk_ut_assigned_to FOREIGN KEY (assigned_to) REFERENCES Users(user_id)
);


CREATE TABLE Frequency   (
    frequency_id NUMBER GENERATED AS IDENTITY PRIMARY KEY,
    frequency_name VARCHAR2(50) UNIQUE NOT NULL  -- e.g., 'daily', 'weekly', 'monthly'
);


-- Goals
CREATE TABLE GOALS (
    goal_id NUMBER GENERATED AS IDENTITY PRIMARY KEY,
    category VARCHAR2(20),  -- e.g., 'daily', 'weekly', 'monthly',
    category_id NUMBER, -- e.g. 1 2 3
    child_id NUMBER, -- child user
    created_by NUMBER, -- parent user
    created_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
    status VARCHAR2(20) CHECK (status IN  ('assigned', 'in_progress', 'submitted', 'approved', 'rejected', 'paid', 'overdue')) NOT NULL,
    due_date TIMESTAMP,
    completion_date TIMESTAMP,
    progress NUMBER(3,0) DEFAULT 0,  -- progress percentage (0 to 100), function/trigger can update this
    CONSTRAINT fk_goal_child FOREIGN KEY (child_id) REFERENCES Users(user_id),          
    CONSTRAINT fk_goal_created_by FOREIGN KEY (created_by) REFERENCES Users(user_id),
    CONSTRAINT fk_goal_category FOREIGN KEY (category_id) REFERENCES Frequency(frequency_id)
);



-- Transactions table (payment records - Parent pays for completed tasks)
CREATE TABLE Transactions (
    transaction_id NUMBER GENERATED AS IDENTITY PRIMARY KEY,
    parent_id NUMBER,
    child_id NUMBER,
    reward_points NUMBER(10,2) NOT NULL,
    task_id NUMBER,
    status VARCHAR2(20) DEFAULT 'pending' CHECK (status IN ('pending', 'success', 'failed')) ,
    created_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
    CONSTRAINT fk_transaction_parent FOREIGN KEY (parent_id) REFERENCES Users(user_id),
    CONSTRAINT fk_transaction_child FOREIGN KEY (child_id) REFERENCES Users(user_id)
);




