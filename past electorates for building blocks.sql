past electorates for building blocks

okay, lets drive in
select
	'2015' as year
	,ap.state_code
	,'state_house' as chamber
	,ad.state_house_district as district
	,sum(case when pv.g_2015 IS not Null then 1 else 0 end) as people_voted
	,sum(case when ap.ethnicity_combined='B' then 1 else 0 end) as black_voters
	,sum(case when ap.ethnicity_combined='N' then 1 else 0 end) as native_voters
	,sum(case when ap.ethnicity_combined='W' then 1 else 0 end) as white_voters
	,sum(case when ap.ethnicity_combined='H' then 1 else 0 end) as latino_voters
	,sum(case when ap.ethnicity_combined='A' then 1 else 0 end) as aapi_voters
	,sum(case when  ap.ethnicity_combined!='W' then 1 else 0 end) as non_white_voters
	, SUM(CASE WHEN ap.age_combined BETWEEN 23 AND 30 THEN 1 ELSE 0 END) AS age_18_to_24_voted
	, SUM(CASE WHEN ap.age_combined BETWEEN 31 AND 40 THEN 1 ELSE 0 END) AS age_25_to_34_voted
	, SUM(CASE WHEN ap.age_combined BETWEEN 41 AND 55 THEN 1 ELSE 0 END) AS age_35_to_49_voted
	, SUM(CASE WHEN ap.age_combined BETWEEN 55 AND 70 THEN 1 ELSE 0 END) AS age_50_to_64_voted
	, SUM(CASE WHEN ap.age_combined >= 71 THEN 1 ELSE 0 END) AS age_65_plus_voted
	,avg(b.clarity_2014_college_grad_v2)as average_graduate_score
	,avg(b.clarity_2014_guncontrol_score)as average_guncontrol_score
	,avg(b.clarity_2014_choice_score)as average_choice_score
	,avg(b.clarity_2014_turnout_v2) as average_turnout_score
	,avg(b.clarity_2014_party_score_v3) as average_support_score
from demcrats.analytics_archive.person_2015_backfill ap
join democrats.analytics.person_election_voted pv on ap.person_id = pv.person_id
join democrats.scores.all_scores_2014 b on ap.person_id= b.person_id
left join democrats.voterfile.address ad on ap.voting_address_id=ad.address_id
where pv.g_2015 IS not Null 
group by ap.state_code


select
	'2015' as year
	,ap.state_code
	,'state_senate' as chamber
	,ad.state_senate_district as district
	,sum(case when pv.g_2015 IS not Null then 1 else 0 end) as people_voted
	,sum(case when ap.ethnicity_combined='B' then 1 else 0 end) as black_voters
	,sum(case when ap.ethnicity_combined='N' then 1 else 0 end) as native_voters
	,sum(case when ap.ethnicity_combined='W' then 1 else 0 end) as white_voters
	,sum(case when ap.ethnicity_combined='H' then 1 else 0 end) as latino_voters
	,sum(case when ap.ethnicity_combined='A' then 1 else 0 end) as aapi_voters
	,sum(case when  ap.ethnicity_combined!='W' then 1 else 0 end) as non_white_voters
	, SUM(CASE WHEN ap.age_combined BETWEEN 23 AND 30 THEN 1 ELSE 0 END) AS age_18_to_24_voted
	, SUM(CASE WHEN ap.age_combined BETWEEN 31 AND 40 THEN 1 ELSE 0 END) AS age_25_to_34_voted
	, SUM(CASE WHEN ap.age_combined BETWEEN 41 AND 55 THEN 1 ELSE 0 END) AS age_35_to_49_voted
	, SUM(CASE WHEN ap.age_combined BETWEEN 55 AND 70 THEN 1 ELSE 0 END) AS age_50_to_64_voted
	, SUM(CASE WHEN ap.age_combined >= 71 THEN 1 ELSE 0 END) AS age_65_plus_voted
	,avg(b.clarity_2014_college_grad_v2)as average_graduate_score
	,avg(b.clarity_2014_guncontrol_score)as average_guncontrol_score
	,avg(b.clarity_2014_choice_score)as average_choice_score
	,avg(b.clarity_2014_turnout_v2) as average_turnout_score
	,avg(b.clarity_2014_party_score_v3) as average_support_score
from democrats.analytics_archive.person_2015_backfill ap
join democrats.analytics.person_election_voted pv on ap.person_id = pv.person_id
join democrats.scores.all_scores_2014 b on ap.person_id= b.person_id
left join democrats.voterfile.address ad on ap.voting_address_id=ad.address_id
where pv.g_2015 IS not Null 
group by ap.state_code


select
	'2016' as year
	,ap.state_code
	,'state_house' as chamber
	,ad.state_house_district as district
	,sum(case when pv.g_2016 IS not Null then 1 else 0 end) as people_voted
	,sum(case when ap.ethnicity_combined='B' then 1 else 0 end) as black_voters
	,sum(case when ap.ethnicity_combined='N' then 1 else 0 end) as native_voters
	,sum(case when ap.ethnicity_combined='W' then 1 else 0 end) as white_voters
	,sum(case when ap.ethnicity_combined='H' then 1 else 0 end) as latino_voters
	,sum(case when ap.ethnicity_combined='A' then 1 else 0 end) as aapi_voters
	,sum(case when  ap.ethnicity_combined!='W' then 1 else 0 end) as non_white_voters
	, SUM(CASE WHEN ap.age_combined BETWEEN 23 AND 30 THEN 1 ELSE 0 END) AS age_18_to_24_voted
	, SUM(CASE WHEN ap.age_combined BETWEEN 31 AND 40 THEN 1 ELSE 0 END) AS age_25_to_34_voted
	, SUM(CASE WHEN ap.age_combined BETWEEN 41 AND 55 THEN 1 ELSE 0 END) AS age_35_to_49_voted
	, SUM(CASE WHEN ap.age_combined BETWEEN 55 AND 70 THEN 1 ELSE 0 END) AS age_50_to_64_voted
	, SUM(CASE WHEN ap.age_combined >= 71 THEN 1 ELSE 0 END) AS age_65_plus_voted
	,avg(b.dnc_2016_college_graduate)as average_graduate_score
	,avg(b.dnc_2016_gun_control)as average_guncontrol_score
	,avg(b.dnc_2016_prochoice)as average_choice_score
	,avg(b.dnc_2016_turnout_v2) as average_turnout_score
	,avg(b.dnc_2016_party_support_score_v2) as average_support_score
from democrats.analytics_archive.person_2016_backfill ap
join democrats.analytics.person_election_voted pv on ap.person_id = pv.person_id
join democrats.scores.all_scores_2016 b on ap.person_id= b.person_id
left join democrats.voterfile.address ad on ap.voting_address_id=ad.address_id
where pv.g_2016 IS not Null 
group by ap.state_code


select
	'2016' as year
	,ap.state_code
	,'state_senate' as chamber
	,ad.state_senate_district as district
	,sum(case when pv.g_2016 IS not Null then 1 else 0 end) as people_voted
	,sum(case when ap.ethnicity_combined='B' then 1 else 0 end) as black_voters
	,sum(case when ap.ethnicity_combined='N' then 1 else 0 end) as native_voters
	,sum(case when ap.ethnicity_combined='W' then 1 else 0 end) as white_voters
	,sum(case when ap.ethnicity_combined='H' then 1 else 0 end) as latino_voters
	,sum(case when ap.ethnicity_combined='A' then 1 else 0 end) as aapi_voters
	,sum(case when  ap.ethnicity_combined!='W' then 1 else 0 end) as non_white_voters
	, SUM(CASE WHEN ap.age_combined BETWEEN 23 AND 30 THEN 1 ELSE 0 END) AS age_18_to_24_voted
	, SUM(CASE WHEN ap.age_combined BETWEEN 31 AND 40 THEN 1 ELSE 0 END) AS age_25_to_34_voted
	, SUM(CASE WHEN ap.age_combined BETWEEN 41 AND 55 THEN 1 ELSE 0 END) AS age_35_to_49_voted
	, SUM(CASE WHEN ap.age_combined BETWEEN 55 AND 70 THEN 1 ELSE 0 END) AS age_50_to_64_voted
	, SUM(CASE WHEN ap.age_combined >= 71 THEN 1 ELSE 0 END) AS age_65_plus_voted
	,avg(b.dnc_2016_college_graduate)as average_graduate_score
	,avg(b.dnc_2016_gun_control)as average_guncontrol_score
	,avg(b.dnc_2016_prochoice)as average_choice_score
	,avg(b.dnc_2016_turnout_v2) as average_turnout_score
	,avg(b.dnc_2016_party_support_score_v2) as average_support_score
from democrats.analytics_archive.person_2016_backfill ap
join democrats.analytics.person_election_voted pv on ap.person_id = pv.person_id
join democrats.scores.all_scores_2016 b on ap.person_id= b.person_id
left join democrats.voterfile.address ad on ap.voting_address_id=ad.address_id
where pv.g_2016 IS not Null 
group by ap.state_code



select
	'2017' as year
	,ap.state_code
	,'state_house' as chamber
	,ad.state_house_district as district
	,sum(case when pv.g_2017 IS not Null then 1 else 0 end) as people_voted
	,sum(case when ap.ethnicity_combined='B' then 1 else 0 end) as black_voters
	,sum(case when ap.ethnicity_combined='N' then 1 else 0 end) as native_voters
	,sum(case when ap.ethnicity_combined='W' then 1 else 0 end) as white_voters
	,sum(case when ap.ethnicity_combined='H' then 1 else 0 end) as latino_voters
	,sum(case when ap.ethnicity_combined='A' then 1 else 0 end) as aapi_voters
	,sum(case when  ap.ethnicity_combined!='W' then 1 else 0 end) as non_white_voters
	, SUM(CASE WHEN ap.age_combined BETWEEN 23 AND 30 THEN 1 ELSE 0 END) AS age_18_to_24_voted
	, SUM(CASE WHEN ap.age_combined BETWEEN 31 AND 40 THEN 1 ELSE 0 END) AS age_25_to_34_voted
	, SUM(CASE WHEN ap.age_combined BETWEEN 41 AND 55 THEN 1 ELSE 0 END) AS age_35_to_49_voted
	, SUM(CASE WHEN ap.age_combined BETWEEN 55 AND 70 THEN 1 ELSE 0 END) AS age_50_to_64_voted
	, SUM(CASE WHEN ap.age_combined >= 71 THEN 1 ELSE 0 END) AS age_65_plus_voted
	,avg(b.dnc_2016_college_graduate)as average_graduate_score
	,avg(b.dnc_2016_gun_control)as average_guncontrol_score
	,avg(b.dnc_2016_prochoice)as average_choice_score
	,avg(b.dnc_2016_turnout_v2) as average_turnout_score
	,avg(b.dnc_2016_party_support_score_v2) as average_support_score
from democrats.analytics_archive.person_2017_backfill ap
join democrats.analytics.person_election_voted pv on ap.person_id = pv.person_id
join democrats.scores.all_scores_2016 b on ap.person_id= b.person_id
left join democrats.voterfile.address ad on ap.voting_address_id=ad.address_id
where pv.g_2017 IS not Null 
group by ap.state_code


select
	'2017' as year
	,ap.state_code
	,'state_senate' as chamber
	,ad.state_senate_district as district
	,sum(case when pv.g_2017 IS not Null then 1 else 0 end) as people_voted
	,sum(case when ap.ethnicity_combined='B' then 1 else 0 end) as black_voters
	,sum(case when ap.ethnicity_combined='N' then 1 else 0 end) as native_voters
	,sum(case when ap.ethnicity_combined='W' then 1 else 0 end) as white_voters
	,sum(case when ap.ethnicity_combined='H' then 1 else 0 end) as latino_voters
	,sum(case when ap.ethnicity_combined='A' then 1 else 0 end) as aapi_voters
	,sum(case when  ap.ethnicity_combined!='W' then 1 else 0 end) as non_white_voters
	, SUM(CASE WHEN ap.age_combined BETWEEN 23 AND 30 THEN 1 ELSE 0 END) AS age_18_to_24_voted
	, SUM(CASE WHEN ap.age_combined BETWEEN 31 AND 40 THEN 1 ELSE 0 END) AS age_25_to_34_voted
	, SUM(CASE WHEN ap.age_combined BETWEEN 41 AND 55 THEN 1 ELSE 0 END) AS age_35_to_49_voted
	, SUM(CASE WHEN ap.age_combined BETWEEN 55 AND 70 THEN 1 ELSE 0 END) AS age_50_to_64_voted
	, SUM(CASE WHEN ap.age_combined >= 71 THEN 1 ELSE 0 END) AS age_65_plus_voted
	,avg(b.dnc_2016_college_graduate)as average_graduate_score
	,avg(b.dnc_2016_gun_control)as average_guncontrol_score
	,avg(b.dnc_2016_prochoice)as average_choice_score
	,avg(b.dnc_2016_turnout_v2) as average_turnout_score
	,avg(b.dnc_2016_party_support_score_v2) as average_support_score
from democrats.analytics_archive.person_2017_backfill ap
join democrats.analytics.person_election_voted pv on ap.person_id = pv.person_id
join democrats.scores.all_scores_2016 b on ap.person_id= b.person_id
left join democrats.voterfile.address ad on ap.voting_address_id=ad.address_id
where pv.g_2017 IS not Null 
group by ap.state_code




select
	'2018' as year
	,ap.state_code
	,'state_house' as chamber
	,ad.state_house_district as district
	,sum(case when pv.g_2018 IS not Null then 1 else 0 end) as people_voted
	,sum(case when ap.ethnicity_combined='B' then 1 else 0 end) as black_voters
	,sum(case when ap.ethnicity_combined='N' then 1 else 0 end) as native_voters
	,sum(case when ap.ethnicity_combined='W' then 1 else 0 end) as white_voters
	,sum(case when ap.ethnicity_combined='H' then 1 else 0 end) as latino_voters
	,sum(case when ap.ethnicity_combined='A' then 1 else 0 end) as aapi_voters
	,sum(case when  ap.ethnicity_combined!='W' then 1 else 0 end) as non_white_voters
	, SUM(CASE WHEN ap.age_combined BETWEEN 23 AND 30 THEN 1 ELSE 0 END) AS age_18_to_24_voted
	, SUM(CASE WHEN ap.age_combined BETWEEN 31 AND 40 THEN 1 ELSE 0 END) AS age_25_to_34_voted
	, SUM(CASE WHEN ap.age_combined BETWEEN 41 AND 55 THEN 1 ELSE 0 END) AS age_35_to_49_voted
	, SUM(CASE WHEN ap.age_combined BETWEEN 55 AND 70 THEN 1 ELSE 0 END) AS age_50_to_64_voted
	, SUM(CASE WHEN ap.age_combined >= 71 THEN 1 ELSE 0 END) AS age_65_plus_voted
	,avg(b.dnc_2018_college_graduate)as average_graduate_score
	,avg(b.dnc_2018_gun_control)as average_guncontrol_score
	,avg(b.dnc_2018_pro_choice)as average_choice_score
	,avg(b.civis_2018_turnout) as average_turnout_score
	,avg(b.civis_2018_partisanship) as average_support_score
from democrats.analytics_archive.person_2018_backfill ap
join democrats.analytics.person_election_voted pv on ap.person_id = pv.person_id
join democrats.scores.all_scores_2018 b on ap.person_id= b.person_id
left join democrats.voterfile.address ad on ap.voting_address_id=ad.address_id
where pv.g_2018 IS not Null 
group by ap.state_code

select
	'2018' as year
	,ap.state_code
	,'state_senate' as chamber
	,ad.state_senate_district as district
	,sum(case when pv.g_2018 IS not Null then 1 else 0 end) as people_voted
	,sum(case when ap.ethnicity_combined='B' then 1 else 0 end) as black_voters
	,sum(case when ap.ethnicity_combined='N' then 1 else 0 end) as native_voters
	,sum(case when ap.ethnicity_combined='W' then 1 else 0 end) as white_voters
	,sum(case when ap.ethnicity_combined='H' then 1 else 0 end) as latino_voters
	,sum(case when ap.ethnicity_combined='A' then 1 else 0 end) as aapi_voters
	,sum(case when  ap.ethnicity_combined!='W' then 1 else 0 end) as non_white_voters
	, SUM(CASE WHEN ap.age_combined BETWEEN 23 AND 30 THEN 1 ELSE 0 END) AS age_18_to_24_voted
	, SUM(CASE WHEN ap.age_combined BETWEEN 31 AND 40 THEN 1 ELSE 0 END) AS age_25_to_34_voted
	, SUM(CASE WHEN ap.age_combined BETWEEN 41 AND 55 THEN 1 ELSE 0 END) AS age_35_to_49_voted
	, SUM(CASE WHEN ap.age_combined BETWEEN 55 AND 70 THEN 1 ELSE 0 END) AS age_50_to_64_voted
	, SUM(CASE WHEN ap.age_combined >= 71 THEN 1 ELSE 0 END) AS age_65_plus_voted
	,avg(b.dnc_2018_college_graduate)as average_graduate_score
	,avg(b.dnc_2018_gun_control)as average_guncontrol_score
	,avg(b.dnc_2018_pro_choice)as average_choice_score
	,avg(b.civis_2018_turnout) as average_turnout_score
	,avg(b.civis_2018_partisanship) as average_support_score
from democrats.analytics_archive.person_2018_backfill ap
join democrats.analytics.person_election_voted pv on ap.person_id = pv.person_id
join democrats.scores.all_scores_2018 b on ap.person_id= b.person_id
left join democrats.voterfile.address ad on ap.voting_address_id=ad.address_id
where pv.g_2018 IS not Null 
group by ap.state_code


select
	'2019' as year
	,ap.state_code
	,'state_house' as chamber
	,ad.state_house_district as district
	,sum(case when pv.g_2019 IS not Null then 1 else 0 end) as people_voted
	,sum(case when ap.ethnicity_combined='B' then 1 else 0 end) as black_voters
	,sum(case when ap.ethnicity_combined='N' then 1 else 0 end) as native_voters
	,sum(case when ap.ethnicity_combined='W' then 1 else 0 end) as white_voters
	,sum(case when ap.ethnicity_combined='H' then 1 else 0 end) as latino_voters
	,sum(case when ap.ethnicity_combined='A' then 1 else 0 end) as aapi_voters
	,sum(case when  ap.ethnicity_combined!='W' then 1 else 0 end) as non_white_voters
	, SUM(CASE WHEN ap.age_combined BETWEEN 23 AND 30 THEN 1 ELSE 0 END) AS age_18_to_24_voted
	, SUM(CASE WHEN ap.age_combined BETWEEN 31 AND 40 THEN 1 ELSE 0 END) AS age_25_to_34_voted
	, SUM(CASE WHEN ap.age_combined BETWEEN 41 AND 55 THEN 1 ELSE 0 END) AS age_35_to_49_voted
	, SUM(CASE WHEN ap.age_combined BETWEEN 55 AND 70 THEN 1 ELSE 0 END) AS age_50_to_64_voted
	, SUM(CASE WHEN ap.age_combined >= 71 THEN 1 ELSE 0 END) AS age_65_plus_voted
	,avg(b.dnc_2018_college_graduate)as average_graduate_score
	,avg(b.dnc_2018_gun_control)as average_guncontrol_score
	,avg(b.dnc_2018_pro_choice)as average_choice_score
	,avg(b.civis_2018_turnout) as average_turnout_score
	,avg(b.civis_2018_partisanship) as average_support_score
from democrats.analytics_archive.person_2019_backfill ap
join democrats.analytics.person_election_voted pv on ap.person_id = pv.person_id
join democrats.scores.all_scores_2018 b on ap.person_id= b.person_id
left join democrats.voterfile.address ad on ap.voting_address_id=ad.address_id
where pv.g_2019 IS not Null 
group by ap.state_code

select
	'2019' as year
	,ap.state_code
	,'state_senate' as chamber
	,ad.state_senate_district as district
	,sum(case when pv.g_2019 IS not Null then 1 else 0 end) as people_voted
	,sum(case when ap.ethnicity_combined='B' then 1 else 0 end) as black_voters
	,sum(case when ap.ethnicity_combined='N' then 1 else 0 end) as native_voters
	,sum(case when ap.ethnicity_combined='W' then 1 else 0 end) as white_voters
	,sum(case when ap.ethnicity_combined='H' then 1 else 0 end) as latino_voters
	,sum(case when ap.ethnicity_combined='A' then 1 else 0 end) as aapi_voters
	,sum(case when  ap.ethnicity_combined!='W' then 1 else 0 end) as non_white_voters
	, SUM(CASE WHEN ap.age_combined BETWEEN 23 AND 30 THEN 1 ELSE 0 END) AS age_18_to_24_voted
	, SUM(CASE WHEN ap.age_combined BETWEEN 31 AND 40 THEN 1 ELSE 0 END) AS age_25_to_34_voted
	, SUM(CASE WHEN ap.age_combined BETWEEN 41 AND 55 THEN 1 ELSE 0 END) AS age_35_to_49_voted
	, SUM(CASE WHEN ap.age_combined BETWEEN 55 AND 70 THEN 1 ELSE 0 END) AS age_50_to_64_voted
	, SUM(CASE WHEN ap.age_combined >= 71 THEN 1 ELSE 0 END) AS age_65_plus_voted
	,avg(b.dnc_2018_college_graduate)as average_graduate_score
	,avg(b.dnc_2018_gun_control)as average_guncontrol_score
	,avg(b.dnc_2018_pro_choice)as average_choice_score
	,avg(b.civis_2018_turnout) as average_turnout_score
	,avg(b.civis_2018_partisanship) as average_support_score
from democrats.analytics_archive.person_2019_backfill ap
join democrats.analytics.person_election_voted pv on ap.person_id = pv.person_id
join democrats.scores.all_scores_2018 b on ap.person_id= b.person_id
left join democrats.voterfile.address ad on ap.voting_address_id=ad.address_id
where pv.g_2019 IS not Null 
group by ap.state_code




select
	'2020' as year
	,ap.state_code
	,'state_house' as chamber
	,ad.state_house_district as district
	,sum(case when pv.g_2019 IS not Null then 1 else 0 end) as people_voted
	,sum(case when ap.ethnicity_combined='B' then 1 else 0 end) as black_voters
	,sum(case when ap.ethnicity_combined='N' then 1 else 0 end) as native_voters
	,sum(case when ap.ethnicity_combined='W' then 1 else 0 end) as white_voters
	,sum(case when ap.ethnicity_combined='H' then 1 else 0 end) as latino_voters
	,sum(case when ap.ethnicity_combined='A' then 1 else 0 end) as aapi_voters
	,sum(case when  ap.ethnicity_combined!='W' then 1 else 0 end) as non_white_voters
	, SUM(CASE WHEN ap.age_combined BETWEEN 23 AND 30 THEN 1 ELSE 0 END) AS age_18_to_24_voted
	, SUM(CASE WHEN ap.age_combined BETWEEN 31 AND 40 THEN 1 ELSE 0 END) AS age_25_to_34_voted
	, SUM(CASE WHEN ap.age_combined BETWEEN 41 AND 55 THEN 1 ELSE 0 END) AS age_35_to_49_voted
	, SUM(CASE WHEN ap.age_combined BETWEEN 55 AND 70 THEN 1 ELSE 0 END) AS age_50_to_64_voted
	, SUM(CASE WHEN ap.age_combined >= 71 THEN 1 ELSE 0 END) AS age_65_plus_voted
	,avg(b.dnc_2020_college_graduate)as average_graduate_score
	,avg(b.civis_2020_gun_violence_prevention_persuasion)as average_guncontrol_score
	,avg(b.clarity_2020_pro_choice)as average_choice_score
	,avg(b.clarity_2020_turnout) as average_turnout_score
	,avg(b.dnc_2020_dem_party_support) as average_support_score
from democrats.analytics_archive.person_2020_backfill ap
join democrats.analytics.person_election_voted pv on ap.person_id = pv.person_id
join democrats.scores.all_scores_2020 b on ap.person_id= b.person_id
left join democrats.voterfile.address ad on ap.voting_address_id=ad.address_id
where pv.g_2020 IS not Null 
group by ap.state_code


select
	'2020' as year
	,ap.state_code
	,'state_senate' as chamber
	,ad.state_senate_district as district
	,sum(case when pv.g_2019 IS not Null then 1 else 0 end) as people_voted
	,sum(case when ap.ethnicity_combined='B' then 1 else 0 end) as black_voters
	,sum(case when ap.ethnicity_combined='N' then 1 else 0 end) as native_voters
	,sum(case when ap.ethnicity_combined='W' then 1 else 0 end) as white_voters
	,sum(case when ap.ethnicity_combined='H' then 1 else 0 end) as latino_voters
	,sum(case when ap.ethnicity_combined='A' then 1 else 0 end) as aapi_voters
	,sum(case when  ap.ethnicity_combined!='W' then 1 else 0 end) as non_white_voters
	, SUM(CASE WHEN ap.age_combined BETWEEN 23 AND 30 THEN 1 ELSE 0 END) AS age_18_to_24_voted
	, SUM(CASE WHEN ap.age_combined BETWEEN 31 AND 40 THEN 1 ELSE 0 END) AS age_25_to_34_voted
	, SUM(CASE WHEN ap.age_combined BETWEEN 41 AND 55 THEN 1 ELSE 0 END) AS age_35_to_49_voted
	, SUM(CASE WHEN ap.age_combined BETWEEN 55 AND 70 THEN 1 ELSE 0 END) AS age_50_to_64_voted
	, SUM(CASE WHEN ap.age_combined >= 71 THEN 1 ELSE 0 END) AS age_65_plus_voted
	,avg(b.dnc_2020_college_graduate)as average_graduate_score
	,avg(b.civis_2020_gun_violence_prevention_persuasion)as average_guncontrol_score
	,avg(b.clarity_2020_pro_choice)as average_choice_score
	,avg(b.clarity_2020_turnout) as average_turnout_score
	,avg(b.dnc_2020_dem_party_support) as average_support_score
from democrats.analytics_archive.person_2020_backfill ap
join democrats.analytics.person_election_voted pv on ap.person_id = pv.person_id
join democrats.scores.all_scores_2020 b on ap.person_id= b.person_id
left join democrats.voterfile.address ad on ap.voting_address_id=ad.address_id
where pv.g_2020 IS not Null 
group by ap.state_code