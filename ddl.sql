--DROP TABLE USERS;
--DROP TABLE tasks;
--DROP TABLE Assigned_tasks;
--DROP TABLE transactions;


-- Users table (Parents & childs)
CREATE TABLE Users (
    user_id NUMBER GENERATED AS IDENTITY PRIMARY KEY,
    name VARCHAR2(255) NOT NULL,
    email VARCHAR2(255) UNIQUE,
    role VARCHAR2(50) CHECK (role IN ('parent', 'child')) NOT NULL,
    balance NUMBER(10,2) DEFAULT 0.0,
    created_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP
);

-- tasks table (Task listing - parent created tasks)
CREATE TABLE Tasks (
    task_id NUMBER GENERATED AS IDENTITY PRIMARY KEY,
    title VARCHAR2(255) NOT NULL,
    description VARCHAR2(255),
    reward_amount NUMBER(10,2) NOT NULL,
    created_by NUMBER,
    created_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
    CONSTRAINT fk_task_created_by FOREIGN KEY (created_by) REFERENCES Users(user_id)
);

-- Assigned_tasks table (child-specific assignments)
CREATE TABLE Assigned_tasks (
    assignment_id NUMBER GENERATED AS IDENTITY PRIMARY KEY,
    task_id NUMBER,
    child_id NUMBER,
    status VARCHAR2(20) CHECK (status IN  ('assigned', 'in_progress', 'submitted', 'approved', 'rejected', 'paid', 'overdue')) ,
    assigned_by NUMBER,
    due_date TIMESTAMP,
    completion_date TIMESTAMP,
    created_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
    CONSTRAINT fk_assigned_child FOREIGN KEY (child_id) REFERENCES Users(user_id),
    CONSTRAINT fk_assigned_task FOREIGN KEY (task_id) REFERENCES tasks(task_id),
    CONSTRAINT fk_task_assigned_by FOREIGN KEY (assigned_by) REFERENCES Users(user_id)
);


-- Transactions table (payment records - Parent pays for completed tasks)
CREATE TABLE Transactions (
    transaction_id NUMBER GENERATED AS IDENTITY PRIMARY KEY,
    parent_id NUMBER,
    child_id NUMBER,
    amount NUMBER(10,2) NOT NULL,
    task_id NUMBER,
    status VARCHAR2(20) DEFAULT 'pending' CHECK (status IN ('pending', 'success', 'failed')) ,
    created_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
    CONSTRAINT fk_transaction_parent FOREIGN KEY (parent_id) REFERENCES Users(user_id),
    CONSTRAINT fk_transaction_child FOREIGN KEY (child_id) REFERENCES Users(user_id),
    CONSTRAINT fk_transaction_task FOREIGN KEY (task_id) REFERENCES tasks(task_id)
);

