USE mydb;

-- Drop Tables if They Exist
DROP TABLE IF EXISTS Student;
DROP TABLE IF EXISTS Enrolment;
DROP TABLE IF EXISTS Lecturer;
DROP TABLE IF EXISTS Department;
DROP TABLE IF EXISTS Course;
DROP TABLE IF EXISTS ExamResults;
DROP TABLE IF EXISTS OpeningTimes;
DROP TABLE IF EXISTS UniversityInfo;

-- Create Department Table
CREATE TABLE Department (
    DepartmentID INT PRIMARY KEY,       
    DepartmentName VARCHAR(100),       
    DepartmentCode VARCHAR(10),         
    Grade VARCHAR(45)                   
);
-- Insert 10 Rows of Department Data
INSERT INTO Department (DepartmentID, DepartmentName, DepartmentCode, Grade) VALUES
(1, 'Computer Science', 'CS101', 'A'),
(2, 'Accounting & Finance', 'AF102', 'A'),
(3, 'Business', 'BUS103', 'C'),
(4, 'Law', 'LAW104', 'A'),
(5, 'Engineering', 'ENG105', 'B'),
(6, 'Biology', 'BIO106', 'B'),
(7, 'Sport Management', 'SM107', 'B'),
(8, 'Chemistry', 'CHE108', 'C'),
(9, 'Psychology', 'PSY109', 'A'),
(10, 'English Literature', 'ENG110', 'B');

-- Create the Student Table
CREATE TABLE Student (
    StudentID VARCHAR(10) PRIMARY KEY,
    Name VARCHAR(45),
    DateOfBirth DATE,
    Gender VARCHAR(10),
    Address VARCHAR(100),
    PhoneNumber VARCHAR(20),
    Email VARCHAR(45),
    Status VARCHAR(45),
    AcademicLevel INT,
    StudentNumber VARCHAR(45),
    DepartmentID INT,
    AcademicYear INT,
    PaidFees BOOLEAN,
    FOREIGN KEY (DepartmentID) REFERENCES Department(DepartmentID)
);
-- Insert 10 Rows of Student Data
INSERT INTO Student (StudentID, Name, DateOfBirth, Gender, Address, PhoneNumber, Email, Status, AcademicLevel, StudentNumber, DepartmentID, AcademicYear, PaidFees) 
VALUES
('S831', 'John Doe', '2003-05-12', 'Male', '032 Main Road', '123-456-7890', 'john.doe@university.com', 'Completed', 8, 'STU831', 1, 1, TRUE),
('S862', 'Alice Smith', '2002-08-24', 'Female', '456 Oak Street', '123-456-7891', 'alice.smith@university.com','In Progress', 7, 'STU862', 2, 2, FALSE),
('S826', 'Bob Johnson', '2004-01-15', 'Male', '789 Pine Lane', '123-456-7892', 'bob.johnson@university.com', 'Completed', 7,'STU826', 3, 3, FALSE),
('S992', 'Eve Williams', '2003-03-08', 'Female', '321 Elm Road', '123-456-7893', 'eve.williams@university.com','In Progress', 8, 'STU992', 4, 2, TRUE),
('S846', 'Charlie Brown', '2001-09-21', 'Male', '654 Maple Avenue', '123-456-7894', 'charlie.brown@university.com', 'Completed', 8, 'STU846', 5,1,TRUE),
('S932', 'Daisy Adams', '2002-11-19', 'Female', '987 Birch Blvd', '123-456-7895', 'daisy.adams@university.com','In Progress',  7, 'STU932', 6, 2, FALSE),
('S896', 'Frank Taylor', '2004-06-30', 'Male', '741 Cedar Street', '123-456-7896', 'frank.taylor@university.com','Completed', 8, 'STU896', 7,3, TRUE),
('S961', 'Grace Harris', '2001-12-25', 'Female', '852 Walnut Way', '123-456-7897', 'grace.harris@university.com','In Progress', 8, 'STU961', 8, 4, FALSE),
('S972', 'Hank Davis', '2003-02-02', 'Male', '963 Aspen Place', '123-456-7898', 'hank.davis@university.com', 'Completed', 7, 'STU972', 9, 2, TRUE),
('S893', 'Ivy Lee', '2002-10-10', 'Female', '159 Spruce Drive', '123-456-7899', 'ivy.lee@university.com', 'Completed', 7, 'STU893', 10, 1, FALSE);

-- Create Course Table
CREATE TABLE Course (
    CourseID INT PRIMARY KEY,
    CourseName VARCHAR(45),
    Requirements VARCHAR(100),
    AcademicLevel INT,
    AcademicYear INT,
    DepartmentID INT,
    FOREIGN KEY (DepartmentID) REFERENCES Department(DepartmentID)
);
-- Insert 10 Rows of Course Data with Random AcademicYear
INSERT INTO Course (CourseID, CourseName, AcademicLevel, AcademicYear, DepartmentID) VALUES
(1, 'Computer Science', 8, 3, 1),
(2, 'Accounting & Finance', 7, 1, 2),
(3, 'Business', 7, 2, 3),
(4, 'Law', 8, 4, 4),
(5, 'Engineering', 8, 2, 5),
(6, 'Biology', 7, 3, 6),
(7, 'Sport Management', 7, 1, 7),
(8, 'Chemistry', 8, 4, 8),
(9, 'Psychology', 7, 3, 9),
(10, 'English Literature', 8, 2, 10);

-- Add the DeliveryMethod // Altered it but not added in the column
ALTER TABLE Course ADD COLUMN DeliveryMethod VARCHAR(45) DEFAULT 'Online';
UPDATE Course SET DeliveryMethod = 'Online';

-- Create Lecturer Table (now after Course is created)
CREATE TABLE Lecturer (
    LecturerID INT PRIMARY KEY,
    LecturerName VARCHAR(45),
    Email VARCHAR(45),
    PhoneNumber VARCHAR(45),
    DaysOff INT,
    CourseID INT,
    DepartmentID INT,
    FOREIGN KEY (DepartmentID) REFERENCES Department(DepartmentID),
    FOREIGN KEY (CourseID) REFERENCES Course(CourseID)
);
-- Insert Lecturer Data (fixed LecturerID as INT and corrected values)
INSERT INTO Lecturer (LecturerID, LecturerName, Email, PhoneNumber, DaysOff, CourseID, DepartmentID) VALUES
(53, 'Emma Carter', 'emma.carter@university.com', '087-325-4389', 10,5, 1),
(82, 'Liam Anderson', 'liam.anderson@university.com', '085-463-5472', 20 ,1, 2),
(42, 'Sophia Bennett', 'sophia.bennet@university.com', '089-378-3479', 30, 6, 3),
(24, 'Noah Mitchell', 'noah.mitchell@university.com', '085-385-8654', 15,7, 4),
(16, 'Isabella Parker', 'isabella.parker@university.com', '088-753-6863', 20,3, 5),
(95, 'Oliver Hayes', 'oliver.hayes@university.com', '089-982-7355', 18, 2, 6),
(94, 'Ava Morgan', 'ava.morgan@university.com', '086-577-7353', 35, 2, 7),
(25, 'Elijah Turner', 'elijah.turner@university.com', '084-839-2463', 23, 3, 8),
(73, 'Mia Coleman', 'mia.coleman@university.com', '089-764-4126', 22, 4, 9),
(37, 'James Wilson', 'james.wilson@university.com', '087-335-6928', 35,5, 10);

-- Create Enrolment Table
CREATE TABLE Enrolment (
    EnrolmentID INT PRIMARY KEY,
    Grade VARCHAR(10),
    CourseID INT,
    StudentID VARCHAR(10),
    FOREIGN KEY (CourseID) REFERENCES Course(CourseID),
    FOREIGN KEY (StudentID) REFERENCES Student(StudentID)
);
-- Insert 10 Rows of Enrolment Data
INSERT INTO Enrolment (EnrolmentID, Grade, CourseID, StudentID) VALUES
(101, 'A', 1, 'S831'),
(102, 'A', 2, 'S862'),
(103, 'C', 3, 'S826'),
(104, 'A', 4, 'S992'),
(105, 'B', 5, 'S846'),
(106, 'B', 6, 'S932'),
(107, 'B', 7, 'S896'),
(108, 'C', 8, 'S961'),
(109, 'A', 9, 'S972'),
(110, 'B', 10, 'S893');

-- Create ExamResults Table
CREATE TABLE ExamResults (
    ResultsID INT PRIMARY KEY,
    ExamDate DATE,
    Total VARCHAR(10),
    StudentID VARCHAR(10),
    CourseID INT,
    FOREIGN KEY (StudentID) REFERENCES Student(StudentID),
    FOREIGN KEY (CourseID) REFERENCES Course(CourseID)
);
-- Insert 10 Rows of ExamResults Data
INSERT INTO ExamResults (ResultsID, ExamDate, Total, StudentID, CourseID) VALUES
(201, '2024-06-03', '85', 'S831', 1),
(202, '2024-06-13', '78', 'S862', 2),
(203, '2024-06-07', '90', 'S826', 3),
(204, '2024-06-11', '88', 'S992', 4),
(205, '2024-06-24', '75', 'S846', 5),
(206, '2024-06-13', '92', 'S932', 6),
(207, '2024-06-24', '79', 'S896', 7),
(208, '2024-06-09', '81', 'S961', 8),
(209, '2024-06-17', '84', 'S972', 9),
(210, '2024-06-07', '88', 'S893', 10);

-- Create OpeningTimes Table
CREATE TABLE OpeningTimes (
    OpeningTimesID INT PRIMARY KEY,
    DayOfWeek VARCHAR(45),
    OpenTime TIME,
    CloseTime TIME,
    Location VARCHAR (45),
    DepartmentID INT,
    FOREIGN KEY (DepartmentID) REFERENCES Department(DepartmentID)
);
-- Insert 10 Rows of OpeningTimes Data 
INSERT INTO OpeningTimes (OpeningTimesID, DayOfWeek, OpenTime, CloseTime, Location, DepartmentID) VALUES
(1, 'Monday', '08:00', '16:00', 'Main Campus - Building A', 1),
(2, 'Tuesday', '09:00', '17:00', 'Computer Room - Room 12', 2),
(3, 'Wednesday', '08:30', '16:30', 'North Wing - Room 19', 3),
(4, 'Thursday', '09:00', '18:00', 'East Hall - Room 32', 4),
(5, 'Friday', '08:00', '15:00', 'Engineering - Lab 5', 5),
(6, 'Monday', '09:00', '16:00', 'Science Building - Floor 2', 6),
(7, 'Tuesday', '08:00', '15:00', 'Sports Center - Office', 7),
(8, 'Wednesday', '10:00', '17:00', 'Chemistry - Lab 8', 8),
(9, 'Thursday', '08:00', '16:00', 'Psychology Hub - Room 302', 9),
(10, 'Friday', '09:00', '14:00', 'Literature Hall - Room 1', 10);

-- Create University Table
CREATE TABLE UniversityInfo (
	UniversityID INT,
    UniversityName VARCHAR(45),
    Address VARCHAR(45),
    PhoneNumber VARCHAR(45)
);
-- Insert University Data
INSERT INTO UniversityInfo (UniversityID, UniversityName, Address, PhoneNumber) VALUES
(123987, 'California University', '456 College Blvd, California, USA', '01-7655325');

ALTER TABLE UniversityInfo 
ADD COLUMN Dean VARCHAR(45);


/* Task 3 - 1 */
UPDATE Student 
SET AcademicYear = 2 
WHERE AcademicYear = 1;

select * from student;

/* Task 3 - 2*/
UPDATE Student
SET Status = 'Completed'
WHERE AcademicLevel = 4;

/* Task 3 - 3*/
SET FOREIGN_KEY_CHECKS = 0;
DELETE FROM Student
WHERE PaidFees = FALSE;
SET FOREIGN_KEY_CHECKS = 1;

/* Task 3 - 4*/
SELECT 
    Student.Name, 
    Enrolment.Grade
FROM 
    Student
JOIN 
    Enrolment ON Student.StudentID = Enrolment.StudentID
ORDER BY 
    CASE Enrolment.Grade
        WHEN 'A' THEN 1
        WHEN 'B' THEN 2
        WHEN 'C' THEN 3
        ELSE 4
    END,
    Student.Name;
    
/* Task 3 - 5*/
INSERT INTO Department (DepartmentID, DepartmentName, DepartmentCode, Grade)
VALUES (11, 'Philosophy', 'PHI111', 'B');
INSERT INTO Student (StudentID, Name, DateOfBirth, Gender, Address, PhoneNumber, Email, Status, AcademicYear, StudentNumber, DepartmentID, AcademicLevel, PaidFees)
VALUES ('S1001', 'Laura Green', '2003-04-20', 'Female', '101 Birch Street', '123-456-7910', 'laura.green@university.com', 'In Progress', 8, 'STU1001', 11, 2, TRUE);
INSERT INTO Course (CourseID, CourseName, Requirements, AcademicYear, DepartmentID)
VALUES (11, 'Philosophy 101', 'Logic, Ethics', 8, 11);
INSERT INTO Enrolment (EnrolmentID, Grade, CourseID, StudentID)
VALUES (111, 'B', 11, 'S1001');
INSERT INTO ExamResults (ResultsID, ExamDate, Total, StudentID, CourseID)
VALUES (211, '2024-07-01', '82', 'S1001', 11);
INSERT INTO OpeningTimes (OpeningTimesID, DayOfWeek, OpenTime, CloseTime, DepartmentID)
VALUES (11, 'Monday', '10:00:00', '18:00:00', 11);

/* Task 3 - 6*/
SET foreign_key_checks = 0;
DELETE FROM Department WHERE DepartmentID = 1;
DELETE FROM Course WHERE CourseID = 1;
DELETE FROM Student WHERE StudentID = 'S831';
DELETE FROM Enrolment WHERE EnrolmentID = 101;
DELETE FROM ExamResults WHERE ResultsID = 201;
DELETE FROM OpeningTimes WHERE OpeningTimesID = 1;
SET foreign_key_checks = 1;

/* Task 3 - 7*/
SELECT LecturerName, SUM(DaysOff) AS TotalDaysOff
FROM Lecturer
GROUP BY LecturerName
ORDER BY TotalDaysOff ASC;

/* Task 3 - 8*/
SELECT COUNT(*) AS BusinessStudents
FROM Student
JOIN Course ON Student.DepartmentID = Course.DepartmentID
WHERE Course.CourseName LIKE '%Business%';

/* Task 3 - 9*/
UPDATE Staff
SET Role = 'Administrator'
WHERE Role = 'Office Worker';

/* Task 3 - 10*/
UPDATE Course
SET CourseName = 'Doctorial'
WHERE CourseName = 'PHD';

/* Task 3 - 11*/
UPDATE Course
SET DeliveryMethod = 'Online';

/* Task 3 - 12*/
UPDATE OpeningTimes
SET OpenTime = NULL, CloseTime = NULL, Location = 'Closed to Visitors';

/* Task 3 - 13*/
SET FOREIGN_KEY_CHECKS = 0;
DELETE FROM Course;
SET FOREIGN_KEY_CHECKS = 1;

/* Task 3 - 14*/
SELECT DISTINCT c.*
FROM Course c
JOIN Enrolment e ON c.CourseID = e.CourseID
JOIN Student s ON e.StudentID = s.StudentID
WHERE s.AcademicLevel <= 6;

/* Task 3 - 15*/
UPDATE UniversityInfo
SET PhoneNumber = '01-7654321';

/* Task 3 - 16*/
UPDATE UniversityInfo
SET Dean = 'Michael Dean';

/* Task 3 - 17*/
SELECT * 
FROM Lecturer
WHERE DaysOff > 4 * 365; 

/* Task 3 - 18*/
-- Doesn't Work

/* Task 3 - 19*/
SELECT COUNT(*) AS StudentsWithRoadInAddress
FROM Student
WHERE Address LIKE '%road%';

/* Task 3 - 20*/
CREATE VIEW StudentCourseEnrolmentView AS
SELECT S.StudentID, S.Name AS StudentName, C.CourseName, E.Grade
FROM Student S
JOIN Enrolment E ON S.StudentID = E.StudentID
JOIN Course C ON E.CourseID = C.CourseID;

-- To see the view:
SELECT * FROM StudentCourseEnrolmentView;
