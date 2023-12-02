SELECT * FROM sales.markets;
use sales;
# to see total number of transactions
select count(*) from transactions; #  150283

# to see total number of customers
select count(*) from customers;# 38

# to see transactions only from chennai
select * from transactions where market_code='Mark001';

# total transactions made from chennai
select count(*) from transactions where market_code='Mark001';   # 1035

# to dispaly total number of transactions from each market 
select count(market_code), market_code, markets_name from transactions join markets on(market_code=markets_code) group by market_code order by count(market_code) desc ;

#to display transactions by USD Currency
select * from sales.transactions where currency='USD';

#to display transactions occured in 2020;
select * from sales.transactions t join sales.date d on(t.order_date=d.date) where year=2020;

# to display total revenue occured in 2020
select  sum(sales_amount) from sales.transactions t join sales.date d on(t.order_date=d.date) where year=2020;   #142235559

#TO DISPLAY REVENUE FOR ALL THE YEAR
select  sum(sales_amount) as revenue, year from sales.transactions t join sales.date d on(t.order_date=d.date) group by year; 
/*
REVENUE     YEAR
93569152	2017
414308941	2018
336452114	2019
142235559	2020
*/

#to display total revenue made from each market including paris and new york;
select sum(sales_amount),markets_name from sales.transactions t right join sales.markets m on (t.market_code=m.markets_code) group by markets_name;

#to display total revenue made in chennai in 2020;
select sum(sales_amount) as revenue from sales.transactions t join sales.date d on(t.order_date=d.date) where year=2020 and market_code='Mark001';  #2463024


#to display distinct product code sold in chennai
select distinct product_code from sales.transactions where market_code='Mark001';











