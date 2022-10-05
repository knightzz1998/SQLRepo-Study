USE atguigudb;

# 加法与减法运算符
SELECT 100, 100 + 0, 100 - 0, 100 + 50, 100 + 50 - 30, 100 + 35.5, 100 - 35.5
FROM dual;

#计算出员工的年基本工资
SELECT employee_id, salary, salary * 12 AS "annual_sal"
FROM employees;

# 求模求余运算符
SELECT 12 % 3, 12 MOD 5
FROM dual;

#筛选出employee_id是偶数的员工
SELECT *
FROM employees
WHERE employee_id MOD 2 = 0;


# 等号运算符
SELECT 1 = 1,
       1 = '1',
       1 = 0,
       'a' = 'a',
       (5 + 3) = (2 + 6),
       '' = NULL,
       NULL =
       NULL;

SELECT 1 = 2, 0 = 'abc', 1 = 'abc'
FROM dual;

#查询salary=10000，注意在Java中比较是==
SELECT employee_id, salary
FROM employees
WHERE salary = 10000;

SELECT 1 <=> '1',
       1 <=> 0,
       'a' <=> 'a',
       (5 + 3) <=> (2 + 6),
       '' <=> NULL,
       NULL
           <=> NULL
FROM dual;

#查询commission_pct等于0.40
SELECT employee_id,commission_pct FROM employees WHERE commission_pct = 0.40;
SELECT employee_id,commission_pct FROM employees WHERE commission_pct = NULL;
# <=> 安全等于运算符
SELECT employee_id,commission_pct FROM employees WHERE commission_pct <=> 0.40;
#如果把0.40改成 NULL 呢？
SELECT employee_id,commission_pct FROM employees WHERE commission_pct <=> NULL;


# 不等于运算符
SELECT 1 <> 1, 1 != 2, 'a' != 'b', (3+4) <> (2+6), 'a' != NULL, NULL <> NULL;

# 空运算符
SELECT NULL IS NULL, ISNULL(NULL), ISNULL('a'), 1 IS NULL;

#查询commission_pct等于NULL。比较如下的四种写法
SELECT employee_id,commission_pct FROM employees WHERE commission_pct IS NULL;
SELECT employee_id,commission_pct FROM employees WHERE commission_pct <=> NULL;
SELECT employee_id,commission_pct FROM employees WHERE ISNULL(commission_pct);
SELECT employee_id,commission_pct FROM employees WHERE commission_pct = NULL;


SELECT last_name, manager_id
FROM   employees
WHERE  manager_id IS NULL;


# 非空运算符
SELECT NULL IS NOT NULL, 'a' IS NOT NULL,  1 IS NOT NULL;

SELECT employee_id,commission_pct FROM employees WHERE NOT commission_pct <=> NULL;
SELECT employee_id,commission_pct FROM employees WHERE NOT ISNULL(commission_pct);

# 最小值运算符
SELECT LEAST (1,0,2), LEAST('b','a','c'), LEAST(1,NULL,2);

# 最大值运算符
SELECT GREATEST(1,0,2), GREATEST('b','a','c'), GREATEST(1,NULL,2);

# BETWEEN AND 运算符
SELECT 1 BETWEEN 0 AND 1, 10 BETWEEN 11 AND 12, 'b' BETWEEN 'a' AND 'c';

SELECT last_name, salary
FROM   employees
WHERE  salary BETWEEN 2500 AND 3500;


# IN 运算符
SELECT 'a' IN ('a','b','c'), 1 IN (2,3), NULL IN ('a','b'), 'a' IN ('a', NULL);