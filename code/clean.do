
cd "E:\Google Drive\chips-analysis\data"
******************************************************************
*IMPORT LATEST DATA - REMEMBER TO CHANGE FILE NAME AND SHEET NAME

import excel "04.01.2020_Zimbabwe_032620.xlsx", sheet(University of Zimbabwe) firstrow clear

save chips_cleaned, replace

************************
*THIS PREPARES DATASET
************************

set more off
***************************************************************
*DROP BLANK FIELDS
*drop A B C D E F Y Z AQ AZ BA BI BJ DV ED EE EQ ER FB FC  GE GF GH GI GJ
***********************************************************************
*CHANGE NUMERIC STRING VARIABLES TO INTEGERS
*the command 'quietly' does it in the background
*quietly destring, replace
*INSERT GLOBAL COMMAND FOR CONVERTING ALL VARIABLE NAMES TO LOWER CASE
*replace=lower
***********************************************************************

save "chips_cleaned.dta", replace
