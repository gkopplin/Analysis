set more off
capture log close
log using "K:/Projects/429 OPA-ACA/Component 3 - Client survey\Analysis\Logs\429 Client Survey 2015 recodes.log", replace


** Program name:  429 Client Survey 2015 recodes
** 429/Client Survey 2015
** Program task:  Load 2015 Client Survey datafile; recode variables; set survey settings
** Date created:  12/1/2016 
** Written by:    KB and MZ


*******************************
* Get 2015 client survey data.
*******************************

use "K:\Projects\429 OPA-ACA\Component 3 - Client survey\Data\429 Client Survey 2015 data original.dta", clear
set linesize 75

* Sort by clinic id and then client id.
sort clinicid uniqueid

codebook clinicid
*n=43 clinics
*n=2,911 clients

**************************************************************************
* Merge in clinic-level characteristics from 2015 clinic survey datafile.
**************************************************************************

// These characteristics will later be used to weight sample
rename clinicid clinid
merge m:1 clinid using "K:\Projects\432 OPA Family Planning Center Surveys\Analysis\Data\432 Clinic Survey full data file w weights Oct 10.dta", keepusing (newtype dbtx cpweek expanstate fpexpanstate anymedicaid StateAbbr)    

* Make sure all records in the master data file got clinic details. (They did.)
assert _merge ~=1
drop if _merge ~=3
drop _merge 
count // n = 2911
rename clinid clinicid
rename StateAbbr stateabbrv

************************
* KB's Recodes.
************************
cd "K:\Projects\429 OPA-ACA\Component 3 - Client survey\Analysis"

do "K:\Projects\429 OPA-ACA\Component 3 - Client survey\Analysis\Vars\vars.do"

// Inconsistency checks do file checks for inconsistencies in recodes
// do "K:\Projects\429 OPA-ACA\Component 3 - Client survey\Analysis\Vars\inconsistencychecks.do"


*****************************
* Save and label recoded data file.
*****************************
compress
sort uniqueid
label data "429 Client Survey 2015 data clean"
note: Last saved $S_DATE at $S_TIME.
save "K:\Projects\429 OPA-ACA\Component 3 - Client survey\Data\429 Client Survey 2015 recodes.dta", replace

* End of 429 Client Survey 2015 recodes.do.
exit
