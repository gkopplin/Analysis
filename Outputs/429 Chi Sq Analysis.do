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

gutt using "K:\Projects\429 OPA-ACA\Component 3 - Client survey\Analysis\Prints\429 Tables docking station chi sq.xlsx", replace

** Table 2 Chi Sq Statistics

// Testing all Table 2 vars over insurance type
gtab usepill 			insurancecat3, svy percent chi2 subtitle("Use pill x insurance cat") continue
gtab usepatchringshot   insurancecat3, svy percent chi2 subtitle("Use patchringshot x insurance cat") continue
gtab useIUDimp 			insurancecat3, svy percent chi2 subtitle("Use IUD imp x insurance cat") continue
gtab useothermethod 	insurancecat3, svy percent chi2 subtitle("Use other mthd x insurance cat") continue
gtab usenone 			insurancecat3, svy percent chi2 subtitle("Use no mthd x insurance cat") continue
gtab wantpill 			insurancecat3, svy percent chi2 subtitle("Want pill x insurance cat") continue
gtab wantpatchringshot  insurancecat3, svy percent chi2 subtitle("Want patchringshot x insurance cat") continue
gtab wantIUDimp 		insurancecat3, svy percent chi2 subtitle("Want IUD imp x insurance cat") continue
gtab wantEC 			insurancecat3, svy percent chi2 subtitle("Want EC x insurance cat") continue
gtab wantothermethod 	insurancecat3, svy percent chi2 subtitle("Want other mthd x insurance cat") continue
gtab notseekingchange 	insurancecat3, svy percent chi2 subtitle("No method change x insurance cat") continue
gtab q5arforce 			insurancecat3, svy percent chi2 subtitle("Change bc learned new things x insurance cat") continue
gtab q5brforce 			insurancecat3, svy percent chi2 subtitle("Change bc can now afford mthd x insurance cat") continue
gtab q5crforce 			insurancecat3, svy percent chi2 subtitle("Change bc can't afford old mthd x insurance cat") continue
gtab q5drforce 			insurancecat3, svy percent chi2 subtitle("Change bc side effectsx insurance cat") continue
gtab q5erforce 			insurancecat3, svy percent chi2 subtitle("change bc UP x insurance cat") continue
gtab q5grforce 			insurancecat3, svy percent chi2 subtitle("Change bc other reason x insurance cat") sheet("Table 2 Method Use & Switching")

// Testing all Table 2 vars over insurance status (insured/uninsured)
gtab usepill 			q9r, svy percent chi2 subtitle("Use pill x insurance status") continue
gtab usepatchringshot   q9r, svy percent chi2 subtitle("Use patchringshot x insurance status") continue
gtab useIUDimp 			q9r, svy percent chi2 subtitle("Use IUD imp x insurance status") continue
gtab useothermethod 	q9r, svy percent chi2 subtitle("Use other mthd x insurance status") continue
gtab usenone 			q9r, svy percent chi2 subtitle("Use no mthd x insurance status") continue
gtab wantpill 			q9r, svy percent chi2 subtitle("Want pill x insurance status") continue
gtab wantpatchringshot  q9r, svy percent chi2 subtitle("Want patchringshot x insurance status") continue
gtab wantIUDimp 		q9r, svy percent chi2 subtitle("Want IUD imp x insurance status") continue
gtab wantEC 			q9r, svy percent chi2 subtitle("Want EC x insurance status") continue
gtab wantothermethod 	q9r, svy percent chi2 subtitle("Want other mthd x insurance status") continue
gtab notseekingchange 	q9r, svy percent chi2 subtitle("No method change x insurance status") continue
gtab q5arforce 			q9r, svy percent chi2 subtitle("Change bc learned new things x insurance status") continue
gtab q5brforce 			q9r, svy percent chi2 subtitle("Change bc can now afford mthd x insurance status") continue
gtab q5crforce 			q9r, svy percent chi2 subtitle("Change bc can't afford old mthd x insurance status") continue
gtab q5drforce 			q9r, svy percent chi2 subtitle("Change bc side effectsx insurance status") continue
gtab q5erforce 			q9r, svy percent chi2 subtitle("change bc UP x insurance status") continue
gtab q5grforce 			q9r, svy percent chi2 subtitle("Change bc other reason x insurance status") below_last sheet("Table 2 Method Use & Switching")


** Table 3 Chi Sq Statistics


// Testing all Table 3 variables across insurance type
gtab firstvisit							insurancecat3, svy percent chi2 subtitle("First visit? x insurance cat") continue

gtab visitreason1 	 					insurancecat3, svy percent chi2 subtitle("Visit reason x insurance cat") continue

gtab servicesavailablegrp 	 			insurancecat3, svy percent chi2 subtitle("Smgrp services avail x insurance cat") continue
gtab q6ar 	 							insurancecat3, svy percent chi2 subtitle("only place x insurance cat") continue
gtab q6er 	 							insurancecat3, svy percent chi2 subtitle("can get method x insurance cat") continue
gtab q6fr 	 							insurancecat3, svy percent chi2 subtitle("teens and YA x insurance cat") continue

gtab qualconveniencegrp 	 			insurancecat3, svy percent chi2 subtitle("smgrp qual convenience x insurance cat") continue
gtab q6dr 	 							insurancecat3, svy percent chi2 subtitle("convenient loc x insurance cat") continue
gtab q6gr 	 							insurancecat3, svy percent chi2 subtitle("confidential x insurance cat") continue
gtab q6hr 	 							insurancecat3, svy percent chi2 subtitle("staff respectful x insurance cat") continue
gtab q6ir 	 							insurancecat3, svy percent chi2 subtitle("referrals x insurance cat") continue

gtab familiaritygrp		 				insurancecat3, svy percent chi2 subtitle("Smgrp familiarity x insurance cat") continue
gtab q6br 	 							insurancecat3, svy percent chi2 subtitle("Been here before x insurance cat") continue
gtab q6cr 	 							insurancecat3, svy percent chi2 subtitle("Recommended x insurance cat") continue

gtab affordabilitygrp 	 				insurancecat3, svy percent chi2 subtitle("Smgrp affordability x insurance cat") continue
gtab q6jr 	 							insurancecat3, svy percent chi2 subtitle("free/low-cost x insurance cat") continue
gtab q6kr 	 							insurancecat3, svy percent chi2 subtitle("can use insurance x insurance cat") continue

gtab q8 	 							insurancecat3, svy percent chi2 subtitle("Gone anywhere for care? x insurance cat") continue
gtab hadBCvisit 	 					insurancecat3, svy percent chi2 subtitle("Had BC visit? x insurance cat") continue
gtab noBCvisit	 	 					insurancecat3, svy percent chi2 subtitle("No BC visit? x insurance cat") continue
gtab q7arforce	 	 					insurancecat3, svy percent chi2 subtitle("No reason to x insurance cat") continue
gtab q7brforce	 	 					insurancecat3, svy percent chi2 subtitle("had GYN exam x insurance cat") continue
gtab q7crforce	 	 					insurancecat3, svy percent chi2 subtitle("not comfortable x insurance cat") continue
gtab q7drforce	 	 					insurancecat3, svy percent chi2 subtitle("couldn't afford x insurance cat") continue
gtab q7erforce 		 					insurancecat3, svy percent chi2 subtitle("too inconvenient x insurance cat") continue
gtab q7frforce	 	 					insurancecat3, svy percent chi2 subtitle("didn't want anyone to know x insurance cat") continue
gtab q7grforce	 	 					insurancecat3, svy percent chi2 subtitle("other reasons x insurance cat") sheet("Table 3 Healthcare Behaviors")


// Testing all Table 3 variables across insurance status (insured/uninsured)
gtab firstvisit							q9r, svy percent chi2 subtitle("First visit? x insurance status") continue

gtab visitreason1 	 					q9r, svy percent chi2 subtitle("Visit reason x insurance status") continue

gtab servicesavailablegrp 	 			q9r, svy percent chi2 subtitle("Smgrp services avail x insurance status") continue
gtab q6ar 	 							q9r, svy percent chi2 subtitle("only place x insurance status") continue
gtab q6er 	 							q9r, svy percent chi2 subtitle("can get method x insurance status") continue
gtab q6fr 	 							q9r, svy percent chi2 subtitle("teens and YA x insurance status") continue

gtab qualconveniencegrp 	 			q9r, svy percent chi2 subtitle("smgrp qual convenience x insurance status") continue
gtab q6dr 	 							q9r, svy percent chi2 subtitle("convenient loc x insurance status") continue
gtab q6gr 	 							q9r, svy percent chi2 subtitle("confidential x insurance status") continue
gtab q6hr 	 							q9r, svy percent chi2 subtitle("staff respectful x insurance status") continue
gtab q6ir 	 							q9r, svy percent chi2 subtitle("referrals x insurance status") continue

gtab familiaritygrp		 				q9r, svy percent chi2 subtitle("Smgrp familiarity x insurance status") continue
gtab q6br 	 							q9r, svy percent chi2 subtitle("Been here before x insurance status") continue
gtab q6cr 	 							q9r, svy percent chi2 subtitle("Recommended x insurance status") continue

gtab affordabilitygrp 	 				q9r, svy percent chi2 subtitle("Smgrp affordability x insurance status") continue
gtab q6jr 	 							q9r, svy percent chi2 subtitle("free/low-cost x insurance status") continue
gtab q6kr 	 							q9r, svy percent chi2 subtitle("can use insurance x insurance status") continue

gtab q8 	 							q9r, svy percent chi2 subtitle("Gone anywhere for care? x insurance status") continue
gtab hadBCvisit 	 					q9r, svy percent chi2 subtitle("Had BC visit? x insurance status") continue
gtab noBCvisit	 	 					q9r, svy percent chi2 subtitle("No BC visit? x insurance status") continue
gtab q7arforce	 	 					q9r, svy percent chi2 subtitle("No reason to x insurance status") continue
gtab q7brforce	 	 					q9r, svy percent chi2 subtitle("had GYN exam x insurance status") continue
gtab q7crforce	 	 					q9r, svy percent chi2 subtitle("not comfortable x insurance status") continue
gtab q7drforce	 	 					q9r, svy percent chi2 subtitle("couldn't afford x insurance status") continue
gtab q7erforce 		 					q9r, svy percent chi2 subtitle("too inconvenient x insurance status") continue
gtab q7frforce	 	 					q9r, svy percent chi2 subtitle("didn't want anyone to know x insurance status") continue
gtab q7grforce	 	 					q9r, svy percent chi2 subtitle("other reasons x insurance status") below_last sheet("Table 3 Healthcare Behaviors")


// Testing all Table 3 variables across clinic type
gtab firstvisit							factype, svy percent chi2 subtitle("First visit? x factype") continue

gtab visitreason1 	 					factype, svy percent chi2 subtitle("Visit reason x factype") continue

gtab servicesavailablegrp 	 			factype, svy percent chi2 subtitle("Smgrp services avail x factype") continue
gtab q6ar 	 							factype, svy percent chi2 subtitle("only place x factype") continue
gtab q6er 	 							factype, svy percent chi2 subtitle("can get method x factype") continue
gtab q6fr 	 							factype, svy percent chi2 subtitle("teens and YA x factype") continue

gtab qualconveniencegrp 	 			factype, svy percent chi2 subtitle("smgrp qual convenience x factype") continue
gtab q6dr 	 							factype, svy percent chi2 subtitle("convenient loc x factype") continue
gtab q6gr 	 							factype, svy percent chi2 subtitle("confidential x factype") continue
gtab q6hr 	 							factype, svy percent chi2 subtitle("staff respectful x factype") continue
gtab q6ir 	 							factype, svy percent chi2 subtitle("referrals x factype") continue

gtab familiaritygrp		 				factype, svy percent chi2 subtitle("Smgrp familiarity x factype") continue
gtab q6br 	 							factype, svy percent chi2 subtitle("Been here before x factype") continue
gtab q6cr 	 							factype, svy percent chi2 subtitle("Recommended x factype") continue

gtab affordabilitygrp 	 				factype, svy percent chi2 subtitle("Smgrp affordability x factype") continue
gtab q6jr 	 							factype, svy percent chi2 subtitle("free/low-cost x factype") continue
gtab q6kr 	 							factype, svy percent chi2 subtitle("can use insurance x factype") continue

gtab q8 	 							factype, svy percent chi2 subtitle("Gone anywhere for care? x factype") continue
gtab hadBCvisit 	 					factype, svy percent chi2 subtitle("Had BC visit? x factype") continue
gtab noBCvisit	 	 					factype, svy percent chi2 subtitle("No BC visit? x factype") continue
gtab q7arforce	 	 					factype, svy percent chi2 subtitle("No reason to x factype") continue
gtab q7brforce	 	 					factype, svy percent chi2 subtitle("had GYN exam x factype") continue
gtab q7crforce	 	 					factype, svy percent chi2 subtitle("not comfortable x factype") continue
gtab q7drforce	 	 					factype, svy percent chi2 subtitle("couldn't afford x factype") continue
gtab q7erforce 		 					factype, svy percent chi2 subtitle("too inconvenient x factype") continue
gtab q7frforce	 	 					factype, svy percent chi2 subtitle("didn't want anyone to know x factype") continue
gtab q7grforce	 	 					factype, svy percent chi2 subtitle("other reasons x factype") below_last sheet("Table 3 Healthcare Behaviors")

** Table 4

// Testing all Table 4 variables across age
gtab q9r								agecat3, svy percent chi2 subtitle("insurance status x age") continue
gtab q11frforceinc 	 					agecat3, svy percent chi2 subtitle("use insurance x age") continue
gtab q11afinal 	 						agecat3, svy percent chi2 subtitle("insurance doesn't cover x age") continue
gtab q11bfinal 	 						agecat3, svy percent chi2 subtitle("insurance can't be used x age") continue
gtab q11cfinal 	 						agecat3, svy percent chi2 subtitle("someone might find out x age") continue
gtab q11dfinal 	 						agecat3, svy percent chi2 subtitle("deductible copay too high x age") continue
gtab q11efinal 	 						agecat3, svy percent chi2 subtitle("other reason not using ins x age") continue

gtab q12rfinal 	 						agecat3, svy percent chi2 subtitle("try to get insurance? x age") continue
gtab q12a1rforceinc 	 				agecat3, svy percent chi2 subtitle("12a couldn't afford x age") continue
gtab q12a2rforceinc 	 				agecat3, svy percent chi2 subtitle("12a too complicated x age") continue
gtab q12a3rforceinc 	 				agecat3, svy percent chi2 subtitle("12a didn't have paperwork x age") continue
gtab q12a4rforceinc 	 				agecat3, svy percent chi2 subtitle("12a immigration status x age") continue
gtab q12a5rforceinc 	 				agecat3, svy percent chi2 subtitle("12a made too much money x age") continue
gtab q12a6rforceinc 	 				agecat3, svy percent chi2 subtitle("12a other reason x age") continue

gtab q12rfinal 	 						agecat3, svy percent chi2 subtitle("try to get insurance? x age") continue
gtab q12b1rforceinc 	 				agecat3, svy percent chi2 subtitle("12b don't want or need x age") continue
gtab q12b2rforceinc 	 				agecat3, svy percent chi2 subtitle("12b parents would have had to x age") continue
gtab q12b3rforceinc 	 				agecat3, svy percent chi2 subtitle("12b seemed expensive x age") continue
gtab q12b4rforceinc 	 				agecat3, svy percent chi2 subtitle("12b didn't know how x age") continue
gtab q12b5rforceinc 	 				agecat3, svy percent chi2 subtitle("12b didn't think could get paperwork x age") continue
gtab q12b6rforceinc 	 				agecat3, svy percent chi2 subtitle("12b immigration status x age") continue
gtab q12b7rforceinc 	 				agecat3, svy percent chi2 subtitle("12b too much money x age") continue
gtab q12b8rforceinc 	 				agecat3, svy percent chi2 subtitle("12b other reason x age") below_last sheet("Table 4 Insurance")

// Testing all Table 4 variables across poverty status

gtab q9r								povcat3, svy percent chi2 subtitle("insurance status x povcat3") continue
gtab q11frforceinc 	 					povcat3, svy percent chi2 subtitle("use insurance x povcat3") continue
gtab q11afinal 	 						povcat3, svy percent chi2 subtitle("insurance doesn't cover x povcat3") continue
gtab q11bfinal 	 						povcat3, svy percent chi2 subtitle("insurance can't be used x povcat3") continue
gtab q11cfinal 	 						povcat3, svy percent chi2 subtitle("someone might find out x povcat3") continue
gtab q11dfinal 	 						povcat3, svy percent chi2 subtitle("deductible copay too high x povcat3") continue
gtab q11efinal 	 						povcat3, svy percent chi2 subtitle("other reason not using ins x povcat3") continue

gtab q12rfinal 	 						povcat3, svy percent chi2 subtitle("try to get insurance? x povcat3") continue
gtab q12a1rforceinc 	 				povcat3, svy percent chi2 subtitle("12a couldn't afford x povcat3") continue
gtab q12a2rforceinc 	 				povcat3, svy percent chi2 subtitle("12a too complicated x povcat3") continue
gtab q12a3rforceinc 	 				povcat3, svy percent chi2 subtitle("12a didn't have paperwork x povcat3") continue
gtab q12a4rforceinc 	 				povcat3, svy percent chi2 subtitle("12a immigration status x povcat3") continue
gtab q12a5rforceinc 	 				povcat3, svy percent chi2 subtitle("12a made too much money x povcat3") continue
gtab q12a6rforceinc 	 				povcat3, svy percent chi2 subtitle("12a other reason x povcat3") continue

gtab q12rfinal 	 						povcat3, svy percent chi2 subtitle("try to get insurance? x povcat3") continue
gtab q12b1rforceinc 	 				povcat3, svy percent chi2 subtitle("12b don't want or need x povcat3") continue
gtab q12b2rforceinc 	 				povcat3, svy percent chi2 subtitle("12b parents would have had to x povcat3") continue
gtab q12b3rforceinc 	 				povcat3, svy percent chi2 subtitle("12b seemed expensive x povcat3") continue
gtab q12b4rforceinc 	 				povcat3, svy percent chi2 subtitle("12b didn't know how x povcat3") continue
gtab q12b5rforceinc 	 				povcat3, svy percent chi2 subtitle("12b didn't think could get paperwork x povcat3") continue
gtab q12b6rforceinc 	 				povcat3, svy percent chi2 subtitle("12b immigration status x povcat3") continue
gtab q12b7rforceinc 	 				povcat3, svy percent chi2 subtitle("12b too much money x povcat3") continue
gtab q12b8rforceinc 	 				povcat3, svy percent chi2 subtitle("12b other reason x povcat3") below_last sheet("Table 4 Insurance")


// Testing all Table 4 variables across race status
gtab q9r								race1, svy percent chi2 subtitle("insurance status x race1") continue
gtab q11frforceinc 	 					race1, svy percent chi2 subtitle("use insurance x race1") continue
gtab q11afinal 	 						race1, svy percent chi2 subtitle("insurance doesn't cover x race1") continue
gtab q11bfinal 	 						race1, svy percent chi2 subtitle("insurance can't be used x race1") continue
gtab q11cfinal 	 						race1, svy percent chi2 subtitle("someone might find out x race1") continue
gtab q11dfinal 	 						race1, svy percent chi2 subtitle("deductible copay too high x race1") continue
gtab q11efinal 	 						race1, svy percent chi2 subtitle("other reason not using ins x race1") continue

gtab q12rfinal 	 						race1, svy percent chi2 subtitle("try to get insurance? x race1") continue
gtab q12a1rforceinc 	 				race1, svy percent chi2 subtitle("12a couldn't afford x race1") continue
gtab q12a2rforceinc 	 				race1, svy percent chi2 subtitle("12a too complicated x race1") continue
gtab q12a3rforceinc 	 				race1, svy percent chi2 subtitle("12a didn't have paperwork x race1") continue
gtab q12a4rforceinc 	 				race1, svy percent chi2 subtitle("12a immigration status x race1") continue
gtab q12a5rforceinc 	 				race1, svy percent chi2 subtitle("12a made too much money x race1") continue
gtab q12a6rforceinc 	 				race1, svy percent chi2 subtitle("12a other reason x race1") continue

gtab q12rfinal 	 						race1, svy percent chi2 subtitle("try to get insurance? x race1") continue
gtab q12b1rforceinc 	 				race1, svy percent chi2 subtitle("12b don't want or need x race1") continue
gtab q12b2rforceinc 	 				race1, svy percent chi2 subtitle("12b parents would have had to x race1") continue
gtab q12b3rforceinc 	 				race1, svy percent chi2 subtitle("12b seemed expensive x race1") continue
gtab q12b4rforceinc 	 				race1, svy percent chi2 subtitle("12b didn't know how x race1") continue
gtab q12b5rforceinc 	 				race1, svy percent chi2 subtitle("12b didn't think could get paperwork x race1") continue
gtab q12b6rforceinc 	 				race1, svy percent chi2 subtitle("12b immigration status x race1") continue
gtab q12b7rforceinc 	 				race1, svy percent chi2 subtitle("12b too much money x race1") continue
gtab q12b8rforceinc 	 				race1, svy percent chi2 subtitle("12b other reason x race1") below_last sheet("Table 4 Insurance")


// Testing insured women across insurance type
gtab q9r								insurancecat3, svy percent chi2 subtitle("insurance status x insurancecat3") continue
gtab q11frforceinc 	 					insurancecat3, svy percent chi2 subtitle("use insurance x insurancecat3") continue
gtab q11afinal 	 						insurancecat3, svy percent chi2 subtitle("insurance doesn't cover x insurancecat3") continue
gtab q11bfinal 	 						insurancecat3, svy percent chi2 subtitle("insurance can't be used x insurancecat3") continue
gtab q11cfinal 	 						insurancecat3, svy percent chi2 subtitle("someone might find out x insurancecat3") continue
gtab q11dfinal 	 						insurancecat3, svy percent chi2 subtitle("deductible copay too high x insurancecat3") continue
gtab q11efinal 	 						insurancecat3, svy percent chi2 subtitle("other reason not using ins x insurancecat3") below_last sheet("Table 4 Insurance") 


// Testing all Table 4 variables across nativity
gtab q9r								nativity, svy percent chi2 subtitle("insurance status x nativity") continue
gtab q11frforceinc 	 					nativity, svy percent chi2 subtitle("use insurance x nativity") continue
gtab q11afinal 	 						nativity, svy percent chi2 subtitle("insurance doesn't cover x nativity") continue
gtab q11bfinal 	 						nativity, svy percent chi2 subtitle("insurance can't be used x nativity") continue
gtab q11cfinal 	 						nativity, svy percent chi2 subtitle("someone might find out x nativity") continue
gtab q11dfinal 	 						nativity, svy percent chi2 subtitle("deductible copay too high x nativity") continue
gtab q11efinal 	 						nativity, svy percent chi2 subtitle("other reason not using ins x nativity") continue

gtab q12rfinal 	 						nativity, svy percent chi2 subtitle("try to get insurance? x nativity") continue
gtab q12a1rforceinc 	 				nativity, svy percent chi2 subtitle("12a couldn't afford x nativity") continue
gtab q12a2rforceinc 	 				nativity, svy percent chi2 subtitle("12a too complicated x nativity") continue
gtab q12a3rforceinc 	 				nativity, svy percent chi2 subtitle("12a didn't have paperwork x nativity") continue
gtab q12a4rforceinc 	 				nativity, svy percent chi2 subtitle("12a immigration status x nativity") continue
gtab q12a5rforceinc 	 				nativity, svy percent chi2 subtitle("12a made too much money x nativity") continue
gtab q12a6rforceinc 	 				nativity, svy percent chi2 subtitle("12a other reason x nativity") continue

gtab q12rfinal 	 						nativity, svy percent chi2 subtitle("try to get insurance? x nativity") continue
gtab q12b1rforceinc 	 				nativity, svy percent chi2 subtitle("12b don't want or need x nativity") continue
gtab q12b2rforceinc 	 				nativity, svy percent chi2 subtitle("12b parents would have had to x nativity") continue
gtab q12b3rforceinc 	 				nativity, svy percent chi2 subtitle("12b seemed expensive x nativity") continue
gtab q12b4rforceinc 	 				nativity, svy percent chi2 subtitle("12b didn't know how x nativity") continue
gtab q12b5rforceinc 	 				nativity, svy percent chi2 subtitle("12b didn't think could get paperwork x nativity") continue
gtab q12b6rforceinc 	 				nativity, svy percent chi2 subtitle("12b immigration status x nativity") continue
gtab q12b7rforceinc 	 				nativity, svy percent chi2 subtitle("12b too much money x nativity") continue
gtab q12b8rforceinc 	 				nativity, svy percent chi2 subtitle("12b other reason x nativity") below_last sheet("Table 4 Insurance")

	 
// Testing unstable insurance Rs (bottom of Table 4) across age
gtab unstableinsurance				agecat3, svy percent chi2 subtitle("unstable insurance x nativity") continue
gtab q13final						agecat3, svy percent chi2 subtitle("mos w insurance x nativity") continue
gtab lostinsurance12mo				agecat3, svy percent chi2 subtitle("lost insurance last year x nativity") continue
gtab q14afinal						agecat3, svy percent chi2 subtitle("14 couldn't afford x nativity") continue
gtab q14bfinal						agecat3, svy percent chi2 subtitle("14 big life change x nativity") continue
gtab q14cfinal						agecat3, svy percent chi2 subtitle("14 too much m oney x nativity") continue
gtab q14dfinal						agecat3, svy percent chi2 subtitle("14 too old parents' x nativity") continue
gtab q14efinal						agecat3, svy percent chi2 subtitle("14 paperwork x nativity") continue
gtab q14ffinal						agecat3, svy percent chi2 subtitle("14 plan cancelled x nativity") continue	
gtab q14gfinal						agecat3, svy percent chi2 subtitle("14 other x nativity")	below_last sheet("Table 4 Insurance")

// Testing unstable insurance (bottom of Table 4) across poverty status
gtab unstableinsurance				povcat3, svy percent chi2 subtitle("unstable insurance x povcat3") continue
gtab q13final						povcat3, svy percent chi2 subtitle("mos w insurance x povcat3") continue
gtab lostinsurance12mo				povcat3, svy percent chi2 subtitle("lost insurance last year x povcat3") continue
gtab q14afinal						povcat3, svy percent chi2 subtitle("14 couldn't afford x povcat3") continue
gtab q14bfinal						povcat3, svy percent chi2 subtitle("14 big life change x povcat3") continue
gtab q14cfinal						povcat3, svy percent chi2 subtitle("14 too much m oney x povcat3") continue
gtab q14dfinal						povcat3, svy percent chi2 subtitle("14 too old parents' x povcat3") continue
gtab q14efinal						povcat3, svy percent chi2 subtitle("14 paperwork x povcat3") continue
gtab q14ffinal						povcat3, svy percent chi2 subtitle("14 plan cancelled x povcat3") continue	
gtab q14gfinal						povcat3, svy percent chi2 subtitle("14 other x povcat3")	below_last sheet("Table 4 Insurance")


// Testing unstable insurance (bottom of Table 4) across insurance type
gtab unstableinsurance				insurancecat3, svy percent chi2 subtitle("unstable insurance x insurancecat3") continue
gtab q13final						insurancecat3, svy percent chi2 subtitle("mos w insurance x insurancecat3") continue
gtab lostinsurance12mo				insurancecat3, svy percent chi2 subtitle("lost insurance last year x insurancecat3") continue
gtab q14afinal						insurancecat3, svy percent chi2 subtitle("14 couldn't afford x insurancecat3") continue
gtab q14bfinal						insurancecat3, svy percent chi2 subtitle("14 big life change x insurancecat3") continue
gtab q14cfinal						insurancecat3, svy percent chi2 subtitle("14 too much m oney x insurancecat3") continue
gtab q14dfinal						insurancecat3, svy percent chi2 subtitle("14 too old parents' x insurancecat3") continue
gtab q14efinal						insurancecat3, svy percent chi2 subtitle("14 paperwork x insurancecat3") continue
gtab q14ffinal						insurancecat3, svy percent chi2 subtitle("14 plan cancelled x insurancecat3") continue	
gtab q14gfinal						insurancecat3, svy percent chi2 subtitle("14 other x insurancecat3")	below_last sheet("Table 4 Insurance")


// Testing unstable insurance (bottom of Table 4) across insurance status (insured/uninsured)
gtab unstableinsurance				q9r, svy percent chi2 subtitle("unstable insurance x q9r") continue
gtab q13final						q9r, svy percent chi2 subtitle("mos w insurance x q9r") continue
gtab lostinsurance12mo				q9r, svy percent chi2 subtitle("lost insurance last year x q9r") continue
gtab q14afinal						q9r, svy percent chi2 subtitle("14 couldn't afford x q9r") continue
gtab q14bfinal						q9r, svy percent chi2 subtitle("14 big life change x q9r") continue
gtab q14cfinal						q9r, svy percent chi2 subtitle("14 too much m oney x q9r") continue
gtab q14dfinal						q9r, svy percent chi2 subtitle("14 too old parents' x q9r") continue
gtab q14efinal						q9r, svy percent chi2 subtitle("14 paperwork x q9r") continue
gtab q14ffinal						q9r, svy percent chi2 subtitle("14 plan cancelled x q9r") continue	
gtab q14gfinal						q9r, svy percent chi2 subtitle("14 other x q9r")	below_last sheet("Table 4 Insurance")


// Testing unstable insurance (bottom of Table 4) across race
gtab unstableinsurance				race1, svy percent chi2 subtitle("unstable insurance x race1") continue
gtab q13final						race1, svy percent chi2 subtitle("mos w insurance x race1") continue
gtab lostinsurance12mo				race1, svy percent chi2 subtitle("lost insurance last year x race1") continue
gtab q14afinal						race1, svy percent chi2 subtitle("14 couldn't afford x race1") continue
gtab q14bfinal						race1, svy percent chi2 subtitle("14 big life change x race1") continue
gtab q14cfinal						race1, svy percent chi2 subtitle("14 too much m oney x race1") continue
gtab q14dfinal						race1, svy percent chi2 subtitle("14 too old parents' x race1") continue
gtab q14efinal						race1, svy percent chi2 subtitle("14 paperwork x race1") continue
gtab q14ffinal						race1, svy percent chi2 subtitle("14 plan cancelled x race1") continue	
gtab q14gfinal						race1, svy percent chi2 subtitle("14 other x race1")	below_last sheet("Table 4 Insurance")


// Testing unstable insurance (bottom of Table 4) across nativity
gtab unstableinsurance				nativity, svy percent chi2 subtitle("unstable insurance x nativity") continue
gtab q13final						nativity, svy percent chi2 subtitle("mos w insurance x nativity") continue
gtab lostinsurance12mo				nativity, svy percent chi2 subtitle("lost insurance last year x nativity") continue
gtab q14afinal						nativity, svy percent chi2 subtitle("14 couldn't afford x nativity") continue
gtab q14bfinal						nativity, svy percent chi2 subtitle("14 big life change x nativity") continue
gtab q14cfinal						nativity, svy percent chi2 subtitle("14 too much m oney x nativity") continue
gtab q14dfinal						nativity, svy percent chi2 subtitle("14 too old parents' x nativity") continue
gtab q14efinal						nativity, svy percent chi2 subtitle("14 paperwork x nativity") continue
gtab q14ffinal						nativity, svy percent chi2 subtitle("14 plan cancelled x nativity") continue	
gtab q14gfinal						nativity, svy percent chi2 subtitle("14 other x nativity")	below_last sheet("Table 4 Insurance")



