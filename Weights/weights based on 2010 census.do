** Program name:  weights
** 429/Client Survey 2015
** Program task:  Calculate multiplier for the weights and set survey settings
** Date created:  12/13/2016 
** Written by:    MZ and LBF



****************************************
*  Calculate multiplier for the weights.  
****************************************

* See notes about how to create weights: K:\Projects\429 OPA-ACA\Component 3 - Client survey\Analysis\Weights\Weights notes.doc

* We want to identify women served in strata from the 2010 clinic census.
* Calculations are currently based on 2010 census data -- we will update weights with 2015 when they become avialable.

* Get final 2010 clinic census data. 
use "K:\Projects\321 Meeting FP Challenges (OPA)\340 Clinic Census\Tables\Clinic Census 2010 recodes FN-active only.dta", clear
*ClinID10
*NewTot10

gen NewTot10TX = NewTot10 if txclnc10 == 1


* Check to see that the sum of the clients equals the 4,724,250 Title X clients served from published report (6,706,280 is all women served).
sum txpat10
di r(N) * r(mean)


*Identify states in 2010 with any kind of Medicaid in 2015.
gen anymedicaid=0
foreach mystate in AL AR AZ CA CT CO DE DC GA IA HI IL IN LA KY MD MA MI MN MS MO MT NV NH NJ NM NY NC ND OH OK OR PA RI SC VA VT WA WV WI {
	replace anymedicaid=1 if state=="`mystate'"
}
label var anymedicaid "Clinic located in states with any Medicaid (income-based or FP-specific) in 2015"
label define anymedicaid 1 "Any Medicaid (income-based or FP-specific) in 2015' 0 'NO Medicaid"
label values anymedicaid anymedicaid
tab anymedicaid state

* Combine hospitals into other.
recode factype 1=5

gen stratum = factype * 10 + anymedicaid

label var stratum "Stratum (facility type and state Medicaid expansion status) of facility where client was served"
label define stratum 	21 	"HD Medexp" 	20 	"HD NoMedexp"
label define stratum 	31   "PP Medexp " 	30	"PP NoMedexp ", add
label define stratum 	41	"FQHC Medexp "  40	"FQHC NoMedexp " , add
label define stratum 	51	"Other Medexp " 50	"Other NoMedexp "	, add
label values stratum stratum
tab stratum

table stratum, contents(sum NewTot10TX) row

table stratum if stratum ~= 40, contents(sum NewTot10TX) row




*Create variable that is the sum of women served per stratum (2010 census data)
* bysort stratum: egen clientsserved2010stratum = sum(NewTot10TX)


*Create variable that is the sum of women served at FQHCs (2010 census data)
bysort factype: egen clientsserved2010fqhc = sum(NewTot10TX) if factype==4

*Create variable that is the sum of women served at FQHCs in Medicaid states (2010 census data)
bysort factype: egen clientsserved2010fqhcmedicaid = sum(NewTot10TX) if (factype==4 & anymedicaid == 1)

*** Clinic 5140 changed from other in 2010 to fqhc in 2015.
* Therefore, it is not getting the above two variables, but it will need them 
*    in 2015 so its weight can be weighted up in stage 3.
* So we are manually assigning them to clinic 5140.

sum clientsserved2010fqhc
replace clientsserved2010fqhc = r(mean) if ClinID10 == 5140

sum clientsserved2010fqhcmedicaid
replace clientsserved2010fqhcmedicaid = r(mean) if ClinID10 == 5140



* Rename clinic id variable to match other file.
rename ClinID10 clinicid

sum clientsserved2010* if clinicid == 5140




*******************************************
* Save and label 2010 dataset for weights.
*******************************************
sort clinicid
compress
note: Last saved $S_DATE at $S_TIME.
label data "429 for weights for client survey"
save "K:\Projects\429 OPA-ACA\Component 3 - Client survey\Data\429--2010 clinic census for project 429 weights.dta", replace

collapse (sum) clientsserved2010stratum=NewTot10TX, by(stratum)
save "K:\Projects\429 OPA-ACA\Component 3 - Client survey\Data\429-stratum file.dta", replace


use "K:\Projects\429 OPA-ACA\Component 3 - Client survey\Data\429--2010 clinic census for project 429 weights.dta"

* Drop stratum and anymedicaid because they need to be recalculated in the 2015 file.
drop stratum anymedicaid NewTot10TX
save, replace



*******************************************************************
* Get recoded 2015 client survey data with clinic characteristics.
*******************************************************************

use "K:\Projects\429 OPA-ACA\Component 3 - Client survey\Data\429 Client Survey 2015 recodes.dta", clear

recode anymedicaid 2=0
label define anymedicaid 1 "Any Medicaid (income-based or FP-specific)" 0 "No Medicaid" 
label values anymedicaid anymedicaid



*Assign one stratum to each woman.
*Strata (n=8) are based on facility type (4) and state Medicaid expansion status (2).
gen stratum = newtype * 10 + anymedicaid

label var stratum "Stratum (facility type and state Medicaid expansion status) of facility where client was served"
label define stratum 	21 	"HD Medexp" 	20 	"HD NoMedexp"
label define stratum 	31   "PP Medexp " 	30	"PP NoMedexp ", add
label define stratum 	41	"FQHC Medexp "  40	"FQHC NoMedexp " , add
label define stratum 	51	"Other Medexp " 50	"Other NoMedexp "	, add
label values stratum stratum
tab stratum



*Create variable that is a count # of respondents per clinic (2015 survey data)
bysort clinicid: egen clientssurveyed2015clinic = count(clinicid)


**************************************
*  Merge women served data into file.  
**************************************
* Calculations are currently based on 2010 census data -- we will update weights with 2015 when they become avialable.

* Pull in women served by stratum from the 2010 clinic census.
* This is a many-to-one merge (many women will get the same facility weight), hence "m:1".
merge m:1 clinicid using "K:\Projects\429 OPA-ACA\Component 3 - Client survey\Data\429--2010 clinic census for project 429 weights.dta"



* Confirm that all cases in the data file got a multiplier and all multipliers were used.
assert _merge == 3 if uniqueid <.
drop if _merge ~= 3
drop _merge


merge m:1 stratum using "K:\Projects\429 OPA-ACA\Component 3 - Client survey\Data\429-stratum file.dta"
drop if _merge ~= 3




* Checking
sort stratum clinicid uniqueid
list stratum clinicid uniqueid clientssur* in 1/600


*Create variable that is a count # of respondents per stratum (2010 census data)

bysort clinicid: gen NewTot10dummy = NewTot10 if _n == 1
bysort stratum: egen clientssurveyed2015stratum = sum(NewTot10dummy)


*****************************************************************************************************************
*Calculate the weights.
*****************************************************************************************************************
* Stage 1. Respondents weighted up to facility: To calculate the response rate, we need to figure out the number of women served
* at each facility in 2010 based on the clinic census. [Will update with 2015 census data when available]
	*Calculation: Women at each facility weighted up by:
	*(# women served at that facility in a year based on 2010 clinic census) / (# of useable female surveys)

	gen stage1weight = NewTot10 / clientssurveyed2015clinic
	list stage1weight
	
	sum stage1weight
	di r(N) * r(mean)
	* This should yield the total number of women served in 2010 in the sampled facilities.
	
* Stage 2. Facility weighted to stratum
	*Calculation: Women in each stratum weighted up by:
	*(universe of women served in the clinic’s stratum) / (# of women within each stratum served in 2010 at clinics surveyed/responding in 2015)

	gen stage2weight = clientsserved2010stratum / clientssurveyed2015stratum
	list stage2weight
	
* Stage 3. Strata to missing strata. We weighted up to account for the fact that there were no respondents from one stratum 
*(i.e. FQHCs in non-Medicaid states). Rather than weighting all women, we decided that FQHC mattered more than Medicaid status 
* — i.e., that respondents at FQHCs (in Medicaid states) would be most representative of women at FQHCs at non-Medicaid states 
*(as opposed to women in non-Medicaid states [at other facility types]). 
	*Calculation: We weighted up only the women at FQHCs in Medicaid states by:
	*(total number of women served at FQHCs based on 2010 clinic census) / (number of women served by FQHCs in Medicaid states)
	
	sum clientsserved2010fqhc clientsserved2010fqhcmedicaid if stratum == 41
	
	gen stage3weight = clientsserved2010fqhc / clientsserved2010fqhcmedicaid
	* Weight needs to be 1 for all other respondents so that when we multiply all stages the result won't be missing.
	replace stage3weight = 1 if stage3weight >=.
	* list stage3weight
		
	
		
* Checking
sort stratum newtype anymedicaid clinicid uniqueid
* list stratum clinicid uniqueid stage* in 1600/2100

gen weight2 = stage1weight * stage2weight
gen weightp = stage1weight * stage2weight * stage3weight	

* Check to see that the sum of the weights equals the 4,724,248 Title X clients served (6,706,280 is all women served).
sum weightp
di r(N) * r(mean)


label var weightp "Facility weight (population)"
*label var weights "Facility weight (standardized)"
*label var weightpt "Facility weight (trimmed)"	


	
list clinicid stratum weightp 


*************************
* Set survey settings. 
*************************
svyset clinicid [pw=weightp], strata(stratum) singleunit(scaled)


********************************
* Save and label final dataset.
********************************
sort uniqueid
compress
note: Last saved $S_DATE at $S_TIME.
label data "429 Client Survey 2015 data clean with weights"
save "K:\Projects\429 OPA-ACA\Component 3 - Client survey\Data\429 Client Survey 2015 w weights.dta", replace
