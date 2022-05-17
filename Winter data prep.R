library(tidyverse)

##### Read and Prep Data #####
atm160 <- read.csv("~/Downloads/Inclusion_202201_ATM160.csv", stringsAsFactors = FALSE, na.strings = c("", "NA"))
crd141 <- read.csv("~/Downloads/Inclusion_202201_CRD141_001.csv", stringsAsFactors = FALSE, na.strings = c("", "NA"))
ecs150 <- read.csv("~/Downloads/Inclusion_202201_ECS150_001.csv", stringsAsFactors = FALSE, na.strings = c("", "NA"))
eec189L <- read.csv("~/Downloads/Inclusion_202201_EEC189L_A.csv", stringsAsFactors = FALSE, na.strings = c("", "NA"))
fsm122 <- read.csv("~/Downloads/Inclusion_202201_FSM122_001.csv", stringsAsFactors = FALSE, na.strings = c("", "NA"))
nut10 <- read.csv("~/Downloads/Inclusion_202201_NUT010_001.csv", stringsAsFactors = FALSE, na.strings = c("", "NA"))
nut10v <- read.csv("~/Downloads/Inclusion_202201_NUT010V_001.csv", stringsAsFactors = FALSE, na.strings = c("", "NA"))
plp100 <- read.csv("~/Downloads/Inclusion_202201_PLP100_001.csv", stringsAsFactors = FALSE, na.strings = c("", "NA"))
pol152 <- read.csv("~/Downloads/Inclusion_202201_POL152_001.csv", stringsAsFactors = FALSE, na.strings = c("", "NA"))
psc001 <- read.csv("~/Downloads/Inclusion_202201_PSC001_001.csv", stringsAsFactors = FALSE, na.strings = c("", "NA"))
psc100y <- read.csv("~/Downloads/Inclusion_202201_PSC100Y_A.csv", stringsAsFactors = FALSE, na.strings = c("", "NA"))
uwp007_03 <- read.csv("~/Downloads/Inclusion_202201_UWP007_03.csv", stringsAsFactors = FALSE, na.strings = c("", "NA"))
uwp007_11 <- read.csv("~/Downloads/Inclusion_202201_UWP07_11.csv", stringsAsFactors = FALSE, na.strings = c("", "NA"))
wfc050 <- read.csv("~/Downloads/Inclusion_202201_WFC050.csv", stringsAsFactors = FALSE, na.strings = c("", "NA"))

#I think I should be able to remove the first row by running a loop through the actual .csv files on my computer before loading them into R
#make a list of all the dfs to run loop to rename vars
dfs <- list(atm160, crd141, ecs150, eec189L, fsm122, nut10, nut10v, plp100, pol152, psc001, psc100y, uwp007_03, uwp007_11, wfc050)
courses <- c("atm160", "crd141", "ecs150", "eec189L", "fsm122", "nut10", "nut10v", "plp100", "pol152", "psc001", "psc100y", "uwp007_03", "uwp007_11", "wfc050")
names(dfs) <- courses
##### varnames #####
varnames <- c('Start Date',	'End Date',	'Response Type',	'IP Address',	'Progress',	'Duration (in seconds)',
'Finished',	'Recorded Date',	'Response ID',	'Recipient Last Name',	'Recipient First Name',	'Recipient Email',
'External Data Reference',	'LocationLatitude - Location Latitude',	'LocationLongitude - Location Longitude',
'DistributionChannel - Distribution Channel',	'UserLanguage - User Language',	'consent',	'Inf1a ',	'Inf1b ',
'Mem1 ',	'Mem2 ',	'Mem3 ',	'Sup1 ',	'Sup2 ',	'Eng1 ',	'Eng3 ',	'Mem4 ',	'Sup3 ',	'Uni1 ',	'Sup4 ',
'Mem5 ',	'Eng5 ',	'Mem6 ',	'Inf2 ',	'Mem8 ',	'Uni2 ',	'Eng2 ',	'Mem7 ',	'Sup5 ',	'Inf3 ',	'Mem9 ',
'Sup6 ',	'Sup7 ',	'Inf4a ',	'Inf4b ',	'Uni6 ',	'Eng4 ',	'Sup8 ',	'Uni3 ',	'Uni5 ',	'Inf5 ',	'Uni4 ',
'Sup9 ',	'Inf6 ',	'Inf7 ',	'Eth_AfAmBl',	'Eth_AmIn',	'Eth_Asian',	'Eth_Hisp',	'Eth_LatChi',	'Eth_White',
'Eth_Other',	'Eth_NotState',	'Eth_OtherText',	'Lang_ComfortEngl',	'Dis_ID',	'Dis_Barrier',	'Dem_FG',	'Dem_GovAsst',
'Dem_Trans',	'Gen_Agender',	'Gen_Gqueer',	'Gen_Male',	'Gen_NonBin',	'Gen_Unsure',	'Gen_TwoSpirit',
'Gen_Female',	'Gen_Other',	'Gen_NotState',	'Gen_OtherText',	'SexOr_Aromantic',	'SexOr_Asexual',
'SexOr_Bisexual',	'SexOr_Fluid',	'SexOr_Gay',	'SexOr_Lesbian',	'SexOr_Pansex',	'SexOr_Queer',	'SexOr_Unsure',
'SexOr_SamGen',	'SexOr_Straight',	'SexOr_Other',	'SexOr_NotState',	'SexOr_OtherText',	'OthID_Athlete',
'OthID_Caregiver',	'OthID_IntlStu',	'OthID_Married',	'OthID_Greek',	'OthID_TransferStu',	'OthID_Age25up',
'OthID_Age17below',	'OthID_Other',	'OthID_NotState',	'OthID_OtherText',	'Def_Information',	'Def_Support',
'Def_Engage',	'Def_Membership',	'Def_Unique',	'Comments',	'username',	'Course',
'FL_6_DO_Block1 - FL_6 - Block Randomizer - Display Order - Block1','FL_6_DO_Block3 - FL_6 - Block Randomizer - Display Order - Block3',
'FL_6_DO_Block2 - FL_6 - Block Randomizer - Display Order - Block2',	'FL_6_DO_Block4 - FL_6 - Block Randomizer - Display Order - Block4',
'Block1_DO_Mem2 - Block 1 - Display Order - Mem2',	'Block1_DO_Mem1 - Block 1 - Display Order - Mem1',
'Block1_DO_Inf1b - Block 1 - Display Order - Inf1b',	'Block1_DO_Mem4 - Block 1 - Display Order - Mem4',
'Block1_DO_QID117 - Block 1 - Display Order - QID117',	'Block1_DO_Inf1a - Block 1 - Display Order - Inf1a',
'Block1_DO_Eng3 - Block 1 - Display Order - Eng3',	'Block1_DO_Sup2 - Block 1 - Display Order - Sup2',
'Block1_DO_Sup1 - Block 1 - Display Order - Sup1',	'Block1_DO_Eng1 - Block 1 - Display Order - Eng1',
'Block1_DO_Mem3 - Block 1 - Display Order - Mem3',	'Block3_DO_Sup4 - Block 3 - Display Order - Sup4',
'Block3_DO_Mem5 - Block 3 - Display Order - Mem5',	'Block3_DO_Eng5 - Block 3 - Display Order - Eng5',
'Block3_DO_Mem6 - Block 3 - Display Order - Mem6',	'Block3_DO_Q123 - Block 3 - Display Order - Q123',
'Block3_DO_Sup3 - Block 3 - Display Order - Sup3',	'Block3_DO_Uni1 - Block 3 - Display Order - Uni1',
'Block3_DO_Inf2 - Block 3 - Display Order - Inf2',	'Block3_DO_Mem8 - Block 3 - Display Order - Mem8',
'Block3_DO_Uni2 - Block 3 - Display Order - Uni2',	'Block2_DO_QID119 - Block 2 - Display Order - QID119',
'Block2_DO_Sup6 - Block 2 - Display Order - Sup6',	'Block2_DO_Inf4b - Block 2 - Display Order - Inf4b',
'Block2_DO_Sup7 - Block 2 - Display Order - Sup7',	'Block2_DO_Eng2 - Block 2 - Display Order - Eng2',
'Block2_DO_Inf4a - Block 2 - Display Order - Inf4a',	'Block2_DO_Inf3 - Block 2 - Display Order - Inf3',
'Block2_DO_Mem9 - Block 2 - Display Order - Mem9',	'Block2_DO_Sup5 - Block 2 - Display Order - Sup5',
'Block2_DO_Mem7 - Block 2 - Display Order - Mem7',	'Block2_DO_Uni6 - Block 2 - Display Order - Uni6',
'Block4_DO_Inf7 - Block 4 - Display Order - Inf7',	'Block4_DO_Sup9 - Block 4 - Display Order - Sup9',
'Block4_DO_Inf5 - Block 4 - Display Order - Inf5',	'Block4_DO_Uni4 - Block 4 - Display Order - Uni4',
'Block4_DO_Q143 - Block 4 - Display Order - Q143',	'Block4_DO_Eng4 - Block 4 - Display Order - Eng4',
'Block4_DO_Sup8 - Block 4 - Display Order - Sup8',	'Block4_DO_Uni3 - Block 4 - Display Order - Uni3',
'Block4_DO_Uni5 - Block 4 - Display Order - Uni5',	'Block4_DO_Inf6 - Block 4 - Display Order - Inf6')
#####
#create for-loop to remove first row from each df, rename vars in dfs (make them the same so we can rbind them later), and populate course var with course name
for (i in 1:length(dfs)){
  dfs[[i]] <- dfs[[i]][-1,]
  names(dfs[[i]]) <- varnames
  dfs[[i]][,"Course"] <- courses[[i]]
}

#send dfs back to environment (Sending back to .GlobalEnv was said to be "dangerous" on stack exchange - why??)
list2env(dfs, .GlobalEnv)

#create empty dataframe with varnames as names
dat <- atm160[FALSE,] #this keeps the same columns but removes the rows
names(dat) <- varnames #assign correct varnames

#rbind dfs together - can't do that until all the names are the same (i.e., make sure the course name isn't in any vars)
for (i in 1:length(dfs)){
  dat <- rbind(dat, dfs[[i]])
}

#found more data
fall <- read.csv("~/Box Sync/CEE Educational Analytics/Classroom_Inclusion_Survey/survey/Pilot #2/RawResponses/InclPilot_202110_ALLresponsesRAW.csv", stringsAsFactors = FALSE, na.strings = c("NA", ""))

fall <- fall[,-1]

#adding var: CourseSection to new data
dat$CourseSection <- NA

##### varnames #####
varnames <- c('Start Date',	'End Date',	'Response Type',	'IP Address',	'Progress',	'Duration (in seconds)',
              'Finished',	'Recorded Date',	'Response ID',	'Recipient Last Name',	'Recipient First Name',	'Recipient Email',
              'External Data Reference',	'LocationLatitude - Location Latitude',	'LocationLongitude - Location Longitude',
              'DistributionChannel - Distribution Channel',	'UserLanguage - User Language',	'consent',	'Inf1a ',	'Inf1b ',
              'Mem1 ',	'Mem2 ',	'Mem3 ',	'Sup1 ',	'Sup2 ',	'Eng1 ',	'Eng3 ',	'Mem4 ',	'Sup3 ',	'Uni1 ',	'Sup4 ',
              'Mem5 ',	'Eng5 ',	'Mem6 ',	'Inf2 ',	'Mem8 ',	'Uni2 ',	'Eng2 ',	'Mem7 ',	'Sup5 ',	'Inf3 ',	'Mem9 ',
              'Sup6 ',	'Sup7 ',	'Inf4a ',	'Inf4b ',	'Uni6 ',	'Eng4 ',	'Sup8 ',	'Uni3 ',	'Uni5 ',	'Inf5 ',	'Uni4 ',
              'Sup9 ',	'Inf6 ',	'Inf7 ',	'Eth_AfAmBl',	'Eth_AmIn',	'Eth_Asian',	'Eth_Hisp',	'Eth_LatChi',	'Eth_White',
              'Eth_Other',	'Eth_NotState',	'Eth_OtherText',	'Lang_ComfortEngl',	'Dis_ID',	'Dis_Barrier',	'Dem_FG',	'Dem_GovAsst',
              'Dem_Trans',	'Gen_Agender',	'Gen_Gqueer',	'Gen_Male',	'Gen_NonBin',	'Gen_Unsure',	'Gen_TwoSpirit',
              'Gen_Female',	'Gen_Other',	'Gen_NotState',	'Gen_OtherText',	'SexOr_Aromantic',	'SexOr_Asexual',
              'SexOr_Bisexual',	'SexOr_Fluid',	'SexOr_Gay',	'SexOr_Lesbian',	'SexOr_Pansex',	'SexOr_Queer',	'SexOr_Unsure',
              'SexOr_SamGen',	'SexOr_Straight',	'SexOr_Other',	'SexOr_NotState',	'SexOr_OtherText',	'OthID_Athlete',
              'OthID_Caregiver',	'OthID_IntlStu',	'OthID_Married',	'OthID_Greek',	'OthID_TransferStu',	'OthID_Age25up',
              'OthID_Age17below',	'OthID_Other',	'OthID_NotState',	'OthID_OtherText',	'Def_Information',	'Def_Support',
              'Def_Engage',	'Def_Membership',	'Def_Unique',	'Comments',	'username',	'Course',
              'FL_6_DO_Block1 - FL_6 - Block Randomizer - Display Order - Block1','FL_6_DO_Block3 - FL_6 - Block Randomizer - Display Order - Block3',
              'FL_6_DO_Block2 - FL_6 - Block Randomizer - Display Order - Block2',	'FL_6_DO_Block4 - FL_6 - Block Randomizer - Display Order - Block4',
              'Block1_DO_Mem2 - Block 1 - Display Order - Mem2',	'Block1_DO_Mem1 - Block 1 - Display Order - Mem1',
              'Block1_DO_Inf1b - Block 1 - Display Order - Inf1b',	'Block1_DO_Mem4 - Block 1 - Display Order - Mem4',
              'Block1_DO_QID117 - Block 1 - Display Order - QID117',	'Block1_DO_Inf1a - Block 1 - Display Order - Inf1a',
              'Block1_DO_Eng3 - Block 1 - Display Order - Eng3',	'Block1_DO_Sup2 - Block 1 - Display Order - Sup2',
              'Block1_DO_Sup1 - Block 1 - Display Order - Sup1',	'Block1_DO_Eng1 - Block 1 - Display Order - Eng1',
              'Block1_DO_Mem3 - Block 1 - Display Order - Mem3',	'Block3_DO_Sup4 - Block 3 - Display Order - Sup4',
              'Block3_DO_Mem5 - Block 3 - Display Order - Mem5',	'Block3_DO_Eng5 - Block 3 - Display Order - Eng5',
              'Block3_DO_Mem6 - Block 3 - Display Order - Mem6',	'Block3_DO_Q123 - Block 3 - Display Order - Q123',
              'Block3_DO_Sup3 - Block 3 - Display Order - Sup3',	'Block3_DO_Uni1 - Block 3 - Display Order - Uni1',
              'Block3_DO_Inf2 - Block 3 - Display Order - Inf2',	'Block3_DO_Mem8 - Block 3 - Display Order - Mem8',
              'Block3_DO_Uni2 - Block 3 - Display Order - Uni2',	'Block2_DO_QID119 - Block 2 - Display Order - QID119',
              'Block2_DO_Sup6 - Block 2 - Display Order - Sup6',	'Block2_DO_Inf4b - Block 2 - Display Order - Inf4b',
              'Block2_DO_Sup7 - Block 2 - Display Order - Sup7',	'Block2_DO_Eng2 - Block 2 - Display Order - Eng2',
              'Block2_DO_Inf4a - Block 2 - Display Order - Inf4a',	'Block2_DO_Inf3 - Block 2 - Display Order - Inf3',
              'Block2_DO_Mem9 - Block 2 - Display Order - Mem9',	'Block2_DO_Sup5 - Block 2 - Display Order - Sup5',
              'Block2_DO_Mem7 - Block 2 - Display Order - Mem7',	'Block2_DO_Uni6 - Block 2 - Display Order - Uni6',
              'Block4_DO_Inf7 - Block 4 - Display Order - Inf7',	'Block4_DO_Sup9 - Block 4 - Display Order - Sup9',
              'Block4_DO_Inf5 - Block 4 - Display Order - Inf5',	'Block4_DO_Uni4 - Block 4 - Display Order - Uni4',
              'Block4_DO_Q143 - Block 4 - Display Order - Q143',	'Block4_DO_Eng4 - Block 4 - Display Order - Eng4',
              'Block4_DO_Sup8 - Block 4 - Display Order - Sup8',	'Block4_DO_Uni3 - Block 4 - Display Order - Uni3',
              'Block4_DO_Uni5 - Block 4 - Display Order - Uni5',	'Block4_DO_Inf6 - Block 4 - Display Order - Inf6',
              'CourseSection')
##### 
#making variable names for fall data set the same as winter
names(fall) <- varnames
#rbind new data to dat
dat <- rbind(dat, fall)

#write raw data to csv
write.csv(dat, "~/Box Sync/CEE Educational Analytics/Classroom_Inclusion_Survey/survey/Pilot #2/ALLdatRAW.csv", row.names = FALSE)

