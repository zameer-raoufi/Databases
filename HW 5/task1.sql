-- 1

SELECT bill_date, bill_total
FROM restBill
WHERE cust_name = 'Bob Crow';

-- 2

SELECT cust_name
FROM restBill
WHERE cust_name LIKE '% Smith'
ORDER BY cust_name DESC;

-- 3

SELECT DISTINCT cust_name
FROM restBill
WHERE cust_name LIKE '% C%'
ORDER BY cust_name;

-- 4

SELECT DISTINCT first_name, surname
FROM restStaff
WHERE headwaiter IS NOT NULL;

-- 5

SELECT bill_no, bill_date, bill_total, cust_name, covers, table_no, waiter_no
FROM restBill
WHERE bill_date BETWEEN 160201 AND 160229;

-- 6

SELECT DISTINCT cust_name
FROM restBill
WHERE cust_name LIKE '% C%'
ORDER BY cust_name;