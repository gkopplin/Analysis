/*q2 scratch */
// Recode with multiple responses collapsed into one category
gen reasonforvisit = .
replace reasonforvisit = 99 if (q2a != . | q2b != . | q2c != . | q2d != . | q2e != . | q2f != . | q2g != .)
replace reasonforvisit = 1  if q2a == 1 & (q2b != 1 & q2c != 1 & q2d != 1 & q2e != 1 & q2f != 1 & q2g == .)
replace reasonforvisit = 2  if q2b == 1 & (q2a != 1 & q2c != 1 & q2d != 1 & q2e != 1 & q2f != 1 & q2g == .)
replace reasonforvisit = 3  if q2c == 1 & (q2a != 1 & q2b != 1 & q2d != 1 & q2e != 1 & q2f != 1 & q2g == .)
replace reasonforvisit = 4  if q2d == 1 & (q2a != 1 & q2b != 1 & q2c != 1 & q2e != 1 & q2f != 1 & q2g == .)
replace reasonforvisit = 5  if q2e == 1 & (q2a != 1 & q2b != 1 & q2c != 1 & q2d != 1 & q2f != 1 & q2g == .)
replace reasonforvisit = 14  if q2f == 1 & (q2a != 1 & q2b != 1 & q2c != 1 & q2d != 1 & q2e != 1)
replace reasonforvisit = 7  if q2g == 1 & (q2a != 1 & q2b != 1 & q2c != 1 & q2d != 1 & q2e != 1)
replace reasonforvisit = 8  if q2g == 2 & (q2a != 1 & q2b != 1 & q2c != 1 & q2d != 1 & q2e != 1)
replace reasonforvisit = 9  if q2g == 3 & (q2a != 1 & q2b != 1 & q2c != 1 & q2d != 1 & q2e != 1)
replace reasonforvisit = 10 if q2g == 4 & (q2a != 1 & q2b != 1 & q2c != 1 & q2d != 1 & q2e != 1)
replace reasonforvisit = 11 if q2g == 5 & (q2a != 1 & q2b != 1 & q2c != 1 & q2d != 1 & q2e != 1)
replace reasonforvisit = 12 if q2g == 6 & (q2a != 1 & q2b != 1 & q2c != 1 & q2d != 1 & q2e != 1)
replace reasonforvisit = 14  if q2g == 9 & (q2a != 1 & q2b != 1 & q2c != 1 & q2d != 1 & q2e != 1)
replace reasonforvisit = 13 if reasonforvisit == 99
label define reasonforvisit 1 "Get BC or BC refill" 2 "Problem with BC" 3 "Annual GYN exam" 4 "Infection" 5 "Pregnancy test" ///
							14 "Other" 7 "EC" 8 "IUD/Implant removal" 9 "Breast exam" 10 "Other repro health issue" 11 "Other preventative care" ///
							12 "IUD follow-up appt" 13 "More than one response"
label values reasonforvisit reasonforvisit
label variable reasonforvisit "Q2: Why are you here today? (full list w/ mult. resp. option)"


// Q2 Categories based on previous report by Gold, Frost, Bueck
// In this instance, prioritized contraceptive visit before annual exam-- MZ?
gen reasonforvisitcat5 = .
replace reasonforvisitcat5 = 99 if (q2a != . | q2b != . | q2c != . | q2d != . | q2e != . | q2f != .)
replace reasonforvisitcat5 = 3  if q2e == 1 & (q2a != 1 & q2b != 1 & q2c != 1 & q2d != 1 & q2f != 1 & q2g == .)
replace reasonforvisitcat5 = 4  if q2d == 1 & (q2a != 1 & q2b != 1 & q2c != 1 & q2e != 1 & q2f != 1 & q2g == .)
replace reasonforvisitcat5 = 2  if (q2c == 1)
replace reasonforvisitcat5 = 1  if (q2a == 1 | q2b == 1 | q2g == 1 | q2g == 2 | q2g == 6)
replace reasonforvisitcat5 = 5  if reasonforvisitcat5 == 99
label define reasonforvisitcat5 1 "Contraception" 2 "Annual gyn exam" 3 "Pregnancy test only" 4 "STI services only" 5 "Other services only"
label values reasonforvisitcat5 reasonforvisitcat5
label variable reasonforvisitcat5 "Q2: Why are you here today? (collapsed)"

/*q3 scratch*/
// Recode with multiple responses collapsed into one category	
gen currentBC = .
replace currentBC = 99 if (q3a != . | q3b != . | q3c != . | q3d != . | q3e != . | q3f != . | q3g != .)
replace currentBC = 1  if q3a == 1 & (q3b != 1 & q3c != 1 & q3d != 1 & q3e != 1 & q3f == . & q3g != 1)
replace currentBC = 2  if q3b == 1 & (q3a != 1 & q3c != 1 & q3d != 1 & q3e != 1 & q3f == . & q3g != 1)
replace currentBC = 3  if q3c == 1 & (q3a != 1 & q3b != 1 & q3d != 1 & q3e != 1 & q3f == . & q3g != 1)
replace currentBC = 4  if q3d == 1 & (q3a != 1 & q3b != 1 & q3c != 1 & q3e != 1 & q3f == . & q3g != 1)
replace currentBC = 9  if q3e == 1 & (q3a != 1 & q3b != 1 & q3c != 1 & q3d != 1 & q3f == . & q3g != 1)
replace currentBC = 6  if q3f == 1 & (q3a != 1 & q3b != 1 & q3c != 1 & q3d != 1 & q3g != 1)
replace currentBC = 7  if q3f == 2 & (q3a != 1 & q3b != 1 & q3c != 1 & q3d != 1 & q3g != 1)
replace currentBC = 8  if q3f == 3 & (q3a != 1 & q3b != 1 & q3c != 1 & q3d != 1 & q3g != 1)
replace currentBC = 10 if q3f == 9 & (q3a != 1 & q3b != 1 & q3c != 1 & q3d != 1 & q3g != 1)
replace currentBC = 11 if q3g == 1 & (q3a != 1 & q3b != 1 & q3c != 1 & q3d != 1 & q3f == .)
replace currentBC = 9 if currentBC == 99
label define currentBC 1 "Pill" 2 "Patch or ring" 3 "Depo shot" 4 "IUD or Implant" 6 "Condoms" 7 "Sterilization" ///
					   8 "Withdrawl" 9 "Other" 10 "More than one selected" 11 "Not currently using method"
label values currentBC currentBC
label variable currentBC "Q3: Which BC method are you currently using? (full list w/ mult. resp. option)"


// Q3 collapsed
// MZ-- unsure if this is a conventional collapsing of categories
gen currentBCcat6 = .
replace currentBCcat6 = 1 if (currentBC == 1 | currentBC == 2 | currentBC == 3)
replace currentBCcat6 = 2 if  currentBC == 4
replace currentBCcat6 = 3 if (currentBC == 6 | currentBC == 8)
replace currentBCcat6 = 4 if  currentBC == 7
replace currentBCcat6 = 5 if (currentBC == 9 | currentBC == 11)
replace currentBCcat6 = 6 if  currentBC == 11
label define currentBCcat6 1 "Pill, patch, ring, shot" 2 "LARC" 3 "Condoms or withdrawl" 4 "Sterilization" 5 "Other (including more than one)" 6 "None"
label values currentBCcat6 currentBCcat6
label variable currentBCcat6 "Q3: Which BC method are you currently using? (collapsed)"

/*q4 scratch */
// Following recodes used for OPA, but not ideal
// Recode with multiple responses collapsed into one category	
gen interestedBC = .
replace interestedBC = 99 if (q4a != . | q4b != . | q4c != . | q4d != . | q4e != . | q4f != . | q4g != . | q4h != .)
replace interestedBC = 1  if q4a == 1 & (q4b != 1 & q4c != 1 & q4d != 1 & q4e != 1 & q4f != 1 & q4g == . & q4h != 1)
replace interestedBC = 2  if q4b == 1 & (q4a != 1 & q4c != 1 & q4d != 1 & q4e != 1 & q4f != 1 & q4g == . & q4h != 1)
replace interestedBC = 3  if q4c == 1 & (q4a != 1 & q4b != 1 & q4d != 1 & q4e != 1 & q4f != 1 & q4g == . & q4h != 1)
replace interestedBC = 4  if q4d == 1 & (q4a != 1 & q4b != 1 & q4c != 1 & q4e != 1 & q4f != 1 & q4g == . & q4h != 1)
replace interestedBC = 5  if q4e == 1 & (q4a != 1 & q4b != 1 & q4c != 1 & q4d != 1 & q4f != 1 & q4g == . & q4h != 1)
replace interestedBC = 8  if q4f == 1 & (q4a != 1 & q4b != 1 & q4c != 1 & q4d != 1 & q4e != 1 & q4h != 1)
replace interestedBC = 6  if q4g == 1 & (q4a != 1 & q4b != 1 & q4c != 1 & q4d != 1 & q4e != 1 & q4h != 1)
replace interestedBC = 7  if q4g == 2 & (q4a != 1 & q4b != 1 & q4c != 1 & q4d != 1 & q4e != 1 & q4h != 1)
replace interestedBC = 8  if q4g == 9 & (q4a != 1 & q4b != 1 & q4c != 1 & q4d != 1 & q4e != 1 & q4h != 1)
replace interestedBC = 10 if q4h == 1 & (q4a != 1 & q4b != 1 & q4c != 1 & q4d != 1 & q4e != 1 & q4g == . & q4f != 1)
replace interestedBC = 9  if interestedBC == 99
label define interestedBC 1 "Pill" 2 "Patch or ring" 3 "Depo shot" 4 "IUD or Implant" 5 "EC" 6 "Condoms" 7 "Sterilization" ///
					   8 "Other" 9 "More than one selected" 10 "Not interested in method today" 
label values interestedBC interestedBC
label variable interestedBC "Q4: Which BC methods are you interested in today? (full list w/ mult. resp. option)"					   

// Collapsing.
gen interestedBCcat6 = .
replace interestedBCcat6 = 1 if (interestedBC == 1 | interestedBC == 2 | interestedBC == 3)
replace interestedBCcat6 = 2 if  interestedBC == 4
replace interestedBCcat6 = 3 if  interestedBC == 6
replace interestedBCcat6 = 4 if  interestedBC == 5
replace interestedBCcat6 = 5 if (interestedBC == 7 | interestedBC == 8 | interestedBC == 9)
replace interestedBCcat6 = 6 if  interestedBC == 10
label define interestedBCcat6 1 "Pill, patch, ring, shot" 2 "LARC" 3 "Condoms" 4 "EC" 5 "Other (including more than one)" 6 "None"
label values interestedBCcat6 interestedBCcat6
label variable interestedBCcat6 "Q4: Which BC method are you interested in today? (collapsed)"


/* q5 scratch */
// Recode with multiple responses collapsed into one category
gen whyswitch = .
replace whyswitch = 99 if (q5a != . | q5b != . | q5c != . | q5d != . | q5e != . | q5f != . | q5g != . | q5h != . | q5i !=.)
replace whyswitch = 1 if  q5a == 1 & (q5b != 1 & q5c != 1 & q5d != 1 & q5e != 1 & q5f != 1 & q5g != 1 & q5h != 1 & q5i != 1)
replace whyswitch = 2 if  q5b == 1 & (q5a != 1 & q5c != 1 & q5d != 1 & q5e != 1 & q5f != 1 & q5g != 1 & q5h != 1 & q5i != 1)
replace whyswitch = 3 if  q5c == 1 & (q5a != 1 & q5b != 1 & q5d != 1 & q5e != 1 & q5f != 1 & q5g != 1 & q5h != 1 & q5i != 1)
replace whyswitch = 4 if  q5d == 1 & (q5a != 1 & q5b != 1 & q5c != 1 & q5e != 1 & q5f != 1 & q5g != 1 & q5h != 1 & q5i != 1)
replace whyswitch = 5 if  q5e == 1 & (q5a != 1 & q5b != 1 & q5c != 1 & q5d != 1 & q5f != 1 & q5g != 1 & q5h != 1 & q5i != 1)
replace whyswitch = 6 if  q5f == 1 & (q5a != 1 & q5b != 1 & q5c != 1 & q5d != 1 & q5e != 1 & q5g != 1 & q5h != 1 & q5i != 1)
replace whyswitch = 7 if (q5g == 1 | q5h == 1) & (q5b != 1 & q5c != 1 & q5d != 1 & q5e != 1 & q5f != 1 & q5i != 1)
replace whyswitch = 9 if  q5i == 1 & (q5a != 1 & q5b != 1 & q5c != 1 & q5d != 1 & q5e != 1 & q5f != 1 & q5g != 1 & q5h != 1)
replace whyswitch = 8 if whyswitch == 99
label define whyswitch 1 "I've learned new things about my BC options" 2 "I can now afford the method I want" 3 "I can't afford my old method anymore" ///
					   4 "I've had side effects with my old method" 5 "I had an unplanned pregnancy on my old method" 6 "I'm not currently using a method" ///
					   7 "Other" 8 "More than one response selected" 9 "I'm not seeking to change my method today"
label values whyswitch whyswitch
label variable whyswitch "Q5: If the method you're interested in is different than the method you're currently using, why are you switching?"


/* q10 scratch*/
gen     insurancetype1 = .b
replace insurancetype1 = .a if insurancedummy == 2
replace insurancetype1 = 99 if (q10a == 1 | q10b == 1 | q10c == 1 | q10d == 1 | q10e == 1 | q10f == 1 | q10g == 1 | q10h !=. )
replace insurancetype1 = 1 if  (q10a == 1 & q10b != 1 & q10c != 1 & q10d != 1 & q10e != 1 & q10f != 1 & q10g != 1 & q10h ==. )
replace insurancetype1 = 2 if  (q10a != 1 & q10b == 1 & q10c != 1 & q10d != 1 & q10e != 1 & q10f != 1 & q10g != 1 & q10h ==. )
replace insurancetype1 = 3 if  (q10a != 1 & q10b != 1 & q10c == 1 & q10d != 1 & q10e != 1 & q10f != 1 & q10g != 1 & q10h ==. )
replace insurancetype1 = 4 if  (q10a != 1 & q10b != 1 & q10c != 1 & q10d == 1 & q10e != 1 & q10f != 1 & q10g != 1 & q10h ==. )
replace insurancetype1 = 5 if  (q10a != 1 & q10b != 1 & q10c != 1 & q10d != 1 & q10e == 1 & q10f != 1 & q10g != 1 & q10h ==. )
replace insurancetype1 = 6 if  (q10a != 1 & q10b != 1 & q10c != 1 & q10d != 1 & q10e != 1 & q10f == 1 & q10g != 1 & q10h ==. )
replace insurancetype1 = 7 if  (q10a != 1 & q10b != 1 & q10c != 1 & q10d != 1 & q10e != 1 & q10f != 1 & q10g == 1 & q10h ==. )
replace insurancetype1 = 8 if  insurancetype1 == 99
label define insurancetype 1 "Employer-based" 2 "Marketplace or Exchange" 3 "Medicaid" 4 "TRICARE or other military" 5 "Indian Health Service" 6 "Medicare" 7 "Other" 8 "More than one selected" ///
						   .a "N/A" .b "Missing"
label values insurancetype1 insurancetype
label variable insurancetype1 "Q10 Type of insurance (w mult. resp. option)"

gen insurance1cat4 = .b
replace insurance1cat4 = .a if insurancedummy ==2
replace insurance1cat4 = 1 if insurancetype1 == 1
replace insurance1cat4 = 2 if insurancetype1 == 2
replace insurance1cat4 = 3 if insurancetype1 == 3 | insurancetype1 == 4 | insurancetype1 == 5 | insurancetype1 == 6
replace insurance1cat4 = 4 if insurancetype1 == 7 | insurancetype1 ==8
label define insurance1cat4 1 "Private" 2 "Marketplace or Exchange" 3 "Public (Medicaid, Medicare, IHS, TRICARE)" 4 "Other (includes more than one selected)" ///
							.a "N/A" .b "Missing"
label values insurance1cat4 insurance1cat4
label variable insurance1cat4 "Q10: Type of insurance (collapsed w/ mult. resp. option)"

// This insurancetype variable prioritizes public insurances
// also eliminates "mult responses" category
// MZ and KB decided to use insurancetype1 for the OPA mtg on Dec 12th
gen insurancetype2 = .
replace insurancetype2 = 7 if q10g == 1
replace insurancetype2 = 1 if q10a == 1
replace insurancetype2 = 4 if q10d == 1
replace insurancetype2 = 5 if q10e == 1
replace insurancetype2 = 2 if q10b == 1
replace insurancetype2 = 6 if q10f == 1
replace insurancetype2 = 3 if q10c == 1
label values insurancetype2 insurancetype
label variable insurancetype2 "Q10: Type of insurance (w/ priority given to public)"

gen insurance2cat4 = .
replace insurance2cat4 = 1 if insurancetype2 == 1
replace insurance2cat4 = 2 if insurancetype2 == 2
replace insurance2cat4 = 3 if insurancetype2 == 3 | insurancetype2 == 4 | insurancetype2 == 5 | insurancetype2 == 6
replace insurance2cat4 = 4 if insurancetype2 == 7 | insurancetype2 ==8
label define insurance2cat4 1 "Private" 2 "Marketplace or Exchange" 3 "Public (Medicaid, Medicare, IHS, TRICARE)" 4 "Other"
label values insurance2cat4 insurance2cat4
label variable insurance1cat4 "Q10: Type of insurance collapsed"


/* Below, forced skip pattern based on Q9. This is necessary, because there are a substantial
   number of Rs (identified in the inconsistencies.do script) who failed to follow the skip pattern*/

// Q 10, insurance type with "More than one response" as option
// Need to check in with MZ to see if there's a way we wish to prioritize insurance.
gen     insurancetype1force = .b
replace insurancetype1force = .a if insurancedummy == 2
replace insurancetype1force = 99 if (q10a == 1 | q10b == 1 | q10c == 1 | q10d == 1 | q10e == 1 | q10f == 1 | q10g == 1 | q10h !=.) & insurancedummy == 1
replace insurancetype1force = 1 if  (q10a == 1 & q10b != 1 & q10c != 1 & q10d != 1 & q10e != 1 & q10f != 1 & q10g != 1 & q10h ==.) & insurancedummy == 1
replace insurancetype1force = 2 if  (q10a != 1 & q10b == 1 & q10c != 1 & q10d != 1 & q10e != 1 & q10f != 1 & q10g != 1 & q10h ==.) & insurancedummy == 1
replace insurancetype1force = 3 if  (q10a != 1 & q10b != 1 & q10c == 1 & q10d != 1 & q10e != 1 & q10f != 1 & q10g != 1 & q10h ==.) & insurancedummy == 1
replace insurancetype1force = 4 if  (q10a != 1 & q10b != 1 & q10c != 1 & q10d == 1 & q10e != 1 & q10f != 1 & q10g != 1 & q10h ==.) & insurancedummy == 1
replace insurancetype1force = 5 if  (q10a != 1 & q10b != 1 & q10c != 1 & q10d != 1 & q10e == 1 & q10f != 1 & q10g != 1 & q10h ==.) & insurancedummy == 1
replace insurancetype1force = 6 if  (q10a != 1 & q10b != 1 & q10c != 1 & q10d != 1 & q10e != 1 & q10f == 1 & q10g != 1 & q10h ==.) & insurancedummy == 1
replace insurancetype1force = 7 if  (q10a != 1 & q10b != 1 & q10c != 1 & q10d != 1 & q10e != 1 & q10f != 1 & q10g == 1 & q10h ==.) & insurancedummy == 1
replace insurancetype1force = 8 if  insurancetype1force == 99
label values insurancetype1force insurancetype
label variable insurancetype1force "Q10: Type of insurance (w mult. resp. option) (forced skip pattern)"

gen insurance1cat4force = .b
replace insurance1cat4force = .a if insurancedummy == 2
replace insurance1cat4force = 1 if insurancetype1force == 1
replace insurance1cat4force = 2 if insurancetype1force == 2
replace insurance1cat4force = 3 if insurancetype1force == 3 | insurancetype1force == 4 | insurancetype1force == 5 | insurancetype1force == 6
replace insurance1cat4force = 4 if insurancetype1force == 7 | insurancetype1force ==8
label values insurance1cat4force insurance1cat4
label variable insurance1cat4force "Q10: Type of insurance collapsed (w mult. resp. option)(forced skip pattern)"

// This insurancetype variable prioritizes public insurances
// also eliminates "mult responses" category
// not using for OPA
gen insurancetype2force = .b
replace insurancetype2force = .a if insurancedummy == 2
replace insurancetype2force = 7 if q10g == 1 & insurancedummy == 1
replace insurancetype2force = 1 if q10a == 1 & insurancedummy == 1
replace insurancetype2force = 4 if q10d == 1 & insurancedummy == 1
replace insurancetype2force = 5 if q10e == 1 & insurancedummy == 1
replace insurancetype2force = 2 if q10b == 1 & insurancedummy == 1
replace insurancetype2force = 6 if q10f == 1 & insurancedummy == 1
replace insurancetype2force = 3 if q10c == 1 & insurancedummy == 1
label values insurancetype2force insurancetype
label variable insurancetype2force "Q10: Type of insurance (w/ priority given to public) (forced skip pattern)"

// not using for OPA
gen insurance2cat4force = .
replace insurance2cat4force = 1 if insurancetype2 == 1
replace insurance2cat4force = 2 if insurancetype2 == 2
replace insurance2cat4force = 3 if insurancetype2 == 3 | insurancetype2 == 4 | insurancetype2 == 5 | insurancetype2 == 6
replace insurance2cat4force = 4 if insurancetype2 == 7 | insurancetype2 ==8
label values insurance2cat4force insurance2cat4
label variable insurance2cat4force "Q10: Type of insurance collapsed (forced skip pattern)"


/* q11 scratch */

// Among women who answered Q11 indicating they don't intend to use insurance, why not?
// Not using this variable for the OPA mtg, using data from all of Q11
gen notusinginsurance = .
replace notusinginsurance = q11 if q11 < 5
replace notusinginsurance = 5   if q11e == 1
replace notusinginsurance = 5   if (q11 == 5 & q11a != 1 & q11b!=1 & q11c!=1 & q11d!=1)
replace notusinginsurance = 1   if q11a == 1
replace notusinginsurance = 2   if q11b == 1
replace notusinginsurance = 3   if q11c == 1
replace notusinginsurance = 4   if q11d == 1
label values notusinginsurance whyinsr
label variable notusinginsurance "Q11: If not using insurance, why not?"

// Full question 11
gen whynotusinginsurance = .b
replace whynotusinginsurance = .a if insurancedummy == 2
replace whynotusinginsurance = q11 if q11 != .
replace whynotusinginsurance = 5   if q11e == 1
replace whynotusinginsurance = 5   if (q11 == 5 & q11a != 1 & q11b!=1 & q11c!=1 & q11d!=1)
replace whynotusinginsurance = 1   if q11a == 1
replace whynotusinginsurance = 2   if q11b == 1
replace whynotusinginsurance = 3   if q11c == 1
replace whynotusinginsurance = 4   if q11d == 1
label define whynotusinginsurance 1 "My insurance doesn't cover service" 2 "My insurance can't be used here" ///
								  3 "Can't use because, if I did, someone might find out" 4 "Deductible or co-pay too high" ///
								  5 "Other" 6 "I expect to use health insurance to pay for some or part of this visit" ///
								  .a "N/A" .b "Missing"
label values whynotusinginsurance whynotusinginsurance
label variable whynotusinginsurance "Q11: If you have insurance and aren't using it today, why not?"

/* Below, forced skip pattern based on Q9. This is necessary, because there are a substantial
   number of Rs (identified in the inconsistencies.do script) who failed to follow the skip pattern*/

   
// Q11
// Among women who answered Q11, which intend to use their insurance at this visit
// All answers that an individual gave are tallied in their respective categories
// even though this was originally a forced choice question
// Not using for OPA, combining full details of Q11 (usingheldinsurance + notusinginsurance)
gen usingheldinsuranceforce = .
replace usingheldinsuranceforce = 1 if q11 == 6  & insurancedummy == 1
replace usingheldinsuranceforce = 2 if (q11 <6 & q11 !=.  & insurancedummy == 1)
label values usingheldinsuranceforce yesno
label variable usingheldinsuranceforce "Q11: Plan to use insurance today (forced skip pattern)"

// Among women who answered Q11 indicating they don't intend to use insurance, why not?
// Not using for OPA
gen notusinginsuranceforce = .
replace notusinginsuranceforce = q11 if q11 < 5 & insurancedummy == 1
replace notusinginsuranceforce = 5   if q11e == 1 & insurancedummy == 1
replace notusinginsuranceforce = 5   if (q11 == 5 & q11a != 1 & q11b!=1 & q11c!=1 & q11d!=1 & insurancedummy == 1)
replace notusinginsuranceforce = 1   if q11a == 1 & insurancedummy == 1
replace notusinginsuranceforce = 2   if q11b == 1 & insurancedummy == 1
replace notusinginsuranceforce = 3   if q11c == 1 & insurancedummy == 1
replace notusinginsuranceforce = 4   if q11d == 1 & insurancedummy == 1
label values notusinginsuranceforce whyinsr
label variable notusinginsuranceforce "Q11: If not using insurance, why not (forced skip pattern)?"

// Full Q11 to be used for OPA
gen whynotusinginsuranceforce = .b
replace whynotusinginsuranceforce = .a if insurancedummy == 2
replace whynotusinginsuranceforce = q11 if (q11 !=.   & insurancedummy == 1 )
replace whynotusinginsuranceforce = 5   if (q11e == 1 & insurancedummy == 1)
replace whynotusinginsuranceforce = 5   if (q11 == 5  & q11a != 1 & q11b!=1 & q11c!=1 & q11d!=1 & insurancedummy == 1)
replace whynotusinginsuranceforce = 1   if (q11a == 1 & insurancedummy == 1)
replace whynotusinginsuranceforce = 2   if (q11b == 1 & insurancedummy == 1)
replace whynotusinginsuranceforce = 3   if (q11c == 1 & insurancedummy == 1)
replace whynotusinginsuranceforce = 4   if (q11d == 1 & insurancedummy == 1)
label define whynotusinginsuranceforce 1 "My insurance doesn't cover service" 2 "My insurance can't be used here" ///
								  3 "Can't use because, if I did, someone might find out" 4 "Deductible or co-pay too high" ///
								  5 "Other" 6 "I expect to use health insurance to pay for some or part of this visit" ///
								  .a "N/A" .b "Missing"
label values whynotusinginsuranceforce whynotusinginsuranceforce
label variable whynotusinginsuranceforce "Q11: If you have insurance and aren't using it today, why not?(forced skip pattern)"
