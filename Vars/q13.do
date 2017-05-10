/* Q13: For how many of the last 12mos did you have health insurance? */

// Get rid of inconsistencies
gen q13rinc = q13
replace q13rinc = .a if anyinconsistency ==1
label define q13rinc 1 "Less than 1 month" 2 "1 to 3 months" 3 "4 to 6 months" ///
				  4 "7 to 12 months" 5 "I did not have health insurance" .a "N/A"
label values q13rinc q13rinc
label variable q13rinc "Q13: For how many of the last 12 months did you have health insurance? inconsistencies dropped"
<<<<<<< HEAD

// Present responses as Rs insured for x months / women who were insured any or part of year
gen q13final = q13rinc
replace q13final = .a if q13rinc == 5
label values q13final q13rinc
label variable q13rinc "Q13: For how many of the last 12 months did you have health insurance? Among women insured some/part year"
=======
>>>>>>> a41b51e7fea30f4f3d21d842cd1aaf3894566fd9
