select * from TB_DEPARTMENT; --  학과테이블
select * from TB_STUDENT; -- 학생테이블
select * from TB_PROFESSOR; -- 교수테이블
select * from TB_CLASS; -- 수업테이블
select * from TB_CLASS_PROFESSOR; -- 수업교수테이블
select * from TB_GRADE; -- 학점테이블

select
	DEPARTMENT_NAME as '학과 명',
	CATEGORY as '계열'
from
	tb_department;

select
	a.DEPARTMENT_NAME as '학과 명',
	b.STUDENT_NO as '정원'
from
	tb_department a
    join 
    tb_student b on a.DEPARTMENT_NO = b.DEPARTMENT_NO;