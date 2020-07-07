MySQL ���ݿ⹤��ģʽ��C/S�ܹ�
mysqld.exe ���Ƿ�����, ServerSocket
mysql.exe ���ǿͻ���, Socket.

ͨ��Socket��������
Ҫ�����ӷ�����, ����Ҫ�ṩ����ip��ַ(-h), �˿ں�(-P), �û���(-u), ����(-p)

set MYSQL_HOME=D:\MyWork\MySQL\mysql-5.7.28-winx64
set PATH=%MYSQL_HOME%\bin;%PATH%
rem /d��Ŀ���ǲ���Ҫ�л��̾���ֱ���ܵ�ָ����Ŀ��Ŀ¼��.
cd /d %MYSQL_HOME%
mysql -h127.0.0.1 -P3306 -uroot -p"123456"
rem ��һ����ʲô����, ��ͣһ�¿�������
pause 


���������һ� "�½�" -> "�ı��ļ�"
���ļ�����Ϊ"����mysql�ͻ���.bat", �һ����ļ� -> "�༭"
�����漸�����ݸ��Ƶ��ļ���, ����
�������һ�"����mysql�ͻ���.bat", -> "�Թ���Ա�������"


�ɹ��������� :
D:\MyWork\MySQL\mysql-5.7.28-winx64>mysql -h127.0.0.1 -P3306 -uroot -p"123456"
mysql: [Warning] Using a password on the command line interface can be insecure.
Welcome to the MySQL monitor.  Commands end with ; or \g.
Your MySQL connection id is 9
Server version: 5.7.28 MySQL Community Server (GPL)

Copyright (c) 2000, 2019, Oracle and/or its affiliates. All rights reserved.

Oracle is a registered trademark of Oracle Corporation and/or its
affiliates. Other names may be trademarks of their respective
owners.

Type 'help;' or '\h' for help. Type '\c' to clear the current input statement.

mysql> _

���õ�SQL���� :
ע�� : ���е�sql��������;Ϊ��β�Ͷ���.

�鿴�������е����ݿ�
show databases;

ÿ�����ݿ���һ����DataĿ¼�µ�һ����������Ŀ¼.

�鿴��������
show variables like 'char%';

+--------------------------+-----------------------------------------------------+
| Variable_name            | Value                                               |
+--------------------------+-----------------------------------------------------+
| character_set_client     | gbk                                                 |
| character_set_connection | gbk                                                 |
| character_set_database   | utf8                                                |
| character_set_filesystem | binary                                              |
| character_set_results    | gbk                                                 |
| character_set_server     | utf8                                                |
| character_set_system     | utf8                                                |
| character_sets_dir       | D:\MyWork\MySQL\mysql-5.7.28-winx64\share\charsets\ |
+--------------------------+-----------------------------------------------------+

1) �����Զ������ݿ�
create database company charset utf8;

2) �л��������ݿ�
use company;

4) �鿴���ݿ��е����б�
show tables;
+-------------------+
| Tables_in_company |
+-------------------+
| departments       |
| employees         |
| jobs              |
| locations         |
+-------------------+

3) ���ⲿ��.sql�ļ��е����ݵ��뵽��ǰ���ݿ���, ������ļ���·����ʵ��Ϊ׼.
source d:/company.sql;

5) �鿴���е�����
select * from employees;

6) �������ݿ�
drop database company;

��ϰ : �������ݿ�world, ����d:/world.sql���ݵ��뵽world���ݿ���.
1) create database world charset utf8;
2) use world;
3) source d:/world.sql;
4) show tables;
+-----------------+
| Tables_in_world |
+-----------------+
| city            |
| country         |
| countrylanguage |
+-----------------+
5) select * from country;


mysqld�Ƿ����� : �������ݿ�
	���ݿ�1(Ŀ¼)
		��1(����ļ�), .frm�Ǳ�ṹ, .ibd�Ǳ������
			��¼(����)
			��¼2
			��¼3.....
		��2
		��3
		
	���ݿ�2(Ŀ¼)
	���ݿ�3(Ŀ¼)

�о�������о�����еĶ���, ������(��������, ����)

������ : ע��� : ���ݿ���û����java�е�char��������, ���ݿ��е�char���Ƕ����ַ���
create table customer (
	id int,
	name varchar(30),
	gender char(1),
	phone varchar(30),
	email varchar(50)
);

�鿴��ṹ
describe customer;
desc customer; 
+--------+-------------+------+-----+---------+-------+
| Field  | Type        | Null | Key | Default | Extra |
+--------+-------------+------+-----+---------+-------+
| id     | int(11)     | YES  |     | NULL    |       |
| name   | varchar(30) | YES  |     | NULL    |       |
| gender | char(1)     | YES  |     | NULL    |       |
| phone  | varchar(30) | YES  |     | NULL    |       |
| email  | varchar(50) | YES  |     | NULL    |       |
+--------+-------------+------+-----+---------+-------+

������ : �ѱ�ṹ�����е�����ȫ��ɾ��
drop table customer;

����в�������
insert into ����(�����б�) values(�ж�Ӧ��ֵ���б�);

insert into customer (
	id,
	name,
	gender,
	phone, 
	email
) values (
	1,
	'����',
	'��',
	'213234',
	'zhang3@qq.com'
);

insert into customer (
	id,
	name,
	gender,
	phone, 
	email
) values (
	2,
	'����',
	'Ů',
	'2321234',
	'li4@qq.com'
);

insert into customer (
	id,
	name,
	gender,
	phone, 
	email
) values (
	3,
	'����',
	'��',
	'3341234',
	'w5@qq.com'
);

�޸����� 

�������д���޸���������, ��������
update customer set 
	name = '������',
	phone = '1323434',
	email = 'wl5@qq.com';
	
update customer set 
	name = '����',
	email = 'z3@qq.com'
where
	id = 1;

ɾ������

�������д��ɾ����������, ��������
delete from customer;

delete from customer where id = 2;

�������� insert : C 
�鿴���� select : R  
�޸����� update : U 
ɾ������ delete : D 

CRUD������Ե��Ǳ��е�����, ��������� ��ΪDML(���ݲ�������)


���show variables like 'char%'; �������, ����ִ�����  set names gbk; 
+--------------------------+-----------------------------------------------------+
| Variable_name            | Value                                               |
+--------------------------+-----------------------------------------------------+
| character_set_client     | utf8                                                |
| character_set_connection | utf8                                                |
| character_set_database   | utf8                                                |
| character_set_filesystem | binary                                              |
| character_set_results    | utf8                                                |
| character_set_server     | utf8                                                |
| character_set_system     | utf8                                                |
| character_sets_dir       | D:\Mywork\Mysql\mysql-5.7.28-winx64\share\charsets\ |
+--------------------------+-----------------------------------------------------+


��ѯ��������
select * from departments;

��ѯָ���е�����
SELECT department_id, location_id
FROM   departments;


��ϵ�����ݿ����� ���� �����֮��������ϵ��, ���ǹ�����.

+----------------+---------------------------------------------------------------------------------------+------+-----+---------+-------+
| Field          | Type                                                                                  | Null | Key | Default | Extra |
+----------------+---------------------------------------------------------------------------------------+------+-----+---------+-------+
| Code(����)           | char(3)                                                                               | NO   | PRI |         |       |
| Name           | char(52)                                                                              | NO   |     |         |       |
| Continent(����)      | enum('Asia','Europe','North America','Africa','Oceania','Antarctica','South America') | NO   |     | Asia    |       |
| Region(����)         | char(26)                                                                              | NO   |     |         |       |
| SurfaceArea(���)    | float(10,2)                                                                           | NO   |     | 0.00    |       |
| IndepYear      | smallint(6)                                                                           | YES  |     | NULL    |       |
| Population(�˿�)     | int(11)                                                                               | NO   |     | 0       |       |
| LifeExpectancy(ƽ������) | float(3,1)                                                                            | YES  |     | NULL    |       |
| GNP(����������ֵ)            | float(10,2)                                                                           | YES  |     | NULL    |       |
| GNPOld         | float(10,2)                                                                           | YES  |     | NULL    |       |
| LocalName      | char(45)                                                                              | NO   |     |         |       |
| GovernmentForm | char(45)                                                                              | NO   |     |         |       |
| HeadOfState(�쵼��)    | char(60)                                                                              | YES  |     | NULL    |       |
| Capital(�׶�)        | int(11)                                                                               | YES  |     | NULL    |       |
| Code2          | char(2)                                                                               | NO   |     |         |       |
+----------------+---------------------------------------------------------------------------------------+------+-----+---------+-------+

select * from country;

select 
	code,
	name,
	continent
from 
	country;
	
select 
	continent,
	code,
	name 
from 
	country;
	
��ѯ�ı��� : �ѻ����п�, �ٿ�Ҫselectʲô��, �Ͱ�ʲô��ȡ����, ������ճ��һ����ʱ�����, ������ʾ���ͻ���

ע��� : 
SQL ���Դ�Сд�����С� 
SQL ����д��һ�л��߶���
�ؼ��ֲ��ܱ���дҲ���ܷ���
���Ӿ�һ��Ҫ����д��
ʹ������������Ŀɶ��ԡ�

�������������������ʾ��ʱ������ ����, ���ڲ鿴�����.
�еı���, as�ؼ��ֿ���ʡ��
SELECT 
	last_name AS name, 
	commission_pct comm
FROM   employees;


��������""�ĺô��ǿ��԰����ո�, ������ԭ����ʾ
SELECT 
	last_name AS "name", 
	commission_pct "���� ����"
FROM   employees;


��ѯ���ҵĴ��޺��˿ڼ����ƺʹ���, ���޺��˿������, ���Ǻ���.
select 
	continent as ����,
	population "�˿�",
	name,
	code 
from 
	country;

select ֻ�ܿ�����, ֻ�ܿ��������Ҫȡ��Щ�г���.

where ���Կ�����, where���������������(�ж���)

select 
	first_name,
	salary,
	department_id dept
from 
	employees
where 
	department_id = 90;
	
where�в�����ʹ��������(����), ��Ϊ������selectִ��.
select 
	first_name,
	salary,
	department_id dept
from 
	employees
where -- ��ִ��whereʱû�����, ֻ�������.
	dept = 90;
	
ִ��˳�� : from -> where -> select 

��ϰ : 
��ѯ�������޹��ҵĴ���, ���޺�����, �˿�, Ҫ����������
select
	code,
	continent ����,
	name,
	population
from 
	country 
where 
	continent = 'asia';
	
��ѯ�����й��ĳ���.
+-------------+----------+------+-----+---------+----------------+
| Field       | Type     | Null | Key | Default | Extra          |
+-------------+----------+------+-----+---------+----------------+
| ID          | int(11)  | NO   | PRI | NULL    | auto_increment |
| Name        | char(35) | NO   |     |         |                |
| CountryCode | char(3)  | NO   | MUL |         |                |
| District    | char(20) | NO   |     |         |                |
| Population  | int(11)  | NO   |     | 0       |                |
+-------------+----------+------+-----+---------+----------------+
select 
	*
from 
	city 
where 
	countrycode = 'chn';

--between a and b ��ʾһ������, ����a��b
SELECT last_name, salary
FROM   employees
WHERE  salary BETWEEN 2500 AND 3500;


--in(����), ֻҪ���ڼ����е�����һ���Ϳ���
SELECT employee_id, last_name, salary, manager_id
FROM   employees
WHERE  manager_id IN (100, 101, 201);

--like '�ַ���' �� = һ����
--like '_%' ����ģ����ѯ

_��ʾ����һ���ַ�
%��ʾ����������ַ�

SELECT first_name
FROM employees
WHERE first_name LIKE 'steven';

select
	code,
	name,
	continent
from 
	country 
where 
	name like '_hi%'; -- ��һ���϶���, ���ǲ�ȷ��, ��2����ĸ��h��3��һ��i, ��������.
	
select
	code,
	name,
	continent
from 
	country 
where 
	name like '%hi%'; -- ����������ֻҪ������hi����
	
-- ��2����ĸ��o, �������
SELECT last_name
FROM   employees
WHERE  last_name LIKE '_o%';

-- ��ѯ���������а���ing��
select 
	*
from 
	city 
where 
	name like '%ing%';
	
-- ��ѯ�������Ƶ�3����ĸ��a�Ĺ���
select 
	code,
	name,
	population
from 
	country 
where 
	name like '__a%';

null������ֵ, ��һ����������, ��ʾ���ǿ�, ʲôҲû��, ����������Ƚ������߼�����, ���һ����false

select 
	code,
	name,
	continent,
	population,
	capital
from 
	country 
where 
	capital = null;
	
null��һ�������ר�Ų����� is 

select 
	code,
	name,
	continent,
	population,
	capital
from 
	country 
where 
	capital is null;
	
-- �鿴�������׶��Ĺ���
select 
	code,
	name,
	continent,
	population,
	capital
from 
	country 
where 
	capital is not null;
	
-- ��ѯ��Щ������δ����.
select 
	name,
	continent,
	indepyear
from 
	country 
where 
	indepyear is null;
	
And��ʾ�߼���, �ǲ���
SELECT 
	employee_id, 
	last_name, 
	job_id, 
	salary
FROM   
	employees
WHERE  
		salary >=10000
	AND    
		job_id LIKE '%MAN%';
		
OR��ʾ�߼���, �ǻ���
SELECT 
	employee_id, 
	last_name, 
	job_id, 
	salary
FROM   
	employees
WHERE  
		salary >=10000
	OR    
		job_id LIKE '%MAN%';
		
-- ��ѯ�������޹����˿���5000�����ϵĹ�������, ������˿�.
select 
	code,
	name,
	population
from 
	country 
where 
		continent = 'asia'
	and 
		population > 50000000;

-- ��ѯ�й���Щ�����˿�С��50��.
select 
	*
from 
	city 
where 
		countrycode = 'chn'
	and 
		population < 500000;

		
--ȥ��ʹ��distinct, distinct�����ں���������е����ֵ		
--ȫ������Щ����, 	
--distinctǰ�治������ֱ����.
select 
	distinct 
		continent,
		region
from 
	country;
	
-- ��ѯ�й�����Щ��ͬ��ʡ��
select 
	distinct district
from 
	city 
where 
	countrycode = 'chn';

-- ��ѯȫ�������Щ��ͬ��������֯.
select 
	distinct GovernmentForm
from 
	country;

order by  �������ݵ���, �����ǰ�������ʾ�����ָ����˳��	
	
select 
	id,
	name,
	district dist,
	population pop
from 
	city 
where 
		countrycode = 'chn'
	and 
		population < 200000
order by 
	dist desc; --desc��ʾ����  asc; -- asc ��ʾ����
	
ִ��˳�� : from -> where -> select -> order by 
������Զ���������ִ��..���Ƿ������

-- order by ��������ж����, �Ȱ���һ��Ϊ��������, ���ڵ�һ�����ź���Ļ�����, �Եڶ���Ϊ������΢��.
SELECT 
	last_name, department_id, salary
FROM   
	employees
ORDER BY 
	department_id asc, 
	salary DESC;

	
-- �鿴�����й������˿�С��10��ĳ���, ����ʡ��������ʾ, ʡ���ڲ��ٰ����ƽ���.
select 
	id,
	name,
	district dist,
	population pop
from 
	city 
where 
		countrycode = 'chn'
	and 
		population < 100000
order by 
	dist asc,
	name desc;
	
-- �鿴���ҵ��˿�, �Դ�������, �鿴ÿ���������˿����Ĺ���
select 
	name,
	continent,
	population
from 
	country 
order by 
	continent,
	population;

-- �鿴��еĹ���
select 
	code,
	name,
	continent,
	gnp
from 
	country 
order by 
	gnp desc;
	
-- �鿴���������˿ڵĹ��� 
select 
	code,
	name,
	population
from 
	country 
where 
	continent = 'asia'
order by 
	population desc;
	
-- �鿴�й���ʹ�ö���������
select 
	*
from 
	countrylanguage
where 
	countrycode = 'chn';

	
ִ��˳�� : from ȷ������, where ���˻������, select ȷ��Ҫ��Щ��, order by ȷ�������ʾʱ��˳��

mysql> select * from city where name = 'london';
+------+--------+-------------+----------+------------+
| ID   | Name   | CountryCode | District | Population |
+------+--------+-------------+----------+------------+
|  456 | London | GBR         | England  |    7285000 |
| 1820 | London | CAN         | Ontario  |     339917 |
+------+--------+-------------+----------+------------+

select * from country where code in('gbr', 'can');
+------+----------------+---------------+-----------------+-------------+-----------+------------+----------------+------------+------------+----------------+-------------------------------------+--------------+---------+-------+
| Code | Name           | Continent     | Region          | SurfaceArea | IndepYear | Population | LifeExpectancy | GNP        | GNPOld     | LocalName      | GovernmentForm                      | HeadOfState  | Capital | Code2 |
+------+----------------+---------------+-----------------+-------------+-----------+------------+----------------+------------+------------+----------------+-------------------------------------+--------------+---------+-------+
| CAN  | Canada         | North America | North America   |  9970610.00 |      1867 |   31147000 |           79.4 |  598862.00 |  625626.00 | Canada         | Constitutional Monarchy, Federation | Elisabeth II |    1822 | CA    |
| GBR  | United Kingdom | Europe        | British Islands |   242900.00 |      1066 |   59623400 |           77.7 | 1378330.00 | 1296830.00 | United Kingdom | Constitutional Monarchy             | Elisabeth II |     456 | GB    |
+------+----------------+---------------+-----------------+-------------+-----------+------------+----------------+------------+------------+----------------+-------------------------------------+--------------+---------+-------+

Ϊ�˱����о�, �����±�
create table city2 select * from city where name = 'london';
create table country2 select * from country where code in('gbr', 'can');
+------+--------+-------------+----------+------------+
| ID   | Name   | CountryCode | District | Population |
+------+--------+-------------+----------+------------+
|  456 | London | GBR         | England  |    7285000 |
| 1820 | London | CAN         | Ontario  |     339917 |
+------+--------+-------------+----------+------------+
+------+----------------+---------------+-----------------+-------------+-----------+------------+----------------+------------+------------+----------------+-------------------------------------+--------------+---------+-------+
| Code | Name           | Continent     | Region          | SurfaceArea | IndepYear | Population | LifeExpectancy | GNP        | GNPOld     | LocalName      | GovernmentForm                      | HeadOfState  | Capital | Code2 |
+------+----------------+---------------+-----------------+-------------+-----------+------------+----------------+------------+------------+----------------+-------------------------------------+--------------+---------+-------+
| CAN  | Canada         | North America | North America   |  9970610.00 |      1867 |   31147000 |           79.4 |  598862.00 |  625626.00 | Canada         | Constitutional Monarchy, Federation | Elisabeth II |    1822 | CA    |
| GBR  | United Kingdom | Europe        | British Islands |   242900.00 |      1066 |   59623400 |           77.7 | 1378330.00 | 1296830.00 | United Kingdom | Constitutional Monarchy             | Elisabeth II |     456 | GB    |
+------+----------------+---------------+-----------------+-------------+-----------+------------+----------------+------------+------------+----------------+-------------------------------------+--------------+---------+-------+
������ : 
select 
	*
from 
	city2,
	country2;
+------+--------+-------------+----------+------------+------+----------------+---------------+-----------------+-------------+-----------+------------+----------------+------------+------------+----------------+-------------------------------------+--------------+---------+-------+
| ID   | Name   | CountryCode | District | Population | Code | Name           | Continent     | Region          | SurfaceArea | IndepYear | Population | LifeExpectancy | GNP        | GNPOld     | LocalName      | GovernmentForm                      | HeadOfState  | Capital | Code2 |
+------+--------+-------------+----------+------------+------+----------------+---------------+-----------------+-------------+-----------+------------+----------------+------------+------------+----------------+-------------------------------------+--------------+---------+-------+
|  456 | London | GBR         | England  |    7285000 | CAN  | Canada         | North America | North America   |  9970610.00 |      1867 |   31147000 |           79.4 |  598862.00 |  625626.00 | Canada         | Constitutional Monarchy, Federation | Elisabeth II |    1822 | CA    |
| 1820 | London | CAN         | Ontario  |     339917 | CAN  | Canada         | North America | North America   |  9970610.00 |      1867 |   31147000 |           79.4 |  598862.00 |  625626.00 | Canada         | Constitutional Monarchy, Federation | Elisabeth II |    1822 | CA    |
|  456 | London | GBR         | England  |    7285000 | GBR  | United Kingdom | Europe        | British Islands |   242900.00 |      1066 |   59623400 |           77.7 | 1378330.00 | 1296830.00 | United Kingdom | Constitutional Monarchy             | Elisabeth II |     456 | GB    |
| 1820 | London | CAN         | Ontario  |     339917 | GBR  | United Kingdom | Europe        | British Islands |   242900.00 |      1066 |   59623400 |           77.7 | 1378330.00 | 1296830.00 | United Kingdom | Constitutional Monarchy             | Elisabeth II |     456 | GB    |
+------+--------+-------------+----------+------------+------+----------------+---------------+-----------------+-------------+-----------+------------+----------------+------------+------------+----------------+-------------------------------------+--------------+---------+-------+
�������еĽ�����������������, ���Ա������
select 
	*
from 
	city2,
	country2
where 
	countrycode = code;
+------+--------+-------------+----------+------------+------+----------------+---------------+-----------------+-------------+-----------+------------+----------------+------------+------------+----------------+-------------------------------------+--------------+---------+-------+
| ID   | Name   | CountryCode | District | Population | Code | Name           | Continent     | Region          | SurfaceArea | IndepYear | Population | LifeExpectancy | GNP        | GNPOld     | LocalName      | GovernmentForm                      | HeadOfState  | Capital | Code2 |
+------+--------+-------------+----------+------------+------+----------------+---------------+-----------------+-------------+-----------+------------+----------------+------------+------------+----------------+-------------------------------------+--------------+---------+-------+
| 1820 | London | CAN         | Ontario  |     339917 | CAN  | Canada         | North America | North America   |  9970610.00 |      1867 |   31147000 |           79.4 |  598862.00 |  625626.00 | Canada         | Constitutional Monarchy, Federation | Elisabeth II |    1822 | CA    |
|  456 | London | GBR         | England  |    7285000 | GBR  | United Kingdom | Europe        | British Islands |   242900.00 |      1066 |   59623400 |           77.7 | 1378330.00 | 1296830.00 | United Kingdom | Constitutional Monarchy             | Elisabeth II |     456 | GB    |
+------+--------+-------------+----------+------------+------+----------------+---------------+-----------------+-------------+-----------+------------+----------------+------------+------------+----------------+-------------------------------------+--------------+---------+-------+

-- ���ⲻͬ���ͬ���б�����ϱ��޶�, ��ʹû�г�ͻ, ҲӦ�ü��ϱ��޶�, ��߿ɶ���
select 
	city2.id,
	city2.name City,
	city2.district,
	city2.population CityPop,
	country2.name Country,
	country2.population countryPop,
	country2.capital
from 
	city2,
	country2 
where 
	city2.countrycode = country2.code;
	
	
-- ��ѯʱҲ���Ը��������, �ô�ʱ��ʹ�ñ���ʱ��.
select 
	ci.id,
	ci.name City,
	ci.district,
	ci.population CityPop,
	co.name Country,
	co.population countryPop,
	co.capital
from 
	city2 as ci ,
	country2 co
where 
	ci.countrycode = co.code;


ʵ�� -> ����ʵʵ���ڵı�. DDL�����ܸ�
���� -> from ����ı�
��� -> ������������.
	
-- from ��������ִ��. ���Ա���һ���ı�, ԭ���Ͳ�����..
-- �����sql�Ǵ����.
select 
	city2.id,
	city2.name City,
	city2.district,
	city2.population CityPop,
	country2.name Country,
	country2.population countryPop,
	country2.capital
from 
	city2 as ci ,
	country2 co
where 
	city2.countrycode = country2.code;
	
-- ��ѯ���й��ҵ����ƺ͹��ҵ��׶�������
select
	co.name country ,
	city.name capital
from
	country co,
	city 
where 
	co.capital = city.id;
	
-- ��ѯ���й��Ҽ����ҵ����г���	
select
	co.name country ,
	city.name city
from
	country co,
	city 
where 
	co.code = city.countrycode;

	
select 
	ci.id,
	ci.name City,
	ci.district,
	ci.population CityPop,
	co.name Country,
	co.population countryPop,
	co.capital
from 
	city2 as ci ,
	country2 co
where 
		ci.countrycode = co.code
	and 
		ci.population > 1000000;

--- �������ӱ��ʾ���������
select 
	ci.id,
	ci.name City,
	ci.district,
	ci.population CityPop,
	co.name Country,
	co.population countryPop,
	co.capital
from 
	city2 as ci ,
	country2 co
where 
		ci.countrycode = co.code -- �������� 
	and 
		ci.population > 1000000;
		
-- SQL99��׼�������������д��, ��ͱ�ֱ��inner join, ��������ʹ��on
-- where �� on �����������ǿ��Ի�������, ���Ǿ���Ҫ������.
select 
	ci.id,
	ci.name City,
	ci.district,
	ci.population CityPop,
	co.name Country,
	co.population countryPop,
	co.capital
from 
	city2 as ci
inner join 
	country2 co 
on  
	ci.countrycode = co.code 
where  
	ci.population > 1000000;
	
	
--inner join �� on ����ɶԳ���. 
--inner ����ʡ��
select 
	ci.id,
	ci.name City,
	ci.district,
	ci.population CityPop,
	co.name Country,
	co.population countryPop,
	co.capital,
	cl.language
from 
	city2 as ci
join 
	country2 co 
on  
	ci.countrycode = co.code 
join 
	countrylanguage cl 
on 
	co.code = cl.countrycode 
where  
	ci.population > 1000000;


-- ��ѯ�������޺�ŷ�޹������Ƽ����ҵ��׶�
select 
	co.continent,
	co.name country,
	ci.name captial
from 
	country co 
join 
	city ci 
on 
	co.capital = ci.id 
where 
		co.continent = 'asia' 
	or 
		co.continent = 'europe'
order by 
	country;
	
-- ��ѯ�������޺ͷ��޹��ҵ����ƺ��׶����ٷ�����, ����������













