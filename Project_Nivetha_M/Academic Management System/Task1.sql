-- Task1 
-- a)create table studentInfo
create table StudentInfo(STU_ID int primary key,
STU_NAME VARCHAR(40),
DOB DATE,PHONE_NO BIGINT,
EMAIL_ID VARCHAR(30),
ADDRESS VARCHAR(50));

-- b)create table courseInfo
create table CourseInfo(COURSE_ID INT primary key,COURSE_NAME VARCHAR(30), INSTRUCTOR_NAME VARCHAR(30));

-- C)create table enrollmentInfo
create table EnrollmentInfo(ENROLLMENT_ID INT,STU_ID INT,COURSE_ID INT,ENTROLL_STATUS varchar(30),FOREIGN KEY (STU_ID) REFERENCES StudentInfo(STU_ID),FOREIGN KEY (COURSE_ID) REFERENCES CourseInfo(COURSE_ID));

-- Data Creation
insert into StudentInfo VALUES
(101,'Nive','08-07-2002','735875410','Nive01@gmail.com','Adyar,chennai'),
(102,'Kaviya','12-05-2002','9876829456','Kavi02@gmail.com','Thiruvanmyir,chennai'),
(103,'Pooja','10-08-2001','9962869022','Gabrial03@gmail','besant nagar,Chennai'),
(104,'Cecilia','11-09-2001','8939735881','Ceci04@gmail.com','mylapore,chennai'),
(105,'Munusamy','01-11-2000','9840213789','Munus05@gmail.com','guindy,chennai'),
(106,'Sruthika','27-02-2000','9967834812','Sruthi@gmail.com','Thambaram,chennai');

Select * from StudentInfo;

insert into CourseInfo values
(91,'SQL','Bharath'),
(92,'dbms','Sanjay'),
(93,'python','Stephen'),
(94,'rdbms','Pradheepan');

insert into EnrollmentInfo values
(1,101,91,'Enrolled'),
(2,102,92,'Not Enrolled'),
(3,103,93,'Enrolled'),
(4,104,94,'Enrolled'),
(5,105,92,'Enrolled'),
(6,106,93,' Not Enrolled');

-- 3) Retrieve the Student Information
-- a) Write a query to retrieve student details, such as student name, contact informations, and Enrollment status.

select S.STU_NAME, S.PHONE_NO,E.ENTROLL_STATUS
from EnrollmentInfo E
inner join StudentInfo S on E.STU_ID=S.STU_ID

-- b) Write a query to retrieve a list of courses in which a specific student is enrolled.

select C.COURSE_NAME
from EnrollmentInfo E
join CourseInfo C on E.COURSE_ID = C.COURSE_ID
where E.STU_ID = 103 and E.ENTROLL_STATUS='Enrolled';

-- c) Write a query to retrieve course information, including course name, instructor information.

Select COURSE_NAME, INSTRUCTOR_NAME FROM CourseInfo;

-- d) Write a query to retrieve course information for a specific course .

Select * FROM courseInfo Where COURSE_NAME = 'SQL';

-- e) Write a query to retrieve course information for multiple courses

Select * FROM courseInfo Where COURSE_NAME IN ('SQL','dbms','python');

-- 4) Reporting and Analytics (Using joining queries)
-- a) Write a query to retrieve the number of students enrolled in each course

select C.COURSE_NAME,count(E.STU_ID)AS NUMBER_OF_STUDENT from EnrollmentInfo E 
inner join CourseInfo C on E.COURSE_ID = C.COURSE_ID where E.ENTROLL_STATUS = 'Enrolled' 
group by C.COURSE_NAME;


-- b) Write a query to retrieve the list of students enrolled in a specific course

select S.STU_NAME from EnrollmentInfo E inner join StudentInfo S on E.STU_ID = S.STU_ID
where E.COURSE_ID = 94 and E.ENTROLL_STATUS = 'Enrolled';


-- c) Write a query to retrieve the count of enrolled students for each instructor.

SELECT CI.INSTRUCTOR_NAME, COUNT(EI.STU_ID) AS Enrolled_Students_Count
FROM EnrollmentInfo EI
JOIN CourseInfo CI ON EI.COURSE_ID = CI.COURSE_ID
GROUP BY CI.INSTRUCTOR_NAME;

-- d) Write a query to retrieve the list of students who are enrolled in multiple courses

select S.STU_NAME,count(E.COURSE_ID)from StudentInfo S join EnrollmentInfo E 
on S.STU_ID = E.STU_ID where E.ENTROLL_STATUS = 'Enrolled' group by S.STU_NAME
having count(E.COURSE_ID) >1;

-- e) Write a query to retrieve the courses that have the highest number of enrolled students(arranging from highest to lowest)

select C.COURSE_NAME,count(E.STU_ID) AS Enrolled_Students from EnrollmentInfo E 
join CourseInfo C on E.COURSE_ID = C.COURSE_ID Where E.ENTROLL_STATUS = 'Enrolled' 
group by C.COURSE_NAME order by Enrolled_Students desc;
