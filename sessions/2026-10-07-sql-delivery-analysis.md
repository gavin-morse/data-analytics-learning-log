# SQL Session 1 — Delivery vs. In-Store Contribution Analysis

**Date:** October 7, 2026  
**Time:** 1 hour  
**Focus:** SQL + business analysis  
**Dataset:** Fictional fast-casual restaurant business created for practice

## Goal

I wanted to practice SQL in a way that felt closer to actual analyst work instead of doing isolated syntax exercises.

I had AI create a small fictional restaurant dataset and give me a vague business concern:

> September sales look good, but management is worried that some sales may not be very profitable, especially delivery.

My job was to decide what to measure, write the SQL, interpret the results, and decide what to investigate next.

## What I decided to measure

I chose to compare delivery and in-store orders using:

- total orders
- total sales
- contribution after food cost and platform fees
- contribution per order

For this exercise:

```
contribution = sales - food_cost - platform_fees
```

I was careful not to call this total profit because the dataset did not include labor, rent, utilities, or other overhead.

## What I found

### 1. Delivery had lower contribution per order overall

The first comparison showed:

- In-store contribution per order: about **$9.94**
- Delivery contribution per order: about **$6.92**

That did not prove delivery was unprofitable. It only showed that, after the costs included in the dataset, delivery contributed less per order than in-store sales.

### 2. The difference varied a lot by location

Breaking the results down by location showed:

- Downtown delivery: about **$7.88** contribution per order
- Northside delivery: about **$9.33**
- University delivery: about **$4.94**

University was the clear outlier.

### 3. Lower sales per order appeared to be the main driver

I broke contribution per order into:

- sales per order
- food cost per order
- platform fees per order

University delivery had only about **$13 in sales per order**, compared with roughly **$18 Downtown** and **$19 Northside**.

Its platform fees and food costs were not high enough in dollar terms to explain the full gap. The biggest difference was lower sales per order.

### 4. The University pattern was consistent across weeks

I filtered to University delivery and grouped by week.

Sales per delivery order stayed at **$13 in all three weeks**, so the weak monthly result was not caused by one unusual week.

That suggested the next useful question would require more detailed order-level data.

## What I would investigate next

I would want to see the actual composition of University delivery orders, including things like:

- number of items per order
- menu-item mix
- discounts or promotions
- pricing differences
- average basket size

The current dataset can show that University delivery orders generate less sales per order, but it cannot explain exactly why.

## SQL concepts practiced

- `SELECT`
- `SUM()`
- calculated columns
- aliases with `AS`
- `GROUP BY`
- grouping by more than one column
- `WHERE`
- `AND`
- dividing aggregated values to create per-order metrics

## Mistakes and debugging

Most of my mistakes were small syntax errors rather than analytical mistakes.

Examples:

- forgetting a comma after a selected column
- leaving an extra comma immediately before `FROM`

AI helped identify those syntax problems, but I was usually able to decide what the query needed to do before getting syntax help.

## Main lesson

The most important part of the session was not memorizing SQL syntax.

The useful skill was moving through this sequence:

**vague business concern → choose metrics → query the data → identify a pattern → break the metric into components → test whether the pattern is stable → identify what data is needed next**

That is the kind of reasoning I want to keep practicing while I improve my technical fluency.
