# Session 2 — Diagnosing Smaller University Delivery Orders

**Dates:** October 10–11, 2026  
**Time:** About 45 minutes total  
**Dataset:** Fictional restaurant order and item data

## What I was trying to figure out

This session continued the question from Session 1.

I had already found that University delivery orders had much lower sales per order.

I wanted to figure out why.

I thought of three possible reasons:

1. University customers were buying fewer items per order
2. they were buying cheaper items
3. they were getting larger discounts

The new dataset had two tables:

- `orders`
- `order_items`

The `orders` table had things like location, channel, and discount amount.

The `order_items` table had the actual items in each order, quantity, category, and unit price.

## Learning JOINs

The main new SQL idea here was `JOIN`.

I joined the two tables using `order_id`.

The way I started thinking about it was:

> show me every item, and attach the information from the order that item belongs to

This also helped me understand why joins can create more rows.

If one order has 3 items, joining the order table to the item table gives 3 rows for that order.

If I am not careful, the same order can show up across multiple joined rows and mess up the totals.

## Items per order

I first calculated total items for each order.

```sql
SELECT 
    orders.order_id,
    orders.location,
    SUM(order_items.quantity) AS total_items
FROM orders
JOIN order_items
    ON orders.order_id = order_items.order_id
GROUP BY orders.order_id, orders.location;
```

Then I used that result inside another query to calculate average items per order by location.

The results were:

- Downtown: 3.0 items per order
- Northside: 3.0
- University: 1.67

That was a pretty large difference.

## Were University customers buying cheaper items?

I also checked average item price.

The results were roughly:

- Downtown: $6.86
- University: $7.20
- Northside: $6.89

So cheaper items did not seem to explain the lower order value.

If anything, University item prices were slightly higher.

## Discounts

I also checked average discount per order.

The results were roughly:

- Downtown: $0.33
- University: $1.17
- Northside: $0.17

University had larger discounts, so that probably contributed somewhat.

But the bigger difference still seemed to be the number of items per order.

## What I concluded

The main reason University delivery orders were smaller was that customers were buying fewer items per order.

Higher discounts probably also mattered, but cheaper items did not seem to be the explanation.

This was also my first time using a subquery in a way that made sense to me.

I had to first make a result with one row per order, then average those order-level totals by location.

That idea came up again later.

## What I practiced

- `JOIN`
- grouping after a join
- how joins can multiply rows
- `SUM()`
- `AVG()`
- subqueries
- thinking about the correct level of analysis

The biggest thing I want to remember from this session is that the table I need for the final question does not always already exist. Sometimes I have to build an intermediate result first.
