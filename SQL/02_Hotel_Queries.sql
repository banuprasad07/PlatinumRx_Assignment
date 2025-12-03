-- A1: last booked room per user
SELECT 
    b.user_id,
    b.room_no AS last_booked_room,
    b.booking_date
FROM bookings b
JOIN (
    SELECT user_id, MAX(booking_date) AS last_booking_date
    FROM bookings
    GROUP BY user_id
) t
ON b.user_id = t.user_id 
AND b.booking_date = t.last_booking_date;


-- A2: total billing per booking created in Nov 2021
SELECT 
    bc.booking_id,
    SUM(bc.item_quantity * i.item_rate) AS total_amount
FROM booking_commercials bc
JOIN items i    ON bc.item_id = i.item_id
JOIN bookings b ON b.booking_id = bc.booking_id
WHERE strftime('%Y-%m', b.booking_date) = '2021-11'
GROUP BY bc.booking_id;

-- A3: Oct 2021 bills with amount > 1000
SELECT 
    bc.bill_id,
    SUM(bc.item_quantity * i.item_rate) AS bill_amount
FROM booking_commercials bc
JOIN items i ON bc.item_id = i.item_id
WHERE strftime('%Y-%m', bc.bill_date) = '2021-10'
GROUP BY bc.bill_id
HAVING bill_amount > 1000;

-- A4: most and least ordered item per month in 2021
WITH monthly AS (
    SELECT 
        strftime('%Y-%m', bc.bill_date) AS month,
        i.item_id,
        i.item_name,
        SUM(bc.item_quantity) AS total_qty
    FROM booking_commercials bc
    JOIN items i ON bc.item_id = i.item_id
    WHERE strftime('%Y', bc.bill_date) = '2021'
    GROUP BY month, i.item_id, i.item_name
)
SELECT 
    m.month,
    CASE 
        WHEN m.total_qty = (
            SELECT MAX(total_qty) FROM monthly m2 WHERE m2.month = m.month
        ) THEN 'most_ordered'
        WHEN m.total_qty = (
            SELECT MIN(total_qty) FROM monthly m3 WHERE m3.month = m.month
        ) THEN 'least_ordered'
    END AS which,
    m.item_id,
    m.item_name,
    m.total_qty
FROM monthly m
WHERE m.total_qty = (
        SELECT MAX(total_qty) FROM monthly m2 WHERE m2.month = m.month
    )
   OR m.total_qty = (
        SELECT MIN(total_qty) FROM monthly m3 WHERE m3.month = m.month
    )
ORDER BY m.month, which;

-- A5: customers with second highest bill value per month (2021)
WITH bills AS (
    SELECT 
        bc.bill_id,
        bc.booking_id,
        strftime('%Y-%m', bc.bill_date) AS month,
        SUM(bc.item_quantity * i.item_rate) AS bill_amount
    FROM booking_commercials bc
    JOIN items i ON bc.item_id = i.item_id
    WHERE strftime('%Y', bc.bill_date) = '2021'
    GROUP BY bc.bill_id, bc.booking_id, month
),
second_highest AS (
    SELECT 
        b1.month,
        b1.bill_id,
        b1.booking_id,
        b1.bill_amount
    FROM bills b1
    WHERE b1.bill_amount = (
        SELECT MAX(b2.bill_amount)
        FROM bills b2
        WHERE b2.month = b1.month
          AND b2.bill_amount < (
              SELECT MAX(b3.bill_amount)
              FROM bills b3
              WHERE b3.month = b1.month
          )
    )
)
SELECT 
    s.month,
    s.bill_id,
    s.bill_amount,
    bk.user_id
FROM second_highest s
JOIN bookings bk ON s.booking_id = bk.booking_id
ORDER BY s.month;
