-- 2100	Number of persons with at least one device exposure , by device_concept_id

--HINT DISTRIBUTE_ON_KEY(analysis_id)
select 2100 as analysis_id, 
	CAST(m.device_CONCEPT_ID AS VARCHAR(255)) as stratum_1,
	null as stratum_2, null as stratum_3, null as stratum_4, null as stratum_5,
	COUNT_BIG(distinct m.PERSON_ID) as count_value
into @scratchDatabaseSchema@schemaDelim@tempAchillesPrefix_2100
from
	@cdmDatabaseSchema.device_exposure m
group by m.device_CONCEPT_ID
;