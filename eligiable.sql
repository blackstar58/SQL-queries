insert overwrite directory 'hdfs://nameservice1/user/as7639/hive/candidate.out'


select
        a.customer_id as CID,
        a.extra_line50 as slogan,
        b.attr_name,
        b.attr_value,
        a.phone_text as Phone,
        a.extra_url as Url
        
        
        
        
        

SELECT a.YPID, a.LISTING_ID, a.LISTING_NAME, a.TIER, a.ADDRESS_TEXT, a.PHONE_TEXT, a.ALL_HEADING_TEXT, a.VIDEO_AD, a.TOUR_ID, a.SERP_IMAGE_SHA1, a.OAD_FLAG, a.EXTRA_LINE50, b.ATTR_VALUE
FROM UFO.LISTING_ATTRS_INDEXER_FULL b left outer join UFO.PUBLISHER_EXTRACT_FULL_TODAY a
ON a.YPID = b.YPID
WHERE b.ATTR_NAME='bbb_grade' and a.TIER in (20,21,22) and extra_line50 is not null and b.attr_value in ('A', 'A+');




select
    a.YPID, 
    a.LISTING_ID, 
    a.LISTING_NAME, 
    a.TIER, 
    a.ADDRESS_TEXT, 
    a.PHONE_TEXT, 
    a.ALL_HEADING_TEXT, 
    a.VIDEO_AD, 
    a.TOUR_ID, 
    a.SERP_IMAGE_SHA1, 
    a.OAD_FLAG, 
    a.EXTRA_LINE50, 
    b.ATTR_VALUE
from
    ae_indexer_full_today_v2 a , listing_attrs_full_today_v2 b
where
     a.ds='20170513' and
     a.tier in ('20','21','22') and
     a.ypid = b.ypid and
     b.attr_name = 'bbb_grade'
group by
    a.YPID, 
    a.LISTING_ID, 
    a.LISTING_NAME, 
    a.TIER, 
    a.ADDRESS_TEXT, 
    a.PHONE_TEXT, 
    a.ALL_HEADING_TEXT, 
    a.VIDEO_AD, 
    a.TOUR_ID, 
    a.SERP_IMAGE_SHA1, 
    a.OAD_FLAG, 
    a.EXTRA_LINE50, 
    b.ATTR_VALUE