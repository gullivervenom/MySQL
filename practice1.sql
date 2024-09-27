select * from TB_DEPARTMENT; --  학과테이블
select * from TB_STUDENT; -- 학생테이블
select * from TB_PROFESSOR; -- 교수테이블
select * from TB_CLASS; -- 수업테이블
select * from TB_CLASS_PROFESSOR; -- 수업교수테이블
select * from TB_GRADE; -- 학점테이블

-- 1.
select
	DEPARTMENT_NAME as '학과 명',
	CAPACITY as '정원'
from
	tb_department;
 

-- 2.
select
	concat(DEPARTMENT_NAME,'의 정원은',CAPACITY,'명 입니다') as '학과별 정원'
from
	tb_department;

-- 3.
select
	STUDENT_NAME
from
	tb_student
where
	DEPARTMENT_NO = 1 and ABSENCE_YN = 'Y' and STUDENT_SSN like '%-2%';
    
    
    
    
    
    
국어국문학과
select concat('조', '문자열', '평훈');



    
    
	b.STUDENT_NO as '정원'
from
	tb_department a
    join 
    tb_student b on a.DEPARTMENT_NO = b.DEPARTMENT_NO;