/* Question 5 "If the birth control method you are seeking today (q4) is different from the method you are
   currently using (q3), why do you want to switch methods?"
   
	Rs could give more than one response*/
	
// Rs who skipped entire question	
gen q5missing = .
replace q5missing = 1 if (q5a != 1 & q5b != 1 & q5c != 1 & q5d != 1 & q5e != 1 & q5f != 1 & q5g != 1 & q5h != 1 & q5i != 1)
label values q5missing yes
label variable q5missing "Q5: Respondent skipped the entire question"	

// First, need to identify women who gave different answers to Qs 3 and 4
// Will do this by identifying women whos answers AGREE
// Two of the BC options don't make sense to force "agreement", thus muting their responses to Q5:
// patch or ring & IUD or implant, as women may be switching within the category. Leaving those out of this var.
// Additionally, women who are using pill and interested in pill + IUD today aren potentially interested in switching, so they will not be included
// Leaving in women who say they're "not interested in birth control today" in Q4 bc they may be interested in discontinuing current method (but not starting a new one)
gen q3q4agree = .
replace q3q4agree = 1 if (q3ar == 1 & q4ar == 1 & q4br ! = 1 & q4cr ! = 1 & q4dr ! = 1 & q4er ! = 1 & q4fr ! = 1 & q4g1r ! = 1 & q4g2r ! = 1)  // women who say "pill" for both, not interested in any other methods
replace q3q4agree = 1 if (q3cr == 1 & q4cr == 1 & q4br ! = 1 & q4ar ! = 1 & q4dr ! = 1 & q4er ! = 1 & q4fr ! = 1 & q4g1r ! = 1 & q4g2r ! = 1)  // women who say "shot" for both, not interested in any other methods
replace q3q4agree = 1 if (q3f1r == 1 & q4g1r == 1 & q4ar ! = 1 & q4cr ! = 1 & q4cr ! = 1 & q4dr ! = 1 & q4er ! = 1 & q4fr ! = 1 & q4g2r ! = 1) // women who say "condoms" for both, not interested in any other methods
replace q3q4agree = 1 if q3f2r == 1 // women who indicated they're sterilized
label values q3q4agree yesnomissing
label variable q3q4agree "Women who indicate they are interested in and using the same method of BC"

// Code full cohort of women who indicate no interest in switching
// Women who indicated matching using/interested methods and/or said they were "not interested in switching" in Q5
gen notseekingchange = .
replace notseekingchange = .a if q5missing == 1
replace notseekingchange = 1 if (q3q4agree == 1 | q5i ==1)
<<<<<<< HEAD
replace notseekingchange = 2 if notseekingchange ==.
label values notseekingchange yesnomissing
label variable notseekingchange "Women not seeking to change method based on Qs 3 & 4 or directly stated in Q5"

// Sum up all Rs who ARE seeking a change
gen seekingchange = .
replace seekingchange = 1 if notseekingchange != 1
replace seekingchange = 2 if notseekingchange == 1
replace seekingchange = .a if q5missing == 1
label values seekingchange yesnomissing

=======
label values notseekingchange yesnomissing
label variable notseekingchange "Women not seeking to change method based on Qs 3 & 4 or directly stated in Q5"

>>>>>>> a41b51e7fea30f4f3d21d842cd1aaf3894566fd9
** Basic recode of vars
	
/* Recoding each of the response choices to distinguish between true missings
   for the entire question vs. respondents who did not choose that response.
   Added "r" to the end of recoded vars. */
   
foreach letter in a b c d e f g {
	gen q5`letter'r = q5`letter'
	replace q5`letter'r = 2  if q5`letter' == .
	replace q5`letter'r = .a if q5missing == 1
	label values q5`letter'r yesnomissing
}    
   
//  q5g is the "other" and q5h is the "specify"
// All Rs who have responses for q5h are captured in q5g


** Forced recodes based on "notseekingchange" constructed variable

// Pulling out women who indicated that they were not seeking to change method today
// "Among women seeking to change their method today (according to q5)..."

label define q5force 1 "Yes" 2 "No" .a "Not seeking to change (Qs 3, 4, and 5)" .b "Missing for entire question"

foreach letter in a b c d e f g {
	gen q5`letter'rforce = q5`letter'
	replace q5`letter'rforce = 2  if q5`letter' == .
	replace q5`letter'rforce = .a if notseekingchange == 1
	replace q5`letter'rforce = .b if q5missing == 1
	label values q5`letter'rforce q5force
	tab q5`letter'rforce, missing
}

<<<<<<< HEAD

=======
>>>>>>> a41b51e7fea30f4f3d21d842cd1aaf3894566fd9
** Label all variables descriptively 

label variable q5ar 			"Q5: Switching because I've learned new things about options"
label variable q5br 			"Q5: Switching because I can now afford the method I want"
label variable q5cr 			"Q5: Switching because I can't afford my old method"
label variable q5dr 			"Q5: Switching because I've had side effects with my old method"
label variable q5er 			"Q5: Switching because I had an unplanned pregnancy on the old method"
label variable q5fr 			"Q5: I'm not currently using a birth control method"
label variable q5gr 			"Q5: Switching for another reason"
label variable q5arforce		"Q5: Switching because I've learned new things about options (force)"
label variable q5brforce 		"Q5: Switching because I can now afford the method I want (force)"
label variable q5crforce 		"Q5: Switching because I can't afford my old method (force)"
label variable q5drforce 		"Q5: Switching because I've had side effects with my old method (force)"
label variable q5erforce 		"Q5: Switching because I had an unplanned pregnancy on the old method (force)"
label variable q5frforce 		"Q5: I'm not currently using a birth control method (force)"
label variable q5grforce 		"Q5: Switching for another reason (force)"

