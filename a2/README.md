# README.md for Assignment 2



## The bash script file is called: 'datacollector.sh'




## What it does:
- Prompts the user to input a dataset ZIP file
- Downloads and unzips that file
- Prompts the user to input the indices for the numerical columns
- Creates a separate 'summary.md' file for each csv file in the dataset
    - Each 'summary.md' file contains a summary of each column
        - This includes maximum, minimum, mean and standard deviation
    - Also lists the title of each numerical column in a numbered list at the top




## How to use (specifically for wine quality dataset):
- Run the script by typing this command: bash datacollector.sh
- Input this url when prompted: https://archive.ics.uci.edu/static/public/186/wine+quality.zip
- Input the index numbers like this: 1 2 3 4 5 6 7 8 9 10 11 12




## Demo (Output):
Enter the URL: https://archive.ics.uci.edu/static/public/186/wine+quality.zip
  % Total    % Received % Xferd  Average Speed   Time    Time     Time  Current
                                 Dload  Upload   Total   Spent    Left  Speed
100 91353    0 91353    0     0   453k      0 --:--:-- --:--:-- --:--:--  455k
Enter numerical columns' index numbers (ex: 1 2 3...): 1 2 3 4 5 6 7 8 9 10 11 12
Summary saved to `winequality-red_summary.md`
Summary saved to `winequality-white_summary.md`


A summary file is created for each csv file (in this case there are two csv files: for red and white wine)


To check the `winequality-red_summary.md` file just type: `cat winequality-red_summary.md`

This is the output:

# Feature Summary for winequality-red.csv

## Feature Index and Names
1. "fixed acidity"
2. "volatile acidity"
3. "citric acid"
4. "residual sugar"
5. "chlorides"
6. "free sulfur dioxide"
7. "total sulfur dioxide"
8. "density"
9. "pH"
10. "sulphates"
11. "alcohol"
12. "quality"

## Statistics (Numerical Features)
| Index | Feature                | Min  | Max     | Mean    | StdDev    |
|-------|------------------------|------|---------|---------|-----------|
| 1     | "fixed acidity"        | 4.60 | 15.90   | 8.320   | 1.741     |
| 2     | "volatile acidity"     | 0.12 | 1.58    | 0.528   | 0.179     |
| 3     | "citric acid"          | 0.00 | 1.00    | 0.271   | 0.195     |
| 4     | "residual sugar"       | 0.90 | 15.50   | 2.539   | 1.409     |
| 5     | "chlorides"            | 0.01 | 0.61    | 0.087   | 0.047     |
| 6     | "free sulfur dioxide"  | 1.00 | 72.00   | 15.875  | 10.457    |
| 7     | "total sulfur dioxide" | 6.00 | 289.00  | 46.468  | 32.885    |
| 8     | "density"              | 0.99 | 1.00    | 0.997   | 0.002     |
| 9     | "pH"                   | 2.74 | 4.01    | 3.311   | 0.154     |
| 10    | "sulphates"            | 0.33 | 2.00    | 0.658   | 0.169     |
| 11    | "alcohol"              | 8.40 | 14.90   | 10.423  | 1.065     |
| 12    | "quality"              | 3.00 | 8.00    | 5.636   | 0.807     |


