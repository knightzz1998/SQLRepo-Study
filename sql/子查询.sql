# 子查询
use atguigudb;
select tmp.name, tmp.salary
from (select first_name as name, salary from employees) as tmp
where tmp.salary > 5000 order by salary desc ;