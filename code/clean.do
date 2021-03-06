log using chips_cleaning.log, replace

clear

cd "C:\Users\ronald\Documents\GitHub\chips-analysis\data"
******************************************************************
*IMPORT LATEST DATA - REMEMBER TO CHANGE FILE NAME AND SHEET NAME

import excel "04.01.2020_Zimbabwe_032620.xlsx", sheet(University of Zimbabwe) firstrow clear

qui destring, replace

save chips_cleaned, replace

use chips_cleaned, clear

************************
*THIS PREPARES DATASET
************************

set more off
***************************************************************
* Label the dataset
label data "This file contains CHIPS STRIPE HIV data"

* Correct mispelt Partner/Clinical site names
* Confirm if survey was run both at Parirenyatwa OI Clinic and Main hospital (are they two different sites?)
replace clinical_site="Parirenyatwa" if index(clinical_site,"Medicine")~=0 // rename medicine to Parirenyatwa
replace clinical_site="Parirenyatwa" if index(clinical_site,"Parireyatwa")~=0 //rename Parireyatwa  to Parirenyatwa
replace clinical_site="Parirenyatwa" if index(clinical_site,"Parirenyatwa")~=0 // combine all the Parirenyatwa participants
replace clinical_site="Parirenyatwa Hospital" if index(clinical_site,"Parirenyatwa")~=0
replace clinical_site="Mpilo Hospital" if index(clinical_site,"NUST")~=0 //rename NUST Mpilo Hospitals to Mpilo Hospital
replace clinical_site="Howard Hospital" if index(clinical_site,"Howard")~=0 //rename Howard Hospitals to Howard Hospital
replace clinical_site="Harare Hospital" if index(clinical_site,"Harare")~=0 //rename HarareHospitals to Harare Hospital
replace clinical_site="Gweru Hospital" if index(clinical_site,"MSU")~=0 //rename MSU Gweru General Hospitals to Gweru Hospital

*Generate two new variables

* Variable 1 - Pretest module 1, 3, 4 and 17 total score

* Variable 1 - Pretest module 1, 3, 4 and 17 total score

* Clean Module and facilitator evaluation data wrongly captured.

*Pm1_3_1 recode all responses with a value of 6 to Missing
recode Pm1_3_1 6=.

*Pm1_3_2 recode all responses with a value of 6 to Missing
recode Pm1_3_2 6=.

*Pm1_3_3 recode all responses with a value of 3 to Missing
recode Pm1_3_3 3=.

*Pm1_3_4 recode all responses with a value of 3 to Missing
recode Pm1_3_4 3=.

*Pm3_3_1 recode all responses with a value of 6 to Missing
recode Pm3_3_1 6=.

*Pm3_3_2 recode all responses with a value of 6 to Missing
recode Pm3_3_2 6=.

*Pm3_3_3 recode all responses with a value of 2 to Missing
recode Pm3_3_3 2=.

*Pm3_3_3 recode all responses with a value of 3 to Missing
recode Pm3_3_3 3=.

*Pm3_3_4 recode all responses with a value of 2 to Missing
recode Pm3_3_4 2=.

*Pm3_3_4 recode all responses with a value of 3 to Missing
recode Pm3_3_4 3=.

*Pm4_3_1 recode all responses with a value of 6 to Missing
recode Pm4_3_1 6=.

*Pm4_3_2 recode all responses with a value of 6 to Missing
recode Pm4_3_2 6=.

*Pm4_3_3 recode all responses with a value of 2 to Missing
recode Pm4_3_3 2=.

*Pm4_3_3 recode all responses with a value of 3 to Missing
recode Pm4_3_3 3=.

*Pm4_3_4 recode all responses with a value of 3 to Missing
recode Pm4_3_4 3=.

*Pm17_3_1 recode all responses with a value of 6 to Missing
recode Pm17_3_1 6=.

*Pm17_3_2 recode all responses with a value of 6 to Missing
recode Pm17_3_2 6=.

*Pm17_3_3 recode all responses with a value of 2 to Missing
recode Pm17_3_3 2=.

*Pm17_3_3 recode all responses with a value of 3 to Missing
recode Pm17_3_3 3=.

*Pm17_3_4 recode all responses with a value of 3 to Missing
recode Pm17_3_4 3=.

*Pm1_4_1 recode all responses with a value of 6 to Missing
recode Pm1_4_1 6=.

*Pm1_4_2 recode all responses with a value of 6 to Missing
recode Pm1_4_2 6=.

*Pm1_4_3 recode all responses with a value of 6 to Missing
recode Pm1_4_3 6=.

*Pm1_4_4 recode all responses with a value of 6 to Missing
recode Pm1_4_4 6=.

*Pm3_4_1 recode all responses with a value of 6 to Missing
recode Pm3_4_1 6=.

*Pm3_4_2 recode all responses with a value of 6 to Missing
recode Pm3_4_2 6=.

*Pm3_4_3 recode all responses with a value of 6 to Missing
recode Pm3_4_3 6=.

*Pm3_4_4 recode all responses with a value of 6 to Missing
recode Pm3_4_4 6=.

*Pm4_4_1 recode all responses with a value of 6 to Missing
recode Pm4_4_1 6=.

*Pm4_4_2 recode all responses with a value of 6 to Missing
recode Pm4_4_2 6=.

*Pm4_4_3 recode all responses with a value of 6 to Missing
recode Pm4_4_3 6=.

*Pm4_4_4 recode all responses with a value of 6 to Missing
recode Pm4_4_4 6=.

*Pm17_4_1 recode all responses with a value of 6 to Missing
recode Pm17_4_1 6=.

*Pm17_4_2 recode all responses with a value of 6 to Missing
recode Pm17_4_2 6=.

*Pm17_4_3 recode all responses with a value of 6 to Missing
recode Pm17_4_3 6=.

*Pm17_4_4 recode all responses with a value of 6 to Missing
recode Pm17_4_4 6=.

* Label variables
label variable id "ID"
label variable form_date "Date"
label variable facility "University Affiliate"
label variable training_level "Training Level"
label variable clinical_site "Partner or Clinical Site"
label variable profession_category "Health Profession Category"
label variable gender "Gender"
label variable country "Country"

* Label variables for pre-test Module 1 multiple choice questions
label variable m1_1_1_score "pre-test, module 1, Multiple choice question #1 score"
label variable m1_1_2_score "pre-test, module 1, Multiple choice question #2 score"
label variable m1_1_3_score "pre-test, module 1, Multiple choice question #3 score"
label variable m1_1_4_score "pre-test, module 1, Multiple choice question #4 score"
label variable m1_total_score "pre-test, module 1, Multiple choice question #total score"

* Define labels for pre-test Module 1 multiple choice questions responses
label define m1_1_1_score 0 "Incorrect" 1 "Correct"
label values m1_1_1_score m1_1_1_score

label define m1_1_2_score 0 "Incorrect" 1 "Correct"
label values m1_1_2_score m1_1_2_score

label define m1_1_3_score 0 "Incorrect" 1 "Correct"
label values m1_1_3_score m1_1_3_score

label define m1_1_4_score 0 "Incorrect" 1 "Correct"
label values m1_1_4_score m1_1_4_score

* Label variables for pre-test Module 3 multiple choice questions
label variable m3_1_1_score "pre-test, module 3, Multiple choice question #1 score"
label variable m3_1_2_score "pre-test, module 3, Multiple choice question #2 score"
label variable m3_1_3_score "pre-test, module 3, Multiple choice question #3 score"
label variable m3_1_4_1_score "pre-test, module 3, Multiple choice question #4.1 score"
label variable m3_1_4_2_score "pre-test, module 3, Multiple choice question #4.2 score"
label variable m3_1_4_3_score "pre-test, module 3, Multiple choice question #4.3 score"
label variable m3_1_4_4_score "pre-test, module 3, Multiple choice question #4.4 score"
label variable m3_1_5_score "pre-test, module 3, Multiple choice question #5 score"
label variable m3_total_score "pre-test, module 3, Multiple choice question #total score"

* Define labels for pre-test Module 3 multiple choice questions responses
label define m3_1_1_score 0 "Incorrect" 1 "Correct"
label values m3_1_1_score m3_1_1_score

label define m3_1_2_score 0 "Incorrect" 1 "Correct"
label values m3_1_2_score m3_1_2_score

label define m3_1_3_score 0 "Incorrect" 1 "Correct"
label values m3_1_3_score m3_1_3_score

label define m3_1_4_1_score 0 "Incorrect" 1 "Correct"
label values m3_1_4_1_score m3_1_4_1_score

label define m3_1_4_2_score 0 "Incorrect" 1 "Correct"
label values m3_1_4_2_score m3_1_4_2_score

label define m3_1_4_3_score 0 "Incorrect" 1 "Correct"
label values m3_1_4_3_score m3_1_4_3_score

label define m3_1_4_4_score 0 "Incorrect" 1 "Correct"
label values m3_1_4_4_score m3_1_4_4_score

label define m3_1_5_score 0 "Incorrect" 1 "Correct"
label values m3_1_5_score m3_1_5_score

* Label variables for pre-test Module 4 multiple choice questions
label variable m4_1_1_score "pre-test, module 4, Multiple choice question #1 score"
label variable m4_1_2_score "pre-test, module 4, Multiple choice question #2 score"
label variable m4_1_3_score "pre-test, module 4, Multiple choice question #3 score"
label variable m4_1_4_score "pre-test, module 4, Multiple choice question #4 score"
label variable m4_total_score "pre-test, module 4, Multiple choice question #total score"

* Define labels for pre-test Module 4 multiple choice questions responses
label define m4_1_1_score 0 "Incorrect" 1 "Correct"
label values m4_1_1_score m4_1_1_score

label define m4_1_2_score 0 "Incorrect" 1 "Correct"
label values m4_1_2_score m4_1_2_score

label define m4_1_3_score 0 "Incorrect" 1 "Correct"
label values m4_1_3_score m4_1_3_score

label define m4_1_4_score 0 "Incorrect" 1 "Correct"
label values m4_1_4_score m4_1_4_score

* Label variables for pre-test Module 17 multiple choice questions
label variable m17_1_1_score "pre-test, module 17, Multiple choice question #1 score"
label variable m17_1_2_score "pre-test, module 17, Multiple choice question #2 score"
label variable m17_1_3_score "pre-test, module 17, Multiple choice question #3 score"
label variable m17_1_4_score "pre-test, module 17, Multiple choice question #4 score"
label variable m17_total_score "pre-test, module 17, Multiple choice question #total score"

* Define labels for pre-test Module 17 multiple choice questions responses
label define m17_1_1_score 0 "Incorrect" 1 "Correct"
label values m17_1_1_score m17_1_1_score

label define m17_1_2_score 0 "Incorrect" 1 "Correct"
label values m17_1_2_score m17_1_2_score

label define m17_1_3_score 0 "Incorrect" 1 "Correct"
label values m17_1_3_score m17_1_3_score

label define m17_1_4_score 0 "Incorrect" 1 "Correct"
label values m17_1_4_score m17_1_4_score

* Define lables for Likert scale questions
* Label variables for pre-test Module 1 Likert scale choice questions
label variable m1_2_1 "pre-test, module 1, Likert question #1"
label variable m1_2_2 "pre-test, module 1, Likert question #2"
label variable m1_2_3 "pre-test, module 1, Likert question #3"
label variable m1_2_4 "pre-test, module 1, Likert question #4"
label variable m1_2_5 "pre-test, module 1, Likert question #5"
label variable m1_2_6 "pre-test, module 1, Likert question #6"
label variable m1_2_7 "pre-test, module 1, Likert question #7"

* Define labels for pre-test Module 1 Likert scale questions responses
label define m1_2_1 1 "Uncomfortable" 2 "Somewhat comfortable" 3 "Comfortable" 4 "Very Comfortable" 5 "Not Applicable"
label values m1_2_1 m1_2_1

label define m1_2_2 1 "Uncomfortable" 2 "Somewhat comfortable" 3 "Comfortable" 4 "Very Comfortable" 5 "Not Applicable"
label values m1_2_2 m1_2_2

label define m1_2_3 1 "Uncomfortable" 2 "Somewhat comfortable" 3 "Comfortable" 4 "Very Comfortable" 5 "Not Applicable"
label values m1_2_3 m1_2_3

label define m1_2_4 1 "Uncomfortable" 2 "Somewhat comfortable" 3 "Comfortable" 4 "Very Comfortable" 5 "Not Applicable"
label values m1_2_4 m1_2_4

label define m1_2_5 1 "Uncomfortable" 2 "Somewhat comfortable" 3 "Comfortable" 4 "Very Comfortable" 5 "Not Applicable"
label values m1_2_5 m1_2_5

label define m1_2_6 1 "Uncomfortable" 2 "Somewhat comfortable" 3 "Comfortable" 4 "Very Comfortable" 5 "Not Applicable"
label values m1_2_6 m1_2_6

label define m1_2_7 1 "Uncomfortable" 2 "Somewhat comfortable" 3 "Comfortable" 4 "Very Comfortable" 5 "Not Applicable"
label values m1_2_7 m1_2_7

* Label variables for pre-test Module 3 Likert scale choice questions
label variable m3_2_1 "pre-test, module 3, Likert question #1"
label variable m3_2_2 "pre-test, module 3, Likert question #2"
label variable m3_2_3 "pre-test, module 3, Likert question #3"
label variable m3_2_4 "pre-test, module 3, Likert question #4"
label variable m3_2_5 "pre-test, module 3, Likert question #5"

* Define labels for pre-test Module 3 Likert scale questions responses
label define m3_2_1 1 "Uncomfortable" 2 "Somewhat comfortable" 3 "Comfortable" 4 "Very Comfortable" 5 "Not Applicable"
label values m3_2_1 m3_2_1

label define m3_2_2 1 "Uncomfortable" 2 "Somewhat comfortable" 3 "Comfortable" 4 "Very Comfortable" 5 "Not Applicable"
label values m3_2_2 m3_2_2

label define m3_2_3 1 "Uncomfortable" 2 "Somewhat comfortable" 3 "Comfortable" 4 "Very Comfortable" 5 "Not Applicable"
label values m3_2_3 m3_2_3

label define m3_2_4 1 "Uncomfortable" 2 "Somewhat comfortable" 3 "Comfortable" 4 "Very Comfortable" 5 "Not Applicable"
label values m3_2_4 m3_2_4

*destring before labeling, error as a result of missing values
label define m3_2_5 1 "Uncomfortable" 2 "Somewhat comfortable" 3 "Comfortable" 4 "Very Comfortable" 5 "Not Applicable"
label values m3_2_5 m3_2_5

* Define labels for pre-test Module 4 Likert scale questions responses
label variable m4_2_1 "pre-test, module 4, Likert question #1"
label variable m4_2_2 "pre-test, module 4, Likert question #2"
label variable m4_2_3 "pre-test, module 4, Likert question #3"
label variable m4_2_4 "pre-test, module 4, Likert question #4"
label variable m4_2_5 "pre-test, module 4, Likert question #5"
label variable m4_2_6 "pre-test, module 4, Likert question #6"

* Define labels for pre-test Module 4 Likert scale questions responses
label define m4_2_1 1 "Uncomfortable" 2 "Somewhat comfortable" 3 "Comfortable" 4 "Very Comfortable" 5 "Not Applicable"
label values m4_2_1 m4_2_1

label define m4_2_2 1 "Uncomfortable" 2 "Somewhat comfortable" 3 "Comfortable" 4 "Very Comfortable" 5 "Not Applicable"
label values m4_2_2 m4_2_2

label define m4_2_3 1 "Uncomfortable" 2 "Somewhat comfortable" 3 "Comfortable" 4 "Very Comfortable" 5 "Not Applicable"
label values m4_2_3 m4_2_3

label define m4_2_4 1 "Uncomfortable" 2 "Somewhat comfortable" 3 "Comfortable" 4 "Very Comfortable" 5 "Not Applicable"
label values m4_2_4 m4_2_4

label define m4_2_5 1 "Uncomfortable" 2 "Somewhat comfortable" 3 "Comfortable" 4 "Very Comfortable" 5 "Not Applicable"
label values m4_2_5 m4_2_5

*Missing values
label define m4_2_6 1 "Uncomfortable" 2 "Somewhat comfortable" 3 "Comfortable" 4 "Very Comfortable" 5 "Not Applicable"
label values m4_2_6 m4_2_6

* Label variables for pre-test Module 17 Likert scale choice questions
*Note: pre-test, module 17, Likert question #1 - data removed, question asked in error
label variable m17_2_2 "pre-test, module 17, Likert question #2"
label variable m17_2_3 "pre-test, module 17, Likert question #3"
label variable m17_2_4 "pre-test, module 17, Likert question #4"
label variable m17_2_5 "pre-test, module 17, Likert question #5"

* Define labels for pre-test Module 17 Likert scale questions responses
label define m17_2_2 1 "Uncomfortable" 2 "Somewhat comfortable" 3 "Comfortable" 4 "Very Comfortable" 5 "Not Applicable"
label values m17_2_2 m17_2_2

label define m17_2_3 1 "Uncomfortable" 2 "Somewhat comfortable" 3 "Comfortable" 4 "Very Comfortable" 5 "Not Applicable"
label values m17_2_3 m17_2_3

label define m17_2_4 1 "Uncomfortable" 2 "Somewhat comfortable" 3 "Comfortable" 4 "Very Comfortable" 5 "Not Applicable"
label values m17_2_4 m17_2_4

label define m17_2_5 1 "Uncomfortable" 2 "Somewhat comfortable" 3 "Comfortable" 4 "Very Comfortable" 5 "Not Applicable"
label values m17_2_5 m17_2_5

* Label variables for post-test Module 1 multiple choice questions
label variable Pm1_1_1_score "post-test, module 1, Multiple choice question #1 score"
label variable Pm1_1_2_score "post-test, module 1, Multiple choice question #2 score"
label variable Pm1_1_3_score "post-test, module 1, Multiple choice question #3 score"
label variable Pm1_1_4_score "post-test, module 1, Multiple choice question #4 score"
label variable Pm1_total_score "post-test, module 1, Multiple choice question #total score"

* Define labels for post-test Module 1 multiple choice questions responses
label define Pm1_1_1_score 0 "Incorrect" 1 "Correct"
label values Pm1_1_1_score Pm1_1_1_score

label define Pm1_1_2_score 0 "Incorrect" 1 "Correct"
label values Pm1_1_2_score Pm1_1_2_score

label define Pm1_1_3_score  0 "Incorrect" 1 "Correct"
label values Pm1_1_3_score  Pm1_1_3_score

label define Pm1_1_4_score 0 "Incorrect" 1 "Correct"
label values Pm1_1_4_score Pm1_1_4_score

* Define labels for post-test Module 1 Likert scale questions responses
label variable Pm1_2_1 "post-test, module 1, Likert question #1"
label variable Pm1_2_2 "post-test, module 1, Likert question #2"
label variable Pm1_2_3 "post-test, module 1, Likert question #3"
label variable Pm1_2_4 "post-test, module 1, Likert question #4"
label variable Pm1_2_5 "post-test, module 1, Likert question #5"
label variable Pm1_2_6 "post-test, module 1, Likert question #6"
label variable Pm1_2_7 "post-test, module 1, Likert question #7"

* Define labels for post-test Module 1 Likert scale questions responses
label define Pm1_2_1 1 "Uncomfortable" 2 "Somewhat comfortable" 3 "Comfortable" 4 "Very Comfortable" 5 "Not Applicable"
label values Pm1_2_1 Pm1_2_1

label define Pm1_2_2 1 "Uncomfortable" 2 "Somewhat comfortable" 3 "Comfortable" 4 "Very Comfortable" 5 "Not Applicable"
label values Pm1_2_2 Pm1_2_2

label define Pm1_2_3 1 "Uncomfortable" 2 "Somewhat comfortable" 3 "Comfortable" 4 "Very Comfortable" 5 "Not Applicable"
label values Pm1_2_3 Pm1_2_3

label define Pm1_2_4 1 "Uncomfortable" 2 "Somewhat comfortable" 3 "Comfortable" 4 "Very Comfortable" 5 "Not Applicable"
label values Pm1_2_4  Pm1_2_4

label define Pm1_2_5 1 "Uncomfortable" 2 "Somewhat comfortable" 3 "Comfortable" 4 "Very Comfortable" 5 "Not Applicable"
label values Pm1_2_5 Pm1_2_5

label define Pm1_2_6 1 "Uncomfortable" 2 "Somewhat comfortable" 3 "Comfortable" 4 "Very Comfortable" 5 "Not Applicable"
label values Pm1_2_6 Pm1_2_6

label define Pm1_2_7 1 "Uncomfortable" 2 "Somewhat comfortable" 3 "Comfortable" 4 "Very Comfortable" 5 "Not Applicable"
label values Pm1_2_7 Pm1_2_7

*Define labels for post-test Module 1  Learner evaluation of facilitator
label variable Pm1_3_1 "post-test, module 1, Learner evaluation of facilitator question #1"
label variable Pm1_3_2 "post-test, module 1, Learner evaluation of facilitator question #2"
label variable Pm1_3_3 "post-test, module 1, Learner evaluation of facilitator question #3"
label variable Pm1_3_4 "post-test, module 1, Learner evaluation of facilitator question #4"
label variable Pm1_3_5 "post-test, module 1, Learner evaluation of facilitator question #5"

* Define labels for post-test Module 1  Learner evaluation of facilitator
label define Pm1_3_1 1 "not effective at all" 2 "slightly effective" 3 "moderately effective" 4 "very effective" 5 "extremely effective"
label values Pm1_3_1 Pm1_3_1

label define Pm1_3_2 1 "not knowledgeable at all" 2 "slightly knowledgeable" 3 "moderately knowledgeable" 4 "very knowledgeable" 5 "extremely knowledgeable"
label values Pm1_3_2 Pm1_3_2

label define Pm1_3_3 0 "No" 1 "Yes"
label values Pm1_3_3 Pm1_3_3

label define Pm1_3_4 0 "No" 1 "Yes"
label values Pm1_3_4  Pm1_3_4

* Pm1_3_5  Open ended question
*label values Pm1_3_5 Pm1_3_5

*Define labels for post-test Module 1  Learner evaluation of module
label variable Pm1_4_1 "post-test, module 1, Learner evaluation of module question #1"
label variable Pm1_4_2 "post-test, module 1, Learner evaluation of module question #2"
label variable Pm1_4_3 "post-test, module 1, Learner evaluation of module question #3"
label variable Pm1_4_4 "post-test, module 1, Learner evaluation of module question #4"
label variable Pm1_4_5 "post-test, module 1, Learner evaluation of module question #5"

* Define labels for post-test Module 1  Learner evaluation of module
label define Pm1_4_1 1 "Extremely dissatisfied" 2 "Dissastified" 3 "Neither" 4 "Slightly satisfied" 5 "Extremely satisfied"
label values Pm1_4_1 Pm1_4_1

label define Pm1_4_2 1 "not effective at all" 2 "slightly effective" 3 "moderately effective" 4 "very effective" 5 "extremely effective"
label values Pm1_4_2 Pm1_4_2

label define Pm1_4_3 1 "not effective at all" 2 "slightly effective" 3 "moderately effective" 4 "very effective" 5 "extremely effective"
label values Pm1_4_3 Pm1_4_3

label define Pm1_4_4 1 "not effective at all" 2 "slightly effective" 3 "moderately effective" 4 "very effective" 5 "extremely effective"
label values Pm1_4_4  Pm1_4_4

* Pm1_4_5 Open ended question
*label values Pm1_4_5 Pm1_4_5

* Label variables for post-test Module 3 multiple choice questions
label variable Pm3_1_1_score "post-test, module 3, Multiple choice question #1 score"
label variable Pm3_1_2_score "post-test, module 3, Multiple choice question #2 score"
label variable Pm3_1_3_score "post-test, module 3, Multiple choice question #3 score"
label variable Pm3_1_4_1_score "post-test, module 3, Multiple choice question #4.1 score"
label variable Pm3_1_4_2_score "post-test, module 3, Multiple choice question #4.2 score"
label variable Pm3_1_4_3_score "post-test, module 3, Multiple choice question #4.3 score"
label variable Pm3_1_4_4_score "post-test, module 3, Multiple choice question #4.4 score"
label variable Pm3_1_5_score "post-test, module 3, Multiple choice question #5 score"
label variable Pm3_total_score "post-test, module 3, Multiple choice question #total score"

* Define labels for post-test Module 3 multiple choice questions responses
label define Pm3_1_1_score 0 "Incorrect" 1 "Correct"
label values Pm3_1_1_score Pm3_1_1_score

label define Pm3_1_2_score  0 "Incorrect" 1 "Correct"
label values Pm3_1_2_score  Pm3_1_2_score

label define Pm3_1_3_score 0 "Incorrect" 1 "Correct"
label values Pm3_1_3_score  Pm3_1_3_score

label define Pm3_1_4_1_score 0 "Incorrect" 1 "Correct"
label values Pm3_1_4_1_score Pm3_1_4_1_score

label define Pm3_1_4_2_score 0 "Incorrect" 1 "Correct"
label values Pm3_1_4_2_score  Pm3_1_4_2_score

label define Pm3_1_4_3_score 0 "Incorrect" 1 "Correct"
label values Pm3_1_4_3_score  Pm3_1_4_3_score

label define Pm3_1_4_4_score 0 "Incorrect" 1 "Correct"
label values Pm3_1_4_4_score  Pm3_1_4_4_score

label define Pm3_1_5_score 0 "Incorrect" 1 "Correct"
label values Pm3_1_5_score Pm3_1_5_score

* Define labels for post-test Module 3 Likert scale questions responses
label variable Pm3_2_1 "post-test, module 3, Likert question #1"
label variable Pm3_2_2 "post-test, module 3, Likert question #2"
label variable Pm3_2_3 "post-test, module 3, Likert question #3"
label variable Pm3_2_4 "post-test, module 3, Likert question #4"
label variable Pm3_2_5 "post-test, module 3, Likert question #5"

* Define labels for post-test Module 3 Likert scale questions responses
label define Pm3_2_1 1 "Uncomfortable" 2 "Somewhat comfortable" 3 "Comfortable" 4 "Very Comfortable" 5 "Not Applicable"
label values Pm3_2_1 Pm3_2_1

label define Pm3_2_2 1 "Uncomfortable" 2 "Somewhat comfortable" 3 "Comfortable" 4 "Very Comfortable" 5 "Not Applicable"
label values Pm3_2_2 Pm3_2_2

label define Pm3_2_3 1 "Uncomfortable" 2 "Somewhat comfortable" 3 "Comfortable" 4 "Very Comfortable" 5 "Not Applicable"
label values Pm3_2_3 Pm3_2_3

label define Pm3_2_4 1 "Uncomfortable" 2 "Somewhat comfortable" 3 "Comfortable" 4 "Very Comfortable" 5 "Not Applicable"
label values Pm3_2_4  Pm3_2_4

label define Pm3_2_5 1 "Uncomfortable" 2 "Somewhat comfortable" 3 "Comfortable" 4 "Very Comfortable" 5 "Not Applicable"
label values Pm3_2_5 Pm3_2_5

*Define labels for post-test Module 3  Learner evaluation of facilitator
label variable Pm3_3_1 "post-test, module 3, Learner evaluation of facilitator question #1"
label variable Pm3_3_2 "post-test, module 3, Learner evaluation of facilitator question #2"
label variable Pm3_3_3 "post-test, module 3, Learner evaluation of facilitator question #3"
label variable Pm3_3_4 "post-test, module 3, Learner evaluation of facilitator question #4"
label variable Pm3_3_5 "post-test, module 3, Learner evaluation of facilitator question #5"

* Define labels for post-test Module 3  Learner evaluation of facilitator
label define Pm3_3_1 1 "not effective at all" 2 "slightly effective" 3 "moderately effective" 4 "very effective" 5 "extremely effective"
label values Pm3_3_1 Pm3_3_1

label define Pm3_3_2 1 "not knowledgeable at all" 2 "slightly knowledgeable" 3 "moderately knowledgeable" 4 "very knowledgeable" 5 "extremely knowledgeable"
label values Pm3_3_2 Pm3_3_2

label define Pm3_3_3 0 "No" 1 "Yes"
label values Pm3_3_3 Pm3_3_3

label define Pm3_3_4 0 "No" 1 "Yes"
label values Pm3_3_4  Pm3_3_4

* Pm1_3_5  Open ended question
*label values Pm3_3_5 Pm3_3_5

*Define labels for post-test Module 3  Learner evaluation of module
label variable Pm3_4_1 "post-test, module 3, Learner evaluation of module question #1"
label variable Pm3_4_2 "post-test, module 3, Learner evaluation of module question #2"
label variable Pm3_4_3 "post-test, module 3, Learner evaluation of module question #3"
label variable Pm3_4_4 "post-test, module 3, Learner evaluation of module question #4"
label variable Pm3_4_5 "post-test, module 3, Learner evaluation of module question #5"

* Define labels for post-test Module 3  Learner evaluation of module
label define Pm3_4_1 1 "Extremely dissatisfied" 2 "Dissastified" 3 "Neither" 4 "Slightly satisfied" 5 "Extremely satisfied"
label values Pm3_4_1 Pm3_4_1

label define Pm3_4_2 1 "not effective at all" 2 "slightly effective" 3 "moderately effective" 4 "very effective" 5 "extremely effective"
label values Pm3_4_2 Pm3_4_2

label define Pm3_4_3 1 "not effective at all" 2 "slightly effective" 3 "moderately effective" 4 "very effective" 5 "extremely effective"
label values Pm3_4_3 Pm3_4_3

label define Pm3_4_4 1 "not effective at all" 2 "slightly effective" 3 "moderately effective" 4 "very effective" 5 "extremely effective"
label values Pm3_4_4  Pm3_4_4

* Pm3_4_5 Open ended question
*label values Pm3_4_5 Pm3_4_5

* Label variables for post-test Module 4 multiple choice questions
label variable Pm4_1_1_score "post-test, module 4, Multiple choice question #1 score"
label variable Pm4_1_2_score "post-test, module 4, Multiple choice question #2 score"
label variable Pm4_1_3_score "post-test, module 4, Multiple choice question #3 score"
label variable Pm4_1_4_score "post-test, module 4, Multiple choice question #4 score"
label variable Pm4_total_score "post-test, module 4, Multiple choice question #total score"

* Define labels for post-test Module 4 multiple choice questions responses
label define Pm4_1_1_score 0 "Incorrect" 1 "Correct"
label values Pm4_1_1_score Pm4_1_1_score

label define Pm4_1_2_score  0 "Incorrect" 1 "Correct"
label values Pm4_1_2_score  Pm4_1_2_score

label define Pm4_1_3_score 0 "Incorrect" 1 "Correct"
label values Pm4_1_3_score  Pm4_1_3_score

label define Pm4_1_4_score 0 "Incorrect" 1 "Correct"
label values Pm4_1_4_score Pm4_1_4_score

* Define labels for post-test Module 4 Likert scale questions responses
label variable Pm4_2_1 "post-test, module 4, Likert question #1"
label variable Pm4_2_2 "post-test, module 4, Likert question #2"
label variable Pm4_2_3 "post-test, module 4, Likert question #3"
label variable Pm4_2_4 "post-test, module 4, Likert question #4"
label variable Pm4_2_5 "post-test, module 4, Likert question #5"
label variable Pm4_2_6 "post-test, module 4, Likert question #6"

* Define labels for post-test Module 4 Likert scale questions responses
label define Pm4_2_1 1 "Uncomfortable" 2 "Somewhat comfortable" 3 "Comfortable" 4 "Very Comfortable" 5 "Not Applicable"
label values Pm4_2_1 Pm4_2_1

label define Pm4_2_2 1 "Uncomfortable" 2 "Somewhat comfortable" 3 "Comfortable" 4 "Very Comfortable" 5 "Not Applicable"
label values Pm4_2_2 Pm4_2_2

label define Pm4_2_3 1 "Uncomfortable" 2 "Somewhat comfortable" 3 "Comfortable" 4 "Very Comfortable" 5 "Not Applicable"
label values Pm4_2_3 Pm4_2_3

label define Pm4_2_4 1 "Uncomfortable" 2 "Somewhat comfortable" 3 "Comfortable" 4 "Very Comfortable" 5 "Not Applicable"
label values Pm4_2_4 Pm4_2_4

label define Pm4_2_5 1 "Uncomfortable" 2 "Somewhat comfortable" 3 "Comfortable" 4 "Very Comfortable" 5 "Not Applicable"
label values Pm4_2_5 Pm4_2_5

label define Pm4_2_6 1 "Uncomfortable" 2 "Somewhat comfortable" 3 "Comfortable" 4 "Very Comfortable" 5 "Not Applicable"
label values Pm4_2_6 Pm4_2_6

*Define labels for post-test Module 4  Learner evaluation of facilitator
label variable Pm4_3_1 "post-test, module 4, Learner evaluation of facilitator question #1"
label variable Pm4_3_2 "post-test, module 4, Learner evaluation of facilitator question #2"
label variable Pm4_3_3 "post-test, module 4, Learner evaluation of facilitator question #3"
label variable Pm4_3_4 "post-test, module 4, Learner evaluation of facilitator question #4"
label variable Pm4_3_5 "post-test, module 4, Learner evaluation of facilitator question #5"

* Define labels for post-test Module 4  Learner evaluation of facilitator
label define Pm4_3_1 1 "not effective at all" 2 "slightly effective" 3 "moderately effective" 4 "very effective" 5 "extremely effective"
label values Pm4_3_1 Pm4_3_1

label define Pm4_3_2 1 "not knowledgeable at all" 2 "slightly knowledgeable" 3 "moderately knowledgeable" 4 "very knowledgeable" 5 "extremely knowledgeable"
label values Pm4_3_2 Pm4_3_2

label define Pm4_3_3 0 "No" 1 "Yes"
label values Pm4_3_3 Pm4_3_3

label define Pm4_3_4 0 "No" 1 "Yes"
label values Pm4_3_4  Pm4_3_4

* Pm4_3_5  Open ended question
*label values Pm4_3_5 Pm4_3_5

*Define labels for post-test Module 4  Learner evaluation of module
label variable Pm4_4_1 "post-test, module 4, Learner evaluation of module question #1"
label variable Pm4_4_2 "post-test, module 4, Learner evaluation of module question #2"
label variable Pm4_4_3 "post-test, module 4, Learner evaluation of module question #3"
label variable Pm4_4_4 "post-test, module 4, Learner evaluation of module question #4"
label variable Pm4_4_5 "post-test, module 4, Learner evaluation of module question #5"

* Define labels for post-test Module 4  Learner evaluation of module
label define Pm4_4_1 1 "Extremely dissatisfied" 2 "Dissastified" 3 "Neither" 4 "Slightly satisfied" 5 "Extremely satisfied"
label values Pm4_4_1 Pm4_4_1

label define Pm4_4_2 1 "not effective at all" 2 "slightly effective" 3 "moderately effective" 4 "very effective" 5 "extremely effective"
label values Pm4_4_2 Pm4_4_2

label define Pm4_4_3 1 "not effective at all" 2 "slightly effective" 3 "moderately effective" 4 "very effective" 5 "extremely effective"
label values Pm4_4_3 Pm4_4_3

label define Pm4_4_4 1 "not effective at all" 2 "slightly effective" 3 "moderately effective" 4 "very effective" 5 "extremely effective"
label values Pm4_4_4  Pm4_4_4

* Pm4_4_5 Open ended question
*label values Pm4_4_5 Pm4_4_5

* Label variables for post-test Module 17 multiple choice questions
label variable Pm17_1_1_score "post-test, module 17, Multiple choice question #1 score"
label variable Pm17_1_2_score "post-test, module 17, Multiple choice question #2 score"
label variable Pm17_1_3_score "post-test, module 17, Multiple choice question #3 score"
label variable Pm17_1_4_score "post-test, module 17, Multiple choice question #4 score"
label variable Pm17_total_score "post-test, module 17, Multiple choice question #total score"

* Define labels for post-test Module 17 multiple choice questions responses
label define Pm17_1_1_score 0 "Incorrect" 1 "Correct"
label values Pm17_1_1_score Pm17_1_1_score

label define Pm17_1_2_score  0 "Incorrect" 1 "Correct"
label values Pm17_1_2_score  Pm17_1_2_score

label define Pm17_1_3_score 0 "Incorrect" 1 "Correct"
label values Pm17_1_3_score  Pm17_1_3_score

label define Pm17_1_4_score 0 "Incorrect" 1 "Correct"
label values Pm17_1_4_score Pm17_1_4_score

* Define labels for post-test Module 17 Likert scale questions responses
* Note: post-test, module 17, Likert question #1 - data removed, question asked in error
label variable Pm17_2_2 "post-test, module 17, Likert question #2"
label variable Pm17_2_3 "post-test, module 17, Likert question #3"
label variable Pm17_2_4 "post-test, module 17, Likert question #4"
label variable Pm17_2_5 "post-test, module 17, Likert question #5"

* Define labels for post-test Module 17 Likert scale questions responses
* Note: post-test, module 17, Likert question #1 - data removed, question asked in error
label define Pm17_2_2 1 "Uncomfortable" 2 "Somewhat comfortable" 3 "Comfortable" 4 "Very Comfortable" 5 "Not Applicable"
label values Pm17_2_2 Pm17_2_2

label define Pm17_2_3 1 "Uncomfortable" 2 "Somewhat comfortable" 3 "Comfortable" 4 "Very Comfortable" 5 "Not Applicable"
label values Pm17_2_3 Pm17_2_3

label define Pm17_2_4 1 "Uncomfortable" 2 "Somewhat comfortable" 3 "Comfortable" 4 "Very Comfortable" 5 "Not Applicable"
label values Pm17_2_4 Pm17_2_4

label define Pm17_2_5 1 "Uncomfortable" 2 "Somewhat comfortable" 3 "Comfortable" 4 "Very Comfortable" 5 "Not Applicable"
label values Pm17_2_5 Pm17_2_5

*Define labels for post-test Module 17  Learner evaluation of facilitator
label variable Pm17_3_1 "post-test, module 17, Learner evaluation of facilitator question #1"
label variable Pm17_3_2 "post-test, module 17, Learner evaluation of facilitator question #2"
label variable Pm17_3_3 "post-test, module 17, Learner evaluation of facilitator question #3"
label variable Pm17_3_4 "post-test, module 17, Learner evaluation of facilitator question #4"
label variable Pm17_3_5 "post-test, module 17, Learner evaluation of facilitator question #5"

* Define labels for post-test Module 17  Learner evaluation of facilitator
label define Pm17_3_1 1 "not effective at all" 2 "slightly effective" 3 "moderately effective" 4 "very effective" 5 "extremely effective"
label values Pm17_3_1 Pm17_3_1

label define Pm17_3_2 1 "not knowledgeable at all" 2 "slightly knowledgeable" 3 "moderately knowledgeable" 4 "very knowledgeable" 5 "extremely knowledgeable"
label values Pm17_3_2 Pm17_3_2

label define Pm17_3_3 0 "No" 1 "Yes"
label values Pm17_3_3 Pm17_3_3

label define Pm17_3_4 0 "No" 1 "Yes"
label values Pm17_3_4  Pm17_3_4

* Pm17_3_5  Open ended question
*label values Pm17_3_5 Pm17_3_5

*Define labels for post-test Module 17 Learner evaluation of module
label variable Pm17_4_1 "post-test, module 17, Learner evaluation of module question #1"
label variable Pm17_4_2 "post-test, module 17, Learner evaluation of module question #2"
label variable Pm17_4_3 "post-test, module 17, Learner evaluation of module question #3"
label variable Pm17_4_4 "post-test, module 17, Learner evaluation of module question #4"
label variable Pm17_4_5 "post-test, module 17, Learner evaluation of module question #5"

* Define labels for post-test Module 17 Learner evaluation of module
label define Pm17_4_1 1 "Extremely dissatisfied" 2 "Dissastified" 3 "Neither" 4 "Slightly satisfied" 5 "Extremely satisfied"
label values Pm17_4_1 Pm17_4_1

label define Pm17_4_2 1 "not effective at all" 2 "slightly effective" 3 "moderately effective" 4 "very effective" 5 "extremely effective"
label values Pm17_4_2 Pm17_4_2

label define Pm17_4_3 1 "not effective at all" 2 "slightly effective" 3 "moderately effective" 4 "very effective" 5 "extremely effective"
label values Pm17_4_3 Pm17_4_3

label define Pm17_4_4 1 "not effective at all" 2 "slightly effective" 3 "moderately effective" 4 "very effective" 5 "extremely effective"
label values Pm17_4_4  Pm17_4_4

* Pm17_4_5 Open ended question
*label values Pm17_4_5 Pm17_4_5

save "chips_cleaned.dta", replace

log close
