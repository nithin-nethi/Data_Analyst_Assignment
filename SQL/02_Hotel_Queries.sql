-- Q1: For every user in the system, get the user_id and last booked room_no

SELECT user_id, room_no
FROM (
    SELECT *,
    ROW_NUMBER() OVER (PARTITION BY user_id ORDER BY booking_date DESC) AS rn
    FROM bookings
) t
WHERE rn = 1;



-- Q2: Get booking_id and total billing amount of every booking created in November, 2021

SELECT b.booking_id,
SUM(bc.item_quantity * i.item_rate) AS total_bill
FROM bookings b
JOIN booking_commercials bc ON b.booking_id = bc.booking_id
JOIN items i ON bc.item_id = i.item_id
WHERE MONTH(b.booking_date) = 11 AND YEAR(b.booking_date) = 2021
GROUP BY b.booking_id;



-- Q3: Get bill_id and bill amount of all the bills raised in October, 2021 having bill amount > 1000

SELECT bc.bill_id,
SUM(bc.item_quantity * i.item_rate) AS bill_amount
FROM booking_commercials bc
JOIN items i ON bc.item_id = i.item_id
WHERE MONTH(bc.bill_date) = 10 AND YEAR(bc.bill_date) = 2021
GROUP BY bc.bill_id
HAVING bill_amount > 1000;



-- Q4: Determine the most ordered and least ordered item of each month of year 2021

SELECT *
FROM (
    SELECT 
        MONTH(b.booking_date) AS month,
        i.item_name,
        SUM(bc.item_quantity) AS total_qty,
        RANK() OVER (PARTITION BY MONTH(b.booking_date) ORDER BY SUM(bc.item_quantity) DESC) AS rnk_desc,
        RANK() OVER (PARTITION BY MONTH(b.booking_date) ORDER BY SUM(bc.item_quantity) ASC) AS rnk_asc
    FROM bookings b
    JOIN booking_commercials bc ON b.booking_id = bc.booking_id
    JOIN items i ON bc.item_id = i.item_id
    WHERE YEAR(b.booking_date) = 2021
    GROUP BY month, i.item_name
) t
WHERE rnk_desc = 1 OR rnk_asc = 1;



-- Q5: Find the customers with the second highest bill value of each month of year 2021

SELECT *
FROM (
    SELECT 
        MONTH(b.booking_date) AS month,
        b.user_id,
        SUM(bc.item_quantity * i.item_rate) AS total_bill,
        RANK() OVER (
            PARTITION BY MONTH(b.booking_date)
            ORDER BY SUM(bc.item_quantity * i.item_rate) DESC
        ) AS rnk
    FROM bookings b
    JOIN booking_commercials bc ON b.booking_id = bc.booking_id
    JOIN items i ON bc.item_id = i.item_id
    WHERE YEAR(b.booking_date) = 2021
    GROUP BY month, b.user_id
) t
WHERE rnk = 2;