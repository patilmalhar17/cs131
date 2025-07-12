# grader.awk

# Finding average function
function average(total_score) {
    return total_score / 3
}

BEGIN {
	FS = ","; # Field separator is a comma
}

{
	if (NR == 1){
		next; #Skips the first line of the file since it doesn't store data
	}

	# Student name is second variable, the total score is the sum of the remaining three
	name = $2
	total_score  = $3 + $4 + $5
	avg = average(total_score)

	# Store the total score in array called "grades", store average score in "avgs"
	grades[name] = total_score
	avgs[name] = avg

	# Check whether student passes and store it in an array
	if (avg >= 70){
		status[name] = "Pass"
	} else {
		status[name] = "Fail"
	}
	# Checks whether student got highest score or if we are on the first line (second line of file) because that is automatically the highest score
	if (total_score > max || NR == 2){
		max = total_score
		best_student = name
	}

	# Checks whether student got lowest score or if we are on the first line (second line of file) because that is automatically the lowest score
	if (total_score < min || NR == 2){
		min = total_score
		worst_student = name
	}
}

END {
	print "Student Summary"
	print ""
	# Prints summary for each student followed by two blank lines
	for (student in grades){
		print "Name: " student
		print "Total: " grades[student]
		print "Average: " avgs[student]
		print "Status: " status[student]
		print ""
		print ""
	}

	# Printing top and lowest scoring student with their total score
	print "Top Scoring Student: " best_student " who got " max
	print "Lowest Scoring Student: " worst_student " who got " min
}
