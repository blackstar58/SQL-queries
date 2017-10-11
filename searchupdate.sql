SELECT *
FROM
(SELECT tseg1.TrafficSegmentLevel2Name, count(distinct SearchKey) as Searches,lower(a.SearchTerm) as lower_searchterm,
    CASE
        WHEN lower(a.SearchTerm) = 'audi' or lower(a.SearchTerm) like '% audi %' or lower(a.SearchTerm) like 'audi %' or lower(a.SearchTerm) like '% audi' THEN 'audi'
        WHEN lower(a.SearchTerm) = 'bmw' or lower(a.SearchTerm) like '% bmw %' or lower(a.SearchTerm) like 'bmw %' or lower(a.SearchTerm) like '% bmw' THEN 'bmw'
        WHEN lower(a.SearchTerm) = 'carmax' or lower(a.SearchTerm) like '% carmax %' or lower(a.SearchTerm) like 'carmax %' or lower(a.SearchTerm) like '% carmax' THEN 'carmax'
        WHEN lower(a.SearchTerm) = 'chevrolet ' or lower(a.SearchTerm) like '% chevrolet  %' or lower(a.SearchTerm) like 'chevrolet  %' or lower(a.SearchTerm) like '% chevrolet ' THEN 'chevrolet '
        WHEN lower(a.SearchTerm) = 'chevy' or lower(a.SearchTerm) like '% chevy %' or lower(a.SearchTerm) like 'chevy %' or lower(a.SearchTerm) like '% chevy' THEN 'chevy'
        WHEN lower(a.SearchTerm) = 'chrysler' or lower(a.SearchTerm) like '% chrysler %' or lower(a.SearchTerm) like 'chrysler %' or lower(a.SearchTerm) like '% chrysler' THEN 'chrysler'
        WHEN lower(a.SearchTerm) = 'dodge' or lower(a.SearchTerm) like '% dodge %' or lower(a.SearchTerm) like 'dodge %' or lower(a.SearchTerm) like '% dodge' THEN 'dodge'
        WHEN lower(a.SearchTerm) = 'ford' or lower(a.SearchTerm) like '% ford %' or lower(a.SearchTerm) like 'ford %' or lower(a.SearchTerm) like '% ford' THEN 'ford'
        WHEN lower(a.SearchTerm) = 'honda' or lower(a.SearchTerm) like '% honda %' or lower(a.SearchTerm) like 'honda %' or lower(a.SearchTerm) like '% honda' THEN 'honda'
        WHEN lower(a.SearchTerm) = 'hyundai' or lower(a.SearchTerm) like '% hyundai %' or lower(a.SearchTerm) like 'hyundai %' or lower(a.SearchTerm) like '% hyundai' THEN 'hyundai'
        WHEN lower(a.SearchTerm) = 'isuzu' or lower(a.SearchTerm) like '% isuzu %' or lower(a.SearchTerm) like 'isuzu %' or lower(a.SearchTerm) like '% isuzu' THEN 'isuzu'
        WHEN lower(a.SearchTerm) = 'kia' or lower(a.SearchTerm) like '% kia %' or lower(a.SearchTerm) like 'kia %' or lower(a.SearchTerm) like '% kia' THEN 'kia'
        WHEN lower(a.SearchTerm) = 'lexus' or lower(a.SearchTerm) like '% lexus %' or lower(a.SearchTerm) like 'lexus %' or lower(a.SearchTerm) like '% lexus' THEN 'lexus'
        WHEN lower(a.SearchTerm) = 'mazda' or lower(a.SearchTerm) like '% mazda %' or lower(a.SearchTerm) like 'mazda %' or lower(a.SearchTerm) like '% mazda' THEN 'mazda'
        WHEN lower(a.SearchTerm) = 'mercedes' or lower(a.SearchTerm) like '% mercedes %' or lower(a.SearchTerm) like 'mercedes %' or lower(a.SearchTerm) like '% mercedes' THEN 'mercedes'
        WHEN lower(a.SearchTerm) = 'mini cooper' or lower(a.SearchTerm) like '% mini cooper %' or lower(a.SearchTerm) like 'mini cooper %' or lower(a.SearchTerm) like '% mini cooper' THEN 'mini cooper'
        WHEN lower(a.SearchTerm) = 'mitsubishi' or lower(a.SearchTerm) like '% mitsubishi %' or lower(a.SearchTerm) like 'mitsubishi %' or lower(a.SearchTerm) like '% mitsubishi' THEN 'mitsubishi'
        WHEN lower(a.SearchTerm) = 'nissan' or lower(a.SearchTerm) like '% nissan %' or lower(a.SearchTerm) like 'nissan %' or lower(a.SearchTerm) like '% nissan' THEN 'nissan'
        WHEN lower(a.SearchTerm) = 'saturn' or lower(a.SearchTerm) like '% saturn %' or lower(a.SearchTerm) like 'saturn %' or lower(a.SearchTerm) like '% saturn' THEN 'saturn'
        WHEN lower(a.SearchTerm) = 'subaru' or lower(a.SearchTerm) like '% subaru %' or lower(a.SearchTerm) like 'subaru %' or lower(a.SearchTerm) like '% subaru' THEN 'subaru'
        WHEN lower(a.SearchTerm) = 'toyota' or lower(a.SearchTerm) like '% toyota %' or lower(a.SearchTerm) like 'toyota %' or lower(a.SearchTerm) like '% toyota' THEN 'toyota'
        WHEN lower(a.SearchTerm) = 'volkswagen' or lower(a.SearchTerm) like '% volkswagen %' or lower(a.SearchTerm) like 'volkswagen %' or lower(a.SearchTerm) like '% volkswagen' THEN 'volkswagen'
        WHEN lower(a.SearchTerm) = 'volvo' or lower(a.SearchTerm) like '% volvo %' or lower(a.SearchTerm) like 'volvo %' or lower(a.SearchTerm) like '% volvo' THEN 'volvo'
    ELSE '' END as SerachTerm)
FROM WebanalyticsDWng.F_Daily_Requests as a
JOIN WebanalyticsDWng_Dim.D_Time as dt ON a.TimeKey = dt.TimeKey
JOIN WebanalyticsDWng_Dim.D_TrafficSegment as tseg ON a.TrafficSegmentKey = tseg.TrafficSegmentKey
JOIN WebanalyticsDWng_Dim.vw_Dim_TrafficSegmentLevel as tseg1 ON tseg.TrafficSegmentLevel3Key = tseg1.TrafficSegmentLevel3Key
JOIN WebanalyticsDWng_Dim.D_SearchView as dsv ON a.SearchViewKey = dsv.SearchViewKey
WHERE tseg1.TrafficSegmentLevel2Name IN ('YPmobile - Android','YPmobile - iPhone','YPmobile Web - Organic','YELLOWPAGES.COM Organic')
    AND StartOfMonth = '20161101'
    AND PageGroupCode = 'NAMERES'
    AND (lower(a.SearchTerm) = 'carmax' or lower(a.SearchTerm) = 'hyundai' or lower(a.SearchTerm) = 'dodge' or lower(a.SearchTerm) = 'isuzu' or
        lower(a.SearchTerm) = 'mitsubishi' or lower(a.SearchTerm) = 'subaru' or lower(a.SearchTerm) = 'mercedes' or lower(a.SearchTerm) = 'chrysler' or 
        lower(a.SearchTerm) = 'volvo' or lower(a.SearchTerm) = 'lexus' or lower(a.SearchTerm) = 'mini cooper' or lower(a.SearchTerm) = 'audi' or 
        lower(a.SearchTerm) = 'saturn' or lower(a.SearchTerm) = 'bmw' or lower(a.SearchTerm) = 'ford' or lower(a.SearchTerm) = 'toyota' or 
        lower(a.SearchTerm) = 'honda' or lower(a.SearchTerm) = 'chevrolet ' or lower(a.SearchTerm) = 'chevy' or lower(a.SearchTerm) = 'volkswagen' or 
        lower(a.SearchTerm) = 'kia' or lower(a.SearchTerm) = 'mazda' or lower(a.SearchTerm) = 'nissan' or lower(a.SearchTerm) like '% carmax %' or 
        lower(a.SearchTerm) like '% hyundai %' or lower(a.SearchTerm) like '% dodge %' or lower(a.SearchTerm) like '% isuzu %' or lower(a.SearchTerm) like '% mitsubishi %' or 
        lower(a.SearchTerm) like '% subaru %' or lower(a.SearchTerm) like '% mercedes %' or lower(a.SearchTerm) like '% chrysler %' or lower(a.SearchTerm) like '% volvo %' or 
        lower(a.SearchTerm) like '% lexus %' or lower(a.SearchTerm) like '% mini cooper %' or lower(a.SearchTerm) like '% audi %' or lower(a.SearchTerm) like '% saturn %' or 
        lower(a.SearchTerm) like '% bmw %' or lower(a.SearchTerm) like '% ford %' or lower(a.SearchTerm) like '% toyota %' or lower(a.SearchTerm) like '% honda %' or 
        lower(a.SearchTerm) like '% chevrolet  %' or lower(a.SearchTerm) like '% chevy %' or lower(a.SearchTerm) like '% volkswagen %' or lower(a.SearchTerm) like '% kia %' or 
        lower(a.SearchTerm) like '% mazda %' or lower(a.SearchTerm) like '% nissan %' or lower(a.SearchTerm) like 'carmax %' or lower(a.SearchTerm) like 'hyundai %' or 
        lower(a.SearchTerm) like 'dodge %' or lower(a.SearchTerm) like 'isuzu %' or lower(a.SearchTerm) like 'mitsubishi %' or lower(a.SearchTerm) like 'subaru %' or 
        lower(a.SearchTerm) like 'mercedes %' or lower(a.SearchTerm) like 'chrysler %' or lower(a.SearchTerm) like 'volvo %' or lower(a.SearchTerm) like 'lexus %' or 
        lower(a.SearchTerm) like 'mini cooper %' or lower(a.SearchTerm) like 'audi %' orlower(a.SearchTerm) like 'saturn %' or lower(a.SearchTerm) like 'bmw %' or 
        lower(a.SearchTerm) like 'ford %' or lower(a.SearchTerm) like 'toyota %' or lower(a.SearchTerm) like 'honda %' or lower(a.SearchTerm) like 'chevrolet  %' or 
        lower(a.SearchTerm) like 'chevy %' or lower(a.SearchTerm) like 'volkswagen %' or lower(a.SearchTerm) like 'kia %' or lower(a.SearchTerm) like 'mazda %' or 
        lower(a.SearchTerm) like 'nissan %' or lower(a.SearchTerm) like '% carmax%' or lower(a.SearchTerm) like '% hyundai%' or lower(a.SearchTerm) like '% dodge%' or 
        lower(a.SearchTerm) like '% isuzu%' or lower(a.SearchTerm) like '% mitsubishi%' or lower(a.SearchTerm) like '% subaru%' or lower(a.SearchTerm) like '% mercedes%' or 
        lower(a.SearchTerm) like '% chrysler%' or lower(a.SearchTerm) like '% volvo%' or lower(a.SearchTerm) like '% lexus%' or lower(a.SearchTerm) like '% mini cooper%' or 
        lower(a.SearchTerm) like '% audi%' or lower(a.SearchTerm) like '% saturn%' or lower(a.SearchTerm) like '% bmw%' or lower(a.SearchTerm) like '% ford%' or 
        lower(a.SearchTerm) like '% toyota%' or lower(a.SearchTerm) like '% honda%' or lower(a.SearchTerm) like '% chevrolet %' or lower(a.SearchTerm) like '% chevy%' or 
        lower(a.SearchTerm) like '% volkswagen%' or lower(a.SearchTerm) like '% kia%' or lower(a.SearchTerm) like '% mazda%' or lower(a.SearchTerm) like '% nissan%')
GROUP BY tseg1.TrafficSegmentLevel2Name,lower(a.SearchTerm),
    CASE
        WHEN lower(a.SearchTerm) = 'audi' or lower(a.SearchTerm) like '% audi %' or lower(a.SearchTerm) like 'audi %' or lower(a.SearchTerm) like '% audi' THEN 'audi'
        WHEN lower(a.SearchTerm) = 'bmw' or lower(a.SearchTerm) like '% bmw %' or lower(a.SearchTerm) like 'bmw %' or lower(a.SearchTerm) like '% bmw' THEN 'bmw'
        WHEN lower(a.SearchTerm) = 'carmax' or lower(a.SearchTerm) like '% carmax %' or lower(a.SearchTerm) like 'carmax %' or lower(a.SearchTerm) like '% carmax' THEN 'carmax'
        WHEN lower(a.SearchTerm) = 'chevrolet ' or lower(a.SearchTerm) like '% chevrolet  %' or lower(a.SearchTerm) like 'chevrolet  %' or lower(a.SearchTerm) like '% chevrolet ' THEN 'chevrolet '
        WHEN lower(a.SearchTerm) = 'chevy' or lower(a.SearchTerm) like '% chevy %' or lower(a.SearchTerm) like 'chevy %' or lower(a.SearchTerm) like '% chevy' THEN 'chevy'
        WHEN lower(a.SearchTerm) = 'chrysler' or lower(a.SearchTerm) like '% chrysler %' or lower(a.SearchTerm) like 'chrysler %' or lower(a.SearchTerm) like '% chrysler' THEN 'chrysler'
        WHEN lower(a.SearchTerm) = 'dodge' or lower(a.SearchTerm) like '% dodge %' or lower(a.SearchTerm) like 'dodge %' or lower(a.SearchTerm) like '% dodge' THEN 'dodge'
        WHEN lower(a.SearchTerm) = 'ford' or lower(a.SearchTerm) like '% ford %' or lower(a.SearchTerm) like 'ford %' or lower(a.SearchTerm) like '% ford' THEN 'ford'
        WHEN lower(a.SearchTerm) = 'honda' or lower(a.SearchTerm) like '% honda %' or lower(a.SearchTerm) like 'honda %' or lower(a.SearchTerm) like '% honda' THEN 'honda'
        WHEN lower(a.SearchTerm) = 'hyundai' or lower(a.SearchTerm) like '% hyundai %' or lower(a.SearchTerm) like 'hyundai %' or lower(a.SearchTerm) like '% hyundai' THEN 'hyundai'
        WHEN lower(a.SearchTerm) = 'isuzu' or lower(a.SearchTerm) like '% isuzu %' or lower(a.SearchTerm) like 'isuzu %' or lower(a.SearchTerm) like '% isuzu' THEN 'isuzu'
        WHEN lower(a.SearchTerm) = 'kia' or lower(a.SearchTerm) like '% kia %' or lower(a.SearchTerm) like 'kia %' or lower(a.SearchTerm) like '% kia' THEN 'kia'
        WHEN lower(a.SearchTerm) = 'lexus' or lower(a.SearchTerm) like '% lexus %' or lower(a.SearchTerm) like 'lexus %' or lower(a.SearchTerm) like '% lexus' THEN 'lexus'
        WHEN lower(a.SearchTerm) = 'mazda' or lower(a.SearchTerm) like '% mazda %' or lower(a.SearchTerm) like 'mazda %' or lower(a.SearchTerm) like '% mazda' THEN 'mazda'
        WHEN lower(a.SearchTerm) = 'mercedes' or lower(a.SearchTerm) like '% mercedes %' or lower(a.SearchTerm) like 'mercedes %' or lower(a.SearchTerm) like '% mercedes' THEN 'mercedes'
        WHEN lower(a.SearchTerm) = 'mini cooper' or lower(a.SearchTerm) like '% mini cooper %' or lower(a.SearchTerm) like 'mini cooper %' or lower(a.SearchTerm) like '% mini cooper' THEN 'mini cooper'
        WHEN lower(a.SearchTerm) = 'mitsubishi' or lower(a.SearchTerm) like '% mitsubishi %' or lower(a.SearchTerm) like 'mitsubishi %' or lower(a.SearchTerm) like '% mitsubishi' THEN 'mitsubishi'
        WHEN lower(a.SearchTerm) = 'nissan' or lower(a.SearchTerm) like '% nissan %' or lower(a.SearchTerm) like 'nissan %' or lower(a.SearchTerm) like '% nissan' THEN 'nissan'
        WHEN lower(a.SearchTerm) = 'saturn' or lower(a.SearchTerm) like '% saturn %' or lower(a.SearchTerm) like 'saturn %' or lower(a.SearchTerm) like '% saturn' THEN 'saturn'
        WHEN lower(a.SearchTerm) = 'subaru' or lower(a.SearchTerm) like '% subaru %' or lower(a.SearchTerm) like 'subaru %' or lower(a.SearchTerm) like '% subaru' THEN 'subaru'
        WHEN lower(a.SearchTerm) = 'toyota' or lower(a.SearchTerm) like '% toyota %' or lower(a.SearchTerm) like 'toyota %' or lower(a.SearchTerm) like '% toyota' THEN 'toyota'
        WHEN lower(a.SearchTerm) = 'volkswagen' or lower(a.SearchTerm) like '% volkswagen %' or lower(a.SearchTerm) like 'volkswagen %' or lower(a.SearchTerm) like '% volkswagen' THEN 'volkswagen'
        WHEN lower(a.SearchTerm) = 'volvo' or lower(a.SearchTerm) like '% volvo %' or lower(a.SearchTerm) like 'volvo %' or lower(a.SearchTerm) like '% volvo' THEN 'volvo'
    ELSE '' END
