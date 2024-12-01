-- 1 List the names of the waiters who have served the customer Tanya Singh.
SELECT DISTINCT first_name, surname
FROM restBill 
JOIN restStaff ON waiter_no = staff_no
WHERE cust_name = 'Tanya Singh';

-- 2 On which dates in February 2016 did the Headwaiter 'Charles' manage the 'Green' room? The output date should be in the format they are stored.
SELECT rm.room_date
FROM restRoom_management rm
JOIN restStaff s ON rm.headwaiter = s.staff_no
WHERE s.first_name = 'Charles'
  AND rm.room_name = 'Green'
  AND rm.room_date BETWEEN 160201 AND 160229;

-- 3 List the names and surnames of the waiters with the same headwaiter as the waiter Zoe Ball.
SELECT s.first_name, s.surname
FROM restStaff s
WHERE s.headwaiter = (
    SELECT headwaiter
    FROM restStaff
    WHERE first_name = 'Zoe' AND surname = 'Ball'
)
AND (s.first_name != 'Zoe' OR s.surname != 'Ball');

-- 4 List the customer name, the amount they spent and the waiter’s name for all bills. Order the list by the amount spent, highest bill first.
SELECT 
    b.cust_name AS customer_name,
    b.bill_total AS amount_spent,
    s.first_name AS waiter_first_name,
    s.surname AS waiter_surname
FROM restBill b
JOIN restStaff s ON b.waiter_no = s.staff_no
ORDER BY b.bill_total DESC;

-- 5 List the names and surnames of the waiters who serve tables that worked in the same team that served bills 00014 and 00017.
SELECT DISTINCT s.first_name, s.surname
FROM restBill b
JOIN restStaff s ON b.waiter_no = s.staff_no
WHERE b.table_no IN (
    SELECT DISTINCT table_no
    FROM restBill
    WHERE bill_no IN (14, 17)
);

-- 6 List the names and surnames of the waiters in the team (including the headwaiter) that served Blue room on 160312.
SELECT DISTINCT s.first_name, s.surname
FROM restStaff s
WHERE s.headwaiter = (
    SELECT rm.headwaiter
    FROM restRoom_management rm
    WHERE rm.room_name = 'Blue' AND rm.room_date = 160312
)
OR s.staff_no = (
    SELECT rm.headwaiter
    FROM restRoom_management rm
    WHERE rm.room_name = 'Blue' AND rm.room_date = 160312
);
