/* Question 3 "If you are currently using a method of birth control, which method(s) are you using?"
	Rs could give mult responses*/

gen q3missing = .
replace q3missing = 1 if (q3a != 1 & q3b != 1 & q3c != 1 & q3d != 1 & q3e != 1 & q3f != 1 & q3g != 1)
label values q3missing yes
label variable q3missing "Q3: Respondent skipped the entire question"

/* Recoding each of the response choices to distinguish between true missings
   for the entire question vs. respondents who did not choose that response.
   Added "r" to the end of recoded vars. */


<<<<<<< HEAD
foreach letter in a b c d e {
=======
foreach letter in a b c d {
>>>>>>> a41b51e7fea30f4f3d21d842cd1aaf3894566fd9
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
<<<<<<< HEAD
gen q3e1r = .
replace q3e1r = 1 if (q3e == 1 & q3f == .)
replace q3e1r = 1 if q3f == 9
replace q3e1r = 2 if q3er == .
replace q3e1r = .a if q3missing == 1
label values q3e1r yesnomissing	
=======
gen q3er = .
replace q3er = 1 if (q3e == 1 & q3f == .)
replace q3er = 1 if q3f == 9
replace q3er = 2 if q3er == .
replace q3er = .a if q3missing == 1
label values q3er yesnomissing	
>>>>>>> a41b51e7fea30f4f3d21d842cd1aaf3894566fd9

// Make "using no method" dependent on declaration of other method use. 
gen q3gr = 1 if (q3ar == 2 & q3br == 2 & q3cr == 2 & q3dr == 2 & q3er == 2 & q3f1r == 2 & q3f2r == 2 & q3f3r == 2)
replace q3gr = 2 if q3g == .
replace q3gr = .a if q3missing ==1
label values q3gr yesnomissing

label variable q3ar  "Q3: Currently using the pill"
label variable q3br  "Q3: Currently using the patch or ring"
label variable q3cr  "Q3: Currently using the shot"
label variable q3dr  "Q3: Currently using an IUD or implant"
label variable q3er  "Q3: Currently using an other method"
label variable q3gr  "Q3: I am not currently using a method"
label variable q3f1r "Q3: Currently using condoms"
label variable q3f2r "Q3: Currently using sterilization"
label variable q3f3r "Q3: Currently using withdrawl"
<<<<<<< HEAD

// Need to collapse some birth control categories
gen usepill = q3ar
label values usepill yesnomissing

gen usepatchringshot = .
replace usepatchringshot = 1 if q3br == 1 | q3cr == 1
replace usepatchringshot = 2 if q3br == 2 & q3cr == 2
replace usepatchringshot = .a if q3missing == 1
label values usepatchringshot yesnomissing

gen useIUDimp = q3dr
label values useIUDimp yesnomissing

gen useothermethod = .
replace useothermethod = 1 if (q3er == 1 | q3f1r == 1 | q3f2r == 1 | q3f3r == 1 | q3e1r == 1)
replace useothermethod = 2 if (q3er == 2)
replace useothermethod = .a if q3missing == 1
label values useothermethod yesnomissing

gen usenone = q3gr
=======
>>>>>>> a41b51e7fea30f4f3d21d842cd1aaf3894566fd9
	
