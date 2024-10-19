create database info;
use info;
create table class(
	classId varchar(10) primary key,
    className varchar(25),
    startDate date,
    c_status enum('1','2','3')
);
create table student(
	studentId varchar(10) primary key,
    studentName varchar(50),
    address varchar(50),
    phone int(10),
    s_status enum('1','2','3'),
    classId varchar(10),
    foreign key(classId) references class(classId)
);
create table i_subject(
	subId varchar(10) primary key,
    subName varchar(50),
    credit varchar(25),
	su_status enum('1','2')
);
create table mark(
	markId varchar(10),
    subId varchar(10),
    foreign key(subId) references i_subject(subId),
    studentId varchar(10),
    foreign key(studentId) references student(studentId),
    primary key(subId, studentId),
    mark varchar(10),
    examTime date
);
INSERT INTO class VALUES (1, 'Math101', '2024-12-01', '1'), (2, 'Science102', '2024-11-15', '1'), (3, 'History103', '2024-12-10', '1'),(4, 'Art104', '2024-10-20', '2'),(5, 'English105', '2024-12-05', '3');
INSERT INTO Student VALUES (1, 'Henry', '123 Main St', '0123456789', '1', 1), (2, 'Hana', '456 Oak St', '0987654321', '1', 2), (3, 'Tom', '789 Maple St', '0111222333', '1', 3), (4, 'Hung', '321 Pine St', '0444555666', '2', 4), (5, 'Helen', '654 Elm St', '0777888999', '3', 5);
INSERT INTO i_subject VALUES (1, 'Mathematics', 3, '1'), (2, 'Science', 4, '1'), (3, 'History', 2, '2'), (4, 'Art', 5, '1'), (5, 'English', 3, '1');
INSERT INTO mark VALUES (1, 1, 1, 85, '2024-06-15'), (2, 2, 2, 90, '2024-06-20'), (3, 3, 3, 75, '2024-06-25'), (4, 4, 4, 88, '2024-06-30'), (5, 5, 5, 92, '2024-07-01');

select *
from student s
where s.studentName like 'h%';

select *
from class c
where month(c.startDate) =12; 

select *
from i_subject isu
where isu.credit between 3 and 5;

SET SQL_SAFE_UPDATES = 0;

update student set classId = 2 where studentName='hung';

select s.studentName, isu.subName, m.mark
from student s join mark m on s.studentId = m.studentId
				join i_subject isu on m.subId = isu.subId
                order by m.mark desc, s.studentName asc ;
