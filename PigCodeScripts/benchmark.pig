/* Created by Ben Hesketh
   Advanced Computer Science
   Masters (mSC) */

newlist = LOAD '/home/ben/datasetCpu.txt' USING PigStorage(',')
as
(manufacturer:chararray, cpuName:chararray, singleScore:int, multiScore:int, cores:int, threads:int, baseClock:float, turboClock:float, type:chararray);
/* Used to seperate columns with data types when a comma is found
   within the text file */

/* Temporary table that will be printed
   within the terminal */
newlist = FOREACH newlist GENERATE manufacturer, cpuName, singleScore, multiScore, cores, threads, baseClock, turboClock, type;

filtered_manu = GROUP newlist BY manufacturer;

average_score = FOREACH filtered_manu GENERATE group, ROUND_TO(AVG(newlist.singleScore),3), ROUND_TO(AVG(newlist.baseClock),3), ROUND_TO(AVG(newlist.turboClock),3) as averageBM;

sorted_score = ORDER average_score BY averageBM desc;

DUMP sorted_score;
