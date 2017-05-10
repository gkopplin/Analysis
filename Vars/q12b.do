/* Q12a : If yes to q12, why didn't you get health insurance?
   Was written as a forced choice question, but some answered more than one.
   Will code both ways. */
   
// missing 12a
// missing 12a force
// full tallies w/ force (mult responses)
// full tallies w/ force & inc dropped (mult responses)
// check all tally w/ force
// check all tally w/ force & inc dropped
   
// Rs who skipped entire question
gen q12bmissing = .
replace q12bmissing = 1 if (q12b == . & q12b1 !=1 & q12b2 != 1 & q12b3 != 1 & q12b4 != 1 & q12b5 != 1 & q12b6 != 1 & q12b7 != 1 & q12b8 != 1)   
label values q12bmissing yes
label variable q12bmissing "Q12b: Respondent skipped the entire question"

// Pull out those who should have skipped question, indicating those who skipped who should have answered (i.e. true missings)
// Recoding so that those who skipped all Qs on pg 3 are in the N/A category    
gen q12bmissingforce = .  
replace q12bmissingforce = 1 if (q12b == . & q12b1 !=1 & q12b2 != 1 & q12b3 != 1 & q12b4 != 1 & q12b5 != 1 & q12b6 != 1 & q12b7 != 1 & q12b8 != 1)   
replace q12bmissingforce = .a if (noinsurancepattern != 1)
label values q12bmissingforce yesNA
label variable q12bmissingforce "Q12b: Respondent skipped the entire question (forced skip pattern)" 
<<<<<<< HEAD
  	   
// Coding so that these can be looked at as if they were "check all" questions
=======
 
// "force" : forced skip pattern based on response to Q 9 
// Question as written, lumping together those who gave more than one response
gen q12brforce = . 
replace q12brforce = q12b
replace q12brforce = 9 if  q12aot == 1 & (q12b1 ==1 | q12b2 == 1 | q12b3 == 1 | q12b4 == 1 | q12b5 == 1 | q12b6 == 1 | q12b7 == 1 | q12b8 == 1) 
replace q12brforce = .b if q12bmissingforce == 1
replace q12brforce = .a if noinsurancepattern != 1
label define q12brforce 1 "I don't want or need insurance" 2 "My parents would have had to sign me up" 3 "It seemed too expensive" ///
					    4 "I didn't know how" 5 "I didn't think I could get the necessary paperwork" ///
					    6 "I couldn't because of my or my famiy's immigration status" 7 "I didn't think I was eligible beacuse I/we made too much money" ///
						8 "Other" 9" More than one response" .a "N/A" .b "Missing"
label values q12brforce	q12brforce
label variable q12brforce "Q12b: If no, why didn't you try to get health insurance (forced based on Q9)"

// Question as written, lumping together those who gave more than one response
// Forced based on Q9, and all inconsistent responses to insurance Qs moved to N/A
gen q12brforceinc = . 
replace q12brforceinc = q12b
replace q12brforceinc = 9 if  q12aot == 1 & (q12b1 ==1 | q12b2 == 1 | q12b3 == 1 | q12b4 == 1 | q12b5 == 1 | q12b6 == 1 | q12b7 == 1 | q12b8 == 1) 
replace q12brforceinc = .b if q12bmissingforce   == 1
replace q12brforceinc = .a if noinsurancepattern != 1
replace q12brforceinc = .a if anyinconsistency   == 1		
label values q12brforceinc q12brforce
label variable q12brforceinc "Q12b: If no, why didn't you try to get health insurance? (forced based on Q9, inconsistencies dropped)"
 	   
// Also coding so that these can be looked at as if they were "check all" questions

>>>>>>> a41b51e7fea30f4f3d21d842cd1aaf3894566fd9
// Forced skip pattern recodes
forvalues i = 1/8 {
		gen q12b`i'r = 1 if (q12b == `i' | q12b`i' == 1)
		replace q12b`i'r = .b if q12bmissingforce == 1
		replace q12b`i'r = .a if noinsurancepattern != 1
		label values q12b`i'r yesnoNAmissing
	} 
	
// Forced skip pattern recodes that also move surveys with any inconsistencies
// into the "n/a" category	

forvalues i = 1/8 {
<<<<<<< HEAD
		gen q12b`i'rforceinc = 2
		replace q12b`i'rforceinc = 1 if (q12b == `i' | q12b`i' == 1)
		replace q12b`i'rforceinc = .a if q12rfinal == 1
		replace q12b`i'rforceinc = .b if q12bmissingforce == 1
		replace q12b`i'rforceinc = .a if noinsurancepattern != 1
		replace q12b`i'rforceinc = .a if anyinconsistency == 1
		label values q12b`i'rforceinc yesnoNAmissing
}

label variable q12b1rforceinc "Q12b: Don't want/need insurance (forced based on q9r, inconsistencies removed)"
label variable q12b2rforceinc "Q12b: Parents would have had to sign up (forced based on q9r, inconsistencies removed)"
label variable q12b3rforceinc "Q12b: Seemed too expensive to get insurance (forced based on q9r, inconsistencies removed)"
label variable q12b4rforceinc "Q12b: I didn't know how to get insurance (forced based on q9r, inconsistencies removed)"
label variable q12b5rforceinc "Q12b: Didn't think I could get necessary paperwork (forced based on q9r, inconsistencies removed)"
label variable q12b6rforceinc "Q12b: Couldn't get ins. because of immigration status (forced based on q9r, inconsistencies removed)"
label variable q12b7rforceinc "Q12b: Didn't think I was eligible because we made too much money (forced based on q9r, inconsistencies removed)"
label variable q12b8rforceinc "Q12b: Some other reason (forced based on q9r, inconsistencies removed)"
=======
		gen q12b`i'rinc = 1 if (q12b == `i' | q12b`i' == 1)
		replace q12b`i'rinc = .b if q12bmissingforce == 1
		replace q12b`i'rinc = .a if noinsurancepattern != 1
		replace q12b`i'rinc = .a if anyinconsistency == 1
		label values q12b`i'rinc yesnoNAmissing
}

>>>>>>> a41b51e7fea30f4f3d21d842cd1aaf3894566fd9
