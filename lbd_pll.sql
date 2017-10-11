select 
    count(distinct(customer_id)), 
    coupon_flag,
    tour_id,
    video_ad
from
    ae_indexer_full_today
where
    ds='20170427' and
    length(ypid) > 0 and
    tier = '20'