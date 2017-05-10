capture log close
log using "K:\Projects\429 OPA-ACA\Component 3 - Client survey\Analysis\Logs\Master program to create 429 file for analysis and run tables.log", replace

** Program name:  Master program to create 429 data file for analysis and run tables
** 429/Client Survey 2015 
** Output file:   K:\Projects\429 OPA Family Planning Center Surveys\Analysis\Data\432 final file with recodes.sav (SPSS).
** Program task:  Append and combine data files from QIC; add in clinic-level data; run recodes on merged file; weight data based on 2015 clinic census; save final file for analysis; produce tables for publication
** Date created:  12/1/2016 
** Written by:    MZ & KB



**************************************************************************************************************.
* Import original raw data files from QIC and append them to get one file containing all survey responses.
**************************************************************************************************************.
do "K:\Projects\429 OPA-ACA\Component 3 - Client survey\Analysis\429 Import raw data into Stata.do"

// This file is saved as "K:\Projects\429 OPA-ACA\Component 3 - Client survey\Data\429 Client Survey 2015 data original.dta"
// This will then be used to run through recode program.

******************************************************************************************.
* From final 432 Clinic Survey datafile, pull in various clinic-level variables;
* Run recodes and frequencies on combined file and save final file for analysis.
******************************************************************************************.
do "K:\Projects\429 OPA-ACA\Component 3 - Client survey\Analysis\429 Client Survey 2015 recodes.do"

// The recoded data file is saved as "K:\Projects\429 OPA-ACA\Component 3 - Client survey\Data\429 Client Survey 2015 recodes.dta"
// This will be run through the weighting program.

***********************************************************************************************************************.
* Create weights and apply survey settings.
***********************************************************************************************************************.
do "K:\Projects\429 OPA-ACA\Component 3 - Client survey\Analysis\Weights\weights based on 2015 final census data.do"

// The recoded data with weights is saved as "K:\Projects\429 OPA-ACA\Component 3 - Client survey\Data\429 Client Survey 2015 w weights from 2015 census.dta"

*************************************************************************.
* Produce tables for 429 manuscript. 
*************************************************************************.

do "K:\Projects\429 OPA-ACA\Component 3 - Client survey\Analysis\Outputs\429 Client Survey 2015 journal tables.do"
do "K:\Projects\429 OPA-ACA\Component 3 - Client survey\Analysis\Outputs\429 cell counts for journal tables.do"

