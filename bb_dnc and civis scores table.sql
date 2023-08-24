bb_dnc and civis scores table

create table bb_dnc_scores_05162022 as
(
select
cw.reference_code
,ap.state_code
,ap.chamber
,ap.district
,sum(sc.dnc_2022_dem_party_support*sc.clarity_2022_turnout)/sum(sc.clarity_2022_turnout) as dnc_proj
from phoenix_analytics.person ap
left join phoenix_scores.all_scores_2022 sc
 	on ap.state_code||ap.chamber||ap.district=sc.state_code||sc.chamber||sc.district
left join jdickinson1.ballotpedia_crosswalk cw 
	on ap.state_code||ap.chamber||ap.district=cw.state_code||cw.chamber||cw.district
where ap.reg_voter_flag = TRUE
	AND ap.reg_record_merged = FALSE
	AND ap.is_deceased = FALSE
	AND ap.out_of_state_ncoa = FALSE
)

(select
cw.reference_code
shc.state_code
shc.chamber
shc.district
shc.dnc_proj
from 
(ap.state_code
,"state_house" as chamber
,ap.state_house_district_latest
,sum(sc.dnc_2022_dem_party_support*sc.clarity_2022_turnout)/sum(sc.clarity_2022_turnout) as dnc_proj
from phoenix_analytics.person ap
left join phoenix_scores.all_scores_2022 sc
 	on ap.state_code||ap.person_id=sc.state_code||sc.person_id
where ap.reg_voter_flag = TRUE
	AND ap.reg_record_merged = FALSE
	AND ap.is_deceased = FALSE
	AND ap.out_of_state_ncoa = FALSE) shc
left join jdickinson1.ballotpedia_crosswalk cw 
	on ap.state_code||ap.chamber||ap.district=cw.state_code||cw.chamber||cw.district
	)

union all

	(select
cw.reference_code
,ap.state_code
,"state_senate" as chamber
,ap.state_senate_district_latest
,sum(sc.dnc_2022_dem_party_support*sc.clarity_2022_turnout)/sum(sc.clarity_2022_turnout) as dnc_proj
from phoenix_analytics.person ap
left join phoenix_scores.all_scores_2022 sc
 	on ap.state_code||ap.chamber||ap.district=sc.state_code||sc.chamber||sc.district
left join jdickinson1.ballotpedia_crosswalk cw 
	on ap.state_code||ap.chamber||ap.district=cw.state_code||cw.chamber||cw.district
where ap.reg_voter_flag = TRUE
	AND ap.reg_record_merged = FALSE
	AND ap.is_deceased = FALSE
	AND ap.out_of_state_ncoa = FALSE)





drop table if exists jdickinson.bb_dnc_scores_05162022;
create table jdickinson.bb_dnc_scores_05162022 as

(
select
cw.building_blocks_code
,shc.state_code
,shc.chamber
,shc.district
,shc.dnc_proj
from 
(select
ap.state_code
,'state_house' as chamber
,ap.state_house_district_latest as district
,sum(sc.dnc_2022_dem_party_support*sc.clarity_2022_turnout)/sum(sc.clarity_2022_turnout) as dnc_proj
from phoenix_analytics.person ap
left join phoenix_scores.all_scores_2022 sc
 	on ap.state_code||ap.person_id=sc.state_code||sc.person_id
where ap.reg_voter_flag = TRUE
	AND ap.reg_record_merged = FALSE
	AND ap.is_deceased = FALSE
	AND ap.out_of_state_ncoa = FALSE
    group by 1,2,3
    ) shc
left join jdickinson1.bb_district_names_crosswalk cw 
	on shc.state_code||shc.chamber||shc.district=cw.state||cw.chamber||cw.district
    order by 1
)

union all
(
    	select
cw.building_blocks_code
,shc.state_code
,shc.chamber
,shc.district
,shc.dnc_proj
from 
(select
ap.state_code
,'state_senate' as chamber
,ap.state_senate_district_latest as district
,sum(sc.dnc_2022_dem_party_support*sc.clarity_2022_turnout)/sum(sc.clarity_2022_turnout) as dnc_proj
from phoenix_analytics.person ap
left join phoenix_scores.all_scores_2022 sc
 	on ap.state_code||ap.person_id=sc.state_code||sc.person_id
where ap.reg_record_merged is false
and ap.is_deceased is false
and ap.reg_on_current_file is true 
and ap.reg_voter_flag is true
    group by 1,2,3
    ) shc
left join jdickinson1.bb_district_names_crosswalk cw 
	on shc.state_code||shc.chamber||shc.district=cw.state||cw.chamber||cw.district
    order by 1
    )


,dsc.dnc_projection

join jdickinson1.bb_dnc_scores_test dsc
 	on dsc.reference_code=pe.reference_code

drop table if exists jdickinson1.bb_dnc_scores;
create table jdickinson1.bb_dnc_scores as
(select * from jdickinson1.bb_dnc_scores_test)
union all
(select * from jdickinson1.odd_states_dnc_scores)

drop table if exists jdickinson1.odd_states_dnc_scores;
create table jdickinson1.odd_states_dnc_scores
as
(select
cw.building_blocks_code
,shc.state_code
,shc.chamber
,shc.district
,shc.dnc_proj
from
(select
ap.state_code
,'state_house' as chamber
,cw.state_house_district as district
,sum(sc.dnc_2022_dem_party_support*sc.clarity_2022_turnout)/sum(sc.clarity_2022_turnout) as dnc_proj
from phoenix_analytics.person ap
left join phoenix_scores.all_scores_2022 sc
 	on ap.state_code||ap.person_id=sc.state_code||sc.person_id
    left join jdickinson1.non_ap_state_crosswalk cw
   on cw.state_code||cw.census_block_2020_corrected=ap.state_code||ap.census_block_full_2020
where ap.state_code in ('AK','AZ','CA','MD','MA','MI','MN','WV')
AND ap.reg_voter_flag = TRUE
	AND ap.reg_record_merged = FALSE
	AND ap.is_deceased = FALSE
	AND ap.out_of_state_ncoa = FALSE
    group by 1,2,3
    ) shc
    left join jdickinson1.bb_district_names_crosswalk cw 
	on shc.state_code||shc.chamber||shc.district=cw.state||cw.chamber||cw.district
    order by 1
    )


union all

(select
cw.building_blocks_code
,shc.state_code
,shc.chamber
,shc.district
,shc.dnc_proj
from 
(select
ap.state_code
,'state_senate' as chamber
,cw.state_senate_district as district
,sum(sc.dnc_2022_dem_party_support*sc.clarity_2022_turnout)/sum(sc.clarity_2022_turnout) as dnc_proj
from phoenix_analytics.person ap
left join phoenix_scores.all_scores_2022 sc
 	on ap.state_code||ap.person_id=sc.state_code||sc.person_id
    left join jdickinson1.non_ap_state_crosswalk cw
   on cw.state_code||cw.census_block_2020_corrected=ap.state_code||ap.census_block_full_2020
where ap.state_code in ('AK','AZ','CA','MD','MA','MI','MN','WV')
AND ap.reg_record_merged is false
and ap.is_deceased is false
and ap.reg_on_current_file is true 
and ap.reg_voter_flag is true
    group by 1,2,3
)shc
left join jdickinson1.bb_district_names_crosswalk cw 
	on shc.state_code||shc.chamber||shc.district=cw.state||cw.chamber||cw.district
    order by 1
    )









select 
distinct state_code
,census_block_2020
,state_house_district
,state_senate_district
 from `demsdlcc.commons.person_to_new_district`
 where state_code in ('AK','AZ','CA','MD','MA','MI','MN','WV')
 GROUP BY state_code,2,3,4



 drop table if exists jdickinson1.bb_civis_scores;
create table jdickinson1.bb_civis_scores
as(
select 
cw.building_blocks_code as reference_code
,a.state_code
,a.race
,a.district
,a.mean_forecast as civis_forecast_may
 from forecasts_2022.forecasts_20220506 a
 join jdickinson1.bb_district_names_crosswalk cw
 on a.district=cw.civis_district_name
)


drop table if exists jdickinson1.bb_civis_scores_june;
create table jdickinson1.bb_civis_scores_june as
(
select 
cw.building_blocks_code as reference_code
,a.state_code
,a.race
,a.district
,a.mean_forecast as civis_forecast_june
 from forecasts_2022.district_forecasts_060722 a
 left join jdickinson1.bb_district_names_crosswalk cw
 on a.race||a.district=cw.chamber||cw.civis_district_name
 group by 1,2,3,4,5
 order by 1
 )

select 
state_code
,chamber
,district
,civis_forecast_june
from jdickinson1.building_blocks_master
where
civis_forecast_june is not null