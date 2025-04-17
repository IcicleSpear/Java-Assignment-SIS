create database SISDB;
use SISDB;
create table Students(student_id int primary key auto_increment,first_name varchar(50) not null,last_name varchar(50) not null,date_of_birth date,email varchar(100) unique,phone_number varchar(15));

create table Teacher(
		teacher_id int primary key auto_increment,
        first_name varchar(50) not null,
        last_name varchar(50) not null,
        email varchar(100) unique);
        
create table Courses(
			course_id int primary key auto_increment,
            course_name varchar(100) not null,
            credits int check (credits>0),
            teacher_id int,
            foreign key (teacher_id) references Teacher(teacher_id));
            
create table Enrollments(
			enrollment_id int primary key auto_increment,
            student_id int,
            course_id int,
            enrollment_date date,
            foreign key (student_id) references Students(student_id),
            foreign key(course_id) references Courses(course_id));

            
create table Payments(
			payment_id int primary key auto_increment,
            student_id int,
            amount decimal(10,2),
            payment_date date,
            foreign key (student_id) references Students(student_id));
            
INSERT INTO Students (first_name, last_name, date_of_birth, email, phone_number) VALUES
('Amit', 'Sharma', '2000-05-14', 'amit.sharma@gmail.com', '9876543210'),
('Priya', 'Verma', '1999-08-22', 'priya.verma@yahoo.com', '9823456789'),
('Rahul', 'Patel', '2001-03-10', 'rahul.patel@outlook.com', '7894561230'),
('Sneha', 'Reddy', '2002-12-05', 'sneha.reddy@gmail.com', '9123456780'),
('Vikram', 'Singh', '1998-09-18', 'vikram.singh@gmail.com', '9012345678'),
('Ananya', 'Nair', '2000-01-25', 'ananya.nair@hotmail.com', '8899776655'),
('Manish', 'Kumar', '1997-06-30', 'manish.kumar@gmail.com', '9876123450'),
('Pooja', 'Mishra', '2001-11-12', 'pooja.mishra@gmail.com', '8887766554'),
('Arjun', 'Mehta', '1999-04-04', 'arjun.mehta@gmail.com', '9786543210'),
('Divya', 'Pillai', '2002-07-19', 'divya.pillai@gmail.com', '9876432109');

INSERT INTO Teacher (first_name, last_name, email) VALUES
('Suresh', 'Iyer', 'suresh.iyer@college.edu'),
('Lakshmi', 'Menon', 'lakshmi.menon@college.edu'),
('Rajesh', 'Deshmukh', 'rajesh.deshmukh@college.edu'),
('Neha', 'Kapoor', 'neha.kapoor@college.edu'),
('Arvind', 'Chatterjee', 'arvind.chatterjee@college.edu'),
('Sunita', 'Mohan', 'sunita.mohan@college.edu'),
('Vivek', 'Tripathi', 'vivek.tripathi@college.edu'),
('Kavita', 'Joshi', 'kavita.joshi@college.edu'),
('Ramesh', 'Rao', 'ramesh.rao@college.edu'),
('Meena', 'Saxena', 'meena.saxena@college.edu');

INSERT INTO Courses (course_name, credits, teacher_id) VALUES
('Data Structures', 4, 1),
('Database Management Systems', 3, 2),
('Operating Systems', 4, 3),
('Computer Networks', 3, 4),
('Software Engineering', 3, 5),
('Machine Learning', 4, 6),
('Artificial Intelligence', 4, 7),
('Web Technologies', 3, 8),
('Cloud Computing', 3, 9),
('Cyber Security', 4, 10);

show tables;
select * from Courses;

INSERT INTO Enrollments (student_id, course_id, enrollment_date) VALUES
(1, 1, '2024-01-15'),
(2, 2, '2024-01-16'),
(3, 3, '2024-01-17'),
(4, 4, '2024-01-18'),
(5, 5, '2024-01-19'),
(6, 6, '2024-01-20'),
(7, 7, '2024-01-21'),
(8, 8, '2024-01-22'),
(9, 9, '2024-01-23'),
(10, 10, '2024-01-24');

INSERT INTO Payments (student_id, amount, payment_date) VALUES
(1, 15000.00, '2024-01-25'),
(2, 12000.00, '2024-01-26'),
(3, 13000.00, '2024-01-27'),
(4, 14000.00, '2024-01-28'),
(5, 11000.00, '2024-01-29'),
(6, 16000.00, '2024-01-30'),
(7, 17000.00, '2024-01-31'),
(8, 15500.00, '2024-02-01'),
(9, 12500.00, '2024-02-02'),
(10, 14500.00, '2024-02-03');
 
 -- TASK 2 --
 
insert into Students (first_name,last_name,date_of_birth,email,phone_number) values('John','Doe','1995-08-15','john.doe@example.com','1234567890');

insert into Enrollments(student_id,course_id,enrollment_date) values(2,5,'2025-03-18');

update Teacher set email='thisisupdateemail@gmail.com' where teacher_id=4;

delete from Enrollments where student_id=6 and course_id=6;

update Courses set teacher_id=2 where course_id=3;

delete from Enrollments where student_id=7;
delete FROM Payments WHERE student_id = 7;
delete from Students where student_id=7;

update Payments set amount=20000 where payment_id=6;
select * from payments;

-- TASK 3 --
select s.student_id,concat(first_name,' ',last_name) as student_name,sum(p.amount) as total_payment
			from Students s inner join Payments p on s.student_id=p.student_id 
            where s.student_id=5 group by s.student_id,student_name;
            
select c.course_name,count(e.student_id) 
			from Courses c inner join Enrollments e on c.course_id=e.course_id 
			group by c.course_id,c.course_name;
            
select s.student_id,concat(s.first_name,' ',s.last_name) as student_name
						from Students s left join Enrollments e on s.student_id=e.student_id
                        where e.student_id is NULL;
                        
select s.first_name,s.last_name,c.course_name 
				from Students s inner join Enrollments e on s.student_id=e.student_id 
                inner join Courses c on e.course_id=c.course_id
                group by s.student_id,c.course_name;

select concat(t.first_name,' ',t.last_name) as teacher_name,course_id 
				from Teacher t inner join Courses c on t.teacher_id=c.teacher_id;
                
select concat(s.first_name,' ',s.last_name) as student_name,e.enrollment_date,c.course_name 
					from Students s inner join Enrollments e on s.student_id=e.student_id
                    inner join Courses c on c.course_id=e.course_id where c.course_name='Data Structures';
                    
select concat(s.first_name,' ',s.last_name) as student_name 
					from Students s left join Payments p on s.student_id=p.student_id where p.payment_id is null;
				
select c.course_id,c.course_name from Courses c left join Enrollments e on c.course_id=e.course_id where e.enrollment_id is null;

SELECT DISTINCT e1.student_id FROM Enrollments e1 JOIN Enrollments e2 ON e1.student_id = e2.student_id AND e1.course_id <> e2.course_id;

select t.first_name from Teacher t left join Courses c on t.teacher_id=c.teacher_id where c.course_id is null;

-- TASK 4 --

select avg(student_count) from (
				select course_id,count(student_id) as student_count from Enrollments group by course_id
                ) as course_count;
                
select * from Students where student_id in(select student_id from Payments where amount=(select max(amount) from Payments));

select * from Courses where course_id in(
						select course_id from(select course_id,count(*) as enrollment_count from Enrollments group by course_id) as CourseCount
						where enrollment_count=(select max(enrollment_count) from (select count(*) as enrollment_count from Enrollments group by course_id) as EnrollmentCount));

select t.teacher_id,concat(t.first_name,' ',t.last_name),(
							select max(p.amount) from Payments p where p.student_id in (
                            select e.student_id from Enrollments e where e.course_id in(select c.course_id from Courses c where c.teacher_id=t.teacher_id))
							) as total_payments
                            from Teacher t;
                            
select s.student_id,s.first_name,s.last_name from Students s where (select count(*) from Enrollments e where e.student_id=s.student_id)=(select count(*) from Courses);

select t.teacher_id,t.first_name,t.last_name from Teacher t where t.teacher_id not in(select distinct teacher_id from Courses where teacher_id is not null);


select c.course_id,c.course_name from Courses c where c.course_id not in (select distinct course_id from Enrollments where course_id is not null);


            


