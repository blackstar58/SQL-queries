set hive.cli.print.header=true;

select
    yyyy, mm, dd,
    normalization_map['sgtad'],
    normalization_map['moi'],
    normalization_map['en'],
    normalization_map['poi'],
    normalization_map['v'],
    normalization_map['cstm'],
    normalization_map['t'],
    split(coalesce(normalization_map['sct'], 'null'), ',')[0],
    normalization_map['acctid'],
    normalization_map['pn'],
normalization_map['ypsm_type'],
normalization_map['pf'],
normalization_map['lt'],
normalization_map['rid'],
count(normalization_map['en']),
sum(normalization_map['cost'])

from
    normalized_traffic_events
where
    yyyy=2017 and
    mm = 3 and
    dd >= 17 and dd <=31 and
    normalization_map['moi'] in (7) and
    normalization_map['ptid'] ='www.yellowpages.com' and
normalization_map['tq'] = 0 and
        normalization_map['sgtad'] in
    ('ebltest-no-ebl','ebltest-ebl-website','ebltest-ebl-display')
group by
yyyy, mm, dd,
normalization_map['sgtad'],
normalization_map['moi'],
normalization_map['en'],
normalization_map['poi'],
normalization_map['v'],
normalization_map['cstm'],
normalization_map['t'],
split(coalesce(normalization_map['sct'], 'null'), ',')[0],
normalization_map['acctid'],
normalization_map['pn'],
normalization_map['ypsm_type'],
normalization_map['lt'],
normalization_map['pf'],
normalization_map['rid']