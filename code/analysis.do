log using chips_analysis.log, replace

clear

cd "C:\Users\ronald\Documents\GitHub\chips-analysis\data"
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

*Individual question ttest
*Module 1 ttest
ttest Pm1_1_1_score=m1_1_1_score
ttest Pm1_1_2_score=m1_1_2_score
ttest Pm1_1_3_score=m1_1_3_score
ttest Pm1_1_4_score=m1_1_4_score

*Module 3 ttest
ttest Pm3_1_1_score=m3_1_1_score
ttest Pm3_1_2_score=m3_1_2_score
ttest Pm3_1_3_score=m3_1_3_score
ttest Pm3_1_4_1_score=m3_1_4_1_score
ttest Pm3_1_4_2_score=m3_1_4_2_score
ttest Pm3_1_4_3_score=m3_1_4_3_score
ttest Pm3_1_4_4_score=m3_1_4_4_score
ttest Pm3_1_5_score=m3_1_5_score

*Module 4 ttest
ttest Pm4_1_1_score=m4_1_1_score
ttest Pm4_1_2_score=m4_1_2_score
ttest Pm4_1_3_score=m4_1_3_score
ttest Pm4_1_4_score=m4_1_4_score

*Module 17 ttest
ttest Pm17_1_1_score=m17_1_1_score
ttest Pm17_1_2_score=m17_1_2_score
ttest Pm17_1_3_score=m17_1_3_score
ttest Pm17_1_4_score=m17_1_4_score

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

*Wilcoxon signed ranks tests pre post multiple questions
*Module 1 Wilcoxon signed ranks tests
signrank Pm1_total_score=m1_total_score

*Module 3 Wilcoxon signed ranks tests
signrank Pm3_total_score=m3_total_score

*Module 4 Wilcoxon signed ranks tests
signrank Pm4_total_score=m4_total_score

*Module 17 Wilcoxon signed ranks tests
signrank Pm17_total_score=m17_total_score

*Individual question Wilcoxon signed ranks tests
*Module 1 Wilcoxon signed ranks tests
signrank Pm1_1_1_score=m1_1_1_score
signrank Pm1_1_2_score=m1_1_2_score
signrank Pm1_1_3_score=m1_1_3_score
signrank Pm1_1_4_score=m1_1_4_score

*Module 3 Wilcoxon signed ranks tests
signrank Pm3_1_1_score=m3_1_1_score
signrank Pm3_1_2_score=m3_1_2_score
signrank Pm3_1_3_score=m3_1_3_score
signrank Pm3_1_4_1_score=m3_1_4_1_score
signrank Pm3_1_4_2_score=m3_1_4_2_score
signrank Pm3_1_4_3_score=m3_1_4_3_score
signrank Pm3_1_4_4_score=m3_1_4_4_score
signrank Pm3_1_5_score=m3_1_5_score

*Module 4 Wilcoxon signed ranks tests
signrank Pm4_1_1_score=m4_1_1_score
signrank Pm4_1_2_score=m4_1_2_score
signrank Pm4_1_3_score=m4_1_3_score
signrank Pm4_1_4_score=m4_1_4_score

*Module 17 Wilcoxon signed ranks tests
signrank Pm17_1_1_score=m17_1_1_score
signrank Pm17_1_2_score=m17_1_2_score
signrank Pm17_1_3_score=m17_1_3_score
signrank Pm17_1_4_score=m17_1_4_score

* Learner self conceived competency
* Module 1 pretest Learner self conceived competency
tab m1_2_1
tab m1_2_2
tab m1_2_3
tab m1_2_4
tab m1_2_5
tab m1_2_6
tab m1_2_7

* Module 3 pretest Learner self conceived competency
tab m3_2_1
tab m3_2_2
tab m3_2_3
tab m3_2_4
tab m3_2_5

* Module 4 pretest Learner self conceived competency
tab m4_2_1
tab m4_2_2
tab m4_2_3
tab m4_2_4
tab m4_2_5
tab m4_2_6

* Module 17 pretest Learner self conceived competency
tab m17_2_2
tab m17_2_3
tab m17_2_4
tab m17_2_5

* Module 1 posttest Learner self conceived competency
tab Pm1_2_1
tab Pm1_2_2
tab Pm1_2_3
tab Pm1_2_4
tab Pm1_2_5
tab Pm1_2_6
tab Pm1_2_7

* Module 3 posttest Learner self conceived competency
tab Pm3_2_1
tab Pm3_2_2
tab Pm3_2_3
tab Pm3_2_4
tab Pm3_2_5

* Module 4 posttest Learner self conceived competency
tab Pm4_2_1
tab Pm4_2_2
tab Pm4_2_3
tab Pm4_2_4
tab Pm4_2_5
tab Pm4_2_6

* Module 17 posttest Learner self conceived competency
tab Pm17_2_2
tab Pm17_2_3
tab Pm17_2_4
tab Pm17_2_5

* Wilcoxon signed ranks tests Learner self conceived competency

* Wilcoxon signed ranks tests Module 1 posttest Learner self conceived competency
signrank Pm1_2_1=m1_2_1
signrank Pm1_2_2=m17_2_2
signrank Pm1_2_3=m1_2_3
signrank Pm1_2_4=m1_2_4
signrank Pm1_2_5=m1_2_5
signrank Pm1_2_6=m1_2_6
signrank Pm1_2_7=m1_2_7

* Wilcoxon signed ranks tests Module 3 posttest Learner self conceived competency
signrank Pm3_2_1=m3_2_1
signrank Pm3_2_2=m3_2_2
signrank Pm3_2_3=m3_2_3
signrank Pm3_2_4=m3_2_4
signrank Pm3_2_5=m3_2_5

* Wilcoxon signed ranks tests Module 4 posttest Learner self conceived competency
signrank Pm4_2_1=m4_2_1
signrank Pm4_2_2=m4_2_2
signrank Pm4_2_3=m4_2_3
signrank Pm4_2_4=m4_2_4
signrank Pm4_2_5=m4_2_5
signrank Pm4_2_6=m4_2_6

* Wilcoxon signed ranks tests Module 17 posttest Learner self conceived competency
signrank Pm17_2_2=m17_2_2
signrank Pm17_2_3=m17_2_3
signrank Pm17_2_4=m17_2_4
signrank Pm17_2_5=m17_2_5

* Ttest tests Learner self conceived competency

* Ttest tests Module 1 posttest Learner self conceived competency
ttest Pm1_2_1=m1_2_1
ttest Pm1_2_2=m17_2_2
ttest Pm1_2_3=m1_2_3
ttest Pm1_2_4=m1_2_4
ttest Pm1_2_5=m1_2_5
ttest Pm1_2_6=m1_2_6
ttest Pm1_2_7=m1_2_7

* Ttest tests Module 3 posttest Learner self conceived competency
ttest Pm3_2_1=m3_2_1
ttest Pm3_2_2=m3_2_2
ttest Pm3_2_3=m3_2_3
ttest Pm3_2_4=m3_2_4
ttest Pm3_2_5=m3_2_5

* Ttest tests Module 4 posttest Learner self conceived competency
ttest Pm4_2_1=m4_2_1
ttest Pm4_2_2=m4_2_2
ttest Pm4_2_3=m4_2_3
ttest Pm4_2_4=m4_2_4
ttest Pm4_2_5=m4_2_5
ttest Pm4_2_6=m4_2_6

* Ttest tests Module 17 posttest Learner self conceived competency
ttest Pm17_2_2=m17_2_2
ttest Pm17_2_3=m17_2_3
ttest Pm17_2_4=m17_2_4
ttest Pm17_2_5=m17_2_5
