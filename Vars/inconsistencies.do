/* This script flags surveys with inconsistent responses within the insurance questions*/
// Generating other vars to point out explicit inconsistencies, beyond just the "flag" var

// Gen variable that indicates Rs who gave answers for both 12a and 12b,
// shouldn't have happened if followed skip pattern properly
gen inconsistent12a12b = .
// Flag if neither 12a nor 12b were missing-- one of the two should be.
replace inconsistent12a12b = 1 if (q12a != . & q12b != .)
label values inconsistent12a12b yes
label variable inconsistent12a12b "Rs who answered both 12a and 12b, which goes against skip pattern"

// Rs who checked any responses on Qs 10 or 11 but said they had no insurance on Q9
gen inconsistenthaveinsurance = .
// Q9 is insurance status, if q9 == 2, R has no insurance
replace inconsistenthaveinsurance = 1 if q9 == 2 & (q10a !=. | q10b !=. | q10c !=. | q10d !=. | q10e !=. | q10f !=. | q10g !=. | q11 !=.)
label values inconsistenthaveinsurance yes
label variable inconsistenthaveinsurance "Rs who answered 'have insurance' Qs but said 'no' in Q9"

// Rs who checked any response on Qs in the 12 suite, but indicated that they had insurance on Q9
gen inconsistentnoinsurance = .
// Q9 is insurance question, if q9 == 1, R has insurance
replace inconsistentnoinsurance = 1 if q9 == 1 & (q12a != . | q12b !=.)
label values inconsistentnoinsurance yes
label variable inconsistentnoinsurance "Rs who answered 'no insurance' Qs but said 'yes' in Q9"

// Rs who said they didn't have health insurance in past 12mo
// in q13, but then gave a reason for why they lost insurance in past 12mo in q14
gen inconsistent1314 = .
replace inconsistent1314 = 1 if q13 == 5 & q14 < 8 
label values inconsistent1314 yes
label variable inconsistent1314 "Rs who answered didn't lose insurance past 12mo, then gave reason for loss"

// Creating var for "any inconsistencies" so that we can run tabs w/o them
// If any of the above inconsistencies are present, we'll leave them out of the insurance analysis.
// Note: var "flag" is a variable created in coding that flagged surveys with odd and/or inconsistent answers in the insurance section
gen anyinconsistency = .
replace anyinconsistency = 1 if (inconsistenthaveinsurance == 1 | inconsistentnoinsurance == 1 | inconsistent1314 == 1 | inconsistent12a12b == 1 | flag == 1) 
label values anyinconsistency yes
label variable anyinconsistency "Flag if there are any insurance-related inconsistencies"

tab anyinconsistency
// n= 415 
// 415 surveys that contain any inconsistency in insurance answers,
// will be dropped from analysis of insurance Qs
<<<<<<< HEAD

gen inconsistencytest = anyinconsistency
replace inconsistencytest = 2 if anyinconsistency == .
label values inconsistencytest yesno
=======
>>>>>>> a41b51e7fea30f4f3d21d842cd1aaf3894566fd9
