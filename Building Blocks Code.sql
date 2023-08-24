Building Blocks Code

--this si the main select statement from all the tables. 
--every table has reference_code, which is the state, chamber designation, and district number. 
drop table if exists jdickinson1.building_blocks_master;
create table jdickinson1.building_blocks_master as
	(
	select
pe.reference_code
,pe.state_code
,pe.chamber
,pe.seat
--,ca.democratic_candidate
--,ca.republican_candidate
--,pe.target_indicator
,pe.c2020_vote_share
,pe.c2018_vote_share
,pe.biden_vote_share
,pe.clinton_vote_share
,pe.c2022_dpi
--,p.population
,pe.registered_voters
--,cv.civis_forecast_latest as latest_civis_forecast
--,cv.civis_projected_dem_votes
--,cv.civis_projected_turnout_percentage
--,cv.civis_projected_turnout_votes
--,d.deck_projected_dem_percentage
--,d.deck_projected_dem_votes
--,d.deck_projected_turnout_percentage
--,d.deck_projected_turnout_votes
--,cv.date_civis_forecast
--,cv.date_civis_forecast
from
 jdickinson1.bb_past_elections pe
 --left join jdickinson1.BB_population p on pe.reference_code = p.reference_code
 --left join civis_forecasts.most_recent_forecast cv on pe.reference_code = p.reference_code
 group by 1,2,3,4,5,6,7,8,9,10
 order by 1
 )

	
select 
bb.*
from jdickinson1.building_blocks_master bb
where pe.state_code= 'NM' 
 and pe.chamber= 'state_house'


--this code turns the existing candidate naes table from a table with one row per candidate to one row per district
-- it needs to be per candidate for the research team, and per district for connecting to building blocks.
 select 
 ci.reference_code
 ,ci.state as state_code
 ,ci.chamber
 ,ci.district
 ,case when ci.stage='General' 
 				and ci.race_type='Regular'
 				and ci.Party_affiliation="Republican Party"
 				then ci.name
 				end 
 				as Republican_candidate
 ,case when ci.stage='General' 
 				and ci.race_type='Regular'
 				and ci.Party_affiliation="Republican Party"
 				then ci.Incumbent_indicator
 				end 
 				as Rep_incumbent_indicator
 ,case when ci.stage='General' 
 				and ci.race_type='Regular'
 				and ci.Party_affiliation="Democratic Party"
 				then ci.name
 				end 
 				as Democrat_candidate
 ,case when ci.stage='General' 
 				and ci.race_type='Regular'
 				and ci.Party_affiliation="Republican Party"
 				then ci.Incumbent_indicator
 				end 
 				as Dem_incumbent_indicator

 from jdickinson1.candidate_import_04292020		









--here's further itrations of the master code.
	
 drop table if exists jdickinson1.building_blocks_master;
create table jdickinson1.building_blocks_master as
	(select
pe.state_code
,pe.chamber
,pe.seat as district
,ca.democrat_candidate
,ca.dem_incumbent_indicator
,ca.republican_candidate
,ca.rep_incumbent_indicator
,ta.target_indicator
,ta.district_ranking
,pe.dem_vote_share_2020
,pe.dem_vote_share_2018
,pe.biden_vote_share
,pe.gov_latest
,pe.us_sen_latest
,pe.clinton_vote_share
,pe.population
,pe.registered_voters
,cv.civis_forecast_may*100 as civis_forecast_may
,dsc.dnc_proj*100 as dnc_projection_may
,pe.dpi_2022
,pe.race_type as dpi_race_type	
,pe.reference_code
from
 jdickinson1.bb_past_elections pe
left join jdickinson1.bb_2022_targets ta on pe.reference_code = ta.reference_code
 left join jdickinson1.bb_candidate_names ca on pe.reference_code = ca.bb_reference_code
 LEFT JOIN jdickinson1.bb_dnc_scores_test dsc on dsc.building_blocks_code=pe.reference_code
 left join jdickinson1.bb_civis_scores cv on cv.reference_code=bb.reference_code
 group by 1,2,3,4,5,6,7,8,9,10,11,12,13,14,15,16,17,18,19,20,21,22
 order by 1
     )


	
--this is the export statement for Alaska, which has a different candidate setup, so can't just export from the master table with a where statement		
select
bb.state_code
,bb.chamber
,bb.district
,ak.candidate_1
,ak.candidate_2
,ak.candidate_3
,ak.candidate_4
,bb.target_indicator
,bb.district_ranking
,bb.dem_vote_share_2020
,bb.dem_vote_share_2018
,bb.biden_vote_share
,bb.gov_latest
,bb.us_sen_latest
,bb.clinton_vote_share
,bb.population
,bb.registered_voters
--,bb.civis_forecast_may
,bb.dnc_projection_may
,bb.dpi_2022
,bb.dpi_race_type	
,bb.reference_code
from
 jdickinson1.building_blocks_master bb
left join jdickinson1.ak_candidate_import ak 
on ak.reference_code=bb.reference_code
where bb.state_code='AK'
 and bb.chamber='state_house'
 group by 1,2,3,4,5,6,7,8,9,10,11,12,13,14,15,16,17,18,19,20,21
 order by 21







