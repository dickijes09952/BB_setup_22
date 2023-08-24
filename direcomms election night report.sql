direcomms election night report

--This should create a table with 1 row for every race
select
	distinct dc.race_id
	,ap.office_name
	,apf.state_code
	,apf.chamber
	,apf.district 
	,max(apf.Democrat_candidate) as Democrat_Candidate
	,max(apf.Democrat_votes) as Democrat_Votes
	,max(apf.Democrat_Won) as Democrat_Win

	,max(apf.Republican_candidate) as Republican_Candidate
	,max(apf.Republican_votes) as Republican_Votes
	,max(apf.Republican_Won) as Republican_Win
	--this is all of the columns for each category they are tracking. 
	--we will have to double check this code once it is finalized, as of 10/18 they are adding more
	,max(dc.worst_of_worst)
	,max(dc.social_approved)
	,max(dc.notable_first)
	,max(dc.notable_first_details)
	,max(dc.spotlight)
	,max(dc.insurrection)
	,max(dc.threats_list)
	,max(dc.taking_on_extremism_gop_candidates)
	,max(dc.BIPOC)
	,max(dc.impact)
	,max(dc.gun_saftey)
	,max(dc.repro_rights)
	,max(dc.taking_on_extremism)
	,max(dc.teachers)
	,max(dc.social_recs)
	,max(dc.WOW_recs)

	
	from(
           select 
           ap.race_id
           ,ap.state as state_code
           ,case when ap.district='Y' then 'State House' else 'State Senate'end as Chamber
           ,ap.district
           ,ap.precinctsreporting
           ,ap.totalprecincts
           ,case when  ap.Party='Dem' then ap.cand1 end as Democrat_candidate
           ,case when ap.Party='Dem' then ap.votecount end as Democrat_votes
           ,case when ap.Party='Dem' then ap.winner end as Democrat_won

           ,case when  ap.Party='GOP' then ap.cand1 end as Republican_candidate
           ,case when ap.Party='GOP' then ap.votecount end as Republican votes
           ,case when ap.Party='GOP' then ap.winner end as Republican_won

          --double check the date in your from table
           from jdickinson1.ap_2022_results ap
           group by 1,2,3,4,5,6,7,8,9,10,1,12,13
           order by 1
           )apf
join jdickinson1.direcomms_requests dc
on dc.race_id=apf.race_id
where apf.democrat_won="X" or apf.republican_won="X"


--this will create a table with 1 row for every candidate
select
dc.race_id
,ap.state
,ap.chamber
,ap.district
,ap.party
,ap.precincts_reporting
,ap.total_precincts
,ap.cand1
,ap.candid
,ap.winner
,ap.race_id
--this is all of the columns for each category they are tracking. 
	--we will have to double check this code once it is finalized, as of 10/18 they are adding more
	,dc.worst_of_worst
	,dc.social_approved
	,dc.notable_first
	,dc.notable_first_details
	,dc.spotlight
	,dc.insurrection
	,dc.threats_list
	,dc.taking_on_extremism_gop_candidates
	,dc.BIPOC
	,dc.impact
	,dc.gun_saftey
	,dc.repro_rights
	,dc.taking_on_extremism
	,dc.teachers
	,dc.social_recs
	,dc.WOW_recs

	from jdickinson1.direcomms_requests dc
	left join jdickinson1.ap_2022_results ap
	on ap.race_id=dc.raceid
	--we could join the crosswalk table, but i think two joins will slow things down
	--i would rather do an index match in the direcomms google sheet so we can see if we're missing any matches