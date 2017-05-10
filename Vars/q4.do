/* Question 4 " What birth control methods are you interested in today?"
	R could choose more than one response */

gen q4missing = .
replace q4missing = 1 if (q4a != 1 & q4b != 1 & q4c != 1 & q4d != 1 & q4e != 1 & q4f != 1 & q4g != 1 & q4h != 1)
label values q4missing yes
label variable q4missing "Q4: Respondent skipped the entire question"

/* Recoding each of the response choices to distinguish between true missings
   for the entire question vs. respondents who did not choose that response.
   Added "r" to the end of recoded vars. */


foreach letter in a b c d e {
gen q4`letter'r = q4`letter'
replace q4`letter'r = 2  if q4`letter' == .
replace q4`letter'r = .a if q4missing == 1
label values q4`letter'r yesnomissing
}

// Break out the "other" values
// Condoms
gen q4g1r = .
replace q4g1r = q4g if q4g == 1
replace q4g1r = 2   if q4g != 1
replace q4g1r = .a  if q4missing == 1
label values q4g1r yesnomissing

// Sterilization
gen q4g2r = .
replace q4g2r = 1   if q4g == 2
replace q4g2r = 2   if q4g != 2
replace q4g2r = .a  if q4missing == 1
label values q4g2r yesnomissing

// "Other" others
gen q4fr = .
replace q4fr = 1 if (q4f == 1 & q4g == .)
replace q4fr = 1 if q4g == 9
replace q4fr = 2 if q4fr == .
replace q4fr = .a if q4missing == 1
label values q4fr yesnomissing

// Make "not interested in method" dependent on other answers (i.e. can't be both)
gen q4hr = 1 if (q4ar == 2 & q4br == 2 & q4cr == 2 & q4dr == 2 & q4er == 2 & q4g1r == 2 & q4g2r == 2 & q4fr == 2)
replace q4hr = 2 if q4hr == .
replace q4hr = .a if q4missing == 1
label values q4hr yesnomissing

label variable q4ar   "Q4: Interested in the pill"
label variable q4br   "Q4: Interested in the patch or ring"
label variable q4cr   "Q4: Interested in the shot"
label variable q4dr   "Q4: Interested in an IUD or implant"
label variable q4er   "Q4: Interested in emergency contraception"
label variable q4fr   "Q4: Interested in another method"
label variable q4hr   "Q4: I am not interested in birth control today"
label variable q4g1r  "Q4: Interested in condoms"
label variable q4g2r  "Q4: Interested in sterilization"


<<<<<<< HEAD
// Need to collapse some birth control categories
gen wantpill = q4ar
label values wantpill yesnomissing

gen wantpatchringshot = .
replace wantpatchringshot = 1 if q4br == 1 | q4cr == 1
replace wantpatchringshot = 2 if q4br == 2 & q4cr == 2
replace wantpatchringshot = .a if q4missing == 1
label values wantpatchringshot yesnomissing

gen wantIUDimp = q4dr
label values wantIUDimp yesnomissing

gen wantEC = q4er

gen wantothermethod = .
replace wantothermethod = 1 if (q4fr == 1 | q4g1r == 1 | q4g2r == 1)
replace wantothermethod = 2 if (q4fr == 2)
replace wantothermethod = .a if q4missing == 1
label values wantothermethod yesnomissing

gen wantnone = q4hr
=======
>>>>>>> a41b51e7fea30f4f3d21d842cd1aaf3894566fd9
