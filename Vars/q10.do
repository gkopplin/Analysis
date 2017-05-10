/* Q10: What type of health insurance do you currently have?
	R could choose more than one response */

// Rs who skipped entire question
gen q10missing = .
replace q10missing = 1 if (q10a != 1 & q10b != 1 & q10c != 1 & q10d != 1 & q10e != 1 & q10f != 1 & q10g != 1 & q10h != 1)
label values q10missing yes
label variable q10missing "Q10: Respondent skipped the entire question"

// Pull out those who should have skipped question, indicating those who skipped who should have answered (i.e. true missings)
// Recoding so that those who skipped all Qs on pg 3 are in the N/A category
gen q10missingforce = .
replace q10missingforce = 1 if (q10a != 1 & q10b != 1 & q10c != 1 & q10d != 1 & q10e != 1 & q10f != 1 & q10g != 1 & q10h != 1)
replace q10missingforce = .a if (haveinsurancepattern != 1)
label define yesNA 1 "Yes" .a "N/A"
label values q10missingforce yesNA
label variable q10missingforce "Q10: Respondent skipped the entire question but should have answered (forced skip pattern)"

// I don't think that the values of this loop make sense right now.
// Need to rethink a "non-force" option, if we even wish to do that.
foreach letter in a b c d e f g {
gen q10`letter'r = q10`letter'
replace q10`letter'r = 2  if q10`letter' == .
replace q10`letter'r = .a if q10missing == 1
label values q10`letter'r yesnomissing
}

label variable q10ar "Q10: Insurance through employer or union"
label variable q10br "Q10: Insurance through marketplace/exchange"
label variable q10cr "Q10: Insurance through Medicaid"
label variable q10dr "Q10: Insurance through TRICARE"
label variable q10er "Q10: Insurance through IHS"
label variable q10fr "Q10: Insurance through Medicare"
label variable q10gr "Q10: Other health insurance"

// For now, lumping all "others" together. There are no Rs w/ q10h answered w/o q10g.
// Will need to review all of the specified others.

/* Force is forcing everyone who shouldn't have answered (based on Q9r) into
   N/A.
   True missings are those who SHOULD have but did not answer anything for q10.
   Yes, selected that particular option. No, didn't select option but did
   answer the question. */
label define yesnoNAmissing 1 "Yes" 2 "No" .a "N/A" .b "True missing"
foreach letter in a b c d e f g {
gen q10`letter'rforce = q10`letter'
replace q10`letter'rforce = 2  if q10`letter' == .
replace q10`letter'rforce = .a if q10missingforce == .a
replace q10`letter'rforce = .b if q10missingforce == 1
label values q10`letter'rforce yesnoNAmissing
}
label variable q10arforce "Q10: Insurance through employer or union (forced based on Q9r)"
label variable q10brforce "Q10: Insurance through marketplace/exchange (forced based on Q9r)"
label variable q10crforce "Q10: Insurance through Medicaid (forced based on Q9r)"
label variable q10drforce "Q10: Insurance through TRICARE (forced based on Q9r)"
label variable q10erforce "Q10: Insurance through IHS (forced based on Q9r)"
label variable q10frforce "Q10: Insurance through Medicare (forced based on Q9r)"
label variable q10grforce "Q10: Other health insurance (forced based on Q9r)"

/* "forceinc" : forcing Rs based on q9r and making women N/A if they
 				responded inconsistently to any insurance Qs
   This also moves Rs who had inconsistencies in their insurance answers
   into the N/A category.*/
label define yesnoNAincmissing 1 "Yes" 2 "No" .a "N/A" .b "True missing"  .c "Inconsistency, dropped from analysis"
foreach letter in a b c d e f g {
gen q10`letter'rforceinc = q10`letter'
replace q10`letter'rforceinc = 2  if q10`letter' == .
replace q10`letter'rforceinc = .a if q10missingforce == .a
replace q10`letter'rforceinc = .b if q10missingforce == 1
replace q10`letter'rforceinc = .c if anyinconsistency == 1
label values q10`letter'rforceinc yesnoNAmissing
}


label variable q10arforceinc "Q10: Insurance through employer (forced based on Q9r, inconsistencies dropped)"
label variable q10brforceinc "Q10: Insurance through marketplace (forced based on Q9r, inconsistencies dropped)"
label variable q10crforceinc "Q10: Insurance through Medicaid (forced based on Q9r, inconsistencies dropped)"
label variable q10drforceinc "Q10: Insurance through TRICARE/military (forced based on Q9r inconsistencies dropped)"
label variable q10erforceinc "Q10: Insurance through IHS (forced based on Q9r, inconsistencies dropped)"
label variable q10frforceinc "Q10: Insurance through Medicare (forced based on Q9r, inconsistencies dropped)"
label variable q10grforceinc "Q10: Other Insurance (forced based on Q9r, inconsistencies dropped)"
<<<<<<< HEAD

** Collapse insurance categories

// Need a categorical insurance var among uninsured + insured
gen insurancecat4 = .
replace insurancecat4 = 1 if (q10crforceinc == 1) // Medicaid
replace insurancecat4 = 2 if (q10arforceinc == 1 | q10brforceinc == 1) // Employer or marketplace
replace insurancecat4 = 3 if (q10drforceinc == 1 | q10erforceinc == 1 | q10frforceinc == 1 | q10grforceinc == 1) // Other ins
replace insurancecat4 = 4 if noinsurancepattern == 1 // No insurance
replace insurancecat4 = .a if anyinconsistency == 1 // Removed from analysis
label define insurancecat4 1 "Medicaid" 2 "Private" 3 "Other" 4 "Uninsured" .a "Inconsistent, dropped from analysis"
label values insurancecat4 insurancecat4
label variable insurancecat4 "Insurance status including uninsured, collapsed"


// Need a categorical insurance var just among the insured
gen insurancecat3 = .
replace insurancecat3 = 1 if (q10crforceinc == 1) // Medicaid
replace insurancecat3 = 2 if (q10arforceinc == 1 | q10brforceinc == 1) // Employer or marketplace
replace insurancecat3 = 3 if (q10drforceinc == 1 | q10erforceinc == 1 | q10frforceinc == 1 | q10grforceinc == 1) // Other ins
replace insurancecat3 = .a if noinsurancepattern == 1 // No insurance, N/A
replace insurancecat3 = .b if q10missingforce == 1 // True missing
replace insurancecat3 = .c if anyinconsistency == 1 // Removed from analysis
label define insurancecat3 1 "Medicaid" 2 "Private" 3 "Other" .a "N/A" .b "True missing"  .c "Inconsistency, dropped from analysis"
label values insurancecat3 insurancecat3
label variable insurancecat3 "Insurance status, collapsed"
=======
>>>>>>> a41b51e7fea30f4f3d21d842cd1aaf3894566fd9
