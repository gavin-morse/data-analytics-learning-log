# Session 3 — Customer Retention and Acquisition Channel Analysis

**Dates:** October 12–15, 2026  
**Time:** Multiple short sessions  
**Dataset:** Small fictional e-commerce dataset

## What I was trying to figure out

For this session I switched to an e-commerce example.

The main question was:

> Which acquisition channels are producing repeat customers, and which ones seem to produce more valuable customers?

I defined a repeat customer as someone who placed at least 2 orders.

The data had two tables:

- `customers`
- `orders`

The customer table had things like acquisition channel and region.

The orders table had the customer ID, order date, and order value.

## One row per customer

The raw order table has one row per order, but the question I wanted to answer was about customers.

So I first made a result with one row per customer:

- customer ID
- acquisition channel
- order count

That helped the idea of a subquery make more sense to me.

The way I think about it now is:

> make the table I wish I already had, then query that result

## Repeat customers with CASE WHEN

I learned how to use `CASE WHEN` to classify customers.

```sql
CASE
    WHEN order_count >= 2 THEN 1
    ELSE 0
END
```

So repeat customers become 1 and non-repeat customers become 0.

Then I could add the 1s together to count repeat customers.

```sql
SUM(CASE WHEN order_count >= 2 THEN 1 ELSE 0 END)
```

Then dividing that by the total number of customers gives the repeat customer rate.

This was probably the main new SQL idea from this session.

## WHERE vs. HAVING

I also practiced the difference between `WHERE` and `HAVING`.

The way I understand it now:

- `WHERE` filters rows before grouping
- `HAVING` filters groups after grouping

I tried to look only at customers from the South and then only keep acquisition channels with at least 2 South customers.

I used `WHERE` for the South filter and `HAVING` for the minimum number of customers.

## The empty result

At first the query came back empty and I thought I had done something wrong.

It turned out that there was only one South customer in each acquisition channel.

Because I had:

```sql
HAVING COUNT(*) >= 2
```

every group got filtered out.

Once I removed that condition, I could see the customers.

But with only one customer in each channel, there really was not much to compare. A 0% or 100% repeat rate based on one customer did not tell me much.

## Looking at all customers

I then removed the South filter and compared all customers by acquisition channel.

| Acquisition channel | Customers | Repeat customers | Repeat rate | Avg. orders/customer |
|---|---:|---:|---:|---:|
| Paid Search | 3 | 2 | 66.7% | 2.00 |
| Organic | 3 | 2 | 66.7% | 2.00 |
| Referral | 3 | 2 | 66.7% | 2.00 |
| Email | 3 | 2 | 66.7% | 1.67 |

All four channels had the same repeat rate.

That meant repeat rate alone did not really tell me which channel was better.

## Adding revenue per customer

I then added total revenue for each customer:

```sql
SUM(orders.order_value) AS total_revenue
```

Then I averaged that by acquisition channel.

The results were:

| Acquisition channel | Avg. revenue/customer |
|---|---:|
| Email | $98.67 |
| Paid Search | $96.67 |
| Organic | $84.00 |
| Referral | $73.33 |

This gave a different picture.

Email had the highest revenue per customer even though it had slightly fewer orders per customer.

Referral had the lowest revenue per customer.

So if I kept going, the next thing I would probably check is average order value by acquisition channel.

## What I practiced

- `JOIN`
- `COUNT()`
- `GROUP BY`
- subqueries
- `CASE WHEN`
- conditional aggregation
- `WHERE`
- `HAVING`
- `SUM(order_value)`
- `AVG()`

## Things I still needed help with

I still made a bunch of syntax mistakes.

A few examples:

- joining on the wrong field
- forgetting the exact `CASE WHEN` syntax
- using `AVG(order_value)` in the outer query even though the inner query had created a column called `total_revenue`
- thinking the empty result might mean the query was broken

I think I am currently better at figuring out what I want the query to do than I am at writing every part of the syntax from memory.

The main pattern I want to remember from this session is:

**raw orders → one row per customer → customer-level metrics → compare groups**
