/* Q9: Do you have health insurance?
	Currently represented by "insurancedummy", a renaming of Q9*/
	
// Identifying folks who this insurance question is missing for
gen q9missing = .
replace q9missing = 1 if q9 == . 
label values q9missing yes
label variable q9missing "Q9: Skipped Q9 entirely"

// Need to determine what to do with missing responses to q9
count if q9missing == 1
// n = 56
// They are currently being considered as N/A in both forks of skip pattern,
// i.e., when evaluating Qs 10-12, they're appearing as N/A for both sets of questions.

count if q9missing == 1 & anyinconsistency != 1
// n = 43, there are 43 cases that are missing answers to insurance that do not have inconsistencies
// Honing in on cases that will be included in analysis-- if anyinconsistency == 1,
// we will not be including these Rs in our analysis of insurance Qs
// Exploring these data
list q9* anyinconsistency q10* q11* q12* if q9missing == 1 & anyinconsistency != 1

// Based on this exploration
// will recode Q9 to code any R who gave an answer for Q10 or 11 (but not Q12)
// as having insurance, and will code all who answered any of Qs 12 (but not
// Qs 10 or 11) as not having insurance.
// Essentially, coding Q9 up from the given responses on Qs 10-12, giving a more accurate
// representation of Q9 to force skip patterns with.
gen q9r = .
replace q9r = q9 // fill in with data we currently have
// Fill in Q9 as "have insurance" if any of the 10 or 11 Qs were answered, but not if any inconsistency
// Also, leave out those who declare in Q13 that they "didn't hav einsurance at any point in past 12 months" ! (Almost forgot those)
replace q9r = 1 if (q9 ==. & (q10a == 1 | q10b == 1 | q10c == 1 | q10d == 1 | q10e == 1 | q10f == 1 | q10g == 1 | q10h == 1 | q11 != .) ///
				 & (anyinconsistency != 1 & q13 != 5))
// Fill in Q9 as "no insurance" if any Q12 Qs were answered, but not if any inconsistency
// Also, code up those who answered Q13 as "no insurance all year"!
replace q9r = 2 if (q9 ==. & (q12 != . | q12a != . | q12b != . | q13 == 5) & (anyinconsistency != 1))
label variable q9r "Q9: Do you currently have health insurance? (recode)
label values q9r yesno
// This resolves 16 of the cases in which there are no inconsistencies within the insurance
// questions, but the R did not answer question 9-- they indicated the answer by the skip 
// pattern they followed, but did not indicate it in q9 specifically.
count if q9r==. & anyinconsistency != 1
// n = 27
// Still 27 Rs, it appears they likely  skipped all of pg 3,
// therefore they belong in the N/A category when forcing Qs 10-12. 
// Will run a check in "inconsistencychecks.do" script to ensure that the n of Rs who 
// skipped pg 3 == 27.

// Generating a new recoded q9 missing, eliminating those 16 from being tallied as "missing"
gen q9rmissing = .
replace q9rmissing = 1 if q9r == . 
label values q9rmissing yes
label variable q9rmissing "Q9: Skipped Q9 entirely (recode)"

// Using q9r to make these dummy variables used to force skip patterns in Qs 10-12
gen haveinsurancepattern = .
replace haveinsurancepattern = 1 if q9r ==1
label values haveinsurancepattern yes
label variable haveinsurancepattern "Follow the skip pattern for those who have insurance"

gen noinsurancepattern = .
replace noinsurancepattern = 1 if q9r == 2
label values noinsurancepattern yes
label variable noinsurancepattern "Follow the skip pattern for those who have NO insurance"
