-- Task 2
-- Student Database Management System
-- 1. Create a database named "student_database."
create table Student(Student_id integer, Stu_name text, Department text, email_id text,
Phone_no numeric, Address text,Date_of_birth date, Gender Text, Major text, GPA numeric,Grade text);

--2. Insert 10 sample records into the "student_table" using INSERT command.
Insert Into Student Values
(1,'Sneha','Information Technology','sne1@gmail.com',9878654673,'kelambakkam,Chennai','25-05-2003','female','Computer Science',8.5,'A2'),
(2,'Ramesh','Biotechnology','Ram1@gmail.com',7358834394,'Mandhaveli,Chennai','10-05-2001','Male','Botony',9.1,'A1'),
(3,'Dhanush','Commerce','dhanu@gmail.com',7334528391,'Perambur,Chennai','06-06-2000','Male',
 'accounts',7.5,'B'),
(4,'Anitha','Information Technology','ani1@gmail.com',78284682831,'Paris,Chennai',
'08-10-2001','Female','Computer Science',7.7,'B'),
(5,'Lakshitha','Biotechnology','Laks1@gmail.com',9964513831,
'Vannarpettai,Chennai','10-11-2001','Female','Botony',4.0,'F'),
(6,'Riya','Information Technology','Riya1@gmail.com',9904910293,'luzcorner,Chennai','11-11-2000','Female','Computer Science',7.0,'C'),
(7,'Suresh','BSC maths','sure1@gmail.com',9984756821,'Meddavakkam,Chennai','31-12-2001','Male','Statistics',4.5,'F'),
(8,'Srija','B.com','sri1@gmail.com',998432910,'Santhome,Chennai','10-01-2000','Male','Economics',6.6,'D'),
(9,'Moni','BSC chemistry','moni1@gmail.com',9918788193,'Nungapakkam,Chennai','11-08-2000','Female','Chemistry',5.5,'E'),
(10,'Ahana','B.com','Ahana1@gmail.com',7343176662,'thuraipakkam,Chennai','29-12-2000','Female','Bussiness Maths',9.8,'A1');


-- 3.Select * from Student order by grade desc; 
-- 4.Select * from Student where Gender = 'Male'; 
-- 5.Select * from Student where Gpa < 5.0;
-- 6. Update Student Set Grade = 'A', Email_id = 'Laks1@gmail.com ' where Student_id = 8;
-- 7.Select stu_name, date_of_birth from Student where Grade = 'B';
-- 8.Select Department, Gender, avg(GPA) from student group by Department, Gender;
-- 9.Alter table Student rename to studentinfo;
-- 10.Select Stu_Name from studentinfo WHERE GPA = (select max(GPA) from studentinfo)


