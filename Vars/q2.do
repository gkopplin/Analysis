/* Question 2 "Why are you here today?"
	R could choose more than one response */

// Create var to indicate Rs who skipped question 2 altogether
gen q2missing = .
// If R did not select options a-f (not equal to 1) or g (exactly equal to missing), mark as missing for whole item
replace q2missing = 1 if (q2a != 1 & q2b != 1 & q2c != 1 & q2d != 1 & q2e != 1 & q2f != 1 & q2g == .)
label values q2missing yes
label variable q2missing "Q2: Respondent skipped the entire question"
label define yesnomissing 1 "Yes" 2 "No" .a "Missing for entire question"

/* Recoding each of the response choices to distinguish between true missings
   for the entire question vs. respondents who did not choose that response.
   Added "r" to the end of recoded vars. */

// Main options a-e
foreach letter in a b c d e {
	gen q2`letter'r = q2`letter'
	replace q2`letter'r = 2  if q2`letter' == .
	replace q2`letter'r = .a if q2missing == 1
	label values q2`letter'r yesnomissing
}	

// "Other" options
// EC
gen q2g1r = .
replace q2g1r = 1 if q2g == 1
replace q2g1r = 2   if q2g != 1
replace q2g1r = .a  if q2missing == 1
label values q2g1r yesnomissing

//LARC removal
gen q2g2r = .
replace q2g2r = 1 if q2g == 2
replace q2g2r = 2   if q2g != 2
replace q2g2r = .a  if q2missing == 1
label values q2g2r yesnomissing

// Breast exam
gen q2g3r = .
replace q2g3r = 1 if q2g == 3
replace q2g3r = 2   if q2g != 3
replace q2g3r = .a  if q2missing == 1
label values q2g3r yesnomissing

// Other repro health problem
gen q2g4r = .
replace q2g4r = 1 if q2g == 4
replace q2g4r = 2   if q2g != 4
replace q2g4r = .a  if q2missing == 1
label values q2g4r yesnomissing

// Other preventative care
gen q2g5r = .
replace q2g5r = 1 if q2g == 5
replace q2g5r = 2   if q2g != 5
replace q2g5r = .a  if q2missing == 1
label values q2g5r yesnomissing

// IUD f/up
gen q2g6r = .
replace q2g6r = 1 if q2g == 6
replace q2g6r = 2   if q2g != 6
replace q2g6r = .a  if q2missing == 1
label values q2g6r yesnomissing

// "Other" other
gen q2fr = .
replace q2fr = 1 if q2f == 1 & q2g == .
replace q2fr = 1 if q2g == 9
replace q2fr = 2 if q2fr == .
replace q2fr = .a if q2missing == 1
label values q2fr yesnomissing

// Label all vars
label variable q2ar  "Q2: Here for BC refill"
label variable q2br  "Q2: Here due to method issue"
label variable q2cr  "Q2: Here annual GYN exam"
label variable q2dr  "Q2: Here because I may have an infection"
label variable q2er  "Q2: Here for Pregnancy test"
label variable q2fr  "Q2: Here for other reason"
label variable q2g1r "Q2: Here for EC"
label variable q2g2r "Q2: Here for LARC removal"
label variable q2g3r "Q2: Here for breast exam"
label variable q2g4r "Q2: Here for other repro health problems"
label variable q2g5r "Q2: Here for other preventative care"
label variable q2g6r "Q2: Here for IUD follow-up appt"

** Collapse variable **

// Forced total to equal 100%, i.e. don't let respondents pick more than one option.
// Categories: 
// Contraception / Annual GYN visit / Pregnancy test only / STI service only / Other service only
// Coded with preference given to Contraception above all others

// Create dummies for each of the main categories
// Women here for contraception if here for: BC refill, method issue, EC, LARC removal, IUD follow up
gen hereforcp  = 1 if (q2ar == 1 | q2br == 1 | q2g1r == 1 | q2g2r == 1 | q2g6r == 1)
// Women here for GYN exam is only one question
gen hereforGYN = 1 if q2cr == 1
// Women here for ONLY pregnancy test-- yes to q2er, but no to all others
gen hereforpregtest = 1 if q2er == 1 & (q2ar != 1 & q2br != 1 & q2cr != 1 & q2dr != 1 & q2fr != 1 & q2g1r != 1 & q2g2r != 1 & q2g3r != 1 & q2g4r != 1 & q2g5r != 1 & q2g6r != 1)
// Women here for pregnancy test at all
gen hereforpregtest1 = 1 if q2er == 1
// Women here for ONLY STI treatment-- yes to q2dr, but no to all others
gen hereforSTI = 1 if q2dr == 1 & (q2ar != 1 & q2br != 1 & q2cr != 1 & q2er != 1 & q2fr != 1 & q2g1r != 1 & q2g2r != 1 & q2g3r != 1 & q2g4r != 1 & q2g5r != 1 & q2g6r != 1)
// Women here for STI services at all
gen hereforSTI1 = 1 if q2dr == 1
// Women only here for "other" reason-- any of the not previously named reasons, and NONE of the previously named reasons
gen hereforother = 1 if ((q2fr == 1 | q2g3r == 1 | q2g4r == 1 | q2g5r == 1) & (q2ar != 1 & q2br != 1 & q2cr != 1 & q2dr != 1 & q2er != 1 & q2g1r != 1 & q2g2r != 1 & q2g6r != 1))
// Women here for other services at all
gen hereforother1 = 1 if (q2fr == 1 | q2g3r == 1 | q2g4r == 1 | q2g5r == 1)

/* This recode of visit reason will not be used.

// This is coded such that anyone here for more than one reason that is not CP or GYN exam gets lumped into "other"
gen visitreason = .
replace visitreason = 9 if (q2ar == 1| q2br == 1| q2cr == 1| q2dr == 1| q2er == 1| q2fr == 1| q2g1r == 1| q2g2r == 1| q2g3r == 1| q2g4r == 1| q2g5r == 1| q2g6r == 1)
replace visitreason = 3 if hereforpregtest == 1
replace visitreason = 4 if hereforSTI == 1
replace visitreason = 2 if hereforGYN == 1
replace visitreason = 1 if hereforcp == 1
replace visitreason = 5 if visitreason == 9
label define visitreason 1 "Contraception" 2 "Annual gynecologic exam" 3 "Pregnancy test only" 4 "STI service only" 5 "Other service only"
label values visitreason visitreason
label variable visitreason "Q2: Primary purpose of today's visit"

*/

// This version of the visitreason is coded hierarchically such that cp > gyn > STI > preg test > other 
gen visitreason1 = .
replace visitreason1 = 9 if q2missing ! = 1
replace visitreason1 = 5 if hereforother1 == 1
replace visitreason1 = 3 if hereforpregtest1 == 1
replace visitreason1 = 4 if hereforSTI1 == 1
replace visitreason1 = 2 if hereforGYN == 1
replace visitreason1 = 1 if hereforcp == 1
replace visitreason1 = 5 if visitreason1 == 9
label values visitreason1 visitreason
label variable visitreason1 "Q2ALT: Primary purpose of today's visit, coded toward contraception"
