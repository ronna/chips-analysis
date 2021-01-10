log using chips_analysis.log, replace

clear

cd "C:\Users\Ronald Munjoma\Documents\chips-analysis\data"
******************************************************************
*LOAD LATEST DATA
use chips_cleaned, clear

* Create Tables
bysort gender: tab training_level profession_category, m
bysort profession_category: tab training_level clinical_site, m
bysort year: tab level sex, row nokey


tab facility
tab training_level
tab clinical_site
tab profession_category
tab gender
tab country

tab  m1_1_1_score
tab  m1_1_2_score
tab  m1_1_3_score
tab  m1_1_4_score

tab  m3_1_1_score
tab  m3_1_2_score
tab  m3_1_3_score
tab  m3_1_4_1_score

tab  m4_1_1_score
tab  m4_1_2_score
tab  m4_1_3_score
tab  m4_1_4_score

tab  m17_1_1_score
tab  m17_1_2_score
tab  m17_1_3_score
tab  m17_1_4_score

tab m1_2_1
tab m1_2_2
tab m1_2_3
tab m1_2_4
tab m1_2_5
tab m1_2_6
tab m1_2_7

tab m3_2_1
tab m3_2_2
tab m3_2_3
tab m3_2_4
tab m3_2_5
