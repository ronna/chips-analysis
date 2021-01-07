log using chips_cleaning.log, replace

clear

cd "C:\Users\Ronald Munjoma\Documents\chips-analysis\data"
******************************************************************
*IMPORT LATEST DATA - REMEMBER TO CHANGE FILE NAME AND SHEET NAME

import excel "04.01.2020_Zimbabwe_032620.xlsx", sheet(University of Zimbabwe) firstrow clear

save chips_cleaned, replace

************************
*THIS PREPARES DATASET
************************

set more off
***************************************************************
* Label the dataset
label data "This file contains CHIPS STRIPE HIV data"

* Correct mispelt Partner/Clinical site names
* Confirm if survey was run both at Parirenyatwa OI Clinic and Main hospital (are they two different sites?)


* Label variables
label variable m1_1_1_score "What do the UNAIDS 95-95-95 goals strive to achieve for people with HIV (PWH)?"
label variable m1_1_2_score "Which of the below increases the risk of HIV infection?"
label variable m1_1_3_score "Which of the following contraception methods are affected by antiretroviral therapy (ART)?"
label variable m1_1_4_score "Which of the following best describes when to start antiretroviral therapy (ART)?"

* Define labels for multiple choice questions
label define m1_1_1_score 0 "Incorrect" 1 "Correct"
label values m1_1_1_score m1_1_1_score

label define m1_1_2_score 0 "Incorrect" 1 "Correct"
label values m1_1_2_score m1_1_2_score

label define m1_1_3_score 0 "Incorrect" 1 "Correct"
label values m1_1_3_score m1_1_3_score

label define m1_1_4_score 0 "Incorrect" 1 "Correct"
label values m1_1_4_score m1_1_4_score

* Define lables for Likert scale questions

* Create Tables
tab  m1_1_1_score
tab  m1_1_2_score
tab  m1_1_3_score
tab  m1_1_4_score

save "chips_cleaned.dta", replace

log close
