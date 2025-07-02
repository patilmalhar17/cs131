#!/bin/bash

read -p "Enter the URL: " url

FILENAME=$(basename "$url")

# Download and unzip the dataset
curl -L "$url" -o "$FILENAME"
unzip -o -q "$FILENAME"

# Ask user for  index numbers of the numerical columns
read -p "Enter numerical columns' index numbers (ex: 1 2 3...): " -a indices

for csv in *.csv; do
# Create a md file for each csv file
    summary="${csv%.csv}_summary.md"
    echo "# Feature Summary for $csv" > "$summary"

    echo -e "\n## Feature Index and Names" >> "$summary"

    # Get the column names from the first line of the CSV and store them in an array
    header=$(head -n 1 "$csv")
    IFS=';' read -ra features <<< "$header"

    for i in "${!features[@]}"; do
        echo "$((i+1)). ${features[i]}" >> "$summary"
    done

    echo -e "\n## Statistics (Numerical Features)" >> "$summary"
    echo "| Index | Feature                | Min  | Max     | Mean    | StdDev    |" >> "$summary"
    echo "|-------|------------------------|------|---------|---------|-----------|" >> "$summary"
    
    for i in "${indices[@]}"; do
        stats=$(awk -F';' -v col="$i" 'NR>1 {
            if ($col ~ /^[+-]?[0-9.]+$/) {
                count++
                sum += $col
                sumsq += $col * $col
                if (min == "" || $col < min) min = $col
                if (max == "" || $col > max) max = $col
            }
        }
        END {
            if (count > 0) {
                mean = sum / count
                stddev = sqrt((sumsq - sum*sum/count)/count)
                printf "%.2f %.2f %.3f %.3f", min, max, mean, stddev
            }
        }' "$csv")

	if [[ ! -z "$stats" ]]; then
            min=$(echo $stats | cut -d' ' -f1)
            max=$(echo $stats | cut -d' ' -f2)
            mean=$(echo $stats | cut -d' ' -f3)
            stddev=$(echo $stats | cut -d' ' -f4)

            printf "| %-5s | %-22s | %-4s | %-7s | %-7s | %-9s |\n" \
                "$i" "${features[$((i-1))]}" "$min" "$max" "$mean" "$stddev" >> "$summary"
        fi
    done

    echo "Summary saved to $summary"
done






