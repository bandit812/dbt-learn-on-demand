with orders as (
   select order_id,customer_id, order_date  from  {{ ref('stg_order') }}   
),

payments as (
    select order_id, sum(amount) as amount
    from {{ ref('stg_payments') }}
    group by order_id
)

select 
orders.order_id, orders.customer_id,orders.order_date, payments.amount
from  orders
left outer join payments on orders.order_id = payments.order_id