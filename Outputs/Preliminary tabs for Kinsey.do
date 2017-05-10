// Compare all, missing, and if agencytype=="Planned Parenthood"

gutt using "K:\Projects\429 OPA-ACA\Component 3 - Client survey\Analysis\Prints\Preliminary tabs for DC.xlsx", replace
gtab q6ar, missing body(b.0 pct.0) subtitle("Q6: This is the only place that I can get the services I need") continue
gtab q6br, missing body(b.0 pct.0) subtitle("Q6: I have been here before") continue
gtab q6cr, missing body(b.0 pct.0) subtitle("Q6: Someone recommended I come here") continue
gtab q6dr, missing body(b.0 pct.0) subtitle("Q6: This location is convenient for me") continue
gtab q6er, missing body(b.0 pct.0) subtitle("Q6: I can get the birth control method I want here") continue
gtab q6fr, missing body(b.0 pct.0) subtitle("Q6: There are special services for teens and young people here") jump(1) continue
gtab q6gr, missing body(b.0 pct.0) subtitle("Q6: Services here are confidential; no one needs to know") continue
gtab q6hr, missing body(b.0 pct.0) subtitle("Q6: Staff here treat me respectfully") continue
gtab q6ir, missing body(b.0 pct.0) subtitle("Q6: Staff here can refer me for other health care I need") continue
gtab q6jr, missing body(b.0 pct.0) subtitle("Q6: I can get free or low-cost services here") continue
gtab q6kr, missing body(b.0 pct.0) subtitle("Q6: I can use my insurance here") continue
gtab q6missing, body(b.0 pct.0) subtitle("Q6: Number of responses completely missing for Q6") 

gtab q6ar, body(b.0 pct.0) subtitle("Q6: This is the only place that I can get the services I need") continue
gtab q6br, body(b.0 pct.0) subtitle("Q6: I have been here before") continue
gtab q6cr, body(b.0 pct.0) subtitle("Q6: Someone recommended I come here") continue
gtab q6dr, body(b.0 pct.0) subtitle("Q6: This location is convenient for me") continue
gtab q6er, body(b.0 pct.0) subtitle("Q6: I can get the birth control method I want here") continue
gtab q6fr, body(b.0 pct.0) subtitle("Q6: There are special services for teens and young people here") jump(1) continue
gtab q6gr, body(b.0 pct.0) subtitle("Q6: Services here are confidential; no one needs to know") continue
gtab q6hr, body(b.0 pct.0) subtitle("Q6: Staff here treat me respectfully") continue
gtab q6ir, body(b.0 pct.0) subtitle("Q6: Staff here can refer me for other health care I need") continue
gtab q6jr, body(b.0 pct.0) subtitle("Q6: I can get free or low-cost services here") continue
gtab q6kr, body(b.0 pct.0) subtitle("Q6: I can use my insurance here") continue
gtab q6missing, body(b.0 pct.0) subtitle("Q6: Number of responses completely missing for Q6") 
