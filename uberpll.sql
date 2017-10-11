select
yyyy, mm, dd,
normalization_map['sgt'], 
normalization_map['sgtad'], 
normalization_map['moi'], 
normalization_map['en'],
normalization_map['poi'],
normalization_map['v'],
normalization_map['cstm'],
normalization_map['t'],
split(coalesce(normalization_map['sct'], 'null'), ',')[0], 
normalization_map['acctid'],
count(normalization_map['en']),
sum(normalization_map['cost'])
from normalized_traffic_events
where yyyy=2016 and mm=7 and dd between 8 and 18
and normalization_map['tq'] = 0
and normalization_map['moi'] in (7)
and normalization_map['ptid'] ='www.yellowpages.com'
and normalization_map['sgtad'] in
(
'bucket-catsearch-top3-control_a',
'bucket-catsearch-top3-control_b',
'bucket-catsearch-top3-test_a',
'bucket-catsearch-top3-test_b'
)
group by
yyyy, mm, dd,
normalization_map['sgt'], 
normalization_map['sgtad'], 
normalization_map['moi'], 
normalization_map['en'],
normalization_map['poi'],
normalization_map['v'],
normalization_map['cstm'],
normalization_map['t'],
split(coalesce(normalization_map['sct'], 'null'), ',')[0], 
normalization_map['acctid']
;
