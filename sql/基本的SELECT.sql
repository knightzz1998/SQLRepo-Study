# SELECT
SELECT 1;

# SELECT 全部字段

SELECT *
FROM departments;

# SELECT 字段
USE atguigudb;
SELECT department_id, department_name
FROM departments;

# 列的别名
SELECT department_id AS "id", department_name AS "name"
FROM departments;

# 去除重复行

SELECT DISTINCT department_id, salary
FROM employees;

# 空值运算

SELECT employee_id, salary, commission_pct, 12 * salary * (1 + commission_pct) AS "annual_sal"
from employees;

# SELECT * FROM ORDER , 这是错误的, 因为 ORDER 和 MySQL 关键字相同了
SELECT *
FROM `order`

# 常数

SELECT '阿里巴巴' as corporation, last_name
FROM employees;

# 显示表结构

DESCRIBE employees;
DESC employees;


# 过滤数据

SELECT employee_id, last_name, job_id
FROM employees
WHERE department_id = 90;
