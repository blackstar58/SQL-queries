SELECT sum(customer_id)
FROM
                ae_indexer_full_today_v2 ldb JOIN
                eric_arenas.wpcids cids ON
(ldb.customer_id = cids.wpcid)
WHERE ds = '20170411'  and length(ypid)>0  and tier in  ('20','21','22')
group by customer_id



select 
    count(distinct(r.ypid)) 

from 
    digdata.top_helpful_reviews r 
where 
    r.ds=20170511 and 
    r.ypid in 
            (select 
                    distinct( p.ypid) 
             from 
                    default.ae_indexer_full_today_v2  p 
             
             where p.ds=20170511 and 
             p.tier>19 and 
             p.tier<81 and 
             p.ratable=0);
             
             
_c0
95148 - All Tiers 

_c0
16982 - Tiers

_c0
22364



select 
    count(distinct(r.ypid))
from
    default.ratings_mv r
where
    r.ds=20170513 and
    r.ypid in
            (select
                    distinct(p.ypid)
            
             from
                    default.ae_indexer_full_today_v2 p
             where 
                    p.ds=20170513 and
                    p.tier in ('20','21','22')
            ) and
    r.highlight_priority is not null;
    
    
    
    
    
    
set hive.cli.print.header=true;
select
    count(distinct(customer_id))
from
    default.ae_indexer_full_today_v2 p
where
    p.ds=20170513 and
    p.ypid in
            (select
                    distinct(r.ypid)

             from
                    default.ratings_mv r
             where
                    r.ds=20170513 and
                    r.highlight_priority is not null
                    p.tier in ('20','21','22')
            ) and
    p.tier in ('20','21','22')
    
    
    
    
    

insert overwrite directory 'hdfs://nameservice1/user/as7639/hive/name_search.out'

set hive.cli.print.header=true;

select
    mm,
    normalization_map['v'],
    normalization_map['cstm'],
    split(coalesce(normalization_map['sct'], 'null'), ',')[0],
    normalization_map['pn'],
count(normalization_map['en'])

from
    normalized_traffic_events
where
    yyyy >= 2016 and yyyy= <= 2017 and
    normalization_map['v'] = 2 and
    normalization_map['moi'] = 7 and
    normalization_map['ptid'] ='www.yellowpages.com' and
    normalization_map['tq'] = 0 and   
    normalization_map['t'] ='listing'
    
    
group by
    mm,
    normalization_map['en'],
    normalization_map['v'],
    normalization_map['cstm'],
    split(coalesce(normalization_map['sct'], 'null'), ',')[0],
    normalization_map['pn']

    
    
    
    
    
    
    nselect count(distinct (normalization_map['rid'])), normalization_map['v'] from normalized_traffic_events where normalization_map['en']='YP:: Search' and normalization_map['tq']=0  AND normalization_map['ptid']='www.yellowpages.com' AND mm=03 AND dd=01 AND yyyy=2017 group by normalization_map['v']; 
    
    
    
    
    
    
    
    
    
    
    
    
    
    
            