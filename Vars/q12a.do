/* Q12a : If yes to q12, why didn't you get health insurance?
   Was written as a forced choice question, but some answered more than one.
   Will code both ways. */
   
// Rs who skipped entire question
gen q12amissing = .
replace q12amissing = 1 if (q12a == . & q12a1 !=1 & q12a2 != 1 & q12a3 != 1 & q12a4 != 1 & q12a5 != 1 & q12a6 != 1)   
label values q12amissing yes
label variable q12amissing "Q12a: Respondent skipped the entire question"

// Pull out those who should have skipped question based on q9r, indicating those who skipped who should have answered (i.e. true missings)
// Recoding so that those who skipped all Qs on pg 3 are in the N/A category    
gen q12amissingforce = .  
replace q12amissingforce = 1 if (q12 == . & q12a1 !=1 & q12a2 != 1 & q12a3 != 1 & q12a4 != 1 & q12a5 != 1 & q12a6 != 1)   
replace q12amissingforce = .a if (noinsurancepattern != 1)
label values q12amissingforce yesNA
label variable q12amissingforce "Q12a: Respondent skipped the entire question (forced skip pattern)" 
 

 	   
// Coding so that these can be looked at as if they were "check all" questions
// Forced skip pattern recodes based on q9r, using "noinsurancepattern"

forvalues i = 1/6 {
		gen q12a`i'rforce = 1 if (q12a == `i' | q12a`i' == 1)
		replace q12a`i'rforce = .b if q12amissingforce == 1
		replace q12a`i'rforce = .a if noinsurancepattern != 1
		label values q12a`i'rforce yesnoNAmissing
	} 
label variable q12a1r "Q12a: I couldn't afford insurance (forced based on q9r)"
label variable q12a2r "Q12a: It was too complicated (forced based on q9r)"
label variable q12a3r "Q12a: I didn't have the necessary paperwork (forced based on q9r)"
label variable q12a4r "Q12a: I wasn't eligible because of my or my family's immigration status (forced based on q9r)"
label variable q12a5r "Q12a: I wasn't eligible because I/we made too much money (forced based on q9r)"
label variable q12a6r "Q12a: Some other reason (forced based on q9r)"
	
// Forced skip pattern recodes that also move surveys with any inconsistencies
// into the "n/a" category	
forvalues i = 1/6 {
		gen q12a`i'rforceinc = 2
		replace q12a`i'rforceinc = 1 if (q12a == `i' | q12a`i' == 1)
		replace q12a`i'rforceinc = .a if q12rfinal == 2
		replace q12a`i'rforceinc = .b if q12amissingforce == 1
		replace q12a`i'rforceinc = .a if noinsurancepattern != 1
		replace q12a`i'rforceinc = .a if anyinconsistency == 1
		label values q12a`i'rforceinc yesnoNAmissing
}
label variable q12a1rforceinc "Q12a: I couldn't afford insurance (forced based on q9r, inconsistencies removed)"
label variable q12a2rforceinc "Q12a: It was too complicated (forced based on q9r, inconsistencies removed)"
label variable q12a3rforceinc "Q12a: I didn't have the necessary paperwork (forced based on q9r, inconsistencies removed)"
label variable q12a4rforceinc "Q12a: I wasn't eligible because of my or my family's immigration status (forced based on q9r, inconsistencies removed)"
label variable q12a5rforceinc "Q12a: I wasn't eligible because I/we made too much money (forced based on q9r, inconsistencies removed)"
label variable q12a6rforceinc "Q12a: Some other reason (forced based on q9r, inconsistencies removed)"
