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
	
	
��ϰ : 
C/S ģʽ

�ͻ���Ҫ�����ӷ�����, ��Ҫ�ṩ����IP��ַ, �˿ں�, �û���, ����.
mysql -h127.0.0.1 -P3306 -uroot -p123456 world 
mysql --host=127.0.0.1 --port=3306 --user=root --password=123456 world 
	
�鿴��ǰ���еı�
show tables;

���鿴��
show tables from ����;
	
�鿴��ṹ
describe ����;
desc ����.����;

�鿴��Ľ������, ���Բ鿴������ϸ����Ϣ
show create table ����;
�鿴���������Լ��������, ��ʹ�ô洢����, ����ֵ, Ĭ���ַ���.

CREATE TABLE `city` (
  `ID` int(11) NOT NULL AUTO_INCREMENT,
  `Name` char(35) NOT NULL DEFAULT '',
  `CountryCode` char(3) NOT NULL DEFAULT '',
  `District` char(20) NOT NULL DEFAULT '',
  `Population` int(11) NOT NULL DEFAULT '0',
  PRIMARY KEY (`ID`),
  KEY `CountryCode` (`CountryCode`),
  CONSTRAINT `city_ibfk_1` FOREIGN KEY (`CountryCode`) REFERENCES `country` (`Code`)
) ENGINE=InnoDB AUTO_INCREMENT=4080 DEFAULT CHARSET=latin1;

"`" ���ų�ΪƮ��, ������. ר�������ݿ������ڰ�Χ���ݿ���������
���ݿ���� : ���ݿ�, ��, ��, ����, Լ��, �¼�, ����, �洢����......

�洢���� : ��������δ�������, �����������.........
InnoDB : ֧�����, ����ȸ߼�����

show engines;
+--------------------+---------+----------------------------------------------------------------+--------------+------+------------+
| Engine             | Support | Comment                                                        | Transactions | XA   | Savepoints |
+--------------------+---------+----------------------------------------------------------------+--------------+------+------------+
| InnoDB             | DEFAULT | Supports transactions, row-level locking, and foreign keys     | YES          | YES  | YES        |
| MRG_MYISAM         | YES     | Collection of identical MyISAM tables                          | NO           | NO   | NO         |
| MEMORY             | YES     | Hash based, stored in memory, useful for temporary tables      | NO           | NO   | NO         |
| BLACKHOLE          | YES     | /dev/null storage engine (anything you write to it disappears) | NO           | NO   | NO         |
| MyISAM             | YES     | MyISAM storage engine                                          | NO           | NO   | NO         |
| CSV                | YES     | CSV storage engine                                             | NO           | NO   | NO         |
| ARCHIVE            | YES     | Archive storage engine                                         | NO           | NO   | NO         |
| PERFORMANCE_SCHEMA | YES     | Performance Schema                                             | NO           | NO   | NO         |
| FEDERATED          | NO      | Federated MySQL storage engine                                 | NULL         | NULL | NULL       |
+--------------------+---------+----------------------------------------------------------------+--------------+------+------------+

MyISAM��mysql����Ĭ������ :
	�ٶȳ���, ��֧������,���
InnoDB 
	�ٶȺܿ�, ֧������, ��� 
	
�鿴��������
*����������
select * from ����;

��ѯ����, ���ʽ, ����, ��������.

select 200 from dual;
select 'abc' from dual;	
select 2*(3+5)-5*((3-2)*4);

���� :
�û����� : ������������ʹ��
set @var1 = 200, @var2 = 'abc';
ϵͳ���� :
show variables;
select @@������;

����
select database(); �鿴��ǰ�������ݿ�
select version(); �鿴�������汾
select now(); �鿴��ǰʱ��
	
select 
	'abc',
	29*9-3,
	now(),
	@@version,
	version(),
	country.*
from
	country
where 
	name = 'china';
	
ִ��˳�� : 
from -> join -> on -> where -> select -> order by 

-- ��ѯ�������޺ͷ��޹��ҵ����ƺ��׶����ٷ�����, ����������
+----------------+---------------------------------------------------------------------------------------+------+-----+---------+-------+
| Field          | Type                                                                                  | Null | Key | Default | Extra |
+----------------+---------------------------------------------------------------------------------------+------+-----+---------+-------+
| Code           | char(3)                                                                               | NO   | PRI |         |       |
| Name           | char(52)                                                                              | NO   |     |         |       |
| Continent      | enum('Asia','Europe','North America','Africa','Oceania','Antarctica','South America') | NO   |     | Asia    |       |
| Region         | char(26)                                                                              | NO   |     |         |       |
| SurfaceArea    | float(10,2)                                                                           | NO   |     | 0.00    |       |
| IndepYear      | smallint(6)                                                                           | YES  |     | NULL    |       |
| Population     | int(11)                                                                               | NO   |     | 0       |       |
| LifeExpectancy | float(3,1)                                                                            | YES  |     | NULL    |       |
| GNP            | float(10,2)                                                                           | YES  |     | NULL    |       |
| GNPOld         | float(10,2)                                                                           | YES  |     | NULL    |       |
| LocalName      | char(45)                                                                              | NO   |     |         |       |
| GovernmentForm | char(45)                                                                              | NO   |     |         |       |
| HeadOfState    | char(60)                                                                              | YES  |     | NULL    |       |
| Capital        | int(11)                                                                               | YES  |     | NULL    |       |
| Code2          | char(2)                                                                               | NO   |     |         |       |
+----------------+---------------------------------------------------------------------------------------+------+-----+---------+-------+
+-------------+----------+------+-----+---------+----------------+
| Field       | Type     | Null | Key | Default | Extra          |
+-------------+----------+------+-----+---------+----------------+
| ID          | int(11)  | NO   | PRI | NULL    | auto_increment |
| Name        | char(35) | NO   |     |         |                |
| CountryCode | char(3)  | NO   | MUL |         |                |
| District    | char(20) | NO   |     |         |                |
| Population  | int(11)  | NO   |     | 0       |                |
+-------------+----------+------+-----+---------+----------------+
+-------------+---------------+------+-----+---------+-------+
| Field       | Type          | Null | Key | Default | Extra |
+-------------+---------------+------+-----+---------+-------+
| CountryCode | char(3)       | NO   | PRI |         |       |
| Language    | char(30)      | NO   | PRI |         |       |
| IsOfficial  | enum('T','F') | NO   |     | F       |       |
| Percentage  | float(4,1)    | NO   |     | 0.0     |       |
+-------------+---------------+------+-----+---------+-------+
select 
	co.name country,
	ci.name capital,
	cl.language 
from 
	country co 
join 
	city ci  
on 
	co.capital = ci.id 
join 
	countrylanguage cl 
on 
	co.code = cl.countrycode 
where 
		co.continent in ('asia', 'africa')
	and 
		cl.isofficial = 'T'
order by 
	cl.language;


select 
	ci.name city,
	co.name country,
	ci.population cityPop,
	co.population countryPop
from 
	city2 ci 
join 
	country2 co 
on 
	ci.countrycode = co.code;

-- ��ѯ���Ҽ��׶�
select 
	co.name country,
	ci.name capital
from 
	country2 co 
join 
	city2 ci 
on 
	co.capital = ci.id;
	
�����ӵ��ص� : ֻ����������������ļ�¼.
�����ӵ��ص� : ������������Ϊ��ļ�¼, ��Ҫȷ��ĳ�ű������Ϊ�ٵļ�¼. ��֤ĳ�ű�����ݵ��ϸ��������.
-- ����û������֮��, ��������, outer�ؼ��ֿ���ʡ��
-- �������ӱ�֤�����������
select 
	co.name country,
	ci.name capital
from 
	country2 co 
left outer join 
	city2 ci 
on 
	co.capital = ci.id;
	
-- �������ӱ�֤�ұ���������
select 
	co.name country,
	ci.name capital
from 
	country2 co 
right join 
	city2 ci 
on 
	co.capital = ci.id;

-- �鿴���й��ҵ����ƺ��׶�, ���û���׶�Ҳ��ʾ.
select 
	co.name,
	ci.name catital
from 
	country co 
left join 
	city ci 
on 
	co.capital = ci.id
order by 
	capital desc;
	

-- �鿴���г��м������Ƿ����׶�, �����,��ʾ����
select 
	co.name,
	ci.name catital
from 
	country co 
right join 
	city ci 
on 
	co.capital = ci.id
order by 
	capital desc;
	
-- �鿴���й��ҵ����ƺ͹ٷ�����, ���û�йٷ����Ե�Ҳ��ʾ.
-- ������ȷ������
select 
	co.name,
	cl.*
from 
	country co 
left join 
	countrylanguage cl 
on 
		co.code = cl.countrycode
	and 
		cl.isofficial = 't' 
order by 
	co.name,
	cl.language desc;

-- ����㷨��������, �д��Ľ�... ֪������, ��������???
select 
	co.name,
	cl.*
from 
	country co 
left join 
	countrylanguage cl 
on 
	co.code = cl.countrycode
where  
		cl.isofficial = 't'
	or 
		cl.isofficial is null 
order by 
	co.name,
	cl.language desc;
	
-- ���й��Ҽ��йٷ����ԵĹ��Һ͹ٷ�����, 238
select 
	co.name,
	cl.language,
	cl.isofficial
from 
	country co 
left join 
	countrylanguage cl 
on 
	co.code = cl.countrycode
where  
	cl.isofficial = 't'; 
	
-- 190�����ҿ϶��йٷ�����	
select 
	distinct co.name
from 
	country co 
left join 
	countrylanguage cl 
on 
	co.code = cl.countrycode
where  
	cl.isofficial = 't'; 
	
6��������ȫû������
238�������йٷ�����
190�����ҿ϶��йٷ�����

238 - 190 = 48�������ж���ٷ�����
239 + 48 = 287����ȷ�ļ�¼��
239 - 6 - 190 = 233 - 190 = 43������û�йٷ�����
238 + 43 = 281�������Բ��п���û�йٷ����ԵĹ���

244 == 238 + 6 , �˵��ľ���43��û�йٷ����ԵĹ���
�����������where������������, ��Ϊwhere�������޷���ȷ�жϳ�ĳ�������Ƿ�û�йٷ�����.
select 
	co.name,
	cl.*
from 
	country co 
left join 
	countrylanguage cl 
on 
	co.code = cl.countrycode
where  
		cl.isofficial = 't'
	or 
		cl.isofficial is null 
order by 
	co.name,
	cl.language desc;	

-- ��ȫû�����ԵĹ���	
select 
	co.name
from 
	country co 
left join 
	countrylanguage cl 
on 
	co.code = cl.countrycode
where  
	cl.language is null;
	

-- ���й���,���ٷ����Եĸ���
select 
	co.name,
	count(cl.isofficial) ct
from 
	country co 
left join 
	countrylanguage cl 
on 
		co.code = cl.countrycode
	and  
		cl.isofficial = 'T'
group by 
	co.name
order by 
	ct desc;
	
���к���, ��������ÿһ�� ��¼�ĺ���, ���Ľ���ǻ����ж��ټ�¼���ж���
select 
	upper(name)
from 
	country;
	
select 
	concat('country:',name)
from 
	country;
	
-- ��ѯ���й���, �ѹ��Ҵ�������Ƽ������ö��Ÿ������ӳ�һ����, ��ʾ�����
select 
	concat(concat(concat(concat(code, ','),name), ','), continent)
from 
	country;

�麯��, ������һ������, ʹ��ѭ������һ������, ������һ�����. ���ʾ���ͳ������
�麯���Ľ�������Ǳ�ʾ���Ľ������, ������˭��, ����ȷ��
�麯����ʹ��ʱ�����Ժ���ͨ�л���.

count ����

-- ͳ�Ʊ��еļ�¼��
select 
	count(name)
from 
	country;
	
select 
	count(capital) -- һ�������������Ϊnullֵ��, ������ͳ��
from 
	country;
	
--�鿴���е���ʵ��¼��, ��*������
select 
	count(*)
from 
	country;

avg ��ƽ��ֵ
select 
	avg(population)
from 
	country
where 
	continent = 'asia';

max ���ֵ 
min ��Сֵ 
select 
	max(name),
	min(surfacearea) -- 
from 
	country;

sum ��� 

+----------------+---------------------------------------------------------------------------------------+------+-----+---------+-------+
| Field          | Type                                                                                  | Null | Key | Default | Extra |
+----------------+---------------------------------------------------------------------------------------+------+-----+---------+-------+
| Code           | char(3)                                                                               | NO   | PRI |         |       |
| Name           | char(52)                                                                              | NO   |     |         |       |
| Continent      | enum('Asia','Europe','North America','Africa','Oceania','Antarctica','South America') | NO   |     | Asia    |       |
| Region         | char(26)                                                                              | NO   |     |         |       |
| SurfaceArea    | float(10,2)                                                                           | NO   |     | 0.00    |       |
| IndepYear      | smallint(6)                                                                           | YES  |     | NULL    |       |
| Population     | int(11)                                                                               | NO   |     | 0       |       |
| LifeExpectancy | float(3,1)                                                                            | YES  |     | NULL    |       |
| GNP            | float(10,2)                                                                           | YES  |     | NULL    |       |
| GNPOld         | float(10,2)                                                                           | YES  |     | NULL    |       |
| LocalName      | char(45)                                                                              | NO   |     |         |       |
| GovernmentForm | char(45)                                                                              | NO   |     |         |       |
| HeadOfState    | char(60)                                                                              | YES  |     | NULL    |       |
| Capital        | int(11)                                                                               | YES  |     | NULL    |       |
| Code2          | char(2)                                                                               | NO   |     |         |       |
+----------------+---------------------------------------------------------------------------------------+------+-----+---------+-------+
-- ��ѯ�˾�����������С
select 
	max(LifeExpectancy),
	min(LifeExpectancy)
from
	country;
-- ��ѯ���޹����˾�����������С
select 
	max(LifeExpectancy),
	min(LifeExpectancy)
from
	country
where 
	continent = 'asia';
	
	
group by �����ǰѽ����������ͬ���ݵļ�¼�ϵ�һ������, ��ͬ�����ݾ��в�ͬ����, �������ڽ���ͳ������
��group by, ����Ҫ�ѷ������ݵ��з���select��
select 
	continent,
	--name, �߼��ϲ�ͨ, ���Ǵ��������Ϣ����.
	max(population),
	min(gnp)
from 
	country 
group by 
	continent;


-- ���ַ��鲻��, Ч������ͨ��ѯһ��	
select 
	continent, 
	max(population), 
	min(gnp), 
	name
from 
	country
group by -- �����������еĻ�, ����2���е����ֵΪ�ּ�����
	continent, 
	name;


�������"ÿ", "��" ����ʱҪ����

SELECT   
	department_id, 
	AVG(salary)
FROM     
	company.employees
GROUP BY 
	department_id ;

-- ��ѯ���ұ��и��������˾����������������.
select 
	region,
	continent,
	avg(LifeExpectancy),
	max(surfaceArea)
from 
	country 
group by
	continent,
	region;


-- ���ڷ������Ĺ���, ����ʹ��having
select 
	continent,
	max(population) maxPop,
	min(gnp)
from 
	country 
group by 
	continent
having
	max(population) > 100000000;
	
--------------------------------------------------
select 
	continent,
	max(population) maxPop,
	min(gnp)
from 
	country 
group by 
	continent
having
	maxPop > 100000000; -- ��having���Ƿ����ʹ���еı���????
	
-- ����!!!
select 
	continent,
	max(population),
	min(gnp)
from 
	country 
where 
	max(population) > 100000000
group by 
	continent
	
��ѯ : 
1) from ȷ����һ����
2) join ȷ���ڶ�����
3) join ���ڻ�����
4) ��join����Ҫ��on 
5) �������, ����join��on 
6) where ������ϵĴ������л������й���
7) �Ƿ�Ҫ����, ���Ҫ����, ʹ��group by, �������ݵ��к���Ҫ.
8) ��һʱ��ѷ������ݵ��з���select����
9) ��������Ҫѡ����Щ��..
10) ����������, ��������ٽ�һ�����й���,����ʹ��having 
11) ���Ҫ����, ������ order by 


�г������ڳ���10��������ʹ�õ����ԡ�
select 
	language,
	count(*)
from 
	countrylanguage 
group by 
	language
having 
	count(*) > 10;
		
��ѯÿ�����Ҹ��ж��ٸ����к�ÿ�����ҵĳ������˿���
select 
	countrycode,
	count(*),
	sum(population)
from 
	city 
group by 
	countrycode;

�г���ͬ�Ĺ���(country code)�о��񳬹�7,000,000�ĳ��У� �����ж��٣�
select 
	countrycode,
	count(*)
from 
	city 
where 
	population > 7000000
group by 
	countrycode;

��ѯ�й���ÿ��ʡ���ܳ������������˿���
select 
	district,
	count(*),
	sum(population)
from 
	city 
where 
	countrycode = 'chn'
group by 
	district
order by 
	sum(population);
	
-- �߼��Բ���??
select 
	countrycode,
	district,
	count(*),
	sum(population)
from 
	city 
group by 
	countrycode,
	district
having 
	countrycode = 'chn'
order by 
	sum(population);


ÿ�����Ҹ��ж���������
select 
	countrycode,
	count(*)
from 
	countrylanguage 
group by 
	countrycode;
	
Sweden����˵����ʲô���ԣ�
select 
	co.name,
	cl.language,
	cl.isofficial
from 
	countrylanguage cl 
join 
	country  co 
on 
	cl.countrycode = co.code 
where 
	co.name = 'sweden';

��Щ����û���г��κ�ʹ�����ԣ�
select 
	co.name,
	cl.language
from 
	country co 
left join 
	countrylanguage cl 
on 
	co.code = cl.countrycode 
where 
	cl.language is null;
	
	
select 
	co.name,
	count(cl.language) ct 
from 
	country co 
left join 
	countrylanguage cl 
on 
	co.code = cl.countrycode 
group by 
	co.name 
having 
	ct = 0;

**�г��ڳ��б���80%�˿ھ�ס�ڳ��еĹ���
select
	co.code,
	co.name,
	sum(ci.population) / co.population as rate -- �����˿ڶ������г�����˵��Ⱥ�����
from 
	city ci 
join 
	country  co 
on 
	ci.countrycode = co.code 
group by 
	co.code  -- ����
having 
	rate > 0.8;


��ѯ��Щ���ҵ����Գ���10��	, ������ܷ���where����??
select 
	co.name,
	count(cl.language) ct 
from 
	country co 
left join 
	countrylanguage cl 
on 
	co.code = cl.countrycode 
group by 
	co.name 
having 
	ct > 10;
	
	
	
-- ������group by���������, ��������Ⱥ�����
-- Ҳ����ͨ��һ���������õ��麯����ʹ�������Ⱥ����	

�ؼ�����������... 
�й�, 12��, ���� 5000000 
�й�, 12��, �Ϻ� 7000000 
�й�, 12��, �ɶ� 2000000
��������3����¼��˵, �й����й���ص��������ݶ���Ⱥ��, ֻ�г�����Ϣ�Ǹ���

�ձ�, 5��, ���� 6000000
�ձ�, 5��, ��̨ 2000000 
�ձ�, 5��, ���� 100000 
����3����¼��Ⱥ���������ձ����ձ������������. 

select
	co.code,
	sum(ci.population) / co.population
from
	country co
join
	city ci
on
	co.code = ci.countrycode
group by
	co.code,
	co.population
having
	sum(ci.population) / co.population > 0.8;
	

�Ӳ�ѯ����������� : ��Ҫ�ಽ��ѯ��ɵ�, ����һ����ѯ���
--�鿴ȫ��ƽ��������ߵĹ���
select 
	name,
	continent,
	LifeExpectancy
from 
	country 
where 
	LifeExpectancy = (select max(LifeExpectancy) from country)
	
	
--�鿴��Щ�����˿��ǳ���ȫ��ƽ���˿ڵ�
select 
	name,
	population
from 
	country 
where 
	population > (select avg(population) from country);

--�鿴��Щ�������С��Ӣ��
select 
	name,
	surfaceArea
from 
	country 
where 
	surfaceArea <= (select surfaceArea from country where code = 'gbr')
order by 
	surfaceArea;
	
-- ��ѯ����������Щ��������ƽ���˿ڵĹ���.
select 
	co1.name,
	co1.continent,
	co1.population,
	co2.avgPop
from 
	country co1 
join 
	(select 
		continent,
		avg(population) avgPop
	from 
		country 
	group by 
		continent
	) as co2 
on 
	co1.continent = co2.continent
where 
	co1.population > co2.avgPop 

-- �鿴��Щ�й������˿��Ǵ��ڱ�ʡƽ���˿ڵĳ���

CRUD -- DML ���ݲ�������, ��Ҫ��������, �������������(һ���������ɶ��DML����)
create, alter, drop -- DDL ���ݶ�������, ��Ҫ�������ݿ����(��,��,��,Լ��....), �����������ս���
grant revoke, commit, rollback -- DCL ���ݿ�������.  ���������ս���


�������ݿ�
create database if not exists ���ݿ��� charset �ַ���;
create database if not exists school charset utf8;
create database `create` charset utf8; -- ǿ�Ҳ�����ʹ�ùؼ�����Ϊ����


�޸����ݿ� : ֻ���޸��ַ���
alter database school charset gbk;

�������ݿ� 
drop database if exists school;

������ :
1) ȫ�·�ʽ���� :
	�������� :
		int, bigint, char, varchar, longtext, double, decimal, date, datetime
	
	create table if not exists ���� (
		����1 ��������1(����) ����ѡ��(�м�Լ��),
		����2 ��������2(����) ����ѡ��,
		.......,
		��Լ��1,
		��Լ��2,
		......
	) engine ���� charset �ַ���;
	
	create table if not exists teacher (
		id int auto_increment,
		name varchar(20) not null,
		age int,
		salary double,
		primary key(id)
	);
	
	insert into teacher (
		id,
		name,
		age,
		salary 
	) values (
		1,
		'����',
		20,
		20000
	);
	
	insert into teacher (
		id,
		name,
		age,
		salary 
	) values (
		1, -- ������¼��idֵ���������ݳ�ͻ��, Ҳ�޷�����
		'����',
		21,
		30000
	);
	
	insert into teacher (
		id,
		name,
		age,
		salary 
	) values (
		null, -- �������û������, ��Ӵ�����¼��ʧ��
		'����',
		21,
		30000
	);
	
	���� : �Ǳ�Լ��, ������ʾ�����Ƿǿ�Ψһ
	
	create table if not exists classes (
		id int auto_increment, -- �������б���������
		name varchar(20),
		begindate date,
		master int,
		room char(3),
		primary key(id)
	);
	
	���� : student ��id, name, phone, class_id, address
	
	create table if not exists student (
		id int auto_increment,
		name varchar(20),
		phone varchar(20),
		class_id int,
		address varchar(100),
		primary key(id)
	);
	
2) : �����Ӳ�ѯ���� : ���Ƶ��±�����ԭ���Լ��... ������ɱ�Ŀ�¡.
	create table country2 as select * from world.country where continent = 'asia';
	create table country3 as select * from world.country;
	
3) : ��ȫ���Ʊ�ṹ�Ľ���, ����Լ��. ����û������.
	create table �±� like ���б�;
	
�޸ı� : alter table ���� ֧�������Ӿ�

�������
alter table ���� 
add ���� ����������(����) ����ѡ��;

alter table teacher 
add column phone varchar(20) not null; -- ������¼���

alter table teacher 
add column gender enum('��', 'Ů') default '��' after name; -- ��ָ���к����������

alter table teacher 
add column personId varchar(50) first; -- ����ǰ���������

�޸���(�������͵�) : 
alter table ���� 
modify ���� ����������(�³���) ������ѡ��

alter table teacher 
modify salary int;

�޸���(����������)
alter table ���� 
change ������ ������ ����������(�³���) ������ѡ��;

alter table teacher
change phone mobile varchar(20) not null;
	
������ -- �����ж�Ӧ������ȫ������. ������.
alter table ���� 
drop column ����;

alter table teacher 
drop column personId;

-- ��ѧ�����name�����������age, ����������һ�� gender 
-- ��ѧ����phone�иĳ�mobile
	
	




