set more off
capture log close
log using "K:/Projects/429 OPA-ACA/Component 3 - Client survey\Analysis\Logs\429 cell counts for journal tables.log", replace


** Program name:  429 cell counts for journal tables
** 429/Client Survey 2015
** Program task:  Load 2016 client survey data file; create tables using gtab to look at cell counts in jounal tables
** Date created:  5/9/2017
** Written by:    KB

*******************************
* Get weighted and recoded 2016 client survey data.
*******************************

use "K:\Projects\429 OPA-ACA\Component 3 - Client survey\Data\429 Client Survey 2015 w weights from 2015 census.dta", clear

**************************************************************************
* Export cell counts
**************************************************************************
** This program is analagous to the "journal tables" program, but it exports cell counts.
** The docking station and 
** Tables will be exported to a "docking station" and we will then link the excel spreadsheets into the previously developed table shells
gutt using "K:\Projects\429 OPA-ACA\Component 3 - Client survey\Analysis\Prints\429 cell counts.xlsx", replace

** Table 1
// For now, don't know how to use FPAR data, so just doing an export
gtab agecat5, 	 			body(b.0) subtitle("Age") continue
gtab paritycat2, 			body(b.0) subtitle("Parity") continue
gtab relationshipstatus, 	body(b.0) subtitle("Relationship Status") continue
gtab povcat3, 				body(b.0) subtitle("Poverty Status") continue
gtab insurancecat4, 		body(b.0) subtitle("Insurance Type") continue
gtab race1, 				body(b.0) subtitle("Race") continue
gtab education, 			body(b.0) subtitle("Education") continue
gtab language, 				body(b.0) subtitle("Language") continue
gtab nativity, 				body(b.0) subtitle("Nativity") continue
gtab firstvisit, 			body(b.0) subtitle("First visit") sheet("Table 1 Characteristics") 

** Table 2
// Export total %s
gtab usepill, 	 			body(b.0) subtitle("Using pill") continue
gtab usepatchringshot, 		body(b.0) subtitle("Using pill patch ring") continue
gtab useIUDimp, 			body(b.0) subtitle("Using IUD or implant") continue
gtab useothermethod, 		body(b.0) subtitle("Using other method") continue
gtab usenone, 				body(b.0) subtitle("Not using a method") continue

gtab wantpill, 				body(b.0) subtitle("Interested in pill") continue
gtab wantpatchringshot, 	body(b.0) subtitle("Interested in patch ring shot") continue
gtab wantIUDimp, 			body(b.0) subtitle("Intersted in IUD implant") continue
gtab wantEC, 				body(b.0) subtitle("Interested in EC") continue
gtab wantothermethod, 		body(b.0) subtitle("Interested in another method") continue

gtab notseekingchange, 		body(b.0) subtitle("Not seeking to change method") continue
gtab q5arforce, 			body(b.0) subtitle("Switching bc learned new things") continue
gtab q5brforce, 			body(b.0) subtitle("Switching bc can now afford new method") continue
gtab q5crforce, 			body(b.0) subtitle("Switching bc can't afford old method") continue
gtab q5drforce, 			body(b.0) subtitle("Switching bc side effects") continue
gtab q5erforce, 			body(b.0) subtitle("Switching bc unplanned pregnancy") continue
gtab q5grforce, 			body(b.0) subtitle("Switching for other reason") sheet("Table 2 Method Use & Switching") 

gtab usepill, 	 			body(b.0) subtitle("Using pill") continue
gtab usepatchringshot, 		body(b.0) subtitle("Using pill patch ring") continue
gtab useIUDimp, 			body(b.0) subtitle("Using IUD or implant") continue
gtab useothermethod, 		body(b.0) subtitle("Using other method") continue
gtab usenone, 				body(b.0) subtitle("Not using a method") continue

gtab wantpill, 				body(b.0) subtitle("Interested in pill") continue
gtab wantpatchringshot, 	body(b.0) subtitle("Interested in patch ring shot") continue
gtab wantIUDimp, 			body(b.0) subtitle("Intersted in IUD implant") continue
gtab wantEC, 				body(b.0) subtitle("Interested in EC") continue
gtab wantothermethod, 		body(b.0) subtitle("Interested in another method") continue

gtab notseekingchange, 		body(b.0) subtitle("Not seeking to change method") continue
gtab q5arforce, 			body(b.0) subtitle("Switching bc learned new things") continue
gtab q5brforce, 			body(b.0) subtitle("Switching bc can now afford new method") continue
gtab q5crforce, 			body(b.0) subtitle("Switching bc can't afford old method") continue
gtab q5drforce, 			body(b.0) subtitle("Switching bc side effects") continue
gtab q5erforce, 			body(b.0) subtitle("Switching bc unplanned pregnancy") continue
gtab q5grforce, 			body(b.0) subtitle("Switching for other reason") sheet("Table 2 Method Use & Switching") 

// Describe and test for difference between types of insurance
gumm i.usepill i.usepatchringshot i.useIUDimp i.useothermethod i.useothermethod i.usenone i.wantpill i.wantpatchringshot i.wantIUDimp i.wantEC i.wantothermethod ///
	i.notseekingchange i.q5arforce i.q5brforce i.q5crforce i.q5drforce i.q5erforce i.q5grforce, over(insurancecat3) xtab body(ones) digits(0) percentage below_last sheet("Table 2 Method Use & Switching")

// Describe and test for differences between insured/uninsured
gumm i.usepill i.usepatchringshot i.useIUDimp i.useothermethod i.useothermethod i.usenone i.wantpill i.wantpatchringshot i.wantIUDimp i.wantEC i.wantothermethod ///
	i.notseekingchange i.q5arforce i.q5brforce i.q5crforce i.q5drforce i.q5erforce i.q5grforce, over(q9r) xtab body(ones) digits(0) percentage below_last sheet("Table 2 Method Use & Switching")
	
** Table 3
// Total %s
gtab visitreason1, 	 					body(b.0) subtitle("Primary reason visit") continue

gtab servicesavailablegrp, 	 			body(b.0) subtitle("Summ grp: Services available") continue
gtab q6ar, 	 							body(b.0) subtitle("Provides needed services") continue
gtab q6er, 	 							body(b.0) subtitle("Can get desired method") continue
gtab q6fr, 	 							body(b.0) subtitle("Teen or YA services") continue

gtab qualconveniencegrp, 	 			body(b.0) subtitle("Summ grp: Quality and convenience") continue
gtab q6dr, 	 							body(b.0) subtitle("Location is convenient") continue
gtab q6gr, 	 							body(b.0) subtitle("Services are confidential") continue
gtab q6hr, 	 							body(b.0) subtitle("Staff are respectful") continue
gtab q6ir, 	 							body(b.0) subtitle("Can get needed referrals") continue

gtab familiaritygrp, 	 				body(b.0) subtitle("familiaritygrp") continue
gtab q6br, 	 							body(b.0) subtitle("Been here before") continue
gtab q6cr, 	 							body(b.0) subtitle("Recommended to me") continue

gtab affordabilitygrp, 	 				body(b.0) subtitle("Summ grp: Affordability") continue
gtab q6jr, 	 							body(b.0) subtitle("Free or low-cost services") continue
gtab q6kr, 	 							body(b.0) subtitle("Can use insurance") continue

gtab q8, 	 							body(b.0) subtitle("Have you gone anywhere else for medical care?") continue
gtab hadBCvisit, 	 					body(b.0) subtitle("Have had a FP visit in last year") continue
gtab noBCvisit, 	 					body(b.0) subtitle("NO FP visit in last year") continue
gtab q7arforce, 	 					body(b.0) subtitle("No reason to see a FP provider") continue
gtab q7brforce, 	 					body(b.0) subtitle("Already had annual GYN exam") continue
gtab q7crforce, 	 					body(b.0) subtitle("Not comfortable seeing FP provider") continue
gtab q7drforce, 	 					body(b.0) subtitle("Couldn't afford to see FP provider") continue
gtab q7erforce, 	 					body(b.0) subtitle("Inconvenient to see FP provider") continue
gtab q7frforce, 	 					body(b.0) subtitle("Didn't want family to find out about visit") continue
gtab q7grforce, 	 					body(b.0) subtitle("Other reason not to see FP provider") sheet("Table 3 Healthcare Behaviors")

// Describe and test for differences between types of insurance
gumm i.visitreason1 i.servicesavailablegrp i.q6ar i.q6er i.q6fr i.qualconveniencegrp i.q6dr i.q6gr i.q6hr i.q6ir i.familiaritygrp i.q6br i.q6cr i.affordabilitygrp i.q6jr i.q6kr ///
	 i.q8 i.hadBCvisit i.noBCvisit i.q7arforce i.q7brforce i.q7crforce i.q7drforce i.q7erforce i.q7frforce i.q7grforce, over(insurancecat3) xtab body(ones) digits(0) percentage below_last sheet("Table 3 Healthcare Behaviors")

// Describe and test for differences between insured/uninsured
gumm i.visitreason1 i.servicesavailablegrp i.q6ar i.q6er i.q6fr i.qualconveniencegrp i.q6dr i.q6gr i.q6hr i.q6ir i.familiaritygrp i.q6br i.q6cr i.affordabilitygrp i.q6jr i.q6kr  ///
	 i.q8 i.hadBCvisit i.noBCvisit i.q7arforce i.q7brforce i.q7crforce i.q7drforce i.q7erforce i.q7frforce i.q7grforce, over(q9r) xtab body(ones) digits(0) percentage below_last sheet("Table 3 Healthcare Behaviors")
	 
// Describe and test for differences between clinic type
gumm i.visitreason1 i.servicesavailablegrp i.q6ar i.q6er i.q6fr i.qualconveniencegrp i.q6dr i.q6gr i.q6hr i.q6ir i.familiaritygrp i.q6br i.q6cr i.affordabilitygrp i.q6jr i.q6kr ///
	 i.q8 i.hadBCvisit i.noBCvisit i.q7arforce i.q7brforce i.q7crforce i.q7drforce i.q7erforce i.q7frforce i.q7grforce, over(factype) xtab body(ones) digits(0) percentage below_last sheet("Table 3 Healthcare Behaviors")


** Table 4

// Total %s
gtab q11frforceinc, 	 					body(b.0) subtitle("Plan to use insurance today? Y/N") continue
gtab q11afinal, 	 						body(b.0) subtitle("Service not covered by insurance") continue
gtab q11bfinal, 	 						body(b.0) subtitle("Can't use insurance here") continue
gtab q11cfinal, 	 						body(b.0) subtitle("Someone might find out if I use insurance") continue
gtab q11dfinal, 	 						body(b.0) subtitle("Deductible/co-pay too high on insurance") continue
gtab q11efinal, 	 						body(b.0) subtitle("Other reason not to use insurance") continue

gtab q12rfinal, 	 						body(b.0) subtitle("Did you try to get insurance in past year?") continue
gtab q12a1rforceinc, 	 					body(b.0) subtitle("Didn't get insurance: Couldn't afford") continue
gtab q12a2rforceinc, 	 					body(b.0) subtitle("Didn't get insurance: Too complicated") continue
gtab q12a3rforceinc, 	 					body(b.0) subtitle("Didn't get insurance: Didn't have paperwork") continue
gtab q12a4rforceinc, 	 					body(b.0) subtitle("Didn't get insurance: Not eligible because immigration status") continue
gtab q12a5rforceinc, 	 					body(b.0) subtitle("Didn't get insurance: Not eligible because income") continue
gtab q12a6rforceinc, 	 					body(b.0) subtitle("Didn't get insurance: Other reason") continue

gtab q12rfinal, 	 						body(b.0) subtitle("Did you try to get insurance in past year?") continue
gtab q12b1rforceinc, 	 					body(b.0) subtitle("Didn't try to get insurance: Don't want or need it") continue
gtab q12b2rforceinc, 	 					body(b.0) subtitle("Didn't try to get insurance: Parents would have had to do it") continue
gtab q12b3rforceinc, 	 					body(b.0) subtitle("Didn't try to get insurance: Seemed too expensive") continue
gtab q12b4rforceinc, 	 					body(b.0) subtitle("Didn't try to get insurance: Didn't know how to get it") continue
gtab q12b5rforceinc, 	 					body(b.0) subtitle("Didn't try to get insurance: Didn't think I could get paperwork") continue
gtab q12b6rforceinc, 	 					body(b.0) subtitle("Didn't try to get insurance: Couldn't because of immigration status") continue
gtab q12b7rforceinc, 	 					body(b.0) subtitle("Didn't try to get insurance: Didn't think I was eligible") continue
gtab q12b8rforceinc, 	 					body(b.0) subtitle("Didn't try to get insurance: Other eason") sheet("Table 4 Insurance")

// Describe and test for differences by age
gumm i.q11frforceinc i.q11afinal i.q11bfinal i.q11cfinal i.q11dfinal i.q11efinal i.q12rfinal i.q12a1rforceinc i.q12a2rforceinc i.q12a3rforceinc i.q12a4rforceinc ///
	 i.q12a5rforceinc i.q12a6rforceinc i.q12b1rforceinc i.q12b2rforceinc i.q12b3rforceinc i.q12b4rforceinc i.q12b5rforceinc i.q12b6rforceinc i.q12b7rforceinc ///
	 i.q12b8rforceinc, over(agecat3) xtab body(ones) digits(0) percentage below_last sheet("Table 4 Insurance")
	 
// Describe and test for differences by poverty status
gumm i.q11frforceinc i.q11afinal i.q11bfinal i.q11cfinal i.q11dfinal i.q11efinal i.q12rfinal i.q12a1rforceinc i.q12a2rforceinc i.q12a3rforceinc i.q12a4rforceinc ///
	 i.q12a5rforceinc i.q12a6rforceinc i.q12b1rforceinc i.q12b2rforceinc i.q12b3rforceinc i.q12b4rforceinc i.q12b5rforceinc i.q12b6rforceinc i.q12b7rforceinc ///
	 i.q12b8rforceinc, over(povcat3) xtab body(ones) digits(0) percentage below_last sheet("Table 4 Insurance")
	 
// Describe and test for differences by race/ethnicity
gumm i.q11frforceinc i.q11afinal i.q11bfinal i.q11cfinal i.q11dfinal i.q11efinal i.q12rfinal i.q12a1rforceinc i.q12a2rforceinc i.q12a3rforceinc i.q12a4rforceinc ///
	 i.q12a5rforceinc i.q12a6rforceinc i.q12b1rforceinc i.q12b2rforceinc i.q12b3rforceinc i.q12b4rforceinc i.q12b5rforceinc i.q12b6rforceinc i.q12b7rforceinc ///
	 i.q12b8rforceinc, over(race1) xtab body(ones) digits(0) percentage below_last sheet("Table 4 Insurance")
	 
// Describe and test for differences by insurance type
gumm i.q11frforceinc i.q11afinal i.q11bfinal i.q11cfinal i.q11dfinal i.q11efinal, over(insurancecat3) xtab body(ones) digits(0) percentage below_last sheet("Table 4 Insurance")

// Describe and test for differences by nativity
gumm i.q11frforceinc i.q11afinal i.q11bfinal i.q11cfinal i.q11dfinal i.q11efinal i.q12rfinal i.q12a1rforceinc i.q12a2rforceinc i.q12a3rforceinc i.q12a4rforceinc ///
	 i.q12a5rforceinc i.q12a6rforceinc i.q12b1rforceinc i.q12b2rforceinc i.q12b3rforceinc i.q12b4rforceinc i.q12b5rforceinc i.q12b6rforceinc i.q12b7rforceinc ///
	 i.q12b8rforceinc, over(nativity) xtab body(ones) digits(0) percentage below_last sheet("Table 4 Insurance")
	 
// Accidentally left off Y/N of whether or not someone had insurance to main tables. Because the above output is already linked to the table shells, exporting below.
gtab q9r,   body(b.0) subtitle("Are you currently insured?") continue

gumm i.q9r, over(agecat3) 		xtab body(ones) digits(0) percentage below_last sheet("Table 4 Insurance")
gumm i.q9r, over(povcat3) 		xtab body(ones) digits(0) percentage below_last sheet("Table 4 Insurance")
gumm i.q9r, over(insurancecat3) xtab body(ones) digits(0) percentage below_last sheet("Table 4 Insurance")
gumm i.q9r, over(race1) 		xtab body(ones) digits(0) percentage below_last sheet("Table 4 Insurance")
gumm i.q9r, over(nativity) 		xtab body(ones) digits(0) percentage below_last sheet("Table 4 Insurance")

gtab insuredallyear, 	 						body(b.0) subtitle("Insured all year") continue
gtab uninsuredallyear, 	 						body(b.0) subtitle("Uninsured all year") continue
gtab q13final, 	 								body(b.0) subtitle("No. of Months insured in past year") continue
gtab lostinsurance12mo, 						body(b.0) subtitle("Lost insurance in past year") continue
gtab q14afinal, 	 							body(b.0) subtitle("Lost insurance: Couldn't afford") continue
gtab q14bfinal, 	 							body(b.0) subtitle("Lost insurance: Big life change") continue
gtab q14cfinal, 	 							body(b.0) subtitle("Lost insurance: No longer eligible because made too much money") continue
gtab q14dfinal, 	 							body(b.0) subtitle("Lost insurance: Got too old for parents' plan") continue
gtab q14efinal, 	 							body(b.0) subtitle("Lost insurance: Couldn't provide necessary paperwork") continue
gtab q14ffinal, 	 							body(b.0) subtitle("Lost insurance: Plan was cancelled") continue
gtab q14gfinal, 	 							body(b.0) subtitle("Lost insurance: Other reason") continue

gumm i.insuredallyear i.uninsuredallyear i.q13final i.lostinsurance12mo i.q14afinal i.q14bfinal i.q14cfinal i.q14dfinal i.q14efinal i.q14ffinal i.q14gfinal, ///
	 over(agecat3) xtab body(ones) digits(0) percentage below_last sheet("Table 4 Insurance")
gumm i.insuredallyear i.uninsuredallyear i.q13final  i.lostinsurance12mo i.q14afinal i.q14bfinal i.q14cfinal i.q14dfinal i.q14efinal i.q14ffinal i.q14gfinal, ///
	 over(povcat3) xtab body(ones) digits(0) percentage below_last sheet("Table 4 Insurance")
gumm i.insuredallyear i.uninsuredallyear i.q13final i.lostinsurance12mo i.q14afinal i.q14bfinal i.q14cfinal i.q14dfinal i.q14efinal i.q14ffinal i.q14gfinal, ///
	 over(insurancecat4) xtab body(ones) digits(0) percentage below_last sheet("Table 4 Insurance")
gumm i.insuredallyear i.uninsuredallyear i.q13final i.lostinsurance12mo i.q14afinal i.q14bfinal i.q14cfinal i.q14dfinal i.q14efinal i.q14ffinal i.q14gfinal, ///
	 over(race1) xtab body(ones) digits(0) percentage below_last sheet("Table 4 Insurance")
gumm i.insuredallyear i.uninsuredallyear i.q13final  i.lostinsurance12mo i.q14afinal i.q14bfinal i.q14cfinal i.q14dfinal i.q14efinal i.q14ffinal i.q14gfinal, ///
	 over(nativity) xtab body(ones) digits(0) percentage below_last sheet("Table 4 Insurance")


** Additional and/or appendix tables

// Additional tables (may become appendix table(s) or just for the sake of looking tables)

gtab inconsistencytest,   body(b.0) subtitle("Any inconsistencies on survey?") sheet("Appendix tables")
gumm i.inconsistencytest, over(language) xtab body(ones) digits(0) percentage below_last sheet("Appendix tables")
gumm i.inconsistencytest, over(nativity) xtab body(ones) digits(0) percentage below_last sheet("Appendix tables")
gumm i.inconsistencytest, over(povcat3) xtab body(ones) digits(0) percentage below_last sheet("Appendix tables")
gumm i.inconsistencytest, over(agecat3) xtab body(ones) digits(0) percentage below_last sheet("Appendix tables")
gumm i.inconsistencytest, over(education) xtab body(ones) digits(0) percentage below_last sheet("Appendix tables")


gumm i.q11frforceinc i.q11afinal i.q11bfinal i.q11cfinal i.q11dfinal i.q11efinal i.q12rfinal i.q12a1rforceinc i.q12a2rforceinc i.q12a3rforceinc i.q12a4rforceinc ///
	 i.q12a5rforceinc i.q12a6rforceinc i.q12b1rforceinc i.q12b2rforceinc i.q12b3rforceinc i.q12b4rforceinc i.q12b5rforceinc i.q12b6rforceinc i.q12b7rforceinc ///
	 i.q12b8rforceinc, over(agecat5) xtab body(ones) digits(0) percentage below_last sheet("Appendix tables")

