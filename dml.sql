-- Users table sample data
INSERT INTO Users (name, email, role, balance)
VALUES ('Ramesh Kumar', 'ramesh@example.com', 'parent', 0.00);

INSERT INTO Users (name, email, role, balance)
VALUES ('Suresh Singh', 'suresh@example.com', 'parent', 0.00);

INSERT INTO Users (name, email, role, balance)
VALUES ('Chotu', 'chotu@example.com', 'child', 100.00);

INSERT INTO Users (name, role, balance)
VALUES ('Pappu', 'child', 150.00);


-- Tasks table sample data
INSERT INTO Tasks (title, description, reward_amount, created_by)
VALUES ('Clean Room', 'Clean your room thoroughly', 50.00, 1);

INSERT INTO Tasks (title, description, reward_amount, created_by)
VALUES ('Do Homework', 'Finish your math and science homework', 30.00, 2);

-- Assigned_tasks table sample data
--
-- Record 1: Status 'assigned' – Task is assigned.
INSERT INTO Assigned_tasks (task_id, child_id, status, assigned_by, due_date)
VALUES (1, 3, 'assigned', 1, CURRENT_TIMESTAMP + 2);

-- Record 2: Status 'in_progress' – Task in progress.
INSERT INTO Assigned_tasks (task_id, child_id, status, assigned_by, due_date)
VALUES (2, 4, 'in_progress', 2, CURRENT_TIMESTAMP + 3);

-- Record 3: Status 'submitted' – Due date passed and task is submitted.
INSERT INTO Assigned_tasks (task_id, child_id, status, assigned_by, due_date, completion_date)
VALUES (1, 3, 'submitted', 1, CURRENT_TIMESTAMP - 1, CURRENT_TIMESTAMP);

-- Record 4: Status 'approved' – Parent approved the task.
INSERT INTO Assigned_tasks (task_id, child_id, status, assigned_by, due_date, completion_date)
VALUES (2, 4, 'approved', 2, CURRENT_TIMESTAMP + 3, CURRENT_TIMESTAMP);


-- Transactions table sample data
--
-- Record 1: Pending transaction – Payment process pending.
INSERT INTO Transactions (parent_id, child_id, amount, task_id, status)
VALUES (1, 3, 50.00, 1, 'pending');

-- Record 2: Success transaction – Payment successfully processed.
INSERT INTO Transactions (parent_id, child_id, amount, task_id, status)
VALUES (2, 4, 30.00, 2, 'success');

-- Record 3: Failed transaction – Payment process failed.
INSERT INTO Transactions (parent_id, child_id, amount, task_id, status)
VALUES (1, 3, 50.00, 1, 'failed');

-- Record 4: Another Pending transaction – Duplicate scenario different edge case.
INSERT INTO Transactions (parent_id, child_id, amount, task_id, status)
VALUES (2, 4, 30.00, 2, 'pending');

