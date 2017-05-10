** Program name:  weights based on 2015 final census data
** 429/Client Survey 2015
** Program task:  Calculate multiplier for the weights based on 2015 clinic census and set survey settings
** Date created:  5/1/2017 
** Written by:    MZ; based on program written by MZ and LBF using 2010 clinic census data 


set more off

****************************************
*  Calculate multiplier for the weights.  
****************************************

* See notes about how to create weights: K:\Projects\429 OPA-ACA\Component 3 - Client survey\Analysis\Weights\Weights notes.doc

* We want to identify women served in strata from the 2015 clinic census.

* Get final 2015 clinic census data. 
use "K:\Projects\433 OPA Contraceptive Needs and Services\Clinic Census\Data\SPSS\Clinic Census 2015 eligible facilities only_recodes.dta", clear

* Check to see that the sum of the clients equals the 3,827,650 Title X clients served from published report (6,246,290 is all women served).
* Report is here: https://www.guttmacher.org/sites/default/files/report_pdf/publicly_funded_contraceptive_services_2015_0.pdf
sum txpat15
di r(N) * r(mean)
* Yes, the numbers match. 

* Identify states in 2015 with any kind of Medicaid in 2015.
gen anymedicaid=0
foreach mystate in AL AR AZ CA CT CO DE DC GA IA HI IL IN LA KY MD MA MI MN MS MO MT NV NH NJ NM NY NC ND OH OK OR PA RI SC VA VT WA WV WI {
	replace anymedicaid=1 if state15=="`mystate'"
}
label var anymedicaid "Clinic located in states with any Medicaid (income-based or FP-specific) in 2015"
label define anymedicaid 1 "Any Medicaid (income-based or FP-specific) in 2015' 0 'NO Medicaid"
label values anymedicaid anymedicaid
tab anymedicaid state15

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
*All 10,708 clinics are in a stratum.

table stratum, contents(sum txpat15) row
*All 3,827,650 clients are one of teh 8 possible strata. 
*Therefor we don't have to manually assign any women to a stratum. 

*Create variable that is the sum of women served per stratum (2015 census data)
bysort stratum: egen clientsserved2015stratum = sum(txpat15)

tab clientsserved2015stratum 
tab stratum


table stratum if stratum ~= 40, contents(sum txpat15) row

*Create variable that is the sum of women served at FQHCs (2015 census data)
bysort factype: egen clientsserved2015fqhc = sum(txpat15) if factype==4

*Create variable that is the sum of women served at FQHCs in Medicaid states (2015 census data)
bysort factype: egen clientsserved2015fqhcmedicaid = sum(txpat15) if (factype==4 & anymedicaid == 1)


*Not needed since the clinic is correctly designated in the 2015 census file.  
/*
*** Clinic 5140 changed from other in 2010 to fqhc in 2015.
* Therefore, it is not getting the above two variables, but it will need them 
*    in 2015 so its weight can be weighted up in stage 3.
* So we are manually assigning them to clinic 5140.

sum clientsserved2015fqhc
replace clientsserved2015fqhc = r(mean) if clinicid == 5140

sum clientsserved2015fqhcmedicaid
replace clientsserved2015fqhcmedicaid = r(mean) if clinicid == 5140


sum clientsserved2015* if clinicid == 5140
*/





********************************************************
* Save and label 2015 clinic census dataset for weights.
********************************************************

sort clinicid
compress
note: Last saved $S_DATE at $S_TIME.
label data "429 for weights for client survey"
save "K:\Projects\429 OPA-ACA\Component 3 - Client survey\Data\429--2015 clinic census for project 429 weights.dta", replace

collapse (sum) clientsserved2015stratum=txpat15, by(stratum)
save "K:\Projects\429 OPA-ACA\Component 3 - Client survey\Data\429-2015 stratum file.dta", replace


use "K:\Projects\429 OPA-ACA\Component 3 - Client survey\Data\429--2015 clinic census for project 429 weights.dta"

* Drop stratum and anymedicaid because they need to be recalculated in the 2015 file.
drop stratum anymedicaid 
*factype?
save, replace

*******************************************************************
* Get recoded 2015 client survey data with clinic characteristics.
*******************************************************************

use "K:\Projects\429 OPA-ACA\Component 3 - Client survey\Data\429 Client Survey 2015 recodes.dta", clear
*use "K:\Projects\429 OPA-ACA\Component 3 - Client survey\Data\429 Client Survey 2015 data original.dta", clear

*Replacing clinic id manually becuase this record was inactivated during the 2015 clinic cenus because it was a dup of another clinic.  
replace clinicid=13284 if clinicid==17749



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
*Total clinics should be 2,911.  


*Create variable that is a count # of respondents per clinic (2015 survey data)
bysort clinicid: egen clientssurveyed2015clinic = count(clinicid)


**************************************
*  Merge women served data into file.  
**************************************

* Pull in women served by stratum from the 2015 clinic census.
* This is a many-to-one merge (many women will get the same facility weight), hence "m:1".
merge m:1 clinicid using "K:\Projects\429 OPA-ACA\Component 3 - Client survey\Data\429--2015 clinic census for project 429 weights.dta"



* Confirm that all cases in the data file got a multiplier and all multipliers were used.
assert _merge == 3 if uniqueid <.

*See which clinics in the survey were not matched to figure out why. 
tab clinicid if _merge==1
*All clinics match.

*Delete info that aren't assoicated with the 2,911 clinics surveyed.
drop if _merge ~= 3
drop _merge


merge m:1 stratum using "K:\Projects\429 OPA-ACA\Component 3 - Client survey\Data\429-2015 stratum file.dta"
drop if _merge ~= 3


* Checking
sort stratum clinicid uniqueid
list stratum clinicid uniqueid clientssur* in 1/600, sepby(clinicid)


* Check to make sure all clinics are Title X funded accoding to the census data. 
list clinicid if totpat15 ~= txpat15
sum totpat15 
sum txpat15
*All looks good.

* Check to see if clinic type designations match between census (factype) and survey (newtype). 
tab factype newtype
*They do!

*Create variable that is a count # of respondents per stratum (2015 census data)
bysort clinicid: gen totpat15dummy = totpat15 if _n == 1
bysort stratum: egen clientssurveyed2015stratum = sum(totpat15dummy)


*****************************************************************************************************************
*Calculate the weights.
*****************************************************************************************************************
* Stage 1. Respondents weighted up to facility: To calculate the response rate, we need to figure out the number of women served
* at each facility in 2015 based on the clinic census. 
	*Calculation: Women at each facility weighted up by:
	*(# women served at that facility in a year based on 2015 clinic census) / (# of useable female surveys)

	gen stage1weight = totpat15 / clientssurveyed2015clinic
	list stage1weight
	
	sum stage1weight
	di r(N) * r(mean)
	* This should yield the total number of women served in 2015 in the sampled facilities.
	
* Stage 2. Facility weighted to stratum
	*Calculation: Women in each stratum weighted up by:
	*(universe of women served in the clinic’s stratum) / (# of women within each stratum served in 2015 at clinics surveyed/responding in 2015)

	gen stage2weight = clientsserved2015stratum / clientssurveyed2015stratum
	list stage2weight
	


* Stage 3. Strata to missing strata. We weighted up to account for the fact that there were no respondents from one stratum 
*(i.e. FQHCs in non-Medicaid states). Rather than weighting all women, we decided that FQHC mattered more than Medicaid status 
* — i.e., that respondents at FQHCs (in Medicaid states) would be most representative of women at FQHCs at non-Medicaid states 
*(as opposed to women in non-Medicaid states [at other facility types]). 
	*Calculation: We weighted up only the women at FQHCs in Medicaid states by:
	*(total number of women served at FQHCs based on 2015 clinic census) / (number of women served by FQHCs in Medicaid states)
	
	sum clientsserved2015fqhc clientsserved2015fqhcmedicaid if stratum == 41
	
	gen stage3weight = clientsserved2015fqhc / clientsserved2015fqhcmedicaid
	* Weight needs to be 1 for all other respondents so that when we multiply all stages the result won't be missing.
	replace stage3weight = 1 if stage3weight >=.
	* list stage3weight
	
	
		
* Checking
sort stratum newtype anymedicaid clinicid uniqueid
list stratum clinicid uniqueid stage* in 1600/2100, sepby(clinicid)

gen weight2 = stage1weight * stage2weight
gen weightp = stage1weight * stage2weight * stage3weight	

* Check to see that the sum of the weights equals the 3,827,650 Title X clients served from published report (6,246,290 is all women served).
sum weightp
di r(N) * r(mean)
*It matches so we are all good to go.

label var weightp "Facility weight (population)"
*label var weights "Facility weight (standardized)"
*label var weightpt "Facility weight (trimmed)"	

*Look at the distribution of final population weights to see if we want to trim them. 
tab weightp
*They don't seem too skewed, so we left them as is. 


tab clinicid
set more off
list clinicid stratum weightp, sepby(clinicid) 


*************************
* Set survey settings. 
*************************
*Specificying the -psu- (i.e. clinicid) accounts for both rounds of sampling and improves standard error calculations.
svyset clinicid [pw=weightp], strata(stratum) singleunit(scaled)


********************************
* Save and label final dataset.
********************************
sort uniqueid
compress
note: Last saved $S_DATE at $S_TIME.
label data "429 Client Survey 2015 data clean with weights"
save "K:\Projects\429 OPA-ACA\Component 3 - Client survey\Data\429 Client Survey 2015 w weights from 2015 census.dta", replace
