log using chips_analysis.log, replace

clear

cd "C:\Users\Ronald Munjoma\Documents\chips-analysis\data"
******************************************************************
*LOAD LATEST DATA
use chips_cleaned, clear

* Data Analysis only for subject with non-missing values *
keep if m1_total_score~=. & m3_total_score~=. & m4_total_score~=. & m17_total_score~=. & Pm1_total_score~=. & Pm3_total_score~=. & Pm4_total_score~=. & Pm17_total_score~=.

* Create Tables
*descriptive statistics

* check out these commands
*tab m1_total_score, chi2

*Clinical Site by Profession Category
*pre-test - total survey
tab clinical_site profession_category, row nokey

*Clinical Site by Training levels
*pre-test - total survey
tab clinical_site training_level, row nokey

*Trainne characteristics by gender
*training_level
tab training_level gender, row nokey
*clinical_site
tab clinical_site gender, row nokey
*Profession_categoty
tab profession_category gender, row nokey


*dependent ttest pre post multiple questions
*Module 1 ttest
ttest Pm1_total_score=m1_total_score

*Module 3 ttest
ttest Pm3_total_score=m3_total_score

*Module 4 ttest
ttest Pm4_total_score=m4_total_score

*Module 17 ttest
ttest Pm17_total_score=m17_total_score

*Learner evaluation of facilitator
*post test module 1 Learner evaluation of facilitator
tab Pm1_3_1 gender, row nokey
tab Pm1_3_2 gender, row nokey
tab Pm1_3_3 gender, row nokey
tab Pm1_3_4 gender, row nokey

*post test module 3 Learner evaluation of facilitator
tab Pm3_3_1
tab Pm3_3_2
tab Pm3_3_3
tab Pm3_3_4

*post test module 4 Learner evaluation of facilitator
tab Pm4_3_1
tab Pm4_3_2
tab Pm4_3_3
tab Pm4_3_4

*post test module 17 Learner evaluation of facilitator
tab Pm17_3_1
tab Pm17_3_2
tab Pm17_3_3
tab Pm17_3_4

*Learner evaluation of module
*post test module 1 Learner evaluation of module
tab Pm1_4_1
tab Pm1_4_2
tab Pm1_4_3
tab Pm1_4_4

*post test module 3 Learner evaluation of module
tab Pm3_4_1
tab Pm3_4_2
tab Pm3_4_3
tab Pm3_4_4

*post test module 4 Learner evaluation of module
tab Pm4_4_1
tab Pm4_4_2
tab Pm4_4_3
tab Pm4_4_4

*post test module 17 Learner evaluation of module
tab Pm17_4_1
tab Pm17_4_2
tab Pm17_4_3
tab Pm17_4_4
