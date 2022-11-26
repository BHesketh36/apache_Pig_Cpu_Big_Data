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

group_manufacturer = GROUP newlist by (manufacturer);

DUMP group_manufacturer;