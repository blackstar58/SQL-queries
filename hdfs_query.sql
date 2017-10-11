set hive.cli.print.header=true;

insert overwrite directory 'hdfs://nameservice1/user/as7639/hive/hdfs_results.out'

SELECT
    yyyy, mm, dd,
    normalization_map['sgtad'],
    normalization_map['en'],
    normalization_map['t'],
                normalization_map['v'],
                normalization_map['pn'],
    split(coalesce(normalization_map['sct'], 'null'), ',')[0],
                normalization_map['rid'],
                normalization_map['acctid'],
                normalization_map['ypsm_type'],
                normalization_map['pf'],
                (instr(normalization_map['pf'],'coupon') > 0),
                (instr(normalization_map['pf'],'video') > 0),
                (instr(normalization_map['pf'],'website') > 0),
                (instr(normalization_map['pf'],'address') > 0),
                (instr(normalization_map['pf'],'phone') > 0),
                (instr(normalization_map['pf'],'ebl') > 0),
                COUNT(normalization_map['en'])
FROM
    normalized_traffic_events
WHERE
    yyyy=2017 and mm = 4 and
    normalization_map['moi'] = '7' and
                normalization_map['poi'] = '1' and
                normalization_map['cstm'] = '1' and
    normalization_map['ptid'] ='www.yellowpages.com' and
                normalization_map['tq'] = 0 and
    normalization_map['sgtad'] in
    ('ebltest-no-ebl','ebltest-ebl-website','ebltest-ebl-display')
GROUP BY
                yyyy, mm, dd,
                normalization_map['sgtad'],
                normalization_map['en'],
                normalization_map['t'],
                normalization_map['v'],
                normalization_map['pn'],
                split(coalesce(normalization_map['sct'], 'null'), ',')[0],
                normalization_map['acctid'],
                normalization_map['ypsm_type'],
                normalization_map['pf'],
                normalization_map['rid'],
                (instr(normalization_map['pf'],'coupon') > 0),
                (instr(normalization_map['pf'],'video') > 0),
                (instr(normalization_map['pf'],'website') > 0),
                (instr(normalization_map['pf'],'address') > 0),
                (instr(normalization_map['pf'],'phone') > 0),
                (instr(normalization_map['pf'],'ebl') > 0)