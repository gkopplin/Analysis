/* Q12: If you don't have health insurance, have you tried to get it in the last 12 mos? */

// If R skipped all of Q12
gen q12missing = .
replace q12missing = 1 if (q12 == . & q 12a == . & q12b == .)
label values q12missing yes
label variable q12missing "Q12: Respondent skipped the entire question"

// Pull out those who should have skipped question, indicating those who skipped who should have answered (i.e. true missings)
// Recoding so that those who skipped all Qs on pg 3 are in the N/A category
gen q12missingforce = .
replace q12missingforce = 1 if (q12 == . & q 12a == . & q12b == .)
replace q12missingforce = .a if (noinsurancepattern != 1)
label values q12missingforce yesNA
label variable q12missingforce "Q12: Respondent skipped the entire question but should have (forced skip pattern)"

// Recoding Q12 to lump in "yes and other" w/ yes and "no and other" w/ no
// Also indicating those that are N/A because they shouldn't have answered Q12
// Coding any inconsistencies in insurance Qs as n/a
gen q12r = q12
replace q12r = 1 if q12 == 4
replace q12r = 2 if q12 == 5
replace q12r = .b if q12missingforce == 1
replace q12r = .a if noinsurancepattern != 1
replace q12r = .a if anyinconsistency == 1
label values q12r yesnoNAmissing

label variable q12r "Q12: If you don't have health insurance, have you tried to get it in last 12 mo?"

// There is one survey that has Q12 listed as "other"
// need to investigate. Clinic 6092 ID 3691

// Checked on this survey and it is ambiguous-- says "just lost" on paper
// Hard coding to .b, missing

replace q12r = .b if uniqueid == 3691

// Also, using answers from a and b to code Q12 backwards
// i.e., if R gave answer for Q12a (and not q12b), code q12 as "yes"

gen q12rfinal = q12r
replace q12rfinal = 1 if (q12a == 1 | q12aot == 1  | q12a1 ==1 | q12a2 == 1 | q12a3 == 1 | q12a4 == 1 | q12a5 == 1 | q12a6 == 1) 
replace q12rfinal = 2 if (q12b == 1 | q12bot == 1  | q12b1 ==1 | q12b2 == 1 | q12b3 == 1 | q12b4 == 1 | q12b5 == 1 | q12b6 == 1 | q12b7 == 1 | q12b8 == 1) 
replace q12rfinal = .a if noinsurancepattern != 1
replace q12rfinal = .a if anyinconsistency == 1
label values q12rfinal yesnoNAmissing
label variable q12rfinal "Q12: If you don't have health insurance, have you tried to get it in last 12 mo? (Coded up)"
