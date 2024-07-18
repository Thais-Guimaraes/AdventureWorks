with
    sales_2011 as (
        select sum(GROSS_VALUE) as GROSS_VALUE
        from {{ ref('fact_sales') }}
        where order_date between '2011-01-01' and '2011-12-31'
    )

select GROSS_VALUE
from sales_2011 -- 12.646.112,16 
where GROSS_VALUE not between 12645110.00 and 12647000.00
