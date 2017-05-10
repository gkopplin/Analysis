gutt using "K:\Projects\429 OPA-ACA\Component 3 - Client survey\Analysis\Prints\prelimtabs.xlsx", replace
// Demographic Characteristics w/ missing
gtab agecat5, body(b.0 pct.0) missing subtitle("Age, standard breakdown") jump(2) continue
gtab agecat3, body(b.0 pct.0) missing subtitle("Age, centered on 20-26 year olds who may be impacted by ACA") jump(2) continue
gtab paritycat2, body(b.0 pct.0) missing subtitle("Parity") jump(2) continue
gtab relationshipstatus, body(b.0 pct.0) missing subtitle("Relationship Status") jump(2) continue
gtab povcat3, body(b.0 pct.0) missing subtitle("Poverty Status, 3 category") jump(2) continue
gtab povcat5, body (b.0 pct.0) missing subtitle ("Poverty Status, 5 category") jump(2) continue
gtab race, body(b.0 pct.0) missing subtitle("Race") jump(2) continue
gtab language, body(b.0 pct.0) missing subtitle("Language spoken at home") jump(2) continue
gtab education, body(b.0 pct.0) missing subtitle("Education") jump(2) continue
gtab nativity, body(b.0 pct.0) missing subtitle("Nativity") jump(2) continue
gtab firstvisit, body(b.0 pct.0) missing subtitle("First visit to clinic") sheet("Demographics")

// Demographic characteristics w/o missing
gtab agecat5, body(b.0 pct.0) subtitle("Age, standard breakdown") jump(2) continue
gtab agecat3, body(b.0 pct.0) subtitle("Age, centered on 20-26 year olds who may be impacted by ACA") jump(2) continue
gtab paritycat2, body(b.0 pct.0) subtitle("Parity") jump(2) continue
gtab relationshipstatus, body(b.0 pct.0) subtitle("Relationship Status") jump(2) continue
gtab povcat3, body(b.0 pct.0) subtitle("Poverty Status, 3 category") jump(2) continue
gtab povcat5, body (b.0 pct.0) subtitle ("Poverty Status, 5 category") jump(2) continue
gtab race, body(b.0 pct.0) subtitle("Race") jump(2) continue
gtab language, body(b.0 pct.0) subtitle("Language spoken at home") jump(2) continue
gtab education, body(b.0 pct.0) subtitle("Education") jump(2) continue
gtab nativity, body(b.0 pct.0) subtitle("Nativity") jump(2) continue
gtab firstvisit, body(b.0 pct.0) subtitle("First visit to clinic") sheet("Demographics no missing")

// Inconsistencies
gtab flag, body(b.0 pct.0) missing subtitle("Surveys flagged in coding") jump(2) continue 
gtab inconsistent12a12b, body(b.0 pct.0) missing subtitle("Answered both 12a and 12b") jump(2) continue
gtab inconsistenthaveinsurance, body(b.0 pct.0) missing subtitle("Rs who answered 'have insurance' Qs but said no ins. in Q9") jump(2) continue
gtab inconsistentnoinsurance, body(b.0 pct.0) missing subtitle("Rs who answered 'no insurance' Qs but said have ins. in Q9") jump(2) continue
gtab inconsistent1314, body(b.0 pct.0) missing subtitle("Rs who indicated didn't lose insurance in past 12mo, then gave reason for loss") jump(2) continue
gtab instypeofinconsistent, body(b.0 pct.0) missing subtitle("Type of insurance of Rs who gave any inconsistent responses") sheet("Inconsistencies")

// Insurance as is w/ missing
gtab insurancedummy, body(b.0 pct.0) missing subtitle("Q9: Do you have insurance?") jump(2) continue
gtab insurancetype1, body(b.0 pct.0) missing subtitle("Q10: Insurance type (w/ mult. response option)") jump(2) continue
gtab insurance1cat4, body(b.0 pct.0) missing subtitle("Q10: Insurance type (collapsed w/ mult. response option)") jump(2) continue
gtab whynotusinginsurance, body(b.0 pct.0) missing subtitle("Q11: If not using insurance today, why not?") jump(2) continue
gtab triedgettinginsurance, body(b.0 pct.0) missing subtitle("Q12: If you don't have insurance, did you try to get it this year?") jump(2) continue
gtab didntgetinsurance, body(b.0 pct.0) missing subtitle("Q12a: If you tried to get insurance, why didn't you?") jump(2) continue
gtab didnttryinsurance, body(b.0 pct.0) missing subtitle("Q12b: If you didn't try to get insurance, why not?") jump(2) continue
gtab lostinsurance12mo, body(b.0 pct.0) missing subtitle("Q13: Lost insurance in past 12 months dummy var") jump(2) continue
gtab q13, body(b.0 pct.0) missing subtitle("Q13: For how many of the last 12 months had insurance?") jump(2) continue
gtab whylostinsurance, body(b.0 pct.0) missing subtitle("Q14: If you lost your insurance in past 12 months, why?") sheet("Insurance as written")

// Insruance as is w/o missing
gtab insurancedummy, body(b.0 pct.0) subtitle("Q9: Do you have insurance?") jump(2) continue
gtab insurancetype1, body(b.0 pct.0) subtitle("Q10: Insurance type (w/ mult. response option)") jump(2) continue
gtab insurance1cat4, body(b.0 pct.0) subtitle("Q10: Insurance type (collapsed w/ mult. response option)") jump(2) continue
gtab whynotusinginsurance, body(b.0 pct.0) subtitle("Q11: If not using insurance today, why not?") jump(2) continue
gtab triedgettinginsurance, body(b.0 pct.0) subtitle("Q12: If you don't have insurance, did you try to get it this year?") jump(2) continue
gtab didntgetinsurance, body(b.0 pct.0) subtitle("Q12a: If you tried to get insurance, why didn't you?") jump(2) continue
gtab didnttryinsurance, body(b.0 pct.0) subtitle("Q12b: If you didn't try to get insurance, why not?") jump(2) continue
gtab lostinsurance12mo, body(b.0 pct.0) subtitle("Q13: Lost insurance in past 12 months dummy var") jump(2) continue
gtab q13, body(b.0 pct.0) subtitle("Q13: For how many of the last 12 months had insurance?") jump(2) continue
gtab whylostinsurance, body(b.0 pct.0) subtitle("Q14: If you lost your insurance in past 12 months, why?") sheet("Insurance as written no missing")

// Insurance forced w/ missing
gtab insurancedummy, body(b.0 pct.0) missing subtitle("Q9: Do you have insurance?") jump(2) continue
gtab insurancetype1force, body(b.0 pct.0) missing subtitle("Q10: Insurance type (w/ mult. response option)") jump(2) continue
gtab insurance1cat4force, body(b.0 pct.0) missing subtitle("Q10: Insurance type (collapsed w/ mult. response option)") jump(2) continue
gtab whynotusinginsuranceforce, body(b.0 pct.0) missing subtitle("Q11: If not using insurance today, why not?") jump(2) continue
gtab triedgettinginsuranceforce, body(b.0 pct.0) missing subtitle("Q12: If you don't have insurance, did you try to get it this year?") jump(2) continue
gtab didntgetinsuranceforce, body(b.0 pct.0) missing subtitle("Q12a: If you tried to get insurance, why didn't you?") jump(2) continue
gtab didnttryinsuranceforce, body(b.0 pct.0) missing subtitle("Q12b: If you didn't try to get insurance, why not?") sheet("Insurance forced")

// Insurance forced w/o missing
gtab insurancedummy, body(b.0 pct.0)  subtitle("Q9: Do you have insurance?") jump(2) continue
gtab insurancetype1force, body(b.0 pct.0)  subtitle("Q10: Insurance type (w/ mult. response option)") jump(2) continue
gtab insurance1cat4force, body(b.0 pct.0)  subtitle("Q10: Insurance type (collapsed w/ mult. response option)") jump(2) continue
gtab whynotusinginsuranceforce, body(b.0 pct.0)  subtitle("Q11: If not using insurance today, why not?") jump(2) continue
gtab triedgettinginsuranceforce, body(b.0 pct.0)  subtitle("Q12: If you don't have insurance, did you try to get it this year?") jump(2) continue
gtab didntgetinsuranceforce, body(b.0 pct.0)  subtitle("Q12a: If you tried to get insurance, why didn't you?") jump(2) continue
gtab didnttryinsuranceforce, body(b.0 pct.0)  subtitle("Q12b: If you didn't try to get insurance, why not?") sheet("Insurance forced no missing")

// Visit-related w/ missing
gtab reasonforvisit, body(b.0 pct.0) missing subtitle("Q2: Why are you here today?") jump(1) continue
gtab reasonforvisitcat5, body(b.0 pct.0) missing subtitle("Q2: Why are you here today? (collapsed)") jump(1) continue
gtab currentBC, body(b.0 pct.0) missing subtitle("Q3: If you're currently using a method, which?") jump(1) continue
gtab currentBCcat6, body(b.0 pct.0) missing subtitle("Q3: If you're currently using a method, which? (collapsed)") jump(1) continue
gtab interestedBC, body(b.0 pct.0) missing subtitle("Q4: What method(s) are you interested in today?") jump(1) continue
gtab interestedBCcat6, body(b.0 pct.0) missing subtitle("Q4: What method(s) are you interested in today? (collapsed)") jump(1) continue
gtab whyswitch, body(b.0 pct.0) missing subtitle("Q5: If the BC you're interested in is different than the one you're currently using, why do you want to switch?") jump(1) continue
gtab whythislocation, body(b.0 pct.0) missing subtitle("Q6: Why did you choose this location for services?") jump(1) continue
gtab q6b, missing body(b.0 pct.0) subtitle("Q6: I have been here before") continue
gtab q6h, missing body(b.0 pct.0) subtitle("Q6: Staff here treat me respectfully") continue
gtab q6d, missing body(b.0 pct.0) subtitle("Q6: This location is convenient for me") continue
gtab q6j, missing body(b.0 pct.0) subtitle("Q6: I can get free or low-cost services here") continue
gtab q6g, missing body(b.0 pct.0) subtitle("Q6: Services here are confidential; no one needs to know") continue
gtab q6e, missing body(b.0 pct.0) subtitle("Q6: I can get the birth control method I want here") continue
gtab q6k, missing body(b.0 pct.0) subtitle("Q6: I can use my insurance here") continue
gtab q6a, missing body(b.0 pct.0) subtitle("Q6: This is the only place that I can get the services I need") continue
gtab q6c, missing body(b.0 pct.0) subtitle("Q6: Someone recommended I come here") continue
gtab q6i, missing body(b.0 pct.0) subtitle("Q6: Staff here can refer me for other health care I need") continue
gtab q6f, missing body(b.0 pct.0) subtitle("Q6: There are special services for teens and young people here") jump(1) continue
gtab q6missing, body(b.0 pct.0) subtitle("Q6: Number of responses completely missing for Q6") jump(1) continue
gtab whynovisit, body(b.0 pct.0) missing subtitle("Q7: Other than today's visit, if you didn't make a visit for any birth control services in the last year, why not?") jump(1) continue
gtab q8, body(b.0 pct.0) missing subtitle("Q8: In the last year, have you gone anywhere else for medical care?") sheet("Visit reasons")

// Visit-related w/o missing
gtab reasonforvisit, body(b.0 pct.0)  subtitle("Q2: Why are you here today?") jump(1) continue
gtab reasonforvisitcat5, body(b.0 pct.0)  subtitle("Q2: Why are you here today? (collapsed)") jump(1) continue
gtab currentBC, body(b.0 pct.0)  subtitle("Q3: If you're currently using a method, which?") jump(1) continue
gtab currentBCcat6, body(b.0 pct.0)  subtitle("Q3: If you're currently using a method, which? (collapsed)") jump(1) continue
gtab interestedBC, body(b.0 pct.0)  subtitle("Q4: What method(s) are you interested in today?") jump(1) continue
gtab interestedBCcat6, body(b.0 pct.0)  subtitle("Q4: What method(s) are you interested in today? (collapsed)") jump(1) continue
gtab whyswitch, body(b.0 pct.0)  subtitle("Q5: If the BC you're interested in is different than the one you're currently using, why do you want to switch?") jump(1) continue
gtab whythislocation, body(b.0 pct.0) subtitle("Q6: Why did you choose this location for services?") jump(1) continue
gtab q6b, missing body(b.0 pct.0) subtitle("Q6: I have been here before") continue
gtab q6h, missing body(b.0 pct.0) subtitle("Q6: Staff here treat me respectfully") continue
gtab q6d, missing body(b.0 pct.0) subtitle("Q6: This location is convenient for me") continue
gtab q6j, missing body(b.0 pct.0) subtitle("Q6: I can get free or low-cost services here") continue
gtab q6g, missing body(b.0 pct.0) subtitle("Q6: Services here are confidential; no one needs to know") continue
gtab q6e, missing body(b.0 pct.0) subtitle("Q6: I can get the birth control method I want here") continue
gtab q6k, missing body(b.0 pct.0) subtitle("Q6: I can use my insurance here") continue
gtab q6a, missing body(b.0 pct.0) subtitle("Q6: This is the only place that I can get the services I need") continue
gtab q6c, missing body(b.0 pct.0) subtitle("Q6: Someone recommended I come here") continue
gtab q6i, missing body(b.0 pct.0) subtitle("Q6: Staff here can refer me for other health care I need") continue
gtab q6f, missing body(b.0 pct.0) subtitle("Q6: There are special services for teens and young people here") jump(1) continue
gtab q6missing, body(b.0 pct.0) subtitle("Q6: Number of responses completely missing for Q6") jump(1) continue
gtab whynovisit, body(b.0 pct.0) subtitle("Q7: Other than today's visit, if you didn't make a visit for any birth control services in the last year, why not?") jump(1) continue
gtab q8, body(b.0 pct.0)  subtitle("Q8: In the last year, have you gone anywhere else for medical care?") sheet("Visit reasons no missing")

