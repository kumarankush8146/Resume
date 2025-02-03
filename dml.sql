INSERT INTO Users (name, email, role, REWARD_POINTS)
VALUES ('Ramesh Kumar', 'ramesh@example.com', 'parent', 0.00);

INSERT INTO Users (name, email, role, REWARD_POINTS)
VALUES ('Suresh Singh', 'suresh@example.com', 'parent', 0.00);

INSERT INTO Users (name, email, role, REWARD_POINTS)
VALUES ('Chotu', 'chotu@example.com', 'child', 50.00);

INSERT INTO Users (name, email, role, REWARD_POINTS)
VALUES ('Pappu', 'pappu@example.com', 'child', 75.00);


INSERT INTO General_Tasks (title, description, reward_points)
VALUES ('Clean Room', 'Clean your room thoroughly', 20.00);

INSERT INTO General_Tasks (title, description, reward_points)
VALUES ('Do Homework', 'Complete your math homework', 15.00);

INSERT INTO General_Tasks (title, description, reward_points)
VALUES ('Water Plants', 'Water all the plants in the house', 10.00);

INSERT INTO General_Tasks (title, description, reward_points)
VALUES ('Walk Dog', 'Take the dog for a walk in the park', 25.00);


INSERT INTO User_Tasks (created_by, title, description, reward_points, assigned_to, due_date, completion_date, priority, progress, status, frequency, category)
VALUES (1, 'Mop Floor', 'Mop the kitchen floor properly', 30.00, 3, CURRENT_TIMESTAMP + 1, NULL, 'high', 0, 'assigned', 'daily', 'chores');

INSERT INTO User_Tasks (created_by, title, description, reward_points, assigned_to, due_date, completion_date, priority, progress, status, frequency, category)
VALUES (2, 'Complete Project', 'Finish the school project on time', 50.00, 4, CURRENT_TIMESTAMP + 3, CURRENT_TIMESTAMP + 4, 'medium', 50, 'in_progress', 'weekly', 'study');

INSERT INTO User_Tasks (created_by, title, description, reward_points, assigned_to, due_date, completion_date, priority, progress, status, frequency, category)
VALUES (1, 'Prepare Lunch', 'Prepare a healthy lunch for the family', 20.00, 3, CURRENT_TIMESTAMP + 1, CURRENT_TIMESTAMP + 1, 'low', 100, 'approved', 'daily', 'chores');

INSERT INTO User_Tasks (created_by, title, description, reward_points, assigned_to, due_date, completion_date, priority, progress, status, frequency, category)
VALUES (2, 'Clean Desk', 'Organize and clean your study desk', 10.00, 4, CURRENT_TIMESTAMP + 2, NULL, 'low', 0, 'assigned', 'daily', 'chores');


INSERT INTO Frequency (frequency_name)
VALUES ('daily');

INSERT INTO Frequency (frequency_name)
VALUES ('weekly');

INSERT INTO Frequency (frequency_name)
VALUES ('monthly');

INSERT INTO Frequency (frequency_name)
VALUES ('yearly');


INSERT INTO GOALS (category, category_id, child_id, created_by, status, due_date, completion_date, progress)
VALUES ('daily', 1, 3, 1, 'assigned', CURRENT_TIMESTAMP + 1, NULL, 0);

INSERT INTO GOALS (category, category_id, child_id, created_by, status, due_date, completion_date, progress)
VALUES ('weekly', 2, 4, 2, 'in_progress', CURRENT_TIMESTAMP + 3, NULL, 30);

INSERT INTO GOALS (category, category_id, child_id, created_by, status, due_date, completion_date, progress)
VALUES ('monthly', 3, 3, 1, 'submitted', CURRENT_TIMESTAMP + 10, CURRENT_TIMESTAMP + 11, 80);

INSERT INTO GOALS (category, category_id, child_id, created_by, status, due_date, completion_date, progress)
VALUES ('daily', 1, 4, 2, 'approved', CURRENT_TIMESTAMP + 1, CURRENT_TIMESTAMP, 100);


INSERT INTO Transactions (parent_id, child_id, reward_points, task_id, status)
VALUES (1, 3, 30.00, 1, 'pending');

INSERT INTO Transactions (parent_id, child_id, reward_points, task_id, status)
VALUES (2, 4, 50.00, 2, 'success');

INSERT INTO Transactions (parent_id, child_id, reward_points, task_id, status)
VALUES (1, 3, 20.00, 3, 'failed');

INSERT INTO Transactions (parent_id, child_id, reward_points, task_id, status)
VALUES (2, 4, 10.00, 4, 'pending');

