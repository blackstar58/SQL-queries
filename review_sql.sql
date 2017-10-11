select distinct customer_id 
From
    ae_indexer_full_today_v2
where
    ds = '20170505' and
    tier in ('20','21','22');
    
