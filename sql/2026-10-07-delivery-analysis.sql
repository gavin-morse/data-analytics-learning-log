-- SQL Session 1
-- Delivery vs. In-Store Contribution Analysis
-- October 7, 2026

CREATE TABLE sales_summary (
    week_start DATE,
    location VARCHAR(30),
    channel VARCHAR(20),
    orders INT,
    sales DECIMAL(10,2),
    food_cost DECIMAL(10,2),
    platform_fees DECIMAL(10,2)
);

INSERT INTO sales_summary VALUES
('2026-09-07','Downtown','In-Store',520,7800,2350,0),
('2026-09-07','Downtown','Delivery',260,4680,1500,1120),
('2026-09-07','Northside','In-Store',430,6450,1900,0),
('2026-09-07','Northside','Delivery',150,2850,880,570),
('2026-09-07','University','In-Store',600,7800,2400,0),
('2026-09-07','University','Delivery',310,4030,1500,970),

('2026-09-14','Downtown','In-Store',545,8175,2460,0),
('2026-09-14','Downtown','Delivery',275,4950,1600,1190),
('2026-09-14','Northside','In-Store',445,6675,1980,0),
('2026-09-14','Northside','Delivery',165,3135,960,630),
('2026-09-14','University','In-Store',620,8060,2480,0),
('2026-09-14','University','Delivery',330,4290,1620,1030),

('2026-09-21','Downtown','In-Store',535,8025,2420,0),
('2026-09-21','Downtown','Delivery',290,5220,1690,1250),
('2026-09-21','Northside','In-Store',460,6900,2030,0),
('2026-09-21','Northside','Delivery',175,3325,1030,670),
('2026-09-21','University','In-Store',590,7670,2360,0),
('2026-09-21','University','Delivery',350,4550,1770,1090);

-- 1. Overall comparison by channel

SELECT
    channel,
    SUM(orders) AS total_orders,
    SUM(sales) AS total_sales,
    SUM(sales) - SUM(food_cost) - SUM(platform_fees) AS contribution,
    (SUM(sales) - SUM(food_cost) - SUM(platform_fees)) / SUM(orders)
        AS contribution_per_order
FROM sales_summary
GROUP BY channel;

-- 2. Compare contribution per order by location and channel

SELECT
    location,
    channel,
    SUM(orders) AS total_orders,
    SUM(sales) AS total_sales,
    SUM(sales) - SUM(food_cost) - SUM(platform_fees) AS contribution,
    (SUM(sales) - SUM(food_cost) - SUM(platform_fees)) / SUM(orders)
        AS contribution_per_order
FROM sales_summary
GROUP BY location, channel;

-- 3. Break contribution per order into components

SELECT
    location,
    channel,
    SUM(sales) / SUM(orders) AS sales_per_order,
    SUM(food_cost) / SUM(orders) AS food_cost_per_order,
    SUM(platform_fees) / SUM(orders) AS platform_fees_per_order,
    (SUM(sales) - SUM(food_cost) - SUM(platform_fees)) / SUM(orders)
        AS contribution_per_order
FROM sales_summary
GROUP BY location, channel;

-- 4. Check whether the University delivery pattern is stable by week

SELECT
    week_start,
    SUM(sales) / SUM(orders) AS sales_per_order,
    SUM(food_cost) / SUM(orders) AS food_cost_per_order,
    SUM(platform_fees) / SUM(orders) AS platform_fees_per_order,
    (SUM(sales) - SUM(food_cost) - SUM(platform_fees)) / SUM(orders)
        AS contribution_per_order
FROM sales_summary
WHERE location = 'University'
  AND channel = 'Delivery'
GROUP BY week_start;
