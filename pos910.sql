set hive.cli.print.header=true;
SELECT
    yyyy,
    mm,
    dd,
    ptid as Distribution,
    pos,
    ModuleType as ModuleType,
    sum(searches) as Searches,
    sum(imp) as Impressions,
    sum(clicks) as Clicks,
    sum(cost) as Revenue
    FROM
    (
    SELECT yyyy,
        mm,
        dd,
        raw_map['ptid'] as ptid,
        if(raw_map['en']=='YP::Search:Result', 1, 0) as searches,
        if(raw_map['cstm']==1 and (raw_map['en']=='YP::Search:Result' or raw_map['en']=='YP::PageResult'), 1, 0) as imp,
        if(raw_map['cstm']==1 and raw_map['en']=='YP::Search:Result', raw_map['poi'], 0) as pos,
        if(raw_map['en']=='YP::AdClick', 1, 0) as clicks,
        if(raw_map['en']=='YP::AdClick', raw_map['cost'], 0 ) as cost,
        case  when raw_map['moi'] = 111 then 'North Module'
              when raw_map['moi'] = 33 then 'North Module'
              when raw_map['moi'] = 7 then 'North Module'
              when raw_map['moi'] = 106 then 'North Module'
              when raw_map['moi'] = 116 then 'North Module'
              when raw_map['moi'] = 133 then 'South Module'
              when raw_map['moi'] = 31 then 'South Module'
              when raw_map['moi'] = 34 then 'South Module'
              when raw_map['moi'] = 1 then 'Center'
              when raw_map['moi'] = 2 then 'Right Rail'
              when raw_map['moi'] = 136 then 'Right Rail'
              when raw_map['moi'] = 137 then 'Right Rail'
              when raw_map['moi'] = 139 and raw_map['ptid'] = 'www.yellowpages.com'
                                                 then 'MIP Center'
              when raw_map['moi'] = 140 and raw_map['ptid'] = 'www.yellowpages.com'
                                                 then 'MIP South'
              when raw_map['moi'] = 107 and
                    raw_map['ptid'] = 'MOBWEB'
                                                 then 'MIP South'
              else 'Other' end as ModuleType
      FROM raw_traffic_events
      WHERE raw_map['en'] in ('YP::Search:Result', 'YP::AdClick', 'YP::PageResult')
      AND raw_map['tq']   =0
      AND raw_map['t']    ='pmp'
      and raw_map['ptid'] in ('www.yellowpages.com')
      AND yyyy  =2017
        and mm =3
        and dd =16
    ) X group by
    yyyy,
    mm,
    dd,
    ptid,
    pos,
    ModuleType;
