-- 메뉴 테이블에서 민트 미역국과 같은 카테고리를 가지고 있는 메뉴 조회

-- 민트 미역국의 카테고리 코드
-- 1.
select
	category_code 
from
	tbl_menu
where
	menu_name = '민트미역국';
    
select
	*
from
	tbl_menu
where
	category_code = 4;

-- subquery 란?
-- main 쿼리에서 수행되는 (다른 쿼리문에서 실행되는) 쿼리문이다.
-- 2.
select
	*
from
	tbl_menu
where category_code = (
	select
		category_code	
	from
		tbl_menu
	where
		menu_name = '민트미역국'
);

-- 가장 많은 메뉴가 포함된 카테고리 조회
-- 1. 서브쿼리 작성
select
	count(*) as 'count'
from
	tbl_menu
group by
	category_code;
    
-- max() 함수 : 최대값, min() 함수 : 최소값
-- from 절에 사용하는 서브쿼리는 (derived table, 파생 테이블)이라고 하며
-- 파생 테이블은 반드시 별칭을 가지고 있어야 한다. 
select
	max(count)
from
	(
    select
	count(*) as 'count'
	from
	tbl_menu
	group by
	category_code
	) as countmenu;
    
-- 상관 서브쿼리
-- 메인 쿼리문이 서브쿼리의 결과에 영향을 주는 경우를 상관 서브쿼리라고 한다.

-- 카테고리별 평균 가격보다 높은 가격의 메뉴 조회하기
select
	a.menu_code,
    a.menu_name,
    a.menu_price,
    a.category_code,
	a.orderable_status
from
	tbl_menu a
where 
	menu_price > (
					select
						avg(menu_price)
					from
						tbl_menu
					where
						category_code = a.category_code
					);

select
	*
from
	tbl_menu;
    
select
	category_code,
	avg(menu_price)
from
	tbl_menu
group by
	category_code;

-- CTE ( Common Table Expresstion)
-- 파생 테이블과 비슷한 개념이며, 코드의 기록성과 재사용성을 위해 
-- 파생 테이블 대신 사용하게 된다.
-- from 절에서만 사용이 된다. (join 일 시 join 구문에서도 사용 가능)

with menucte as (
	select
		menu_name,
        category_name
	from
		tbl_menu a
        join
        tbl_category b
        on a.category_code = b.category_code
)

select
	*
from
	menucte
order by
	menu_name;
    










