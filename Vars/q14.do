/* Q14: If you lost your insurance at some point in the last 12 months, why did this occur?"
   Q was intended to be a forced choice, however some treated as a check all that apply. */
   
// Rs who skipped entire question
gen q14missing = .
replace q14missing = 1 if (q14 == . & q14a !=1 & q14b != 1 & q14c != 1 & q14d != 1 & q14e != 1 & q14f != 1 & q14g != 1 & q14h != 1)
label values q14missing yes
label variable q14missing "Q14: Respondent skipped the entire question"

// This doesn't really do anything, aside from moving missings into .b category
gen q14r = .
replace q14r = q14
replace q14r = 9 if q14ot ==1 & (q14a ==1 | q14b == 1 | q14c == 1 | q14d == 1 | q14e == 1 | q14f == 1 | q14g == 1 | q14h == 1)
replace q14r = .b if q14missing == 1

// Rs who had any inconsistency in their answers are forced into N/A category
gen q14rinc = .
replace q14rinc = q14
replace q14rinc = 9 if q14ot ==1 & (q14a ==1 | q14b == 1 | q14c == 1 | q14d == 1 | q14e == 1 | q14f == 1 | q14g == 1 | q14h == 1)
replace q14rinc = .b if q14missing == 1
replace q14rinc = .a if anyinconsistency == 1

<<<<<<< HEAD
=======
// This only excludes Rs who had inconsistencies btwn 13 and 14
gen q14rinc2 = .
replace q14rinc2 = q14
replace q14rinc2 = 9 if q14ot ==1 & (q14a ==1 | q14b == 1 | q14c == 1 | q14d == 1 | q14e == 1 | q14f == 1 | q14g == 1 | q14h == 1)
replace q14rinc2 = .b if q14missing == 1
replace q14rinc2 = .a if inconsistent1314 == 1
// 34 women selected more than one answer


// Create dummy for whether or not R lost insurance in past 12 months
gen lostinsurance12mo = .
replace lostinsurance12mo = 1 if q14 < 8
replace lostinsurance12mo = 2 if q14 == 8
replace lostinsurance12mo = .b if q14missing == 1
label define yesnotruemissing 1 "Yes" 2 "No" .b "True Missing"
label values lostinsurance12mo yesnotruemissing
label variable lostinsurance12mo "Q14: Lost insurance in past 12 months?"
// Among women who answered Q, ~30% lost insurance in the past year
>>>>>>> a41b51e7fea30f4f3d21d842cd1aaf3894566fd9

// Also coding so that these can be looked at as if they were "check all" questions

// Straight from raw data
forvalues i = 1/8 {
	local l : word `i' of a b c d e f g h
		gen     q14`l'r = 1 if (q14 == `i' | q14`l' == 1)
		replace q14`l'r = .b if q14missing == 1
		label values q14`l'r yesnoNAmissing
	}
label variable q14ar "Q14: I couldn't afford it anymore"
label variable q14br "Q14: I had a big change in my life"
label variable q14cr "Q14: I was no longer eligible because I/we made too much money"
label variable q14dr "Q14: I got too old for my paretns' plan"
label variable q14er "Q14: I couldn't provide the necessary paperwork"
label variable q14fr "Q14: My plan was cancelled"
label variable q14gr "Q14: Some other reason"
label variable q14hr "Q14: Didn't lose insurance in last 12 mo"

// Moving ANY inconsistent responses into N/A
forvalues i = 1/8 {
	local l : word `i' of a b c d e f g h
<<<<<<< HEAD
		gen 	q14`l'rinc = 2
		replace     q14`l'rinc = 1 if (q14 == `i' | q14`l' == 1)
=======
		gen     q14`l'rinc = 1 if (q14 == `i' | q14`l' == 1)
>>>>>>> a41b51e7fea30f4f3d21d842cd1aaf3894566fd9
		replace q14`l'rinc = .b if q14missing == 1
		replace q14`l'rinc = .a if anyinconsistency == 1
		label values q14`l'rinc yesnoNAmissing
	}

label variable q14arinc "Q14: I couldn't afford it anymore (inconsistencies removed)"
label variable q14brinc "Q14: I had a big change in my life (inconsistencies removed)"
label variable q14crinc "Q14: I was no longer eligible because I/we made too much money (inconsistencies removed)"
label variable q14drinc "Q14: I got too old for my paretns' plan (inconsistencies removed)"
label variable q14erinc "Q14: I couldn't provide the necessary paperwork (inconsistencies removed)"
label variable q14frinc "Q14: My plan was cancelled (inconsistencies removed)"
label variable q14grinc "Q14: Some other reason (inconsistencies removed)"
label variable q14hrinc "Q14: Didn't lose insurance in last 12 mo (inconsistencies removed)"
<<<<<<< HEAD

// Create "lost insurance" variable
gen lostinsurance12mo = .
replace lostinsurance12mo = 1 if (q14arinc == 1 | q14brinc == 1 | q14crinc == 1 | q14drinc == 1 | q14erinc == 1 | q14frinc == 1 | q14grinc == 1 )
replace lostinsurance12mo = 2 if q14hrinc == 1
label values lostinsurance12mo yesno

// Need to make this variable present as "among Rs who lost insurance in the past year"
foreach  letter in a b c d e f g {
	gen q14`letter'final = .
	replace q14`letter'final = 2 if lostinsurance12mo == 1
	replace q14`letter'final = 1 if q14`letter'rinc == 1
	replace q14`letter'final = . if q14hrinc == 1
	label values q14`letter'final yesno
}
** Insurance status all year

// Rs who had no insurance all year-- total Rs who were uninsured all year as % of those with "clean" insurance Q responses
gen uninsuredallyear = 2
// If R said "I didn't have ins in past 12 months" in q13 AND said they currently don't have health insurance
replace uninsuredallyear = 1 if q13r ==5 & noinsurancepattern == 1
// If R said in Q14 that they didn't lose their insurance in past year AND they currently don't have health insurance
replace uninsuredallyear = 1 if q14hrinc == 1 & noinsurancepattern == 1
// Pull out inconsistent responses from denominator
replace uninsuredallyear = .a if anyinconsistency == 1
label values uninsuredallyear yesnoNAmissing

// Rs who were insured all year-- total Rs who were insured all year as % of those with with "clean" insurance Q responses
gen insuredallyear = 2
// If R said "Didn't lose insured in past year" and are currently insured
replace insuredallyear = 1 if q14hrinc == 1 & haveinsurancepattern == 1
// Pull out inconsistent responses from  denominator
replace insuredallyear = .a if anyinconsistency == 1
label values insuredallyear yesnoNAmissing
=======
>>>>>>> a41b51e7fea30f4f3d21d842cd1aaf3894566fd9
