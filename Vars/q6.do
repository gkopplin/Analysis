/* Question 6-- "Thinking about why you decided to come here today,
   instead of going somewhere elese, which are the most important reasons for you?"
   R could choose more than one option on this question*/
   
gen q6missing = .
replace q6missing = 1 if (q6a != 1 & q6b != 1 & q6c != 1 & q6d != 1 & q6e != 1 & q6f != 1 & q6g != 1 & q6h != 1 & q6i != 1 & q6j != 1 & q6k !=1)
label values q6missing yes
label variable q6missing "Q6: Respondent skipped the entire question"

/* Recoding each of the response choices to distinguish between true missings
   for the entire question vs. respondents who did not choose that response.
   Added "r" to the end of recoded vars. */

foreach letter in a b c d e f g h i j k {
	gen q6`letter'r = q6`letter'
	replace q6`letter'r = 2  if q6`letter' == .
	replace q6`letter'r = .a if q6missing == 1
	label values q6`letter'r yesnomissing
}   

label variable q6ar "Q6: Came here because this is only place I can get services I need"
label variable q6br "Q6: Came here because I've been here before"
label variable q6cr "Q6: Came here because someone recommended I come here"
label variable q6dr "Q6: Came here because this location is convenient for me"
label variable q6er "Q6: Came here because I can get the BC method I want here"
label variable q6fr "Q6: Came here because there are services for teens/young people here"
label variable q6gr "Q6: Came here because services are confidential"
label variable q6hr "Q6: Came here because staff treat me respectfully"
label variable q6ir "Q6: Came here because staff here can refer me for other health services"
label variable q6jr "Q6: Came here because I can get free or low-cost services"
label variable q6kr "Q6: Came here because I can use my insurance here"


** Construct summary categories
// This is a first pass of the summary vars, based on our conjecture of how they fit together, may change when writing paper

// "Services available" group-- includes only place that provides services, can get desired method, tenn or YA services
gen servicesavailablegrp = 2
replace servicesavailablegrp = 1 if (q6ar == 1 | q6er == 1 | q6fr == 1)
replace servicesavailablegrp = .a if q6missing == 1
label values servicesavailablegrp yesnomissing
label variable servicesavailablegrp "Summary group: Reason I came here is services available"

// "Quality and convenicence" group-- includes location convenient, services confidential, staff respectful, can get referrals
gen qualconveniencegrp = 2
replace qualconveniencegrp = 1 if (q6dr == 1 | q6gr == 1 | q6hr == 1 | q6ir == 1)
replace qualconveniencegrp = .a if q6missing == 1
label values qualconveniencegrp yesnomissing
label variable qualconveniencegrp "Summary group: Quality and convenience of care"

// "Familiarity" group-- includes "have been here before" and "someone recommended"
gen familiaritygrp = 2
replace familiaritygrp = 1 if (q6br == 1 | q6cr == 1)
replace familiaritygrp = .a if q6missing == 1
label values familiaritygrp yesnomissing
label variable familiaritygrp "Summary group: Familiarity of location"

// "Affordability" group -- includes "can get free/low-cost services" and "can use insurance"
gen affordabilitygrp = 2
replace affordabilitygrp = 1 if (q6jr == 1 | q6kr == 1)
replace affordabilitygrp = .a if q6missing == 1
label values affordabilitygrp yesnomissing
label variable affordabilitygrp "Summary group: Affordability of location"
