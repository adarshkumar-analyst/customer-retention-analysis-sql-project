-- =====================================================
-- CUSTOMER RETENTION ANALYSIS PROJECT
-- =====================================================


-- ================================
--  BUSINESS OVERVIEW
-- ================================

--  Calculate the total number of distinct customers.
     select 
         count(distinct custid)
	 from store_data;


--  Calculate the overall customer retention rate (in percentage).
     select 
           Round(
           sum(retained)*100/count(*),2) as retention_rate
     from store_data;      


--  Compute the retention rate for each city.
      select city,
             count(*) as Total_customers,
           Round(
           sum(retained)*100/count(*),2) as retention_rate
     from store_data
     group by city
     order by retention_rate;
  
  
--  Show the distribution of customers by favorite order day.
    select 
          favday,
          count(*) as total_customers
    from store_data
    group by favday
    order by total_customers desc;


--  Identify the top 3 cities with the highest customer count.
	select 
          city,
          count(*) as total_customers
    from store_data
    group by city
    order by total_customers desc
    limit 3;


-- ================================
--  RETAINED VS NON-RETAINED ANALYSIS
-- ================================

--  Compare the average order value between retained and non-retained customers.
      select
            retained,
            round(
            avg(avgorder),2) as avg_order_value
      from store_data
      group by retained;


--  Compare the average order frequency between retained and non-retained customers.
      select
            retained,
            round(
            avg(ordfreq),2) as avg_order_value
      from store_data
      group by retained;       
     
     
--  Analyze the difference in email open rate between retained and non-retained customers.
       select
            retained,
            round(
            avg(eopenrate),2) as avg_order_value
      from store_data
      group by retained;  
  
  
--  Evaluate the impact of email click rate on customer retention.
        select
            retained,
            round(
            avg(eclickrate),2) as avg_order_value
      from store_data
      group by retained;  
      
      
-- Calculate the retention rate among customers using the paperless service.
       select 
           paperless,
           Round(
           sum(retained)*100/count(*),2) as retention_rate
     from store_data
     group by paperless;


-- ================================
--  BEHAVIORAL ANALYSIS
-- ================================

-- Calculate the retention rate among customers with above-average order frequency.
      select 
            case
                when ordfreq> (select avg(ordfreq) from store_data)
                then 'high_frequency'
                else 'low_frequency'
              end as frequency_segment,
			round(
            sum(retained)*100/count(*),2) as retaintion_rate
      from store_data
      group by frequency_segment;
      
      
--  Calculate the retention rate among customers with above-average order value.
        select 
            case
                when avgorder> (select avg(avgorder) from store_data)
                then 'high_value'
                else 'low_value'
              end as value_segment,
			round(
            sum(retained)*100/count(*),2) as retaintion_rate
        from store_data
        group by value_segment;  
 
 
--  Determine the retention status of customers whose last order was more than 6 months ago.
       select 
             retained,
             count(*) as total_customer
      from store_data
      where lastorder<current_date-interval 6 month
      group by retained;
 
 
--  Calculate the average active duration (in days) between first order and last order.
	   select 
           round(
           avg(datediff(lastorder,firstorder)),2) as avg_avtive_days
	   from store_data;       
 
 
--  Analyze the month-wise customer signup trend.
       select 
             date_format(created,'%Y-%m') as signup_month,
             count(*) as total_customers
       from store_data
       group by signup_month
       order by signup_month;

-- ================================
--  ADVANCED & ANALYTICAL INSIGHTS
-- ================================

--  Identify the top 10 retained customers based on estimated revenue (avgorder × ordfreq).
       select 
             custid,
             (avgorder * ordfreq) as estimated_revenue
       from store_data
       where retained=1
       order by estimated_revenue desc
       limit 10;
        
        
--  Compare total revenue contribution between retained and non-retained customers.
	   select 
             retained,
             round(
			 sum(avgorder * ordfreq),2) as estimated_revenue
       from store_data
       group by retained
       order by estimated_revenue desc;
       
              
--  Identify high-value customers who are not retained (potential churn risk).
       select
              custid,
              avgorder,
              ordfreq
       from store_data
       where retained=0
       and   avgorder>(select avg(avgorder) from store_data)
       and   ordfreq >(select avg(ordfreq) from store_data);


--  Rank cities based on retention rate using a window function.
       select 
             city,
             round(
             sum(retained) *100/count(*),2) as retention_percentage,
             rank() over(order by sum(retained) *100/count(*) desc) as retention_rank
        from  store_data
        group by city;
      
      
--  Segment customers into High, Medium, and Low value categories based on order value and frequency.
        select
			custid,
				case
				   when avgorder>(select avg(avgorder) from store_data)
                   and  ordfreq >(select avg(ordfreq) from store_data)
                   then 'High_value'
				   when avgorder>(select avg(avgorder) from store_data)
                   or  ordfreq >(select avg(ordfreq) from store_data)
                   then 'Medium_value'
                   else 'Low_value'
		           end as customer_segmet
		from store_data







