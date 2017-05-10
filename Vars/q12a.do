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
 
<<<<<<< HEAD
 	   
// Coding so that these can be looked at as if they were "check all" questions
// Forced skip pattern recodes based on q9r, using "noinsurancepattern"
=======
// "force" : forced skip pattern based on response to Q 9 
// Question as written, lumping together those who gave more than one response
gen q12arforce = . 
replace q12arforce = q12a
replace q12arforce = 7 if  q12aot == 1 & (q12a1 ==1 | q12a2 == 1 | q12a3 == 1 | q12a4 == 1 | q12a5 == 1 | q12a6 == 1) 
replace q12arforce = .b if q12amissingforce == 1
replace q12arforce = .a if noinsurancepattern != 1
label define q12arforce 1 "I couldn't afford it" 2 "It was too complicated" 3 "I didn't have the necessary paperwork" ///
					    4 "I wasn't eligible because of my or my family's immigration status" 5 "I wasn't eligible because I/we made too much money" ///
					    6 "Other" 7 "More than one response" .a "N/A" .b "Missing"
label values q12arforce	q12arforce
label variable q12arforce "Q12a: If yes, why didn't you get insurance? (forced based on Q9)"

// Question as written, lumping together those who gave more than one response
// Forced based on Q9, and all inconsistent responses to insurance Qs moved to N/A
gen q12arforceinc = . 
replace q12arforceinc = q12a
replace q12arforceinc = 7 if  q12aot == 1 & (q12a1 ==1 | q12a2 == 1 | q12a3 == 1 | q12a4 == 1 | q12a5 == 1 | q12a6 == 1) 
replace q12arforceinc = .b if q12amissingforce   == 1
replace q12arforceinc = .a if noinsurancepattern != 1
replace q12arforceinc = .a if anyinconsistency   == 1		
label values q12arforceinc q12arforce
label variable q12arforceinc "Q12a: If yes, why didn't you get health insurance? (forced based on Q9, inconsistencies dropped)"
 	   
// Also coding so that these can be looked at as if they were "check all" questions

// Forced skip pattern recodes based on q9r
>>>>>>> a41b51e7fea30f4f3d21d842cd1aaf3894566fd9
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
<<<<<<< HEAD
forvalues i = 1/6 {
		gen q12a`i'rforceinc = 2
		replace q12a`i'rforceinc = 1 if (q12a == `i' | q12a`i' == 1)
		replace q12a`i'rforceinc = .a if q12rfinal == 2
=======

forvalues i = 1/6 {
		gen q12a`i'rforceinc = 1 if (q12a == `i' | q12a`i' == 1)
>>>>>>> a41b51e7fea30f4f3d21d842cd1aaf3894566fd9
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
