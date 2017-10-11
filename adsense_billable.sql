select
        count(*)
from
         normalized_traffic_events
where
        yyyy = 2017 and
        mm= 02 and
        dd = 12 and
        normalization_map['ptid'] ='www.yellowpages.com' and
        normalization_map['en'] = 'YP::Search' and
        normalization_map['tq'] = '0' and
        normalization_map['tos'] = 'google-adsense' and
        normalization_map['moi'] in (7, 106)


