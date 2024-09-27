--SELECT's
---------------------------------------------------------------------------------

SELECT * FROM products; -- ВСЕ

SELECT product_id, product_name, unit_price FROM products; -- 3 столбца

SELECT product_id, product_name, unit_price * units_in_stock FROM products; -- Умножение

SELECT * FROM employees; -- Сотрудники

SELECT city FROM employees; -- Города сотрудников

SELECT country FROM employees; -- Страны

SELECT DISTINCT city FROM employees; -- уникальные города

SELECT DISTINCT country FROM employees; -- уникальные страны

SELECT DISTINCT country, city FROM employees; -- уникальные сочетания 

-----------------------------------------------------------------------------------------------------
SELECT * FROM orders; -- заказы

SELECT COUNT(*) FROM orders; -- заказы ЧИСЛО

SELECT * FROM employees; -- Сотрудники

SELECT COUNT(country) FROM employees; -- Число стран

SELECT COUNT(DISTINCT country) FROM employees; -- Число стран уникальных

-------------------------------------------------------------------------------------------------------

-- 1. Выбрать все данные из таблицы customers

-- 2. Выбрать все записи из таблицы customers, но только колонки "имя контакта" и "город"

-- 3. Выбрать все записи из таблицы orders, но взять две колонки: идентификатор заказа и колонку, 
-- значение в которой мы рассчитываем как разницу между датой отгрузки и датой формирования заказа.

-- 4. Выбрать все уникальные города в которых "зарегестрированы" заказчики

-- 5. Выбрать все уникальные сочетания городов и стран в которых "зарегестрированы" заказчики

-- 6. Посчитать кол-во заказчиков

-- 7. Посчитать кол-во уникальных стран в которых "зарегестрированы" заказчики

-------------------------------------------------------------------------------------------------------------

--1
SELECT *
FROM customers;
--2
SELECT contact_name, city
FROM customers;
--3
SELECT order_id, shipped_date - order_date
FROM orders;
--4
SELECT DISTINCT city
FROM customers;
--5
SELECT DISTINCT city, country
FROM customers;
--6
SELECT COUNT(*)
FROM customers;
--7
SELECT COUNT(DISTINCT country)
FROM customers

---------------------------------------------------------------------------------------------------------------------

-- Получить названия компаний, контактных лиц, телефоны и страны для всех клиентов из США.
SELECT company_name, contact_name, phone, country
FROM customers
WHERE country = 'USA';

-- Получить все записи о товарах, цена за единицу которых больше 20.
SELECT *
FROM products
WHERE unit_price > 20;

-- Посчитать количество товаров, цена за единицу которых меньше 20.
SELECT COUNT(*)
FROM products
WHERE unit_price < 20;

-- Получить все товары, которые были сняты с производства.
SELECT *
FROM products
WHERE discontinued = 1;

-- Получить всех клиентов, которые не находятся в Берлине.
SELECT *
FROM customers
WHERE city != 'Berlin'; -- <>

-- Получить все заказы, сделанные после 1 марта 1998 года.
SELECT *
FROM orders
WHERE order_date >= '1998-03-01';

--------------------------------------------------------------------------------------------------------------------------

-- Получить все товары, цена которых больше 25, и на складе имеется более 40 единиц.
SELECT *
FROM products
WHERE unit_price > 25 AND units_in_stock > 40;

-- Получить всех клиентов из Берлина, Лондона или Сан-Франциско.
SELECT *
FROM customers
WHERE city = 'Berlin' OR city = 'London' OR city = 'San Francisco';

-- Получить все заказы, отправленные после 30 апреля 1998 года, где стоимость доставки меньше 75 или больше 150.
SELECT *
FROM orders
WHERE shipped_date > '1998-04-30' AND (freight < 75 OR freight > 150);

-----------------------------------------------------------------------------------------------------------------------------

-- Получить все заказы с суммой доставки от 20 до 40 включительно.
SELECT *
FROM orders
WHERE freight >= 20 AND freight <= 40;

-- Альтернативный способ: использование BETWEEN для указания диапазона с включенными границами.
SELECT COUNT(*)
FROM orders
WHERE freight BETWEEN 20 AND 40;

-- Посчитать количество заказов, где сумма доставки больше или равна 20, но меньше 40.
SELECT COUNT(*)
FROM orders
WHERE freight >= 20 AND freight < 40;

-- Получить заказы, сделанные в период с 30 марта 1998 года по 3 апреля 1998 года включительно.
SELECT *
FROM orders
WHERE order_date BETWEEN '1998-03-30' AND '1998-04-03';

-- Получить заказы, сделанные строго после 30 марта 1998 года и до 3 апреля 1998 года.
SELECT *
FROM orders
WHERE order_date > '1998-03-30' AND order_date < '1998-04-03';

-----------------------------------------------------------------------------------------------------------------------------

-- Получить всех клиентов из Мексики, Германии, США или Канады.
SELECT *
FROM customers
WHERE country = 'Mexico' OR country = 'Germany' OR country = 'USA' OR country = 'Canada';

-- Альтернативный способ: использование IN для указания нескольких значений.
SELECT *
FROM customers
WHERE country IN ('Mexico', 'Germany', 'USA', 'Canada');

-- Получить все товары, категории которых имеют идентификаторы 1, 3, 5 или 7.
SELECT *
FROM producrs
WHERE categoryid IN (1, 3, 5, 7);

-- Получить всех клиентов, которые не из Мексики, Германии, США или Канады.
SELECT *
FROM customers
WHERE country NOT IN ('Mexico', 'Germany', 'USA', 'Canada');

-- Получить все товары, категории которых не имеют идентификаторы 1, 3, 5 или 7.
SELECT *
FROM producrs
WHERE categoryid NOT IN (1, 3, 5, 7);

-----------------------------------------------------------------------------------------------------------------------------

-- Получить уникальные страны из списка клиентов.
SELECT DISTINCT country
FROM customers;

-- Получить уникальные страны из списка клиентов, отсортированные по алфавиту.
SELECT DISTINCT country
FROM customers
ORDER BY country;

-- Альтернативный вариант: явное указание сортировки по возрастанию.
SELECT DISTINCT country
FROM customers
ORDER BY country ASC;

-- Для сортировки по убыванию можно использовать DESC.
SELECT DISTINCT country
FROM customers
ORDER BY country DESC;

-- Можно сортировать сразу по нескольким столбцам.
SELECT DISTINCT country, city
FROM customers
ORDER BY country DESC, city DESC;

-- Возможна комбинация разных типов сортировок (по убыванию для стран и по возрастанию для городов).
SELECT DISTINCT country, city
FROM customers
ORDER BY country DESC, city ASC;

-----------------------------------------------------------------------------------------------------------------------------

-- Получить город доставки и дату заказа для заказов в Лондон, отсортировать по дате.
SELECT ship_city, order_date
FROM orders
WHERE ship_city = 'London'
ORDER BY order_date;

-- Получить самую раннюю дату заказа для заказов в Лондон.
SELECT MIN(order_date)
FROM orders
WHERE ship_city = 'London';

--

-- Получить город доставки и дату заказа для заказов в Лондон, отсортировать по дате в обратном порядке.
SELECT ship_city, order_date
FROM orders
WHERE ship_city = 'London'
ORDER BY order_date DESC;

-- Получить самую позднюю дату заказа для заказов в Лондон.
SELECT MAX(order_date)
FROM orders
WHERE ship_city = 'London';

-- Получить среднюю цену товаров, которые не сняты с производства.
SELECT AVG(unit_price)
FROM products
WHERE discontinued <> 1;

-- Получить общую сумму товаров на складе, которые не сняты с производства.
SELECT SUM(units_in_stock)
FROM products
WHERE discontinued <> 1;

-------------------------------------------------------------------------------------------------------------------------------------

-- 1. Выбрать все заказы из стран France, Austria, Spain

-- 2. Выбрать все заказы, отсортировать по required_date (по убыванию) и отсортировать по дате отгрузке (по возрастанию)

-- 3. Выбрать минимальное кол-во  единиц товара среди тех продуктов, которых в продаже более 30 единиц.

-- 4. Выбрать максимальное кол-во единиц товара среди тех продуктов, которых в продаже более 30 единиц.

-- 5. Найти среднее значение дней уходящих на доставку с даты формирования заказа в USA

-- 6. Найти сумму, на которую имеется товаров (кол-во * цену) причём таких, которые планируется продавать и в будущем (см. на поле discontinued)

-------------------------------------------------------------------------------------------------------------------------------------
--1
SELECT *
FROM orders
WHERE ship_country IN ('France', 'Austria', 'Spain');
--2
SELECT *
FROM orders
ORDER BY required_date DESC, shipped_date
--3
SELECT MIN(unit_price)
FROM products
WHERE units_in_stock > 30
--4
SELECT MAX(units_in_stock)
FROM products
WHERE unit_price > 30
--5
SELECT AVG(shipped_date - order_date)
FROM orders
WHERE ship_country = 'USA'
--6
SELECT SUM(unit_price * units_in_stock)
FROM products
WHERE discontinued <> 1
-------------------------------------------------------------------------------------------------------------------------------------
-- Получить фамилию и имя сотрудников, у которых имя заканчивается на 'n'.
SELECT last_name, first_name
FROM employees
WHERE first_name LIKE '%n';

-- Получить фамилию и имя сотрудников, у которых фамилия начинается с 'B'.
SELECT last_name, first_name
FROM employees
WHERE last_name LIKE 'B%';

-- Получить фамилию и имя сотрудников, у которых фамилия начинается с 'Buch'.
SELECT last_name, first_name
FROM employees
WHERE last_name LIKE 'Buch%';

-- Получить фамилию и имя сотрудников, у которых вторая буква фамилии 'u' и есть другие символы после неё.
SELECT last_name, first_name
FROM employees
WHERE last_name LIKE '_uch%';

-------------------------------------------------------------------------------------------------------------------------------------

-- Получить название товаров и их цену, которые не сняты с производства, отсортировать по убыванию цены. Показать только 10 самых дорогих товаров.
SELECT product_name, unit_price
FROM products
WHERE discontinued <> 1
ORDER BY unit_price DESC
LIMIT 10;

-------------------------------------------------------------------------------------------------------------------------------------

-- Получить все данные о заказах.
SELECT *
FROM orders;

-- Получить город, регион и страну доставки для заказов, у которых не указан регион.
SELECT ship_city, ship_region, ship_country
FROM orders
WHERE ship_region IS NULL;

-- Получить город, регион и страну доставки для заказов, у которых указан регион.
SELECT ship_city, ship_region, ship_country
FROM orders
WHERE ship_region IS NOT NULL;

-------------------------------------------------------------------------------------------------------------------------------------

-- Получить страну доставки и количество заказов с доставкой дороже 50, отсортировать по количеству заказов по убыванию.
SELECT ship_country, COUNT(*)
FROM orders
WHERE freight > 50
GROUP BY ship_country
ORDER BY COUNT(*) DESC;

-- Получить ID категории товаров и сумму товаров на складе, сгруппировать по категориям и отсортировать по убыванию. Показать только первые 5 категорий.
SELECT category_id, SUM(UnitsInStock)
FROM products
GROUP BY category_id
ORDER BY SUM(units_in_stock) DESC
LIMIT 5;

-------------------------------------------------------------------------------------------------------------------------------------

-- Получить ID категории товаров и их общую стоимость на складе (цена * количество), для товаров, которые не сняты с производства, 
-- отсортировать по убыванию общей стоимости. Показать только категории, в которых общая стоимость больше 5000.
SELECT category_id, SUM(unit_price * units_in_stock)
FROM products
WHERE discontinued <> 1
GROUP BY category_id
HAVING SUM(unit_price * units_in_stock) > 5000 --Постфильтр
ORDER BY SUM(unit_price * units_in_stock) DESC;

-------------------------------------------------------------------------------------------------------------------------------------

-- Объединить страны из таблиц клиентов и сотрудников, удалить дубли (UNION).
SELECT country
FROM customers
UNION
SELECT country
FROM employees;

-- Объединить страны из таблиц клиентов и сотрудников, сохранить дубли (UNION ALL).
SELECT country
FROM customers
UNION ALL
SELECT country
FROM employees;

-- Пересечение стран из таблиц клиентов и поставщиков (INTERSECT).
SELECT country 
FROM customers
INTERSECT
SELECT country
FROM suppliers;

-- Страны, которые есть в таблице клиентов, но отсутствуют в таблице поставщиков (EXCEPT).
SELECT country 
FROM customers
EXCEPT
SELECT country
FROM suppliers;

-----------------------------------------------------------------------------------------------------------

-- 1. Выбрать все записи заказов в которых наименование страны отгрузки начинается с 'U'

-- 2. Выбрать записи заказов (включить колонки идентификатора заказа, идентификатора заказчика, веса и страны отгузки), которые должны быть отгружены в страны имя которых начинается с 'N', отсортировать по весу (по убыванию) и вывести только первые 10 записей.

-- 3. Выбрать записи работников (включить колонки имени, фамилии, телефона, региона) в которых регион неизвестен

-- 4. Подсчитать кол-во заказчиков регион которых известен

-- 5. Подсчитать кол-во поставщиков в каждой из стран и отсортировать результаты группировки по убыванию кол-ва

-- 6. Подсчитать суммарный вес заказов (в которых известен регион) по странам, затем отфильтровать по суммарному весу (вывести только те записи где суммарный вес больше 2750) и отсортировать по убыванию суммарного веса.

-- 7. Выбрать все уникальные страны заказчиков и поставщиков и отсортировать страны по возрастанию

-- 8. Выбрать такие страны в которых "зарегистированы" одновременно и заказчики и поставщики и работники.

-- 9. Выбрать такие страны в которых "зарегистированы" одновременно заказчики и поставщики, но при этом в них не "зарегистрированы" работники.

-------------------------------------------------------------------------------------------------------------------------------------
SELECT *
FROM orders
WHERE ship_country LIKE 'U%';

SELECT order_id, customer_id, freight, ship_country
FROM orders
WHERE ship_country LIKE 'N%'
ORDER BY freight DESC;
LIMIT 10

SELECT first_name, last_name, home_phone
FROM employees
WHERE region IS NULL

SELECT COUNT(*)
FROM customers
WHERE region IS NOT NULL

SELECT ship_country, COUNT(*)
FROM orders
WHERE freight > 50
GROUP BY ship_country
ORDER BY COUNT(*) DESC

SELECT category_id, SUM(units_in_stock)
FROM products
GROUP BY category_id
ORDER BY SUM(units_in_stock) DESC
LIMIT 5

SELECT ship_country, SUM(freight)
FROM orders
WHERE ship_region IS NOT NULL
GROUP BY ship_country
HAVING SUM(freight) > 2750
ORDER BY SUM(freight) DESC

SELECT country
FROM customers
UNION
SELECT country
FROM suppliers
ORDER BY country

SELECT country 
FROM customers
INTERSECT
SELECT country
FROM suppliers
INTERSECT
SELECT country
FROM employees

SELECT country 
FROM customers
INTERSECT
SELECT country
FROM suppliers
EXCEPT
SELECT country
FROM employees
