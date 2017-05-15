/*	Recodes of demographic characteristics of patients
	Qs 15-23				*/
	

** Nativity

// Label nativity variable
label define nativity 1 "US Born" 2 "Foreign born"
label values nativity nativity


** Race **
/* Generate a race variable that has hierarchical order of hispanic/black/asian/white, such that if someone chooses
 * hispanic & something else, they are coded as hispanic, black and something else aside from hispanic, they are coded 
 * as black, etc.
 * No multi-racial category. 
 * Based on comparison with previous client survey methodologies, this is the race variable that we will be using, 
 * as opposed to a race variable that groups multi-racial individuals together.*/
 
// Generate blank variable
gen race1 = .
// Replace var with 9 if there is an answer for the question. This leaves all missings as "."
replace race1 = 9 if (white == 1 | black == 1 | hispanic == 1 | asian == 1 | otherrace == 1 | q17f !=.)
// Code as white if R selected white
replace race1 = 1 if white == 1
// Code as asian if R selected asian (includes Rs who chose white and asian)
replace race1 = 4 if asian == 1
// Code as black if R selected black (includes Rs who may have chose white or asian & black)
replace race1 = 2 if black == 1
// Code as hispanic if R selected hispanic (includes Rs who may have chose white, asian or black & hispanic)
replace race1 = 3 if hispanic == 1
// All other Rs who answered question but are not in categories are in "other"
replace race1 = 5 if race1 == 9
label define race1 1 "Non-Hispanic White" 2 "Non-Hispanic Black" 3 "Hispanic or Latina" 4 "Asian" 5 "Other"
label values race1 race1
label variable race1 "Q17: Race, coded with hierarchy hisp/black/asian/white"


** Age **

// Five-category age will be presented in Table 1
gen     agecat5 = .
// Replace for each age bracket
replace agecat5 = 1 if age <  18
replace agecat5 = 2 if age >= 18 & age < 20
replace agecat5 = 3 if age >= 20 & age < 25
replace agecat5 = 4 if age >= 25 & age < 30
// Last category excludes missings!
replace agecat5 = 5 if age >=30  & age != .
label define agecat5 1 "<18" 2 "18-19" 3 "20-24" 4 "25-29" 5 "30+"
label values agecat5 agecat5
label variable agecat5 "Q15: How old are you? Standard 5 category"


// Alternative, more collapsed age cat used in Table 4
gen agecat3 = .
replace agecat3 = 1 if age < 20
replace agecat3 = 2 if age >= 20 & age < 30
replace agecat3 = 3 if age >= 30 & age < .
label define agecat3 1 "<20" 2 "20-29" 3 ">30"
label values agecat3 agecat3
label variable agecat3 "Q15: How old are you? 3 category"

/*
 * Alternative age category that looks specifically at 20-26 yos who may be impacted by ACA.
 * This grouping will likely not be used.

 gen agecat3 = .
replace agecat3 = 1 if age < 20
replace agecat3 = 2 if age >= 20 & age < 27
replace agecat3 = 3 if age >= 27 & age < .
label define agecat3 1 "<20" 2 "20-26" 3 ">27"
label values agecat3 agecat3
label variable agecat3 "Q15: How old are you? 3 category centered on 20-26yos who may be impacted by ACA"

*/


** Parity **

// Parity dummy var, indicating whether R has or does not have children, disregarding quantity
gen paritycat2 = .
replace paritycat2 = 1 if parity == 1
replace paritycat2 = 2 if parity >= 2 & parity < .
label define paritycat2 1 "0 children" 2 "1+ children"
label values paritycat2 paritycat2
label variable paritycat2 "Q20: How many children do you have?"


** Household poverty status **

// Generate poverty status based on 2016 guidelines
// https://aspe.hhs.gov/poverty-guidelines (only for contiguous US, but we only have states in lower 48 in sample)
// Using q22 (Ninhousehold) and q23 (householdincome) to calculate this

// Calculating midpoint of household income range from survey Q23
gen midpointinc = .
replace midpointinc = 0     if HHincome == 1 // No income last year
replace midpointinc = 15999 if HHincome == 2 // using ceiling of HH income group 2, under $16000
replace midpointinc = 20499 if HHincome == 3 // Mid of 16k and 24,999
replace midpointinc = 27499 if HHincome == 4 // Mid of 25k and 29,999
replace midpointinc = 34999 if HHincome == 5 // Mid of 30k and 39,999
replace midpointinc = 44999 if HHincome == 6 // Mid of 40k and 49,999
replace midpointinc = 55999 if HHincome == 7 // Mid of 50k and 59,9999
replace midpointinc = 60000 if HHincome == 8 // using floor of HH income group 8, $60000 or more

// Generate what 100% of poverty threshold would be for R's household size
// R's household size comes from Q 22
// 2016 poverty threshold comes from HHS, linked above
gen threshold = ((Ninhousehold) * 4160 + 11770) 

// Generate ratio of what R's reported income is over poverty threshold
// This gives us their "poverty ratio"
gen povertyratio = (midpointinc/threshold) if (HHincome != . & midpointinc != .)

drop midpointinc threshold

// Categorize poverty ratio, category breaks rec'd by DC.
// Using ratios, not percents of the FPL (Federal Poverty Level)
gen povcat3 = .
// < 100% of FPL
replace povcat3 = 1 if povertyratio < 1
// Between 100 - 249% FPL
replace povcat3 = 2 if povertyratio >=1 & povertyratio < 2.5
// 250 % FPL +, excluding missings.
replace povcat3 = 3 if povertyratio >=2.5 & povertyratio < .
label define povcat3 1 "<100% FPL" 2 "100-249% FPL" 3 "250+% FPL"
label values povcat3 povcat3
label variable povcat3 "Poverty status as % of Federal Poverty Level, 3 category breakdown"

// Alternative poverty variable that follows Medicaid expansion guidelines
gen povcat5 = .
replace povcat5 = 1 if povertyratio < 1
replace povcat5 = 2 if povertyratio >= 1 & povertyratio < 1.38
replace povcat5 = 3 if povertyratio >= 1.38 & povertyratio < 2
replace povcat5 = 4 if povertyratio >= 2    & povertyratio < 2.5
replace povcat5 = 5 if povertyratio >= 2.5  & povertyratio < .
label define povcat5 1 "<100% FPL" 2 "100-137% FPL" 3 "138-199% FPL" 4 "200-250% FPL" 5 ">200% FPL"
label values povcat5 povcat5
label variable povcat5 "Poverty status, 5 category breakdown"

** Language

// Reorder and label language variable
gen language = .
replace language = 1 if q18 == 1
replace language = 2 if q18 == 2
replace language = 3 if q18 == 4
replace language = 4 if q18 == 3
label define language 1 "English" 2 "Spanish" 3 "Both English and Spanish" 4 "Other"
label values language language
label variable language "Q18: Language spoken at home"

