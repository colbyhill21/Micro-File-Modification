# Time Stamp Cleaner
This script was created to reformat any data file that leads with timestamp into just HH:MM:SS formatting. I created it because I had a large data points which included a timestamp followed by accelerometer and gyroscopic data. However, when I needed to isolate just the timestamps for analysis, I created this script to make that process much easier.

# How to run
First make the script executable. Then when calling it, pass in two parameters:
1. The name of the file to read the data from (which contains the time stamps)
2. The name of the new file where the output will go.
