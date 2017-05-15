/* Question 7 "Other than today's visit, if you did NOT make a visit for any birth control services in
				in the last year, why not?"
	R could choose more than one response */
	
gen q7missing = .
replace q7missing = 1 if (q7a != 1 & q7b != 1 & q7c != 1 & q7d != 1 & q7e != 1 & q7f != 1 & q7g != 1 & q7h != 1 & q7i != 1)
label values q7missing yes
label variable q7missing "Q7: Respondent skipped the entire question"

// NOTE: There is one R who is coded as having an "other" in q7h,
// but not in q7g. clinicid == 6092 uniqueid == 3698
// This survey needs to be checked and coded appropriately, as surveys
// hypothetically should NOT have a code in q7h without a code in q7g
// RESOLVED: This must have been a keypunching error-- survey ONLY has q7i checked,
// there is no other. Hard coding to correct below prior to other recodes.
replace q7h = . if uniqueid == 3698


/* Recoding each of the response choices to distinguish between true missings
   for the entire question vs. respondents who did not choose that response.
   Added "r" to the end of recoded vars. */
foreach letter in a b c d e f g i{
	gen q7`letter'r = q7`letter'
	replace q7`letter'r = 2  if q7`letter' == .
	replace q7`letter'r = .a if q7missing == 1
	label values q7`letter'r yesnomissing
}


// Will be using q7ir to force responses below, renaming for ease of use
rename q7ir hadBCvisit
label values hadBCvisit yesnomissing
label variable hadBCvisit "Q7: I DID make a visit for birth control services in the last year, other than today's visit"

// This is just the inverse of the previous, hadBCvisit
gen noBCvisit = 1
replace noBCvisit = 2 if hadBCvisit == 1
replace noBCvisit = .a if q7missing == 1
label values noBCvisit yesnomissing
label variable noBCvisit "Q7: Didn't make a BC visit at any healthcare facility in the past year"

// Re-running q7 with forced answers based on q7i
// If a R indicated that they did make a visit for BC services in the past year,
// thier answer will be pulled from the following recodes, making the responses
// "Among women who did NOT make a visit for BC services in the last year..."

label define q7force 1 "Yes" 2 "No" .a "Had BC visit in past year" .b "Missing for entire question"

foreach letter in a b c d e f g i{
	gen q7`letter'rforce = q7`letter'
	replace q7`letter'rforce = 2  if q7`letter' == .
	replace q7`letter'rforce = .a if hadBCvisit == 1
	replace q7`letter'rforce = .b if q7missing == 1
	label values q7`letter'rforce q7force
}

// Label variables descriptively
label variable q7ar "Q7: I didn't have a reason to see a provider/doctor"
label variable q7br "Q7: I had already had my annual GYN exam"
label variable q7cr "Q7: I'm not comfortable seeing a provider/doctor for these services"
label variable q7dr "Q7: I couldn't afford to see a healthcare provider"
label variable q7er "Q7: It was too inconvenient to see a provider/doctor"
label variable q7fr "Q7: I didn't want partner/family to find out I was seeking these services"
label variable q7gr "Q7: I had other reasons for not seeing a provider/doctor for these services"
label variable q7arforce "Q7: I didn't have a reason to see a provider/doctor (force)"
label variable q7brforce "Q7: I had already had my annual GYN exam (force)"
label variable q7crforce "Q7: I'm not comfortable seeing a provider/doctor for these services (force)"
label variable q7drforce "Q7: I couldn't afford to see a healthcare provider (force)"
label variable q7erforce "Q7: It was too inconvenient to see a provider/doctor (force)"
label variable q7frforce "Q7: I didn't want partner/family to find out I was seeking these services (force)"
label variable q7grforce "Q7: I had other reasons for not seeing a provider/doctor for these services (force)"
