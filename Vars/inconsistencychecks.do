// See who skipped all of page 3
// To check that: 
// count if q9r==. & anyinconsistency != 1
// n = 27 are due to skipped page

gen skippg3 = .
replace skippg3 = 1 if (q10missing == 1 & q11missing ==1 & q12
