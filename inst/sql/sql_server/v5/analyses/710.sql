-- 710	Number of drug exposure records outside valid observation period

--HINT DISTRIBUTE_ON_KEY(analysis_id)
select 710 as analysis_id,  
	null as stratum_1, null as stratum_2, null as stratum_3, null as stratum_4, null as stratum_5,
	COUNT_BIG(de1.PERSON_ID) as count_value
into @scratchDatabaseSchema@schemaDelim@tempAchillesPrefix_710
from
	@cdmDatabaseSchema.drug_exposure de1
	left join @cdmDatabaseSchema.observation_period op1
	on op1.person_id = de1.person_id
	and de1.drug_exposure_start_date >= op1.observation_period_start_date
	and de1.drug_exposure_start_date <= op1.observation_period_end_date
where op1.person_id is null
;