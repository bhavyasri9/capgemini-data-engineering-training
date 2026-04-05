-- Bucketing
-- segmentation using case

select customer_id, sum(total_amount) as total_spend,
    case
        when sum(total_amount) > 10000 then 'gold'
        when sum(total_amount) between 5000 and 10000 then 'silver'
        else 'bronze'
    end as segment
from sales
group by customer_id;


-- count customers per segment

select segment, count(*) 
from (
    select customer_id,
        case
            when sum(total_amount) > 10000 then 'gold'
            when sum(total_amount) between 5000 and 10000 then 'silver'
            else 'bronze'
        end as segment
    from sales
    group by customer_id
) t
group by segment;

-- window-based segmentation

select *,
    case
        when rank_pct <= 0.33 then 'bronze'
        when rank_pct <= 0.66 then 'silver'
        else 'gold'
    end as segment
from (
    select 
        customer_id,
        sum(total_amount) as total_spend,
        percent_rank() over (order by sum(total_amount)) as rank_pct
    from sales
    group by customer_id
) t;