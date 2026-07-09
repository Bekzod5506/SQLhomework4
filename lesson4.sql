create database Sql_lesson4

use Sql_lesson4

--Task 1 
drop table if exists Test_multiple_zero;
create table Test_multiple_zero (
   A int null,
   B int null,
   C int null,
   D int null
) ;

insert into Test_multiple_zero (A,B,C,D)
values
    (0,0,0,1),
    (0,0,1,0),
    (0,1,0,0),
    (1,0,0,0),
    (0,0,0,0),
    (1,1,1,0);

	select*from Test_multiple_zero;

	select * from Test_multiple_zero 
	where (A+B+C+D) > 0;

--Task 2

create table Testmax(
   year1 int,
   max1 int,
   max2 int,
   max3 int
);

insert into Testmax 
values 
    (2001,10,101,87),
    (2002,103,19,88),
    (2003,21,23,89),
    (2004,27,28,91);

	
	select*from Testmax;

	select year1, max1, max2, max3,
	   (select max(v) from(values (max1),(max2),(max3)) 
	     as valuelist(v)
	   ) as Highest
	   from Testmax;

--Task 3

create table empbirth (
  empid int identity(1,1),
  empname varchar(50),
  birthdate datetime
);

insert into empbirth(empname, birthdate)
values 
 ('Pawan' , '12/04/1983'),
 ('Zuzu' , '11/28/1986'),
 ('Parveen', '05/07/1977'),
 ('Mahesh', '01/13/1983'),
 ('Ramesh', '05/09/1983');

 select*from empbirth;


 select empid,empname,birthdate
 from empbirth
 where month(birthdate) = 5 and 
 day(birthdate) between 7 and 15;
 
 --Task 4

 create table letters(
  letter char(1)
 );

 insert into letters
values 
('a'), ('a'), ('a'), 
('b'), 
('c'), 
('d'), 
('e'), 
('f');

-- b is first
select letter from letters 
order by
case when letter = 'b' then 0 else 1
end, letter;
 
 -- b is last 
 select letter from letters 
order by
case when letter = 'b' then 1 else 0
end, letter;

-- b is 3rd 
  
SELECT letter
FROM (
    SELECT 
        letter,
        CASE
            WHEN letter = 'b' THEN 3
            WHEN letter < 'b' THEN ROW_NUMBER() OVER (ORDER BY letter) + 1
            WHEN letter > 'b' THEN ROW_NUMBER() OVER (ORDER BY letter)
        END AS position
    FROM letters
) sub
ORDER BY position;





