-- Task 3 
-- Event Management System using PostgreSQL.
-- 1.Database Creation
-- Create tables for Events
CREATE TABLE EVENTS(EVENT_ID INT PRIMARY KEY, EVENT_NAME VARCHAR(20), EVENT_DATE DATE, EVENT_LOCATION VARCHAR(20),EVENT_DESCRIPTION VARCHAR(50));
--Create tables for Attendees
CREATE TABLE ATTENDEES(ATTENDEE_ID INT PRIMARY KEY,ATTENDEE_NAME VARCHAR(20),
ATTENDE_PHONE BIGINT,ATTENDEE_EMAIL VARCHAR(20),ATTENDEE_CITY VARCHAR(20));
--Create tables for Registrations
CREATE TABLE REGISTRATIONS(REGISTRATION_ID INT PRIMARY KEY,EVENT_ID INT,ATTENDEE_ID INT, Registration_DATE DATE, REGISTRATION_AMOUNT NUMERIC,FOREIGN KEY (EVENT_ID) REFERENCES EVENTS(EVENT_ID),FOREIGN KEY (ATTENDEE_ID) REFERENCES ATTENDEES(ATTENDEE_ID));

--2) Insert some sample data for Events, Attendees, and Registrations tables with respective fields.

Insert into events Values
(71,'InfoC Thiruvizha','15-11-2021','Chennai','Only Staffs can participate'),
(72,'Super Singer','11-09-2021','Chennai','above 18 years old can participate'),
(73,'Whistle podu event','06-10-2021','Chennai','Only college students are allowed');

Insert into attendees Values 
(201,'Kumari',9870654321,'Kumari9@gmail.com','Chennai'),
(202,'Krithvik',8765432190,'Krith12@gmail.com','Chennai'),
(203,'Sanjay',7654321098,'Smiley34@gmail.com','Chennai'),
(204,'akshaya',8097654321,'Aksh@gmail.com','Chennai'),
(205,'Harini',8393134323,'haini@gmail.com','Chennai');

Insert into Registrations Values
(11,71,01,'20-02-2021',100),
(22,72,02,'23-01-2021',200),
(33,71,03,'20-01-2021',100),
(44,72,04,'23-01-2021',200),
(55,73,05,'20-02-2021',150);

--3.a) Inserting a new event.
Insert into events Values(74,'Women’s day celebration','01-03-2021','Chennai','Only womens can participate');

--b) Updating an event's information
Update Events set Event_Name = 'Sports Event' Where EVENT_ID = 73;

--c) Deleting an event.
DELETE FROM EVENTS WHERE EVENT_ID = 74;

-- 4) Manage Track Attendees & Handle Events
-- a)Inserting a new attendee.
Insert Into attendees values (206,'Hemalatha',7501234567,'Hema8@gmail.com','Chennai');

--b)Registering an attendee for an event.
insert into registrations values (66,72,206,'30-05-2024',200);

--5.Develop queries to retrieve event information, generate attendee lists, and calculate event attendance statistics.
Select Ei.event_id, Ei.event_name, Count(Rs.attendee_id) From events Ei 
Join registrations Rs ON Ei.event_id = Rs.event_id Group by Ei.event_id, Ei.event_name;







