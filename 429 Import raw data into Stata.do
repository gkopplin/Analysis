set more off
capture log close
log using "K:\Projects\429 OPA-ACA\Component 3 - Client survey\Analysis\Logs\429 Import raw data into Stata.log", replace


** Program name:  429 Import raw data into Stata
** 429/Client Survey 2015
** Program task:  Import the raw data from QIC into a readable format. 
** Date created:  12/1/2016 
** Written by:    MZ



* Clear data files and memory
clear all

* Set Directory 
cd "K:\Projects\429 OPA-ACA\Component 3 - Client survey\Data\Raw data from QIC"


**************************************************************
* Stata-format dictionary from variable database in Access.
**************************************************************
* Export dictionary in rich text (not plain text) from Acess and paste into notepad file "Client survey.dct" to run below.

*Loop in two batches of data from QIC. 
forvalues mybatch = 1/2 {

	* For first batch of data: 
	infile using "Client survey.dct", using(.\GUTT-SH`mybatch'.ASC) clear

	* Save batch 1 interim file.
	save Batch`mybatch'.dta, replace
	
}

* Open first batch.
use Batch1.dta, clear
count
*n for batch 1=1,376


* Append second batch of data to first batch.
append using Batch2.dta
count
*n for batches 1 & 2 =2,911


* The following syntax was exported in rich text format (do not export to plain text) from the Access variable database and copied below.
* Stata-format value labels from variable database in Access.
#delimit ;
label define yes
	1	"Yes"
, modify;
label values flag yes;
 
label define yesno
	1	"Yes"
	2	"No"
, modify;
label values q1 yesno;
 
label define yes
	1	"Yes"
, modify;
label values q10a yes;
 
label define yes
	1	"Yes"
, modify;
label values q10b yes;
 
label define yes
	1	"Yes"
, modify;
label values q10c yes;
 
label define yes
	1	"Yes"
 
, modify;
label values q10d yes;
 
label define yes
	1	"Yes"
, modify;
label values q10e yes;
 
label define yes
	1	"Yes"
, modify;
label values q10f yes;
 
label define yes
	1	"Yes"
, modify;
label values q10g yes;
 
label define q22oth
	1	"Don't know"
	2	"Large insurer, unspecified source of coverage"
	9	"Other"
, modify;
label values q10h q22oth;
 
label define whyinsr
	1	"My insurance doesn't cover the service I am getting today"
	2	"My insurance can't be used here"
	3	"Can't use because, if I did, someone might find out about this visit"
	4	"My deductible or co-pay is too high"
	5	"Some other reason, specify"
 
	6	"I expect to use health insurance to pay for some part or all of today's visit"
, modify;
label values q11 whyinsr;
 
label define yes
	1	"Yes"
, modify;
label values q11a yes;
 
label define yes
	1	"Yes"
, modify;
label values q11b yes;
 
label define yes
	1	"Yes"
, modify;
label values q11c yes;
 
label define yes
	1	"Yes"
, modify;
label values q11d yes;
 
label define yes
	1	"Yes"
, modify;
label values q11e yes;
 
label define yes
	1	"Yes"
 
, modify;
label values q11f yes;
 
label define q24oth
	1	"Indicated more than one response for Q11"
	2	"Care is more expensive using insurance"
	9	"Other/don't know"
, modify;
label values q11ot q24oth;
 
label define yesnooth
	1	"Yes"
	2	"No"
	3	"Other"
	4	"Yes and other"
	5	"No and other"
, modify;
label values q12 yesnooth;
 
label define q12a
	1	"I couldn't afford it"
	2	"It was too complicated"
	3	"I didn't have the necessary paperwork"
	4	"I wasn't eligible because of my or my family's immigration status"
	5	"I wasn't eligible because I/we made too much money"
	6	"Some other reason, specify"
, modify;
label values q12a q12a;
 
label define yes
	1	"Yes"
 
, modify;
label values q12a1 yes;
 
label define yes
	1	"Yes"
, modify;
label values q12a2 yes;
 
label define yes
	1	"Yes"
, modify;
label values q12a3 yes;
 
label define yes
	1	"Yes"
, modify;
label values q12a4 yes;
 
label define yes
	1	"Yes"
, modify;
label values q12a5 yes;
 
label define yes
	1	"Yes"
, modify;
label values q12a6 yes;
 
label define Q12aoth
	1	"Indicated more than one response"
	2	"Other/don't know"
 
, modify;
label values q12aot Q12aoth;
 
label define q12b
	1	"I don't want or need insurance"
	2	"My parents would have had to sign me up"
	3	"It seemed too expensive"
	4	"I didn't know how"
	5	"I didn't think I could get the necessary paperwork"
	6	"I couldn't because of my or my family's immigration status"
	7	"I didn't think I was eligible because I/we made too much money"
	8	"Some other reason, specify"
, modify;
label values q12b q12b;
 
label define yes
	1	"Yes"
, modify;
label values q12b1 yes;
 
label define yes
	1	"Yes"
, modify;
label values q12b2 yes;
 
label define yes
	1	"Yes"
, modify;
label values q12b3 yes;
 
label define yes
 
	1	"Yes"
, modify;
label values q12b4 yes;
 
label define yes
	1	"Yes"
, modify;
label values q12b5 yes;
 
label define yes
	1	"Yes"
, modify;
label values q12b6 yes;
 
label define yes
	1	"Yes"
, modify;
label values q12b7 yes;
 
label define yes
	1	"Yes"
, modify;
label values q12b8 yes;
 
label define Q12aoth
	1	"Indicated more than one response"
	2	"Other/don't know"
, modify;
label values q12bot Q12aoth;
 
label define MoInsur
 
	1	"Less than 1 month"
	2	"1 to 3 months"
	3	"4 to 6 months"
	4	"7 to 12 months"
	5	"I did not have health insurance at all in the last 12 months"
, modify;
label values q13 MoInsur;
 
label define LostInsr
	1	"I couldn't afford it anymore"
	2	"I had a big change in my life (e.g. I lost/changed my job, divorced, moved, etc)"
	3	"I was no longer eligible because I/we made too much money"
	4	"I got too old for my parents' plan"
	5	"I couldn't provide the necessary paperwork"
	6	"My plan was cancelled"
	7	"Some other reason, specify"
	8	"I did not lose my health insurance in the last 12 months"
, modify;
label values q14 LostInsr;
 
label define yes
	1	"Yes"
, modify;
label values q14a yes;
 
label define yes
	1	"Yes"
, modify;
label values q14b yes;
 
label define yes
 
	1	"Yes"
, modify;
label values q14c yes;
 
label define yes
	1	"Yes"
, modify;
label values q14d yes;
 
label define yes
	1	"Yes"
, modify;
label values q14e yes;
 
label define yes
	1	"Yes"
, modify;
label values q14f yes;
 
label define yes
	1	"Yes"
, modify;
label values q14g yes;
 
label define yes
	1	"Yes"
, modify;
label values q14h yes;
 
label define Q12aoth
	1	"Indicated more than one response"
 
	2	"Other/don't know"
, modify;
label values q14ot Q12aoth;
 
label define educ
	1	"0-11th grade"
	2	"High school graduate or GED"
	3	"Some college or associate degree"
	4	"College graduate or more"
, modify;
label values q16 educ;
 
label define yes
	1	"Yes"
, modify;
label values q17a yes;
 
label define yes
	1	"Yes"
, modify;
label values q17b yes;
 
label define yes
	1	"Yes"
, modify;
label values q17c yes;
 
label define yes
	1	"Yes"
 
, modify;
label values q17d yes;
 
label define yes
	1	"Yes"
, modify;
label values q17e yes;
 
label define q15oth
	1	"AK native/Native American/Pacific Islander"
	2	"Multiracial/ mixed - not specified"
	9	"Other"
, modify;
label values q17f q15oth;
 
label define lang
	1	"English"
	2	"Spanish"
	3	"Other"
	4	"Multilingual"
, modify;
label values q18 lang;
 
label define yesno
	1	"Yes"
	2	"No"
, modify;
label values q19 yesno;
 
label define TimeUS
	1	"Less than 5 years"
 
	2	"5+ years"
, modify;
label values q19a TimeUS;
 
label define scale3
	1	"0"
	2	"1"
	3	"2"
	4	"3+"
, modify;
label values q20 scale3;
 
label define RelStat
	1	"Married"
	2	"Living with a partner"
	3	"Not married or living with a partner"
, modify;
label values q21 RelStat;
 
label define income
	1	"No income last year"
	2	"Under $16,000 (less than $308/week)"
	3	"$16,000-$24,999/year ($308-480/week)"
	4	"$25,000-$29,999/year ($481-576/week)"
	5	"$30,000-$39,999/year ($577-769/week)"
	6	"$40,000-$49,999/year ($770-961/week)"
	7	"$50,000-$59,999/year ($962-1154/week)"
	8	"$60,000 or more/year ($1155 or more/week)"
, modify;
label values q23 income;
 
 
label define yes
	1	"Yes"
, modify;
label values q2a yes;
 
label define yes
	1	"Yes"
, modify;
label values q2b yes;
 
label define yes
	1	"Yes"
, modify;
label values q2c yes;
 
label define yes
	1	"Yes"
, modify;
label values q2d yes;
 
label define yes
	1	"Yes"
, modify;
label values q2e yes;
 
label define yes
	1	"Yes"
, modify;
label values q2f yes;
 
label define q2oth
 
	1	"Plan B/EC/Morning After Pill"
	2	"IUD/Implant/BC removal"
	3	"Breast exam"
	4	"Other repro health problem"
	5	"Other preventative care"
	6	"IUD follow-up appointment"
	9	"Other"
, modify;
label values q2g q2oth;
 
label define yes
	1	"Yes"
, modify;
label values q3a yes;
 
label define yes
	1	"Yes"
, modify;
label values q3b yes;
 
label define yes
	1	"Yes"
, modify;
label values q3c yes;
 
label define yes
	1	"Yes"
, modify;
label values q3d yes;
 
label define yes
 
	1	"Yes"
, modify;
label values q3e yes;
 
label define q3othr
	1	"Condoms"
	2	"Sterilization (M or F)"
	3	"Withdrawl"
	9	"Other"
, modify;
label values q3f q3othr;
 
label define yes
	1	"Yes"
, modify;
label values q3g yes;
 
label define yes
	1	"Yes"
, modify;
label values q4a yes;
 
label define yes
	1	"Yes"
, modify;
label values q4b yes;
 
label define yes
	1	"Yes"
 
, modify;
label values q4c yes;
 
label define yes
	1	"Yes"
, modify;
label values q4d yes;
 
label define yes
	1	"Yes"
, modify;
label values q4e yes;
 
label define yes
	1	"Yes"
, modify;
label values q4f yes;
 
label define q3othr
	1	"Condoms"
	2	"Sterilization (M or F)"
	3	"Withdrawl"
	9	"Other"
, modify;
label values q4g q3othr;
 
label define yes
	1	"Yes"
, modify;
label values q4h yes;
 
 
label define yes
	1	"Yes"
, modify;
label values q5a yes;
 
label define yes
	1	"Yes"
, modify;
label values q5b yes;
 
label define yes
	1	"Yes"
, modify;
label values q5c yes;
 
label define yes
	1	"Yes"
, modify;
label values q5d yes;
 
label define yes
	1	"Yes"
, modify;
label values q5e yes;
 
label define yes
	1	"Yes"
, modify;
label values q5f yes;
 
label define yes
 
	1	"Yes"
, modify;
label values q5g yes;
 
label define yes
	1	"Yes"
, modify;
label values q5h yes;
 
label define yes
	1	"Yes"
, modify;
label values q5i yes;
 
label define yes
	1	"Yes"
, modify;
label values q6a yes;
 
label define yes
	1	"Yes"
, modify;
label values q6b yes;
 
label define yes
	1	"Yes"
, modify;
label values q6c yes;
 
label define yes
	1	"Yes"
 
, modify;
label values q6d yes;
 
label define yes
	1	"Yes"
, modify;
label values q6e yes;
 
label define yes
	1	"Yes"
, modify;
label values q6f yes;
 
label define yes
	1	"Yes"
, modify;
label values q6g yes;
 
label define yes
	1	"Yes"
, modify;
label values q6h yes;
 
label define yes
	1	"Yes"
, modify;
label values q6i yes;
 
label define yes
	1	"Yes"
 
, modify;
label values q6j yes;
 
label define yes
	1	"Yes"
, modify;
label values q6k yes;
 
label define yes
	1	"Yes"
, modify;
label values q7a yes;
 
label define yes
	1	"Yes"
, modify;
label values q7b yes;
 
label define yes
	1	"Yes"
, modify;
label values q7c yes;
 
label define yes
	1	"Yes"
, modify;
label values q7d yes;
 
label define yes
	1	"Yes"
 
, modify;
label values q7e yes;
 
label define yes
	1	"Yes"
, modify;
label values q7f yes;
 
label define yes
	1	"Yes"
, modify;
label values q7g yes;
 
label define yes
	1	"Yes"
, modify;
label values q7h yes;
 
label define yes
	1	"Yes"
, modify;
label values q7i yes;
 
label define noyes2
	1	"No, this is the only place I've gone for any type of medical care"
	2	"Yes, I have gone somewhere else for medical care, either for BC/GYN or general"
, modify;
label values q8 noyes2;
 
label define yesno
	1	"Yes"
 
	2	"No"
, modify;
label values q9 yesno;
 
label define yesno
	1	"Yes"
	2	"No"
, modify;
label values screenq1 yesno;
 
label define yesno
	1	"Yes"
	2	"No"
, modify;
label values screenq2 yesno;
 
label define yes1
	1	"Yes"
, modify;
label values spanish yes1;
 
#delimit cr

* End of import file.


*******************
* Check the ns.
*******************
codebook clinicid
*n of clinics=43
*n of clients=2,911

*Checking to make sure there are no duplicate unique ids. 
*(No error so all uniqueids are in fact unique.)
isid uniqueid
*This confirms that 2,911 is the correct count of surveys and that we undercounted by one before sending the surveys off to QIC. 


**********************************************************************.
* Save combined data file.
**********************************************************************.
sort uniqueid
compress

* Date-stamp the following save command.
note: 429 combined file last saved $S_DATE at $S_TIME.

label data "429 Client Survey 2015 original data"
save "K:\Projects\429 OPA-ACA\Component 3 - Client survey\Data\429 Client Survey 2015 data original.dta", replace


set more on
exit
