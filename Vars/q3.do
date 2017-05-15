/* Question 3 "If you are currently using a method of birth control, which method(s) are you using?"
	Rs could give mult responses*/

// Create var to indicate Rs who skipped question altogether
gen q3missing = .
replace q3missing = 1 if (q3a != 1 & q3b != 1 & q3c != 1 & q3d != 1 & q3e != 1 & q3f != 1 & q3g != 1)
label values q3missing yes
label variable q3missing "Q3: Respondent skipped the entire question"

/* Recoding each of the response choices to distinguish between true missings
   for the entire question vs. respondents who did not choose that response.
   Added "r" to the end of recoded vars. */


// Recodes for a-e, the main responses
foreach letter in a b c d e {
gen q3`letter'r = q3`letter'
replace q3`letter'r = 2  if q3`letter' == .
replace q3`letter'r = .a if q3missing == 1
label values q3`letter'r yesnomissing
}

// Break out the "other" values
// Condoms
gen q3f1r = .
replace q3f1r = q3f if q3f == 1
replace q3f1r = 2   if q3f != 1
replace q3f1r = .a  if q3missing == 1
label values q3f1r yesnomissing

// Sterilization
gen q3f2r = .
replace q3f2r = 1   if q3f == 2
replace q3f2r = 2   if q3f != 2
replace q3f2r = .a  if q3missing == 1
label values q3f2r yesnomissing

// Withdrawl
gen q3f3r = .
replace q3f3r = 1   if q3f == 3
replace q3f3r = 2   if q3f != 3
replace q3f3r = .a  if q3missing == 1
label values q3f3r yesnomissing

// "Other" others
gen q3e1r = .
replace q3e1r = 1 if (q3e == 1 & q3f == .)
replace q3e1r = 1 if q3f == 9
replace q3e1r = 2 if q3er == .
replace q3e1r = .a if q3missing == 1
label values q3e1r yesnomissing	


// Make "using no method" dependent on declaration of any other method use. 
gen q3gr = 1 if (q3ar == 2 & q3br == 2 & q3cr == 2 & q3dr == 2 & q3er == 2 & q3f1r == 2 & q3f2r == 2 & q3f3r == 2)
replace q3gr = 2 if q3g == .
replace q3gr = .a if q3missing ==1
label values q3gr yesnomissing

// Label variables
label variable q3ar  "Q3: Currently using the pill"
label variable q3br  "Q3: Currently using the patch or ring"
label variable q3cr  "Q3: Currently using the shot"
label variable q3dr  "Q3: Currently using an IUD or implant"
label variable q3er  "Q3: Currently using an other method"
label variable q3gr  "Q3: I am not currently using a method"
label variable q3f1r "Q3: Currently using condoms"
label variable q3f2r "Q3: Currently using sterilization"
label variable q3f3r "Q3: Currently using withdrawl"


** Collapse variable categories
// Categories: Pill, patch/ring/shot, IUD/implant, all other, none

// Create dummies for each of the main categories
gen usepill = q3ar
label values usepill yesnomissing
label variable usepill "Q3: R currently using pill"

gen usepatchringshot = .
replace usepatchringshot = 1 if q3br == 1 | q3cr == 1
replace usepatchringshot = 2 if q3br == 2 & q3cr == 2
replace usepatchringshot = .a if q3missing == 1
label values usepatchringshot yesnomissing
label variable usepatchringshot "Q3: R currently using patch, ring, or shot"

gen useIUDimp = q3dr
label values useIUDimp yesnomissing
label variable useIUDimp "Q3: R currently using IUD or implant"

gen useothermethod = .
replace useothermethod = 1 if (q3er == 1 | q3f1r == 1 | q3f2r == 1 | q3f3r == 1 | q3e1r == 1)
replace useothermethod = 2 if (q3er == 2)
replace useothermethod = .a if q3missing == 1
label values useothermethod yesnomissing
label variable useothermethod "Q3: R currently using an other method of contraception"

gen usenone = q3gr
label values usenone yesnomissing
label variable usenone "Q3: R currently using no method of contraception"	
