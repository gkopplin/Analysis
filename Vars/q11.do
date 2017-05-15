/* Q11 "If you have health insurance and do NOT expect to use it to pay for any 
	of today's visit, why not?"
	Intended to be a single response, but some Rs answered more than one. */

// Rs who skipped entire question
gen q11missing = .
replace q11missing = 1 if (q11 == . & q11a != 1 & q11b != 1 & q11c != 1 & q11d != 1 & q11e != 1 & q11f != 1)
label values q11missing yes
label variable q11missing "Q11: Respondent skipped the entire question"

// Pull out those who should have skipped question, indicating those who skipped who should have answered (i.e. true missings)
// Recoding so that those who skipped all Qs on pg 3 are in the N/A category
gen q11missingforce = .
replace q11missingforce = 1  if (q11 == . & q11a != 1 & q11b != 1 & q11c != 1 & q11d != 1 & q11e != 1 & q11f != 1)
replace q11missingforce = .a if (haveinsurancepattern != 1)
label values q11missingforce yesNA
label variable q11missingforce "Q11: Respondent skipped the entire question but should have answered (forced skip pattern)"


// "force" : forced skip pattern based on response to Q 9
// Note that those who skipped Q9 are 
// A small number of women chose more than one answer to this question.
// For now will lump them together-- need to resolve with MK and MZ
gen q11rforce = .
replace q11rforce = q11
replace q11rforce = 7 if q11ot == 1 & (q11a == 1 | q11b == 1 | q11c == 1 | q11d == 1 | q11e == 1 | q11f ==1)
replace q11rforce = .b if q11missingforce == 1
replace q11rforce = .a if haveinsurancepattern != 1
label define q11rforce 1 "My insurance doesn't cover service" 2 "My insurance can't be used here" ///
								  3 "Can't use because, if I did, someone might find out" 4 "Deductible or co-pay too high" ///
								  5 "Other" 6 "I expect to use health insurance to pay for some or part of this visit" ///
								  7 "More than one response" .a "N/A" .b "Missing"
label values q11rforce q11rforce
label variable q11rforce "Q11: If you have insurance but don't expect to use it, why not? (forced based on Q9)"

// "forceinc" : forcing Rs based on q9 and making women N/A if they
// 				responded inconsistently to any insurance Qs								  
gen q11rforceinc = .
replace q11rforceinc = q11
replace q11rforceinc = 7 if q11ot == 1
replace q11rforceinc = .b if q11missingforce == 1
replace q11rforceinc = .a if haveinsurancepattern != 1
replace q11rforceinc = .a if anyinconsistency ==1
label values q11rforceinc q11rforce
label variable q11rforceinc "Q11: If you have insurance but don't expect to use it, why not? (forced based on Q9, inconsistencies dropped)"

// Among women who answered Q11 (who were supposed to answer it based on Q9 and had no
// inconsistencies in their insurance responses), which intend to use their insurance at this visit
gen usingheldinsurance = .
replace usingheldinsurance = 1 if (q11 == 6 | q11f == 1)
replace usingheldinsurance = 2 if (q11 <6 & q11 !=.)
replace usingheldinsurance = .b if q11missingforce == 1
replace usingheldinsurance = .a if haveinsurancepattern != 1
replace usingheldinsurance = .a if anyinconsistency == 1
label values usingheldinsurance yesnoNAmissing
label variable usingheldinsurance "Q11: Plan to use insurance today"
// 84% of women who answered this question intend to use their insurance
// 219 don't intend to use their insurance 

// Among women who said they have insurance, but don't plan to use it 
// (and answered Q11 who were supposed to and did not have any insurance inconsistencies), 
// what is the distribution of reasons why they're not using their insurance? 
gen q11whynotusingins = q11rforceinc
replace q11whynotusingins = .c if usingheldinsurance == 1
label define q11whynotusingins 1 "My insurance doesn't cover service" 2 "My insurance can't be used here" ///
								  3 "Can't use because, if I did, someone might find out" 4 "Deductible or co-pay too high" ///
								  5 "Other" 6 "I expect to use health insurance to pay for some or part of this visit" ///
								  7 "More than one response" .a "N/A" .b "Missing" .c "N/A bc using insurance"
label values q11whynotusingins q11whynotusingins
label variable q11whynotusingins "Q11: Why aren't you using your insurance? (Among women who are insured but don't plan to use"
// Because n==219, the 24 who answered more than one response becomes 11%.
// ~10 combinations of answers, so we likely need to establish hierarchy. MZ MK discussion.

// Also coding so that these can be looked at as if they were "check all" questions

// Forced skip pattern recodes based on q9r
forvalues i = 1/6 {
	local l : word `i' of a b c d e f
		gen q11`l'rforce = 1 if (q11 == `i' | q11`l' == 1)
		replace q11`l'rforce = .b if q11missingforce == 1
		replace q11`l'rforce = .a if haveinsurancepattern != 1
		label values q11`l'rforce yesnoNAmissing
	} 
	
label variable q11arforce "Q11: My insurance doesn't cover service I'm getting (forced based on q9r)"
label variable q11brforce "Q11: My insurance cant' be used here (forced based on q9r)"
label variable q11crforce "Q11: Can't use insurance because someone might find out (forced based on q9r)"
label variable q11drforce "Q11: My deductible or co-pay is too high (forced based on q9r)"
label variable q11erforce "Q11: Not using insurance for other reason (forced based on q9r)"
label variable q11frforce "Q11: I expect to use my health insurance (forced based on q9r)"
 
// Forced skip pattern recodes that also move surveys with any inconsistencies
// into the "n/a" category	
// Loop through answer vaules 1/6 as well as answer options a-f
forvalues i = 1/6 {
	local l : word `i' of a b c d e f
		// Set all equal to "no"
		gen q11`l'rforceinc = 2
		// Replace all with "yes" if R gave that answer in one of two ways
		replace q11`l'rforceinc = 1 if (q11 == `i' | q11`l' == 1)
		// Replace with .b if R skipped all of question 11
		replace q11`l'rforceinc = .b if q11missingforce == 1
		// Replace with .a (NA) if R should have skipped this question
		replace q11`l'rforceinc = .a if haveinsurancepattern != 1
		// Replace with .a (NA) if R was pulled from sample because of "dirty" insurance responses
		replace q11`l'rforceinc = .a if anyinconsistency == 1
		label values q11`l'rforceinc yesnoNAmissing
	}

label variable q11arforceinc "Q11: My insurance doesn't cover service I'm getting (forced based on q9r, inconsistencies removed)"
label variable q11brforceinc "Q11: My insurance cant' be used here (forced based on q9r, inconsistencies removed)"
label variable q11crforceinc "Q11: Can't use insurance because someone might find out (forced based on q9r, inconsistencies removed)"
label variable q11drforceinc "Q11: My deductible or co-pay is too high (forced based on q9r inconsistencies removed)"
label variable q11erforceinc "Q11: Not using insurance for other reason (forced based on q9r inconsistencies removed)"
label variable q11frforceinc "Q11: I expect to use my health insurance (forced based on q9r inconsistencies removed)"

// Have to create vars where the denominator == # who will NOT be using insurance
// For options a-e
// This is based on the vars that are forced based on q9r, with inconsistencies removed
// using q11frforceinc as the var that will adjust the denominator
gen q11afinal = q11arforceinc
replace q11afinal = .a if q11frforceinc == 1
label values q11afinal yesnoNAmissing

gen q11bfinal = q11brforceinc
replace q11bfinal = .a if q11frforceinc == 1
label values q11bfinal yesnoNAmissing

gen q11cfinal = q11crforceinc
replace q11cfinal = .a if q11frforceinc == 1
label values q11cfinal yesnoNAmissing

gen q11dfinal = q11drforceinc
replace q11dfinal = .a if q11frforceinc == 1
label values q11dfinal yesnoNAmissing

gen q11efinal = q11erforceinc
replace q11efinal = .a if q11frforceinc == 1
label values q11efinal yesnoNAmissing


label variable q11afinal "Q11: My insurance doesn't cover service I'm getting (forced, inc removed, among those not using ins)"
label variable q11bfinal "Q11: My insurance cant' be used here (forced, inc removed, among those not using ins)"
label variable q11cfinal "Q11: Can't use insurance because someone might find out (forced, inc removed, among those not using ins)"
label variable q11dfinal "Q11: My deductible or co-pay is too high (forced, inc removed, among those not using ins)"
label variable q11efinal "Q11: Not using insurance for other reason (forced, inc removed, among those not using ins)"
