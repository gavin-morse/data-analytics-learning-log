# Session 1 — Delivery vs. In-Store Contribution Analysis

**Date:** October 7, 2026  
**Time:** About 1 hour  
**Dataset:** Fictional restaurant sales data

## What I was trying to figure out

I used a fictional fast-casual restaurant dataset with three locations: Downtown, Northside, and University.

The basic question was whether delivery orders were actually as valuable as in-store orders.

The data had:

- week
- location
- sales channel
- number of orders
- sales
- food cost
- platform fees

I decided to compare something I called contribution:

`contribution = sales - food cost - platform fees`

I called it contribution instead of profit because the dataset did not include things like labor, rent, utilities, or other expenses.

## What I calculated

I looked at:

- total contribution
- contribution per order
- sales per order
- food cost per order
- platform fees per order

I first compared delivery against in-store overall.

### Overall results

| Channel | Orders | Sales | Contribution | Contribution per order |
|---|---:|---:|---:|---:|
| In-Store | 4,745 | $67,555 | $47,175 | $9.94 |
| Delivery | 2,305 | $37,030 | $15,960 | $6.92 |

Delivery had a much lower contribution per order.

Then I broke it down by location.

### Contribution per order by location

| Location | In-Store | Delivery |
|---|---:|---:|
| Downtown | $10.48 | $7.88 |
| Northside | $10.57 | $9.33 |
| University | $9.00 | $4.94 |

The University location stood out because delivery contribution per order was much lower there than at the other locations.

## Trying to explain the University result

I then compared delivery sales, food cost, platform fees, and contribution per order by location.

| Location | Sales/order | Food cost/order | Fees/order | Contribution/order |
|---|---:|---:|---:|---:|
| Downtown | $18.00 | $5.81 | $4.32 | $7.88 |
| Northside | $19.00 | $5.86 | $3.82 | $9.33 |
| University | $13.00 | $4.94 | $3.12 | $4.94 |

The main difference was sales per order.

University delivery orders were only bringing in about $13 per order compared with $18–$19 at the other locations.

I also checked the University location by week. Sales per order stayed at $13, while contribution per order only moved slightly.

So the lower result was showing up across the weeks, not just in one week.

## What I learned

This was the first session where I felt like I was using SQL to answer a business question instead of just practicing syntax.

I used:

- `SELECT`
- `SUM()`
- calculated columns
- aliases
- `GROUP BY`
- grouping by more than one column
- `WHERE`
- `AND`

The main thing I want to remember is that once I found a difference, I did not stop there. I kept breaking it apart to figure out what was causing it.

The next thing I wanted to investigate was why University delivery orders had lower sales per order.
