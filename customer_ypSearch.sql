set hive.cli.print.header=true;
SELECT
    customer_id, coupon_flag, tour_id, video_ad, customer_id
FROM
    ae_indexer_full_today_v2 ldb JOIN
    eric_arenas.wpcids cids ON
    (ldb.customer_id = cids.wpcid)
WHERE
    ds = '20170212' and length(ypid) > 0 and
    tier in ('20','21','22','25','26','27','30','40','50','60','68','100','800','900')