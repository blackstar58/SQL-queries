set hive.cli.print.header=true;

SELECT
        yyyy,
        mm,
        dd,
        sum(if(normalization_map['en'] =='YP::Search:Result',1,0)) as imp
        split(coalesce(normalization_map['sct'], 'null'), ',')[0]

        
FROM
        normalized_traffic_events
WHERE
        mm=01 and
        dd>=01 and dd<=10 and
        yyyy = 2017
        and normalization_map['t']='pmp'
        and normalization_map['en'] in ('YP::Search:Result')
        and normalization_map['tq'] = 0
        and normalization_map['cstm'] = 1
        and normalization_map['ptid']  = 'www.yellowpages.com'
        and normalization_map['moi'] = '7'

                
GROUP BY
        yyyy,
        mm,
        dd,
        split(coalesce(normalization_map['sct'], 'null'), ',')[0]



    