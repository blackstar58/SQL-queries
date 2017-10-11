set hive.cli.print.header=true;
select
yyyy,
mm,
dd,
ptid,
moi,
acctid,
sum(imp) imp,
sum(ad_clicks) ad_clicks,
sum(clicks) clicks

from (
select
yyyy,
mm,
dd,
normalization_map['ptid'] ptid,
    case      when normalization_map['moi'] = 33 then 'North Module'
              when normalization_map['moi'] = 7 then 'North Module'
              when normalization_map['moi'] = 106 then 'North Module'
              when normalization_map['moi'] = 116 then 'North Module'
              when normalization_map['moi'] = 31 then 'South Module'
              when normalization_map['moi'] = 34 then 'South Module'
              when normalization_map['moi'] = 1 then 'Center'
              when normalization_map['moi'] = 2 then 'Right Rail'
              when normalization_map['moi'] = 136 then 'Right Rail'
              when normalization_map['moi'] = 137 then 'Right Rail'
              when normalization_map['moi'] = 139 and normalization_map['ptid'] = 'www.yellowpages.com'
                                                 then 'MIP Center'
              when normalization_map['moi'] = 140 and normalization_map['ptid'] = 'www.yellowpages.com'
                                                 then 'MIP South'
            
              else 'Other' end as moi,
normalization_map['acctid'] acctid,
if(normalization_map['en']=='YP::Search:Result', 1, if(normalization_map['en']=='YP::PageResult',1, 0)) imp,
if(normalization_map['lt'] = 22, 0, if(normalization_map['en']=='YP::AdClick', 1, 0)) ad_clicks,
if(normalization_map['lt'] <> 22, 0, if(normalization_map['en']=='YP::AdClick', 1, 0)) rate_clicks,
if(normalization_map['en']=='YP::AdClick', 1, 0) clicks,
/*if(normalization_map['lt'] = 22, 0, if(normalization_map['en']=='YP::AdClick', normalization_map['cost'], 0))/1000000  cost,
if(normalization_map['lt'] <> 22, 0, if(normalization_map['en']=='YP::AdClick', normalization_map['cost'], 0))/1000000  filtered_cost */
from
normalized_traff
    ic_events
where
(yyyy = 2016 AND mm = 10 AND dd = 26 )
and normalization_map['en'] in ('YP::Search:Result', 'YP::AdClick', 'YP::PageResult')
and normalization_map['tq'] = 0
and normalization_map['cp'] = 0
and normalization_map['cstm'] = 1
and normalization_map['t'] = 'pmp'
and normalization_map['ptid'] in ('www.yellowpages.com')
) x

group by
yyyy,
mm,
dd,
ptid,
moi,
acctid
