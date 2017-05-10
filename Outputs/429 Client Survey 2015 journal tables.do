set more off
capture log close
log using "K:/Projects/429 OPA-ACA/Component 3 - Client survey\Analysis\Logs\429 Client Survey 2015 journal tables.log", replace


** Program name:  429 Client Survey 2015 journal tables
** 429/Client Survey 2015
** Program task:  Load 2016 client survey data file; create tables using gutt/gumm; export to excel
** Date created:  5/5/2017
** Written by:    KB

*******************************
* Get weighted and recoded 2016 client survey data.
*******************************

use "K:\Projects\429 OPA-ACA\Component 3 - Client survey\Data\429 Client Survey 2015 w weights from 2015 census.dta", clear

**************************************************************************
* Export tabs and tests
**************************************************************************

** Tables will be exported to a "docking station" and we will then link the excel spreadsheets into the previously developed table shells
gutt using "K:\Projects\429 OPA-ACA\Component 3 - Client survey\Analysis\Prints\429 Tables docking station.xlsx", replace

** Table 1
// For now, don't know how to use FPAR data, so just doing an export
gtab agecat5, 	 			svy percent body(b.0) subtitle("Age") continue
gtab paritycat2, 			svy percent body(b.0) subtitle("Parity") continue
gtab relationshipstatus, 	svy percent body(b.0) subtitle("Relationship Status") continue
gtab povcat3, 				svy percent body(b.0) subtitle("Poverty Status") continue
gtab insurancecat4, 		svy percent body(b.0) subtitle("Insurance Type") continue
gtab race1, 				svy percent body(b.0) subtitle("Race") continue
gtab education, 			svy percent body(b.0) subtitle("Education") continue
gtab language, 				svy percent body(b.0) subtitle("Language") continue
gtab nativity, 				svy percent body(b.0) subtitle("Nativity") continue
gtab firstvisit, 			svy percent body(b.0) subtitle("First visit") sheet("Table 1 Characteristics") 

** Table 2
// Export total %s
gtab usepill, 	 			svy percent body(b.0) subtitle("Using pill") continue
gtab usepatchringshot, 			svy percent body(b.0) subtitle("Using pill patch ring") continue
gtab useIUDimp, 	svy percent body(b.0) subtitle("Using IUD or implant") continue
gtab useothermethod, 				svy percent body(b.0) subtitle("Using other method") continue
gtab usenone, 		svy percent body(b.0) subtitle("Not using a method") continue

gtab wantpill, 				svy percent body(b.0) subtitle("Interested in pill") continue
gtab wantpatchringshot, 				svy percent body(b.0) subtitle("Interested in patch ring shot") continue
gtab wantIUDimp, 				svy percent body(b.0) subtitle("Intersted in IUD implant") continue
gtab wantEC, 				svy percent body(b.0) subtitle("Interested in EC") continue
gtab wantothermethod, 			svy percent body(b.0) subtitle("Interested in another method") continue

gtab notseekingchange, 			svy percent body(b.0) subtitle("Not seeking to change method") continue
gtab q5arforce, 				svy percent body(b.0) subtitle("Switching bc learned new things") continue
gtab q5brforce, 				svy percent body(b.0) subtitle("Switching bc can now afford new method") continue
gtab q5crforce, 				svy percent body(b.0) subtitle("Switching bc can't afford old method") continue
gtab q5drforce, 				svy percent body(b.0) subtitle("Switching bc side effects") continue
gtab q5erforce, 				svy percent body(b.0) subtitle("Switching bc unplanned pregnancy") continue
gtab q5grforce, 				svy percent body(b.0) subtitle("Switching for other reason") sheet("Table 2 Method Use & Switching") 

// Describe and test for difference between types of insurance
gumm i.usepill i.usepatchringshot i.useIUDimp i.useothermethod i.useothermethod i.usenone i.wantpill i.wantpatchringshot i.wantIUDimp i.wantEC i.wantothermethod ///
	i.notseekingchange i.q5arforce i.q5brforce i.q5crforce i.q5drforce i.q5erforce i.q5grforce, svy percent body(b.0*) over(insurancecat3) below_last sheet("Table 2 Method Use & Switching")

// Describe and test for differences between insured/uninsured
gumm i.usepill i.usepatchringshot i.useIUDimp i.useothermethod i.useothermethod i.usenone i.wantpill i.wantpatchringshot i.wantIUDimp i.wantEC i.wantothermethod ///
	i.notseekingchange i.q5arforce i.q5brforce i.q5crforce i.q5drforce i.q5erforce i.q5grforce, svy percent body(b.0*)  over(q9r) below_last sheet("Table 2 Method Use & Switching")		
	
	
** Table 3
// Total %s
gtab visitreason1, 	 					svy percent body(b.0) subtitle("Primary reason visit") continue

gtab servicesavailablegrp, 	 			svy percent body(b.0) subtitle("Summ grp: Services available") continue
gtab q6ar, 	 							svy percent body(b.0) subtitle("Provides needed services") continue
gtab q6er, 	 							svy percent body(b.0) subtitle("Can get desired method") continue
gtab q6fr, 	 							svy percent body(b.0) subtitle("Teen or YA services") continue

gtab qualconveniencegrp, 	 			svy percent body(b.0) subtitle("Summ grp: Quality and convenience") continue
gtab q6dr, 	 							svy percent body(b.0) subtitle("Location is convenient") continue
gtab q6gr, 	 							svy percent body(b.0) subtitle("Services are confidential") continue
gtab q6hr, 	 							svy percent body(b.0) subtitle("Staff are respectful") continue
gtab q6ir, 	 							svy percent body(b.0) subtitle("Can get needed referrals") continue

gtab familiaritygrp, 	 				svy percent body(b.0) subtitle("familiaritygrp") continue
gtab q6br, 	 							svy percent body(b.0) subtitle("Been here before") continue
gtab q6cr, 	 							svy percent body(b.0) subtitle("Recommended to me") continue

gtab affordabilitygrp, 	 				svy percent body(b.0) subtitle("Summ grp: Affordability") continue
gtab q6jr, 	 							svy percent body(b.0) subtitle("Free or low-cost services") continue
gtab q6kr, 	 							svy percent body(b.0) subtitle("Can use insurance") continue

gtab q8, 	 							svy percent body(b.0) subtitle("Have you gone anywhere else for medical care?") continue
gtab hadBCvisit, 	 					svy percent body(b.0) subtitle("Have had a FP visit in last year") continue
gtab noBCvisit, 	 					svy percent body(b.0) subtitle("NO FP visit in last year") continue
gtab q7arforce, 	 					svy percent body(b.0) subtitle("No reason to see a FP provider") continue
gtab q7brforce, 	 					svy percent body(b.0) subtitle("Already had annual GYN exam") continue
gtab q7crforce, 	 					svy percent body(b.0) subtitle("Not comfortable seeing FP provider") continue
gtab q7drforce, 	 					svy percent body(b.0) subtitle("Couldn't afford to see FP provider") continue
gtab q7erforce, 	 					svy percent body(b.0) subtitle("Inconvenient to see FP provider") continue
gtab q7frforce, 	 					svy percent body(b.0) subtitle("Didn't want family to find out about visit") continue
gtab q7grforce, 	 					svy percent body(b.0) subtitle("Other reason not to see FP provider") sheet("Table 3 Healthcare Behaviors")

// Describe and test for differences between types of insurance
gumm i.visitreason1 i.servicesavailablegrp i.q6ar i.q6er i.q6fr i.qualconveniencegrp i.q6dr i.q6gr i.q6hr i.q6ir i.familiaritygrp i.q6br i.q6cr i.affordabilitygrp i.q6jr i.q6kr ///
	 i.q8 i.hadBCvisit i.noBCvisit i.q7arforce i.q7brforce i.q7crforce i.q7drforce i.q7erforce i.q7frforce i.q7grforce, svy percent body(b.0*) over(insurancecat3) below_last sheet("Table 3 Healthcare Behaviors")

// Describe and test for differences between insured/uninsured
gumm i.visitreason1 i.servicesavailablegrp i.q6ar i.q6er i.q6fr i.qualconveniencegrp i.q6dr i.q6gr i.q6hr i.q6ir i.familiaritygrp i.q6br i.q6cr i.affordabilitygrp i.q6jr i.q6kr  ///
	 i.q8 i.hadBCvisit i.noBCvisit i.q7arforce i.q7brforce i.q7crforce i.q7drforce i.q7erforce i.q7frforce i.q7grforce, svy percent body(b.0*) over(q9r) below_last sheet("Table 3 Healthcare Behaviors")
	 
// Describe and test for differences between clinic type
gumm i.visitreason1 i.servicesavailablegrp i.q6ar i.q6er i.q6fr i.qualconveniencegrp i.q6dr i.q6gr i.q6hr i.q6ir i.familiaritygrp i.q6br i.q6cr i.affordabilitygrp i.q6jr i.q6kr ///
	 i.q8 i.hadBCvisit i.noBCvisit i.q7arforce i.q7brforce i.q7crforce i.q7drforce i.q7erforce i.q7frforce i.q7grforce, svy percent body(b.0*) over(factype) below_last sheet("Table 3 Healthcare Behaviors")


** Table 4

// Total %s
gtab q11frforceinc, 	 					svy percent body(b.0) subtitle("Plan to use insurance today? Y/N") continue
gtab q11afinal, 	 						svy percent body(b.0) subtitle("Service not covered by insurance") continue
gtab q11bfinal, 	 						svy percent body(b.0) subtitle("Can't use insurance here") continue
gtab q11cfinal, 	 						svy percent body(b.0) subtitle("Someone might find out if I use insurance") continue
gtab q11dfinal, 	 						svy percent body(b.0) subtitle("Deductible/co-pay too high on insurance") continue
gtab q11efinal, 	 						svy percent body(b.0) subtitle("Other reason not to use insurance") continue

gtab q12rfinal, 	 						svy percent body(b.0) subtitle("Did you try to get insurance in past year?") continue
gtab q12a1rforceinc, 	 					svy percent body(b.0) subtitle("Didn't get insurance: Couldn't afford") continue
gtab q12a2rforceinc, 	 					svy percent body(b.0) subtitle("Didn't get insurance: Too complicated") continue
gtab q12a3rforceinc, 	 					svy percent body(b.0) subtitle("Didn't get insurance: Didn't have paperwork") continue
gtab q12a4rforceinc, 	 					svy percent body(b.0) subtitle("Didn't get insurance: Not eligible because immigration status") continue
gtab q12a5rforceinc, 	 					svy percent body(b.0) subtitle("Didn't get insurance: Not eligible because income") continue
gtab q12a6rforceinc, 	 					svy percent body(b.0) subtitle("Didn't get insurance: Other reason") continue

gtab q12rfinal, 	 						svy percent body(b.0) subtitle("Did you try to get insurance in past year?") continue
gtab q12b1rforceinc, 	 					svy percent body(b.0) subtitle("Didn't try to get insurance: Don't want or need it") continue
gtab q12b2rforceinc, 	 					svy percent body(b.0) subtitle("Didn't try to get insurance: Parents would have had to do it") continue
gtab q12b3rforceinc, 	 					svy percent body(b.0) subtitle("Didn't try to get insurance: Seemed too expensive") continue
gtab q12b4rforceinc, 	 					svy percent body(b.0) subtitle("Didn't try to get insurance: Didn't know how to get it") continue
gtab q12b5rforceinc, 	 					svy percent body(b.0) subtitle("Didn't try to get insurance: Didn't think I could get paperwork") continue
gtab q12b6rforceinc, 	 					svy percent body(b.0) subtitle("Didn't try to get insurance: Couldn't because of immigration status") continue
gtab q12b7rforceinc, 	 					svy percent body(b.0) subtitle("Didn't try to get insurance: Didn't think I was eligible") continue
gtab q12b8rforceinc, 	 					svy percent body(b.0) subtitle("Didn't try to get insurance: Other eason") sheet("Table 4 Insurance")

// Describe and test for differences by age
gumm i.q11frforceinc i.q11afinal i.q11bfinal i.q11cfinal i.q11dfinal i.q11efinal i.q12rfinal i.q12a1rforceinc i.q12a2rforceinc i.q12a3rforceinc i.q12a4rforceinc ///
	 i.q12a5rforceinc i.q12a6rforceinc i.q12b1rforceinc i.q12b2rforceinc i.q12b3rforceinc i.q12b4rforceinc i.q12b5rforceinc i.q12b6rforceinc i.q12b7rforceinc ///
	 i.q12b8rforceinc, svy percent body(b.0*) over(agecat3) below_last sheet("Table 4 Insurance")
	 
// Describe and test for differences by poverty status
gumm i.q11frforceinc i.q11afinal i.q11bfinal i.q11cfinal i.q11dfinal i.q11efinal i.q12rfinal i.q12a1rforceinc i.q12a2rforceinc i.q12a3rforceinc i.q12a4rforceinc ///
	 i.q12a5rforceinc i.q12a6rforceinc i.q12b1rforceinc i.q12b2rforceinc i.q12b3rforceinc i.q12b4rforceinc i.q12b5rforceinc i.q12b6rforceinc i.q12b7rforceinc ///
	 i.q12b8rforceinc, svy percent body(b.0*) over(povcat3) below_last sheet("Table 4 Insurance")
	 
// Describe and test for differences by race/ethnicity
gumm i.q11frforceinc i.q11afinal i.q11bfinal i.q11cfinal i.q11dfinal i.q11efinal i.q12rfinal i.q12a1rforceinc i.q12a2rforceinc i.q12a3rforceinc i.q12a4rforceinc ///
	 i.q12a5rforceinc i.q12a6rforceinc i.q12b1rforceinc i.q12b2rforceinc i.q12b3rforceinc i.q12b4rforceinc i.q12b5rforceinc i.q12b6rforceinc i.q12b7rforceinc ///
	 i.q12b8rforceinc, svy percent body(b.0*) over(race1) below_last sheet("Table 4 Insurance")
	 
// Describe and test for differences by insurance type
gumm i.q11frforceinc i.q11afinal i.q11bfinal i.q11cfinal i.q11dfinal i.q11efinal, svy percent body(b.0*) over(insurancecat3) below_last sheet("Table 4 Insurance")

// Describe and test for differences by nativity
gumm i.q11frforceinc i.q11afinal i.q11bfinal i.q11cfinal i.q11dfinal i.q11efinal i.q12rfinal i.q12a1rforceinc i.q12a2rforceinc i.q12a3rforceinc i.q12a4rforceinc ///
	 i.q12a5rforceinc i.q12a6rforceinc i.q12b1rforceinc i.q12b2rforceinc i.q12b3rforceinc i.q12b4rforceinc i.q12b5rforceinc i.q12b6rforceinc i.q12b7rforceinc ///
	 i.q12b8rforceinc, svy percent body(b.0*) over(nativity) below_last sheet("Table 4 Insurance")
	 
// Accidentally left off Y/N of whether or not someone had insurance to main tables. Because the above output is already linked to the table shells, exporting below.
gtab q9r,   svy percent body(b.0) subtitle("Are you currently insured?") continue
gumm i.q9r, svy percent body(b.0*) over(agecat3) below_last sheet("Table 4 Insurance")
gumm i.q9r, svy percent body(b.0*) over(povcat3) below_last sheet("Table 4 Insurance")
gumm i.q9r, svy percent body(b.0*) over(insurancecat3)below_last sheet("Table 4 Insurance")
gumm i.q9r, svy percent body(b.0*) over(race1) below_last sheet("Table 4 Insurance")
gumm i.q9r, svy percent body(b.0*) over(nativity) below_last sheet("Table 4 Insurance")

gtab insuredallyear, 	 						svy percent body(b.0) subtitle("Insured all year") continue
gtab uninsuredallyear, 	 						svy percent body(b.0) subtitle("Uninsured all year") continue
gtab q13final, 	 								svy percent body(b.0) subtitle("No. of Months insured in past year") continue
gtab lostinsurance12mo, 						svy percent body(b.0) subtitle("Lost insurance in past year") continue
gtab q14afinal, 	 							svy percent body(b.0) subtitle("Lost insurance: Couldn't afford") continue
gtab q14bfinal, 	 							svy percent body(b.0) subtitle("Lost insurance: Big life change") continue
gtab q14cfinal, 	 							svy percent body(b.0) subtitle("Lost insurance: No longer eligible because made too much money") continue
gtab q14dfinal, 	 							svy percent body(b.0) subtitle("Lost insurance: Got too old for parents' plan") continue
gtab q14efinal, 	 							svy percent body(b.0) subtitle("Lost insurance: Couldn't provide necessary paperwork") continue
gtab q14ffinal, 	 							svy percent body(b.0) subtitle("Lost insurance: Plan was cancelled") continue
gtab q14gfinal, 	 							svy percent body(b.0) subtitle("Lost insurance: Other reason") continue

gumm i.insuredallyear i.uninsuredallyear i.q13final i.lostinsurance12mo i.q14afinal i.q14bfinal i.q14cfinal i.q14dfinal i.q14efinal i.q14ffinal i.q14gfinal, ///
	 svy percent body(b.0*) over(agecat3) below_last sheet("Table 4 Insurance")
gumm i.insuredallyear i.uninsuredallyear i.q13final  i.lostinsurance12mo i.q14afinal i.q14bfinal i.q14cfinal i.q14dfinal i.q14efinal i.q14ffinal i.q14gfinal, ///
	 svy percent body(b.0*) over(povcat3) below_last sheet("Table 4 Insurance")
gumm i.insuredallyear i.uninsuredallyear i.q13final i.lostinsurance12mo i.q14afinal i.q14bfinal i.q14cfinal i.q14dfinal i.q14efinal i.q14ffinal i.q14gfinal, ///
	 svy percent body(b.0*) over(insurancecat4) below_last sheet("Table 4 Insurance")
gumm i.insuredallyear i.uninsuredallyear i.q13final i.lostinsurance12mo i.q14afinal i.q14bfinal i.q14cfinal i.q14dfinal i.q14efinal i.q14ffinal i.q14gfinal, ///
	 svy percent body(b.0*) over(race1) below_last sheet("Table 4 Insurance")
gumm i.insuredallyear i.uninsuredallyear i.q13final  i.lostinsurance12mo i.q14afinal i.q14bfinal i.q14cfinal i.q14dfinal i.q14efinal i.q14ffinal i.q14gfinal, ///
	 svy percent body(b.0*) over(nativity) below_last sheet("Table 4 Insurance")


** Additional and/or appendix tables

// Additional tables (may become appendix table(s) or just for the sake of looking tables)

gtab inconsistencytest,   svy percent body(b.0) subtitle("Any inconsistencies on survey?") sheet("Appendix tables")
gumm i.inconsistencytest, svy percent body(b.0*) over(language) below_last sheet("Appendix tables")
gumm i.inconsistencytest, svy percent body(b.0*) over(nativity) below_last sheet("Appendix tables")
gumm i.inconsistencytest, svy percent body(b.0*) over(povcat3) below_last sheet("Appendix tables")
gumm i.inconsistencytest, svy percent body(b.0*) over(agecat3) below_last sheet("Appendix tables")
gumm i.inconsistencytest, svy percent body(b.0*) over(education) below_last sheet("Appendix tables")


gumm i.q11frforceinc i.q11afinal i.q11bfinal i.q11cfinal i.q11dfinal i.q11efinal i.q12rfinal i.q12a1rforceinc i.q12a2rforceinc i.q12a3rforceinc i.q12a4rforceinc ///
	 i.q12a5rforceinc i.q12a6rforceinc i.q12b1rforceinc i.q12b2rforceinc i.q12b3rforceinc i.q12b4rforceinc i.q12b5rforceinc i.q12b6rforceinc i.q12b7rforceinc ///
	 i.q12b8rforceinc, svy percent body(b.0*) over(agecat5) below_last sheet("Appendix tables")

