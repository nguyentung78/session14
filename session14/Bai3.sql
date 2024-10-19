use info;
select * from i_subject
where credit=(select max(credit) from i_subject);
select isu.subName, m.mark, isu.subId, isu.credit, isu.su_status
from i_subject isu join mark m on isu.subId = m.subId
where m.mark=(select max(mark) from mark);
select s.studentId, s.studentName, s.address, s.phone, s.classId, s.s_status, avg(m.mark)
from student s join mark m on s.studentId = m.studentId
group by s.studentId, s.studentName, s.address, s.phone, s.classId, s.s_status
order by avg(m.mark)desc;