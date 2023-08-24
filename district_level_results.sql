district_level_results

--here's the final code for adding everythin



select
v.state
,case when v.chamber='Y' then 'lower' else 'upper' end as chamber
,v.district
,ds.district_id
,v.total_votes
,d.dem_votes
,case 
	when v.total_votes=0 and d.non_contested_dem_winner= 'X' then 1
	when v.total_votes=0 and d.non_contested_dem_winner is null then 0
	when v.total_votes>0 and d.dem_votes=0 then 0 
	when v.total_votes>0 and d.dem_votes is null then 0 
	else d.dem_votes::float/v.total_votes::float
	end as dem_vote_share
from 
--this table sums up votecounts per district
(select
ap.state
,ap.chamber
,ap.district
,ap.raceid
,sum(ap.votecount) as total_votes
from jdickinson1.ap_2022_results ap 
where state in ('AK','AZ','CO','GA','KS','ME','MI','MN','NC','NH','NM','NV','PA','WI')
group by 1,2,3,4) v
left join
--this table tells us dem votes and marks winners if the votecount is 0
(select 
ap.state
,ap.chamber
,ap.district
,sum(ap.votecount) as dem_votes
,case when ap.votecount=0 then ap.winner else null end as non_contested_dem_winner
from jdickinson1.ap_2022_results ap
where ap.party='Dem'
group by 1,2,3,ap.votecount,ap.winner) d
on d.state||d.chamber||d.district=v.state||v.chamber||v.district
left join dlcc_data.seat ds 
on ds.ap_race_id=v.raceid