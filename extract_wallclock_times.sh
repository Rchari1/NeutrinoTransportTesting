#!/bin/bash

LIBRARY="LIBRARY"
OUTPUT_FILE="wallclock_times.csv"

# Initialize the output file with headers
echo "EpsA,EpsR,WallClockTime" > $OUTPUT_FILE

# Find all log files in the library directory and extract the wall-clock time
find $LIBRARY -type f -name "simulation_log.txt" | while read LOG_FILE; do
    EpsA=$(grep "Absolute Error Tolerance (EpsA)" "$LOG_FILE" | awk -F": " '{print $2}')
    EpsR=$(grep "Relative Error Tolerance (EpsR)" "$LOG_FILE" | awk -F": " '{print $2}')
    WallClockTime=$(grep "Wall-clock time" "$LOG_FILE" | awk -F": " '{print $2}' | awk '{print $1}')
    
    # Append the extracted values to the output file
    echo "$EpsA,$EpsR,$WallClockTime" >> $OUTPUT_FILE
done

echo "Data extraction complete. Wall-clock times saved to $OUTPUT_FILE."

