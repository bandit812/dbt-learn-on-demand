select order_id, sum(amount)
from {{ ('stg_payments')}}
group by 1
having sum(amount) <0