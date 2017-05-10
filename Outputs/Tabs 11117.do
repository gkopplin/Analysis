gutt using "K:\Projects\429 OPA-ACA\Component 3 - Client survey\Analysis\Prints\tabs11117.xlsx", replace

// Inconsistencies
gtab inconsistent12a12b, body(b.0 pct.0) missing subtitle("R answered 12a and 12b") jump(2) continue
gtab inconsistenthaveinsurance, body(b.0 pct.0) missing subtitle("R answered 'have insurance' Qs but answered 'no' to Q9") jump(2) continue
gtab inconsistentnoinsurance, body(b.0 pct.0) missing subtitle("Ranswered 'no insurance' Qs but answered 'yes' to Q9") jump(2) continue
gtab inconsistent1314, body(b.0 pct.0) jump(2) missing subtitle("R answered 'didn't lose insurance in last 12 mo' and then gave reason for loss") continue
gtab flag, body(b.0 pct.0) jump(2) missing subtitle("Survey flagged for insurance inconsistency in coding") continue
gtab anyinconsistency, body(b.0 pct.0) jump(2) missing subtitle("Survey flagged for any insurance-related inconsistency") continue
gtab clinicid anyinconsistency, body(b.0) missing subtitle("Inconsistencies by ClinicID") row cell sheet("Inconsistencies")

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

// Reason for visit w/ missing
gtab q2ar, body(b.0 pct.0) missing subtitle("Q2: Here for BC refill") jump(2) continue
gtab q2br, body(b.0 pct.0) missing subtitle("Q2: Here due to method issue") jump(2) continue
gtab q2cr, body(b.0 pct.0) missing subtitle("Q2: Here for annual GYN exam") jump(2) continue
gtab q2dr, body(b.0 pct.0) missing subtitle("Q2: May have infection") jump(2) continue
gtab q2er, body(b.0 pct.0) missing subtitle("Q2: Here for pregnancy test") jump(2) continue
gtab q2fr, body(b.0 pct.0) missing subtitle("Q2: Here for other reason") jump(2) continue
gtab q2g1r, body(b.0 pct.0) missing subtitle("Q2: Here for EC") jump(2) continue
gtab q2g2r, body(b.0 pct.0) missing subtitle("Q2: Here for LARC removal") jump(2) continue
gtab q2g3r, body(b.0 pct.0) missing subtitle("Q2: Here for breast exam") jump(2) continue
gtab q2g4r, body(b.0 pct.0) missing subtitle("Q2: Here for other repro health problems") jump(2) continue
gtab q2g5r, body(b.0 pct.0) missing subtitle("Q2: Here for other preventative care") jump(2) continue
gtab q2g6r, body(b.0 pct.0) missing subtitle("Q2: Here for IUD follow-up") sheet("Reason for visit")

// Reason for visit w/o missing
gtab q2ar, body(b.0 pct.0) subtitle("Q2: Here for BC refill") jump(2) continue
gtab q2br, body(b.0 pct.0) subtitle("Q2: Here due to method issue") jump(2) continue
gtab q2cr, body(b.0 pct.0) subtitle("Q2: Here for annual GYN exam") jump(2) continue
gtab q2dr, body(b.0 pct.0) subtitle("Q2: May have infection") jump(2) continue
gtab q2er, body(b.0 pct.0) subtitle("Q2: Here for pregnancy test") jump(2) continue
gtab q2fr, body(b.0 pct.0) subtitle("Q2: Here for other reason") jump(2) continue
gtab q2g1r, body(b.0 pct.0) subtitle("Q2: Here for EC") jump(2) continue
gtab q2g2r, body(b.0 pct.0) subtitle("Q2: Here for LARC removal") jump(2) continue
gtab q2g3r, body(b.0 pct.0) subtitle("Q2: Here for breast exam") jump(2) continue
gtab q2g4r, body(b.0 pct.0) subtitle("Q2: Here for other repro health problems") jump(2) continue
gtab q2g5r, body(b.0 pct.0) subtitle("Q2: Here for other preventative care") jump(2) continue
gtab q2g6r, body(b.0 pct.0) subtitle("Q2: Here for IUD follow-up") sheet("Reason for visit, no missing")

// Method use w/ missing
gtab q3ar, body(b.0 pct.0) missing subtitle("Q3: Currently using pill") jump(2) continue
gtab q3br, body(b.0 pct.0) missing subtitle("Q3: Currently using patch or ring") jump(2) continue
gtab q3cr, body(b.0 pct.0) missing subtitle("Q3: Currently using depo") jump(2) continue
gtab q3dr, body(b.0 pct.0) missing subtitle("Q3: Currently using IUD or implant") jump(2) continue
gtab q3er, body(b.0 pct.0) missing subtitle("Q3: Not currently using a method") jump(2) continue
gtab q3f1r, body(b.0 pct.0) missing subtitle("Q3: Currently using condoms") jump(2) continue
gtab q3f2r, body(b.0 pct.0) missing subtitle("Q3: Currently using withdrawl") jump(2) continue
gtab q3f3r, body(b.0 pct.0) missing subtitle("Q3: Currently using sterilization") jump(2) continue
gtab q3er, body(b.0 pct.0) missing subtitle("Q3: Currently using other method") jump(2) continue

gtab q4ar, body(b.0 pct.0) missing subtitle("Q4: Intereseted in pill") jump(2) continue
gtab q4br, body(b.0 pct.0) missing subtitle("Q4: Interested in patch or ring") jump(2) continue
gtab q4cr, body(b.0 pct.0) missing subtitle("Q4: Interested in depo") jump(2) continue
gtab q4dr, body(b.0 pct.0) missing subtitle("Q4: Interested in IUD or implant") jump(2) continue
gtab q4er, body(b.0 pct.0) missing subtitle("Q4: Interested in EC") jump(2) continue
gtab q4hr, body(b.0 pct.0) missing subtitle("Q4: Not interested in BC") jump(2) continue
gtab q4g1r, body(b.0 pct.0) missing subtitle("Q4: Intersted in condoms") jump(2) continue
gtab q4g2r, body(b.0 pct.0) missing subtitle("Q4: Intersted in sterilization") jump(2) continue
gtab q4fr, body(b.0 pct.0) missing subtitle("Q4: Interested in another method") jump(2) continue

gtab q5ar, body(b.0 pct.0) missing subtitle("Q5: Learned new things about method") jump(2) continue
gtab q5br, body(b.0 pct.0) missing subtitle("Q5: I can now afford the method I want") jump(2) continue
gtab q5cr, body(b.0 pct.0) missing subtitle("Q5: I can't afford my old method") jump(2) continue
gtab q5dr, body(b.0 pct.0) missing subtitle("Q5: I've had side effects with old method") jump(2) continue
gtab q5er, body(b.0 pct.0) missing subtitle("Q5: I had an unplanned pregnancy with old method") jump(2) continue
gtab q5fr, body(b.0 pct.0) missing subtitle("Q5: I'm not currently using a method") jump(2) continue
gtab q5gr, body(b.0 pct.0) missing subtitle("Q5: Switching for another reason") jump(2) continue
gtab notseekingchange, body(b.0 pct.0) missing subtitle("Q5: I'm not seeking to change today") sheet("Method use")

// Method use questions w/o missing
gtab q3ar, body(b.0 pct.0) subtitle("Q3: Currently using pill") jump(2) continue
gtab q3br, body(b.0 pct.0) subtitle("Q3: Currently using patch or ring") jump(2) continue
gtab q3cr, body(b.0 pct.0) subtitle("Q3: Currently using depo") jump(2) continue
gtab q3dr, body(b.0 pct.0) subtitle("Q3: Currently using IUD or implant") jump(2) continue
gtab q3er, body(b.0 pct.0) subtitle("Q3: Not currently using a method") jump(2) continue
gtab q3f1r, body(b.0 pct.0) subtitle("Q3: Currently using condoms") jump(2) continue
gtab q3f2r, body(b.0 pct.0) subtitle("Q3: Currently using withdrawl") jump(2) continue
gtab q3f3r, body(b.0 pct.0) subtitle("Q3: Currently using sterilization") jump(2) continue
gtab q3er, body(b.0 pct.0) subtitle("Q3: Currently using other method") jump(2) continue

gtab q4ar, body(b.0 pct.0) subtitle("Q4: Intereseted in pill") jump(2) continue
gtab q4br, body(b.0 pct.0) subtitle("Q4: Interested in patch or ring") jump(2) continue
gtab q4cr, body(b.0 pct.0) subtitle("Q4: Interested in depo") jump(2) continue
gtab q4dr, body(b.0 pct.0) subtitle("Q4: Interested in IUD or implant") jump(2) continue
gtab q4er, body(b.0 pct.0) subtitle("Q4: Interested in EC") jump(2) continue
gtab q4hr, body(b.0 pct.0) subtitle("Q4: Not interested in BC") jump(2) continue
gtab q4g1r, body(b.0 pct.0) subtitle("Q4: Intersted in condoms") jump(2) continue
gtab q4g2r, body(b.0 pct.0) subtitle("Q4: Intersted in sterilization") jump(2) continue
gtab q4fr, body(b.0 pct.0) subtitle("Q4: Interested in another method") jump(2) continue

gtab q5ar, body(b.0 pct.0) subtitle("Q5: Learned new things about method") jump(2) continue
gtab q5br, body(b.0 pct.0) subtitle("Q5: I can now afford the method I want") jump(2) continue
gtab q5cr, body(b.0 pct.0) subtitle("Q5: I can't afford my old method") jump(2) continue
gtab q5dr, body(b.0 pct.0) subtitle("Q5: I've had side effects with old method") jump(2) continue
gtab q5er, body(b.0 pct.0) subtitle("Q5: I had an unplanned pregnancy with old method") jump(2) continue
gtab q5fr, body(b.0 pct.0) subtitle("Q5: I'm not currently using a method") jump(2) continue
gtab q5gr, body(b.0 pct.0) subtitle("Q5: Switching for another reason") jump(2) continue
gtab notseekingchange, body(b.0 pct.0) subtitle("Q5: I'm not seeking to change today") sheet("Method use, no missing")

// Clinic related w/o missing
gtab q6ar, body(b.0 pct.0) missing subtitle("Q6: Only place I can get services I need") jump(2) continue
gtab q6br, body(b.0 pct.0) missing subtitle("Q6: Have been here before") jump(2) continue
gtab q6cr, body(b.0 pct.0) missing subtitle("Q6: Someone recommended I come here") jump(2) continue
gtab q6dr, body(b.0 pct.0) missing subtitle("Q6: Location is convenient") jump(2) continue
gtab q6er, body(b.0 pct.0) missing subtitle("Q6: Can get method I want here") jump(2) continue
gtab q6fr, body(b.0 pct.0) missing subtitle("Q6: Special services for teens/young people") jump(2) continue
gtab q6gr, body(b.0 pct.0) missing subtitle("Q6: Services here are confidential") jump(2) continue
gtab q6hr, body(b.0 pct.0) missing subtitle("Q6: Staff treat me respectfully") jump(2) continue
gtab q6ir, body(b.0 pct.0) missing subtitle("Q6: Staff here can refer me for other healthcare") jump(2) continue
gtab q6jr, body(b.0 pct.0) missing subtitle("Q6: Can get free or low-cost services here") jump(2) continue
gtab q6kr, body(b.0 pct.0) missing subtitle("Q6: Can use my insurance here") jump(2) continue

gtab q7ar, body(b.0 pct.0) missing subtitle("Q7: Didn't have a reason") jump(2) continue
gtab q7br, body(b.0 pct.0) missing subtitle("Q7: Already had annual GYN exam") jump(2) continue
gtab q7cr, body(b.0 pct.0) missing subtitle("Q7: Not comfortable seeing provider for these services") jump(2) continue
gtab q7dr, body(b.0 pct.0) missing subtitle("Q7: Couldn't afford to see provider") jump(2) continue
gtab q7er, body(b.0 pct.0) missing subtitle("Q7: Too inconvenient to see provider") jump(2) continue
gtab q7fr, body(b.0 pct.0) missing subtitle("Q7: I didn't want partner or family to find out") jump(2) continue
gtab q7gr, body(b.0 pct.0) missing subtitle("Q7: Other reason for not seeking services") jump(2) continue
gtab hadBCvisit, body(b.0 pct.0) missing subtitle("Q7: I DID make a BC visit in last year, aside from today") jump(2) continue

gtab q7arforce, body(b.0 pct.0) missing subtitle("Q7: Didn't have a reason (force based on q7i)") jump(2) continue
gtab q7brforce, body(b.0 pct.0) missing subtitle("Q7: Already had annual GYN exam (force based on q7i)") jump(2) continue
gtab q7crforce, body(b.0 pct.0) missing subtitle("Q7: Not comfortable seeing provider for these services (force based on q7i)") jump(2) continue
gtab q7drforce, body(b.0 pct.0) missing subtitle("Q7: Couldn't afford to see provider (force based on q7i)") jump(2) continue
gtab q7erforce, body(b.0 pct.0) missing subtitle("Q7: Too inconvenient to see provider (force based on q7i)") jump(2) continue
gtab q7frforce, body(b.0 pct.0) missing subtitle("Q7: I didn't want partner or family to find out (force based on q7i)") jump(2) continue
gtab q7grforce, body(b.0 pct.0) missing subtitle("Q7: Other reason for not seeking services (force based on q7i)") jump(2) continue
gtab hadBCvisit, body(b.0 pct.0) missing subtitle("Q7: I DID make a BC visit in last year, aside from today") jump(2) continue

gtab q8, body(b.0 pct.0) missing subtitle("Q8: Have you gone anywhere else for medical care in past year?") sheet("Clinic-related")

// Clinic related w/o missing
gtab q6ar, body(b.0 pct.0) subtitle("Q6: Only place I can get services I need") jump(2) continue
gtab q6br, body(b.0 pct.0) subtitle("Q6: Have been here before") jump(2) continue
gtab q6cr, body(b.0 pct.0) subtitle("Q6: Someone recommended I come here") jump(2) continue
gtab q6dr, body(b.0 pct.0) subtitle("Q6: Location is convenient") jump(2) continue
gtab q6er, body(b.0 pct.0) subtitle("Q6: Can get method I want here") jump(2) continue
gtab q6fr, body(b.0 pct.0) subtitle("Q6: Special services for teens/young people") jump(2) continue
gtab q6gr, body(b.0 pct.0) subtitle("Q6: Services here are confidential") jump(2) continue
gtab q6hr, body(b.0 pct.0) subtitle("Q6: Staff treat me respectfully") jump(2) continue
gtab q6ir, body(b.0 pct.0) subtitle("Q6: Staff here can refer me for other healthcare") jump(2) continue
gtab q6jr, body(b.0 pct.0) subtitle("Q6: Can get free or low-cost services here") jump(2) continue
gtab q6kr, body(b.0 pct.0) subtitle("Q6: Can use my insurance here") jump(2) continue

gtab q7ar, body(b.0 pct.0) subtitle("Q7: Didn't have a reason") jump(2) continue
gtab q7br, body(b.0 pct.0) subtitle("Q7: Already had annual GYN exam") jump(2) continue
gtab q7cr, body(b.0 pct.0) subtitle("Q7: Not comfortable seeing provider for these services") jump(2) continue
gtab q7dr, body(b.0 pct.0) subtitle("Q7: Couldn't afford to see provider") jump(2) continue
gtab q7er, body(b.0 pct.0) subtitle("Q7: Too inconvenient to see provider") jump(2) continue
gtab q7fr, body(b.0 pct.0) subtitle("Q7: I didn't want partner or family to find out") jump(2) continue
gtab q7gr, body(b.0 pct.0) subtitle("Q7: Other reason for not seeking services") jump(2) continue
gtab hadBCvisit, body(b.0 pct.0) subtitle("Q7: I DID make a BC visit in last year, aside from today") jump(2) continue

gtab q7arforce, body(b.0 pct.0) subtitle("Q7: Didn't have a reason (force based on q7i)") jump(2) continue
gtab q7brforce, body(b.0 pct.0) subtitle("Q7: Already had annual GYN exam (force based on q7i)") jump(2) continue
gtab q7crforce, body(b.0 pct.0) subtitle("Q7: Not comfortable seeing provider for these services (force based on q7i)") jump(2) continue
gtab q7drforce, body(b.0 pct.0) subtitle("Q7: Couldn't afford to see provider (force based on q7i)") jump(2) continue
gtab q7erforce, body(b.0 pct.0) subtitle("Q7: Too inconvenient to see provider (force based on q7i)") jump(2) continue
gtab q7frforce, body(b.0 pct.0) subtitle("Q7: I didn't want partner or family to find out (force based on q7i)") jump(2) continue
gtab q7grforce, body(b.0 pct.0) subtitle("Q7: Other reason for not seeking services (force based on q7i)") jump(2) continue
gtab hadBCvisit, body(b.0 pct.0) subtitle("Q7: I DID make a BC visit in last year, aside from today") jump(2) continue

gtab q8, body(b.0 pct.0) subtitle("Q8: Have you gone anywhere else for medical care in past year?") sheet("Clinic-related, no missing")

// Insurance w/ missing
gtab q9, body(b.0 pct.0) missing subtitle("Q9: Do you have insurance?") jump(2) continue
gtab q9r, body(b.0 pct.0) missing subtitle("Q: Do you have insurance (recoded based on Qs 10-12)") jump(2) continue

gtab q10arforce, body(b.0 pct.0) missing subtitle("Q10: Employer-based insurance, force using q9r") jump(2) continue
gtab q10brforce, body(b.0 pct.0) missing subtitle("Q10: Marketplace/exchange insurance, force using q9r") jump(2) continue
gtab q10crforce, body(b.0 pct.0) missing subtitle("Q10: Medicaid, force using q9r") jump(2) continue
gtab q10drforce, body(b.0 pct.0) missing subtitle("Q10: TRICARE, force using q9r") jump(2) continue
gtab q10erforce, body(b.0 pct.0) missing subtitle("Q10: IHS, force using q9r") jump(2) continue
gtab q10frforce, body(b.0 pct.0) missing subtitle("Q10: Medicare, force using q9r") jump(2) continue
gtab q10grforce, body(b.0 pct.0) missing subtitle("Q10: Other insurance, force using q9r") jump(2) continue

gtab q10arforceinc, body(b.0 pct.0) missing subtitle("Q10: Employer-based insurance, force using q9r & inconsistencies dropped") jump(2) continue
gtab q10brforceinc, body(b.0 pct.0) missing subtitle("Q10: Marketplace/exchange insurance, force using q9r & inconsistencies dropped") jump(2) continue
gtab q10crforceinc, body(b.0 pct.0) missing subtitle("Q10: Medicaid, force using q9r & inconsistencies dropped") jump(2) continue
gtab q10drforceinc, body(b.0 pct.0) missing subtitle("Q10: TRICARE, force using q9r & inconsistencies dropped") jump(2) continue
gtab q10erforceinc, body(b.0 pct.0) missing subtitle("Q10: IHS, force using q9r & inconsistencies dropped") jump(2) continue
gtab q10frforceinc, body(b.0 pct.0) missing subtitle("Q10: Medicare, force using q9r & inconsistencies dropped") jump(2) continue
gtab q10grforceinc, body(b.0 pct.0) missing subtitle("Q10: Other insurance, force using q9r & inconsistencies dropped") jump(2) continue

gtab q11rforce, body(b.0 pct.0) missing subtitle("Q11: If you have insurance but don't expect to use it, why not? force using q9r") jump(2) continue
gtab q11rforceinc, body(b.0 pct.0) missing subtitle("Q11: If you have insurance but don't expect to use it, why not? force using q9r & incon dropped") jump(2) continue
gtab usingheldinsurance, body(b.0 pct.0) missing subtitle("Q11: Among women w/ insurance, which plans to use it? force using q9r") jump(2) continue
gtab q11whynotusingins, body(b.0 pct.0) missing subtitle("Q11: Among women w/ insurance, if you're not going to use, why not? force using q9r") jump(2) continue
gtab q11arforce, body(b.0 pct.0) missing subtitle("Q11: My insurance doesn't cover the service I'm getting today, force using q9r") jump(2) continue
gtab q11brforce, body(b.0 pct.0) missing subtitle("Q11: My insurance can't be used here force using q9r, force using q9r") jump(2) continue
gtab q11crforce, body(b.0 pct.0) missing subtitle("Q11: I can't use my insurance because someone might find out, force using q9r") jump(2) continue
gtab q11drforce, body(b.0 pct.0) missing subtitle("Q11: My deductible or co-pay is too high, force using q9r") jump(2) continue
gtab q11erforce, body(b.0 pct.0) missing subtitle("Q11: Other reason for not using insurance, force using q9r") jump(2) continue
gtab q11frforce, body(b.0 pct.0) missing subtitle("Q11: Plan to use insurance, force using q9r") jump(2) continue
gtab q11arforceinc, body(b.0 pct.0) missing subtitle("Q11: My insurance doesn't cover the service I'm getting today, force using q9r & incon. dropped") jump(2) continue
gtab q11brforceinc, body(b.0 pct.0) missing subtitle("Q11: My insurance can't be used here force using q9r, force using q9r & incon. dropped") jump(2) continue
gtab q11crforceinc, body(b.0 pct.0) missing subtitle("Q11: I can't use my insurance because someone might find out, force using q9r & incon. dropped") jump(2) continue
gtab q11drforceinc, body(b.0 pct.0) missing subtitle("Q11: My deductible or co-pay is too high, force using q9r & incon. dropped") jump(2) continue
gtab q11erforceinc, body(b.0 pct.0) missing subtitle("Q11: Other reason for not using insurance, force using q9r & incon. dropped") jump(2) continue
gtab q11frforceinc, body(b.0 pct.0) missing subtitle("Q11: Plan to use insurance, force using q9r & incon. dropped") jump(2) continue


gtab q12r, body(b.0 pct.0) missing subtitle("Q12: If you don't have health insurance, have you tried to get it?, force using q9r") jump(2) continue
gtab q12arforce, body(b.0 pct.0) missing subtitle("Q12: Why didn't you get health insurance? force q9r") jump(2) continue
gtab q12arforceinc, body(b.0 pct.0) missing subtitle("Q12: Why didnt you get health insurance? force q9r, incon. dropped") jump(2) continue

gtab q12a1rforce, body(b.0 pct.0) missing subtitle("Q12a: Couldn't afford it, force") jump(2) continue
gtab q12a2rforce, body(b.0 pct.0) missing subtitle("Q12a: It was too complicated, force") jump(2) continue
gtab q12a3rforce, body(b.0 pct.0) missing subtitle("Q12a: Didn't have necessary paperwork, force") jump(2) continue
gtab q12a4rforce, body(b.0 pct.0) missing subtitle("Q12a: Wasn't eligible because of immigration status, force") jump(2) continue
gtab q12a5rforce, body(b.0 pct.0) missing subtitle("Q12a: Wasn't eligible because I/we made too much money, force") jump(2) continue
gtab q12a6rforce, body(b.0 pct.0) missing subtitle("Q12a: Other reason, force") jump(2) continue
gtab q12a1rforceinc, body(b.0 pct.0) missing subtitle("Q12a: Couldn't afford it, force & incon dropped") jump(2) continue
gtab q12a2rforceinc, body(b.0 pct.0) missing subtitle("Q12a: It was too complicated, force & incon dropped") jump(2) continue
gtab q12a3rforceinc, body(b.0 pct.0) missing subtitle("Q12a: Didn't have necessary paperwork, force & incon dropped") jump(2) continue
gtab q12a4rforceinc, body(b.0 pct.0) missing subtitle("Q12a: Wasn't eligible because of immigration status, force & incon dropped") jump(2) continue
gtab q12a5rforceinc, body(b.0 pct.0) missing subtitle("Q12a: Wasn't eligible because I/we made too much money, force & incon dropped") jump(2) continue
gtab q12a6rforceinc, body(b.0 pct.0) missing subtitle("Q12a: Other reason, force & incon dropped") jump(2) continue

gtab q12brforce, body(b.0 pct.0) missing subtitle("Q12: Why didn't you try to get health insurance? force q9r") jump(2) continue
gtab q12brforceinc, body(b.0 pct.0) missing subtitle("Q12: Why didnt you try to get health insurance? force q9r, incon. dropped") jump(2) continue
gtab q12b1r, body(b.0 pct.0) missing subtitle("Q12b: Don't want or need insurance, force") jump(2) continue
gtab q12b2r, body(b.0 pct.0) missing subtitle("Q12b: My parents would have had to sign me up, force") jump(2) continue
gtab q12b3r, body(b.0 pct.0) missing subtitle("Q12b: Seemed too expensive, force") jump(2) continue
gtab q12b4r, body(b.0 pct.0) missing subtitle("Q12b: I didn't know how, force") jump(2) continue
gtab q12b5r, body(b.0 pct.0) missing subtitle("Q12b: I didn't think I could get the necessary paperwork, force") jump(2) continue
gtab q12b6r, body(b.0 pct.0) missing subtitle("Q12b: I couldn't because of immigration status, force") jump(2) continue
gtab q12b7r, body(b.0 pct.0) missing subtitle("Q12b: I didn't think I was eligible because I/we made too much money, force") jump(2) continue
gtab q12b8r, body(b.0 pct.0) missing subtitle("Q12b: Other reason, force") jump(2) continue

gtab q12b1rinc, body(b.0 pct.0) missing subtitle("Q12b: Don't want or need insurance, force & incon dropped") jump(2) continue
gtab q12b2rinc, body(b.0 pct.0) missing subtitle("Q12b: My parents would have had to sign me up, force & incon dropped") jump(2) continue
gtab q12b3rinc, body(b.0 pct.0) missing subtitle("Q12b: Seemed too expensive, force & incon dropped") jump(2) continue
gtab q12b4rinc, body(b.0 pct.0) missing subtitle("Q12b: I didn't know how, force & incon dropped") jump(2) continue
gtab q12b5rinc, body(b.0 pct.0) missing subtitle("Q12b: I didn't think I could get the necessary paperwork, force & incon dropped") jump(2) continue
gtab q12b6rinc, body(b.0 pct.0) missing subtitle("Q12b: I couldn't because of immigration status, force & incon dropped") jump(2) continue
gtab q12b7rinc, body(b.0 pct.0) missing subtitle("Q12b: I didn't think I was eligible because I/we made too much money, force & incon dropped") jump(2) continue
gtab q12b8rinc, body(b.0 pct.0) missing subtitle("Q12b: Other reason, force & incon dropped") jump(2) continue

gtab q13, body(b.0 pct.0) missing subtitle("Q13: For how many of the last 12 months did you have health insurance?") jump(2) continue
gtab q13rinc, body(b.0 pct.0) missing subtitle("Q13: For how many of the last 12 months did you have health insurance? incon dropped") jump(2) continue

gtab q14r, body(b.0 pct.0) missing subtitle("Q14: If you lost insurance in the past 12 mos, why?") jump(2) continue
gtab q14rinc, body(b.0 pct.0) missing subtitle("Q14: If you lost insurance in the past 12 mos, why? incon dropped") jump(2) continue
gtab lostinsurance12mo, body(b.0 pct.0) missing subtitle("Q14: Among women who answered, how many lost insurance?") jump(2) continue

gtab q14ar, body(b.0 pct.0) missing subtitle("Q14: I couldn't afford insurance anymore, force q9r") jump(2) continue
gtab q14br, body(b.0 pct.0) missing subtitle("Q14: I had a big change in my life, force q9r") jump(2) continue
gtab q14cr, body(b.0 pct.0) missing subtitle("Q14: i was no longer eligible because I/we made too much money, force q9r") jump(2) continue
gtab q14dr, body(b.0 pct.0) missing subtitle("Q14: I got too old for my paretns' plan, force q9r") jump(2) continue
gtab q14er, body(b.0 pct.0) missing subtitle("Q14: I couldn't provide the necessary paperwork, force q9r") jump(2) continue
gtab q14fr, body(b.0 pct.0) missing subtitle("Q14: My plan was cancelled, force q9r") jump(2) continue
gtab q14gr, body(b.0 pct.0) missing subtitle("Q14: Some other reason, force q9r") jump(2) continue
gtab q14hr, body(b.0 pct.0) missing subtitle("Q14: I didn't lose my insurance in last 12 mo, force q9r") jump(2) continue

gtab q14arinc, body(b.0 pct.0) missing subtitle("Q14: I couldn't afford insurance anymore, force q9r & incon dropped") jump(2) continue
gtab q14brinc, body(b.0 pct.0) missing subtitle("Q14: I had a big change in my life, force q9r & incon dropped") jump(2) continue
gtab q14crinc, body(b.0 pct.0) missing subtitle("Q14: i was no longer eligible because I/we made too much money, force q9r & incon dropped") jump(2) continue
gtab q14drinc, body(b.0 pct.0) missing subtitle("Q14: I got too old for my paretns' plan, force q9r & incon dropped") jump(2) continue
gtab q14erinc, body(b.0 pct.0) missing subtitle("Q14: I couldn't provide the necessary paperwork, force q9r & incon dropped") jump(2) continue
gtab q14frinc, body(b.0 pct.0) missing subtitle("Q14: My plan was cancelled, force q9r & incon dropped") jump(2) continue
gtab q14grinc, body(b.0 pct.0) missing subtitle("Q14: Some other reason, force q9r & incon dropped") jump(2) continue
gtab q14hrinc, body(b.0 pct.0) missing subtitle("Q14: I didn't lose my insurance in last 12 mo, force q9r & incon dropped") sheet("Insurance")

// Insurance questions w/o missing
gtab q9, body(b.0 pct.0) subtitle("Q9: Do you have insurance?") jump(2) continue
gtab q9r, body(b.0 pct.0) subtitle("Q: Do you have insurance (recoded based on Qs 10-12)") jump(2) continue

gtab q10arforce, body(b.0 pct.0) subtitle("Q10: Employer-based insurance, force using q9r") jump(2) continue
gtab q10brforce, body(b.0 pct.0) subtitle("Q10: Marketplace/exchange insurance, force using q9r") jump(2) continue
gtab q10crforce, body(b.0 pct.0) subtitle("Q10: Medicaid, force using q9r") jump(2) continue
gtab q10drforce, body(b.0 pct.0) subtitle("Q10: TRICARE, force using q9r") jump(2) continue
gtab q10erforce, body(b.0 pct.0) subtitle("Q10: IHS, force using q9r") jump(2) continue
gtab q10frforce, body(b.0 pct.0) subtitle("Q10: Medicare, force using q9r") jump(2) continue
gtab q10grforce, body(b.0 pct.0) subtitle("Q10: Other insurance, force using q9r") jump(2) continue

gtab q10arforceinc, body(b.0 pct.0) subtitle("Q10: Employer-based insurance, force using q9r & inconsistencies dropped") jump(2) continue
gtab q10brforceinc, body(b.0 pct.0) subtitle("Q10: Marketplace/exchange insurance, force using q9r & inconsistencies dropped") jump(2) continue
gtab q10crforceinc, body(b.0 pct.0) subtitle("Q10: Medicaid, force using q9r & inconsistencies dropped") jump(2) continue
gtab q10drforceinc, body(b.0 pct.0) subtitle("Q10: TRICARE, force using q9r & inconsistencies dropped") jump(2) continue
gtab q10erforceinc, body(b.0 pct.0) subtitle("Q10: IHS, force using q9r & inconsistencies dropped") jump(2) continue
gtab q10frforceinc, body(b.0 pct.0) subtitle("Q10: Medicare, force using q9r & inconsistencies dropped") jump(2) continue
gtab q10grforceinc, body(b.0 pct.0) subtitle("Q10: Other insurance, force using q9r & inconsistencies dropped") jump(2) continue

gtab q11rforce, body(b.0 pct.0) subtitle("Q11: If you have insurance but don't expect to use it, why not? force using q9r") jump(2) continue
gtab q11rforceinc, body(b.0 pct.0) subtitle("Q11: If you have insurance but don't expect to use it, why not? force using q9r & incon dropped") jump(2) continue
gtab usingheldinsurance, body(b.0 pct.0) subtitle("Q11: Among women w/ insurance, which plans to use it? force using q9r") jump(2) continue
gtab q11whynotusingins, body(b.0 pct.0) subtitle("Q11: Among women w/ insurance, if you're not going to use, why not? force using q9r") jump(2) continue
gtab q11arforce, body(b.0 pct.0) subtitle("Q11: My insurance doesn't cover the service I'm getting today, force using q9r") jump(2) continue
gtab q11brforce, body(b.0 pct.0) subtitle("Q11: My insurance can't be used here force using q9r, force using q9r") jump(2) continue
gtab q11crforce, body(b.0 pct.0) subtitle("Q11: I can't use my insurance because someone might find out, force using q9r") jump(2) continue
gtab q11drforce, body(b.0 pct.0) subtitle("Q11: My deductible or co-pay is too high, force using q9r") jump(2) continue
gtab q11erforce, body(b.0 pct.0) subtitle("Q11: Other reason for not using insurance, force using q9r") jump(2) continue
gtab q11frforce, body(b.0 pct.0) subtitle("Q11: Plan to use insurance, force using q9r") jump(2) continue
gtab q11arforceinc, body(b.0 pct.0) subtitle("Q11: My insurance doesn't cover the service I'm getting today, force using q9r & incon. dropped") jump(2) continue
gtab q11brforceinc, body(b.0 pct.0) subtitle("Q11: My insurance can't be used here force using q9r, force using q9r & incon. dropped") jump(2) continue
gtab q11crforceinc, body(b.0 pct.0) subtitle("Q11: I can't use my insurance because someone might find out, force using q9r & incon. dropped") jump(2) continue
gtab q11drforceinc, body(b.0 pct.0) subtitle("Q11: My deductible or co-pay is too high, force using q9r & incon. dropped") jump(2) continue
gtab q11erforceinc, body(b.0 pct.0) subtitle("Q11: Other reason for not using insurance, force using q9r & incon. dropped") jump(2) continue
gtab q11frforceinc, body(b.0 pct.0) subtitle("Q11: Plan to use insurance, force using q9r & incon. dropped") jump(2) continue


gtab q12r, body(b.0 pct.0) subtitle("Q12: If you don't have health insurance, have you tried to get it?, force using q9r") jump(2) continue
gtab q12arforce, body(b.0 pct.0) subtitle("Q12: Why didn't you get health insurance? force q9r") jump(2) continue
gtab q12arforceinc, body(b.0 pct.0) subtitle("Q12: Why didnt you get health insurance? force q9r, incon. dropped") jump(2) continue

gtab q12a1rforce, body(b.0 pct.0) subtitle("Q12a: Couldn't afford it, force") jump(2) continue
gtab q12a2rforce, body(b.0 pct.0) subtitle("Q12a: It was too complicated, force") jump(2) continue
gtab q12a3rforce, body(b.0 pct.0) subtitle("Q12a: Didn't have necessary paperwork, force") jump(2) continue
gtab q12a4rforce, body(b.0 pct.0) subtitle("Q12a: Wasn't eligible because of immigration status, force") jump(2) continue
gtab q12a5rforce, body(b.0 pct.0) subtitle("Q12a: Wasn't eligible because I/we made too much money, force") jump(2) continue
gtab q12a6rforce, body(b.0 pct.0) subtitle("Q12a: Other reason, force") jump(2) continue
gtab q12a1rforceinc, body(b.0 pct.0) subtitle("Q12a: Couldn't afford it, force & incon dropped") jump(2) continue
gtab q12a2rforceinc, body(b.0 pct.0) subtitle("Q12a: It was too complicated, force & incon dropped") jump(2) continue
gtab q12a3rforceinc, body(b.0 pct.0) subtitle("Q12a: Didn't have necessary paperwork, force & incon dropped") jump(2) continue
gtab q12a4rforceinc, body(b.0 pct.0) subtitle("Q12a: Wasn't eligible because of immigration status, force & incon dropped") jump(2) continue
gtab q12a5rforceinc, body(b.0 pct.0) subtitle("Q12a: Wasn't eligible because I/we made too much money, force & incon dropped") jump(2) continue
gtab q12a6rforceinc, body(b.0 pct.0) subtitle("Q12a: Other reason, force & incon dropped") jump(2) continue

gtab q12brforce, body(b.0 pct.0) subtitle("Q12: Why didn't you try to get health insurance? force q9r") jump(2) continue
gtab q12brforceinc, body(b.0 pct.0) subtitle("Q12: Why didnt you try to get health insurance? force q9r, incon. dropped") jump(2) continue
gtab q12b1r, body(b.0 pct.0) subtitle("Q12b: Don't want or need insurance, force") jump(2) continue
gtab q12b2r, body(b.0 pct.0) subtitle("Q12b: My parents would have had to sign me up, force") jump(2) continue
gtab q12b3r, body(b.0 pct.0) subtitle("Q12b: Seemed too expensive, force") jump(2) continue
gtab q12b4r, body(b.0 pct.0) subtitle("Q12b: I didn't know how, force") jump(2) continue
gtab q12b5r, body(b.0 pct.0) subtitle("Q12b: I didn't think I could get the necessary paperwork, force") jump(2) continue
gtab q12b6r, body(b.0 pct.0) subtitle("Q12b: I couldn't because of immigration status, force") jump(2) continue
gtab q12b7r, body(b.0 pct.0) subtitle("Q12b: I didn't think I was eligible because I/we made too much money, force") jump(2) continue
gtab q12b8r, body(b.0 pct.0) subtitle("Q12b: Other reason, force") jump(2) continue

gtab q12b1rinc, body(b.0 pct.0) subtitle("Q12b: Don't want or need insurance, force & incon dropped") jump(2) continue
gtab q12b2rinc, body(b.0 pct.0) subtitle("Q12b: My parents would have had to sign me up, force & incon dropped") jump(2) continue
gtab q12b3rinc, body(b.0 pct.0) subtitle("Q12b: Seemed too expensive, force & incon dropped") jump(2) continue
gtab q12b4rinc, body(b.0 pct.0) subtitle("Q12b: I didn't know how, force & incon dropped") jump(2) continue
gtab q12b5rinc, body(b.0 pct.0) subtitle("Q12b: I didn't think I could get the necessary paperwork, force & incon dropped") jump(2) continue
gtab q12b6rinc, body(b.0 pct.0) subtitle("Q12b: I couldn't because of immigration status, force & incon dropped") jump(2) continue
gtab q12b7rinc, body(b.0 pct.0) subtitle("Q12b: I didn't think I was eligible because I/we made too much money, force & incon dropped") jump(2) continue
gtab q12b8rinc, body(b.0 pct.0) subtitle("Q12b: Other reason, force & incon dropped") jump(2) continue

gtab q13, body(b.0 pct.0) subtitle("Q13: For how many of the last 12 months did you have health insurance?") jump(2) continue
gtab q13rinc, body(b.0 pct.0) subtitle("Q13: For how many of the last 12 months did you have health insurance? incon dropped") jump(2) continue

gtab q14r, body(b.0 pct.0) subtitle("Q14: If you lost insurance in the past 12 mos, why?") jump(2) continue
gtab q14rinc, body(b.0 pct.0) subtitle("Q14: If you lost insurance in the past 12 mos, why? incon dropped") jump(2) continue
gtab lostinsurance12mo, body(b.0 pct.0) subtitle("Q14: Among women who answered, how many lost insurance?") jump(2) continue

gtab q14ar, body(b.0 pct.0) subtitle("Q14: I couldn't afford insurance anymore, force q9r") jump(2) continue
gtab q14br, body(b.0 pct.0) subtitle("Q14: I had a big change in my life, force q9r") jump(2) continue
gtab q14cr, body(b.0 pct.0) subtitle("Q14: i was no longer eligible because I/we made too much money, force q9r") jump(2) continue
gtab q14dr, body(b.0 pct.0) subtitle("Q14: I got too old for my paretns' plan, force q9r") jump(2) continue
gtab q14er, body(b.0 pct.0) subtitle("Q14: I couldn't provide the necessary paperwork, force q9r") jump(2) continue
gtab q14fr, body(b.0 pct.0) subtitle("Q14: My plan was cancelled, force q9r") jump(2) continue
gtab q14gr, body(b.0 pct.0) subtitle("Q14: Some other reason, force q9r") jump(2) continue
gtab q14hr, body(b.0 pct.0) subtitle("Q14: I didn't lose my insurance in last 12 mo, force q9r") jump(2) continue

gtab q14arinc, body(b.0 pct.0) subtitle("Q14: I couldn't afford insurance anymore, force q9r & incon dropped") jump(2) continue
gtab q14brinc, body(b.0 pct.0) subtitle("Q14: I had a big change in my life, force q9r & incon dropped") jump(2) continue
gtab q14crinc, body(b.0 pct.0) subtitle("Q14: i was no longer eligible because I/we made too much money, force q9r & incon dropped") jump(2) continue
gtab q14drinc, body(b.0 pct.0) subtitle("Q14: I got too old for my paretns' plan, force q9r & incon dropped") jump(2) continue
gtab q14erinc, body(b.0 pct.0) subtitle("Q14: I couldn't provide the necessary paperwork, force q9r & incon dropped") jump(2) continue
gtab q14frinc, body(b.0 pct.0) subtitle("Q14: My plan was cancelled, force q9r & incon dropped") jump(2) continue
gtab q14grinc, body(b.0 pct.0) subtitle("Q14: Some other reason, force q9r & incon dropped") jump(2) continue
gtab q14hrinc, body(b.0 pct.0) subtitle("Q14: I didn't lose my insurance in last 12 mo, force q9r & incon dropped") sheet("Insurance, no missing")

exit
// Below is the script from the original prelim tabs for the OPA meeting, using as template

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

