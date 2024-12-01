-- 1 Which waiters have taken 2 or more bills on a single date? List the waiter names and surnames, the dates and the number of bills they have taken.
SELECT s.first_name, s.surname, b.bill_date, COUNT(b.bill_no) AS num_bills
FROM restBill b
JOIN restStaff s ON b.waiter_no = s.staff_no
GROUP BY s.staff_no, b.bill_date
HAVING COUNT(b.bill_no) >= 2;

-- 2 List the rooms with tables that can server more than 6 people and how many of such tables they have.
SELECT rt.room_name, COUNT(rt.table_no) AS num_tables
FROM restRest_table rt
WHERE rt.no_of_seats > 6
GROUP BY rt.room_name;

-- 3 List the names of the rooms and the total amount of bills in each room
SELECT rm.room_name, SUM(b.bill_total) AS total_bills
FROM restBill b
JOIN restRest_table rt ON b.table_no = rt.table_no
JOIN restRoom_management rm ON rt.room_name = rm.room_name AND b.bill_date = rm.room_date
GROUP BY rm.room_name;

-- 4 List the headwaiter’s name and surname and the total bill amount their waiters have taken. Order the list by total bill amount, largest first.
SELECT s.first_name AS headwaiter_first_name, s.surname AS headwaiter_surname, SUM(b.bill_total) AS total_bill_amount
FROM restRoom_management rm
JOIN restStaff s ON rm.headwaiter = s.staff_no
JOIN restBill b ON rm.room_name = b.table_no
WHERE b.waiter_no != rm.headwaiter
GROUP BY rm.headwaiter
ORDER BY total_bill_amount DESC;

-- 5 List any customers who have spent more than £400 on average.
SELECT b.cust_name
FROM restBill b
GROUP BY b.cust_name
HAVING AVG(b.bill_total) > 400;

