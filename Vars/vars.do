/* This script runs through all recodes by question */

do "Vars/renames.do"

/* Contraception and visit-related questions
   Qs 1-8 on the survey which review contraceptive use, visit reasons*/
do "Vars/demographics.do"

/* Inconsistencies within insurance questions */
do "Vars/inconsistencies.do"

/* Contraception and visit-related questions
   Qs 1-8 on the survey which review contraceptive use, visit reasons*/
do "Vars/q2.do"
do "Vars/q3.do"
do "Vars/q4.do"
do "Vars/q5.do"
do "Vars/q6.do"
do "Vars/q7.do"
<<<<<<< HEAD
// Q8 doesn't need any recodes
=======
// Q8 doesn't need any recodes do "Vars/q8.do"
>>>>>>> a41b51e7fea30f4f3d21d842cd1aaf3894566fd9

/* Insurance-related questions-- Qs 9 - 14
The survey Rs appeared to have dificulty following the skip patterns in the survey,
as well as understanding what constitutes insurance. Tabs below will first run through
frequences as indicated by respondents, and will then run through frequencies when we 
force the appropriate skip pattern based on Q9, "Do you currently have health insurance?" */

/* For the purposes of the December 12th OPA meeting that Megan will be attending, Qs 11, 12a, 12b and 14
will be dealt with by adding in the responses of those women who selected more than one response.
This is an alternative to breaking them out into a "multiple responses" category.
When we revisit this on a longer timeline, we will examine the different combinations of responses that
Rs gave, see if there are patterns in combinations of responses that were given.*/

/* In order to distinguish between Rs who's responses to certain questions are true missings vs N/A based on 
skip pattern, we'll be using .a = N/A and .b = true missing.*/

/* Insurance questions follow the same general pattern in their recodes
   1. tally of those who skipped whole question
   2. tally of those who skipped whole question w/ skip pattern force, putting Rs who
      shouldn't have answered in the N/A category
   3. Full tally of question as written with forced skip pattern based on #2
   4. Full tally of question as written with forced skip pattern based on #2 and with
	  Rs who answered inconsistently to any insurance question forced into N/A category
   (If question was forced choice but some Rs checked more than one...)
   5. Coding of question with tally of each individual response (like a check all that
      apply) with forced skip pattern based on #2
   6. Coding of question with tally of each individual response (like a check all that
      apply) with forced skip pattern based on #2 and with Rs who answered inconsistently
	  to any insurance question forced into N/A category. */

do "Vars/q9.do"
do "Vars/q10.do"
do "Vars/q11.do"
do "Vars/q12.do"
do "Vars/q12a.do"
do "Vars/q12b.do"
do "Vars/q13.do"
do "Vars/q14.do"


