set more off
capture log close
log using "K:\Projects\429 OPA-ACA\Component 3 - Client survey\Analysis\429 Client Survey 2015 analysis.log", replace


** Program name:  429 Client Survey 2015 analysis program
** 429/Client Survey 2015
** Program task:  Load recoded 2015 Client Survey datafile; merge in clinic-level characteristics; apply weights; run analysis for external journal
** Date created:  12/13/2016 
** Written by:    MZ


* See notes about how to create weights: K:\Projects\429 OPA-ACA\Component 3 - Client survey\Analysis\Weights\Weights notes.doc


****************************************
*  Calculate multiplier for the weights.  
****************************************
* We want to identify women served in strata from the 2010 clinic census.
* Calculations are currently based on 2010 census data -- we will update weights with 2015 when they become avialable.

* Get final 2010 clinic census data. 
use "K:\Projects\321 Meeting FP Challenges (OPA)\340 Clinic Census\Tables\Clinic Census 2010 recodes FN-active only.dta", clear
*ClinID10
*NewTot10

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
label define stratum 	21 	"HD Medexp" 	20 	"HD NoMedexp", add
label define stratum 	31   "PP Medexp " 	30	"PP NoMedexp ", add
label define stratum 	41	"FQHC Medexp "  40	"FQHC NoMedexp " , add
label define stratum 	51	"Other Medexp " 50	"Other NoMedexp "	, add
label values stratum stratum
tab stratum

table stratum, contents(sum NewTot10) row

*Create variable that is the sum of women served per stratum (2010 census data)
bysort stratum: egen clientsserved2010stratum = sum(NewTot10)

*Create variable that is the sum of women served at FQHCs (2010 census data)
bysort factype: egen clientsserved2010fqhc = sum(NewTot10) if factype==4

* Rename clinic id variable to match other file.
rename ClinID10 clinicid

********************************
* Save and label final dataset.
********************************
sort clinicid
compress
note: Last saved $S_DATE at $S_TIME.
label data "429 for weights for client survey"
save "K:\Projects\429 OPA-ACA\Component 3 - Client survey\Data\429--2010 clinic census for project 429 weights.dta", replace



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

*Create variable that is a count # of respondents per stratum (2015 survey data)
bysort stratum: egen clientssurveyed2015stratum = count(clinicid)

*Create variable that is a count # of respondents at FQHCs (2015 survey data)
bysort clinicid: egen clientssurveyed2015fqhc = count(clinicid) if newtype==4


**********************************
*  Merge women served data into file.  
**********************************
* Calculations are currently based on 2010 census data -- we will update weights with 2015 when they become avialable.

* Pull in women served by stratum from the 2010 clinic census.
* This is a many-to-one merge (many women will get the same facility weight), hence "m:1".
merge m:1 clinicid using "K:\Projects\429 OPA-ACA\Component 3 - Client survey\Data\429--2010 clinic census for project 429 weights.dta"

* Confirm that all cases in the data file got a multiplier and all multipliers were used.
assert _merge == 3 if uniqueid <.
drop if _merge ~= 3
drop _merge


* Checking
sort stratum clinicid uniqueid
list stratum clinicid uniqueid clientssur* in 1/600


*****************************************************************************************************************
*Calculate the weights.
*****************************************************************************************************************
* Stage 1. Respondents weighted to facility: To calculate the response rate, we need to figure out the number of women served
* at each facility in 2010 based on the clinic census. [Will update with 2015 census data when available]
	*Calculation: Women at each facility weighted up by:
	*(# women served at that facility in a year based on 2010 clinic census) / (# of useable female surveys)

	gen stage1weight=0
	replace stage1weight = NewTot10 / clientssurveyed2015clinic
	list stage1weight
	
* Stage 2. Facility weighted to stratum
	*Calculation: Women in each stratum weighted up by:
	*(universe of women served in the clinic’s stratum) / (# of women within each stratum served at responding clinics)

	gen stage2weight=0
	replace stage2weight = clientsserved2010stratum / clientssurveyed2015stratum
	list stage2weight
	
* Stage 3. Strata to missing strata. We weighted up to account for the fact that there were no respondents from one stratum 
*(i.e. FQHCs in non-Medicaid states). Rather than weighting all women, we decided that FQHC mattered more than Medicaid status 
* — i.e., that respondents at FQHCs (in Medicaid states) would be most representative of women at FQHCs at non-Medicaid states 
*(as opposed to women in non-Medicaid states [at other facility types]). 
	*Calculation: We weighted up only the women at FQHCs in Medicaid states by:
	*(total number of women served at FQHCs based on 2010 clinic census) / (number of women served by FQHCs in Medicaid states)
	
	gen stage3weight=0
	replace stage3weight = clientsserved2010fqhc / clientssurveyed2015fqhc
	list stage3weight
		
* Checking
sort stratum type anymedicaid clinicid uniqueid
list stratum clinicid uniqueid stage* in 1600/2100
	
gen weightp = stage1weight * stage2weight * stage3weight	

label var weightp "Facility weight (population)"
label var weights "Facility weight (standardized)"
label var weightpt "Facility weight (trimmed)"	
	
list clinicid stratum weightp weights weightpt


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


******************************************************
* Analysis for GPR that will be published in January. 
  *(Send stats to Kinsey and Adam in early January)
******************************************************

*Look at Qs 6 (interested in “This is the only place that I can get the services that I need” response)
   * and 7 (why didn’t make visit in the last year) specifically to get: 
*- Distribution of responses by clinic type 
*- Distribution of responses among PPs 


tab newtype q6a, mis col row

q6missing


*Insurance analysis should exclude the xxx surveys that are flagged for inconsistent responses (not 355 -- those include inconsistences on several Qs I believe).



* End of 429 Client Survey 2015 analysis program.do.
exit
