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
SELECT employee_id, commission_pct
FROM employees
WHERE commission_pct = 0.40;
SELECT employee_id, commission_pct
FROM employees
WHERE commission_pct = NULL;
# <=> 安全等于运算符
SELECT employee_id, commission_pct
FROM employees
WHERE commission_pct <=> 0.40;
#如果把0.40改成 NULL 呢？
SELECT employee_id, commission_pct
FROM employees
WHERE commission_pct <=> NULL;


# 不等于运算符
SELECT 1 <> 1, 1 != 2, 'a' != 'b', (3 + 4) <> (2 + 6), 'a' != NULL, NULL <> NULL;

# 空运算符
SELECT NULL IS NULL, ISNULL(NULL), ISNULL('a'), 1 IS NULL;

#查询commission_pct等于NULL。比较如下的四种写法
SELECT employee_id, commission_pct
FROM employees
WHERE commission_pct IS NULL;
SELECT employee_id, commission_pct
FROM employees
WHERE commission_pct <=> NULL;
SELECT employee_id, commission_pct
FROM employees
WHERE ISNULL(commission_pct);
SELECT employee_id, commission_pct
FROM employees
WHERE commission_pct = NULL;


SELECT last_name, manager_id
FROM employees
WHERE manager_id IS NULL;


# 非空运算符
SELECT NULL IS NOT NULL, 'a' IS NOT NULL, 1 IS NOT NULL;

SELECT employee_id, commission_pct
FROM employees
WHERE NOT commission_pct <=> NULL;
SELECT employee_id, commission_pct
FROM employees
WHERE NOT ISNULL(commission_pct);

# 最小值运算符
SELECT LEAST(1, 0, 2), LEAST('b', 'a', 'c'), LEAST(1, NULL, 2);

# 最大值运算符
SELECT GREATEST(1, 0, 2), GREATEST('b', 'a', 'c'), GREATEST(1, NULL, 2);

# BETWEEN AND 运算符
SELECT 1 BETWEEN 0 AND 1, 10 BETWEEN 11 AND 12, 'b' BETWEEN 'a' AND 'c';

SELECT last_name, salary
FROM employees
WHERE salary BETWEEN 2500 AND 3500;


# IN 运算符
SELECT 'a' IN ('a', 'b', 'c'), 1 IN (2, 3), NULL IN ('a', 'b'), 'a' IN ('a', NULL);

# NOT IN 运算符
SELECT 'a' NOT IN ('a', 'b', 'c'), 1 NOT IN (2, 3);

# LINK 运算符
SELECT NULL LIKE 'abc', 'abc' LIKE NULL;

SELECT first_name
FROM employees
WHERE first_name LIKE 'S%';

SELECT last_name
FROM employees
WHERE last_name LIKE '_o%';


# ESCAPE
SELECT job_id
FROM jobs
WHERE job_id LIKE 'IT\_%';

# 如果使用\表示转义，要省略ESCAPE。如果不是\，则要加上ESCAPE
SELECT job_id
FROM jobs
WHERE job_id LIKE 'IT$_%' escape '$'

# REG
SELECT 'shkstart' REGEXP '^s', 'shkstart' REGEXP 't$', 'shkstart' REGEXP 'hk';

SELECT first_name, last_name
from employees
where first_name REGEXP '^s';

# 逻辑非运算
SELECT NOT 1, NOT 0, NOT (1 + 1), NOT !1, NOT NULL;

SELECT *
FROM jobs
WHERE job_id NOT IN ('IT_PROG', 'ST_CLERK', 'SA_REP');


# 逻辑与运算符
SELECT employee_id, last_name, job_id, salary
FROM   employees
WHERE  salary >=10000
AND    job_id LIKE '%MAN%';

# 逻辑或运算符
SELECT employee_id , first_name , salary FROM employees WHERE salary < 9000 OR salary > 12000;

# 逻辑异或运算符
SELECT last_name,department_id,salary
FROM employees
WHERE department_id IN (10,20) XOR salary > 8000;

# 按位取反运算符
SELECT 10 & ~ 1;

# 按位右移运算符
#
SELECT 16 >> 2 , 3 >> 2 ;

# 正则
# 查询f_name字段以字母‘b’开头的记录
SELECT * FROM employees WHERE first_name REGEXP '^b';
# 查询f_name字段以字母‘y’结尾的记录
SELECT * FROM employees WHERE first_name REGEXP 'y$';
# 用符号"."来替代字符串中的任意一个字符
SELECT * FROM employees WHERE first_name REGEXP 'G.a';
# 星号‘*’匹配前面的字符任意多次，包括0次。加号‘+’匹配前面的字符至少一次
SELECT * FROM employees WHERE first_name REGEXP '^Pa+';
# 查询包含 at 的
SELECT * FROM employees WHERE first_name REGEXP '^Pa+';
# 查询包含 on 的
SELECT * FROM employees WHERE first_name REGEXP 'on';
SELECT * FROM employees WHERE first_name LIKE 'on';
# 查询f_name字段值包含字符串“on”或者“te”的记录
SELECT * FROM employees WHERE first_name REGEXP 'on|te';
# 匹配指定字符中的任意一个, 只要包含 o 或者 n 即可
SELECT * FROM employees WHERE first_name REGEXP '[on]';
# 匹配 id 中含 9或者2的
SELECT employee_id, first_name FROM employees WHERE employee_id REGEXP '[92]';
# 匹配指定字符以外的字符
# 查询employee_id字段中包含 [1~9] 以外数字1的 (0)
SELECT employee_id, first_name FROM employees WHERE employee_id REGEXP '[^1-9]';

# 使用{n,}或者{n,m}来指定字符串连续出现的次数
SELECT employee_id, first_name FROM employees WHERE first_name REGEXP 'e{2,}';


