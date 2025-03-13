# Pandas Challenge - PyCitySchools  
`Module 4`  
`EdX(2U) & UT Data Analytics and Visualization Bootcamp`  
`Cohort UTA-VIRT-DATA-PT-11-2024-U-LOLC`  
`By Neel Kumar Agarwal`  

## Table of Contents  
1. [Introduction](#introduction)  
2. [Challenge Overview](#challenge-overview)  
3. [Variables/Breakdowns](#variablesbreakdowns)  
    - [Relevant Variables](#relevant-variables)  
    - [Summary Breakdowns](#summary-breakdowns)  
4. [Setup and Usage](#setup-and-usage)  
    - [Prerequisites](#prerequisites)  
    - [Instructions](#instructions)  
    - [Limitations](#limitations)  
5. [Files and Directory Structure](#files-and-directory-structure)  
6. [Expected Results](#expected-results)  
7. [Final Analysis](#final-analysis)  
    - [Type & Size of School](#type--size-of-school)
    - [Reading & Math Scores](#reading--math-scores)


## Introduction  
You are the new Chief Data Scientist for your city's school district. In this  
capacity, you'll be helping the school board and mayor make strategic decisions  
regarding future school budgets and priorities.  

As a first task, you've been asked to analyze the district-wide standardized test  
results. You'll be given access to every student's math and reading scores, as  
well as various information on the schools they attend. Your task is to aggregate  
the data to showcase obvious trends in school performance.  

## Challenge Overview  
The PyCitySchools .ipynb is a Python-interactive Jupyter notebook that aims to  
find global and local trends of district, school, and student standardized testing  
scores. My job was to take data presented in cleaned CSV file format and extract  
relevant information from it to produce snapshots of different variants and their  
relationally aggregated data.  

PyCitySchools runs using a conda based local python environment. Python version  
used is `3.12.7` running with dependencies of Pandas and pathlib. Two clean CSV  
files, one containing school data and the other student data, were imported and  
read into 2 Pandas DataFrame objects. Minor data validation was performed but not  
needed. The two DataFrames (DFs) were then merged on their shared factor which was  
the school name they contained. A complete DF of both CSV files was then usable  
after tidying. This complete DF was used in the entirety of the Jupyter Notebook to  
create new DFs that held concise summary information of each comparison. After each  
comparison is made an image of it is saved to `PyCitySchools/snapshots/<image-name>`.  

The task at hand is to compare how successful students and schools are, dependently  
and independently, at standardized tests for reading and mathematics. Instances in  
which both tests are passed are also found taken into account.  

> [!NOTE]
> No citations are needed for this project save for the code, data, and assigned  
> conditions given by edX (2U) given for use of learning in this bootcamp.  

## Variables/Breakdowns  
### Relevant Variables:  
```
- School_Name  
    - Type (District/Charter)
    - Size
    - Budget
- Student_Name  
    - Grade (9-12)
    - Reading Score
    - Math Score
```
### Summary Breakdowns:  
```
|-*-| District Summary
|-*-| School Summary
|-*-| Highest-Performing School (by % Overall Passing)
|-*-| Bottom-Performing Schools (by % Overall Passing)
|-*-| Math Scores by Grade
|-*-| Reading Scores by Grade
|-*-| Scores by School Spending
|-*-| Scores by School Size
|-*-| Scores by School Type
```

## Setup and Usage  
### Prerequisites  
- Python 3.x  
- Standard libraries: `pandas` and `pathlib` (included with Python)  
- Non-standard library: `dataframe_image`  
- IDE that supports Jupyter Notebooks with Python  

### Instructions  
1. Clone this repository.  
2. Ensure IDE is up to date and running.  
3. Please run the following code in your IDE if the dependencies aren't found:  
    ```
    pip install pandas
    pip install pathlib
    pip install dataframe-image
    ```
4. Ensure the input CSV files are in the `Resources` folder.  
5. Open `main.ipynb` in your IDE and run all cells.  
6. Results will print throughout the Jupyter Interactive Notebook  
7. Results are then exported in .png format in new `snapshots` directory  
> [!TIP]  
> Collapsing of various regions or use of `OUTLINE` in VSCode can  
> speed up exploration of the Notebook.  
> If examining using .png images, please refer to the image file  
> name to find the comparison being used to calculate the DataFrame.  

### Limitations  
- [ ] Results are qualitative not quantitative  
- [ ] Exported images lack complete titling for easy comprehension in any space  
- [ ] Time frame for DataFrame is a static moment instead of a dynamic range  


## Files and Directory Structure  
```  
pandas-challenge/
|
|— PyCitySchools/
|   |— Resources/
|   |   — schools_complete.csv
|   |   - students_complete.csv
|   |— main.ipynb
```  
This structure ensures all inputs are organized within their respective folders.  
Outputs will be created without additional directory structuring  


## Expected Results  
1. Updated Jupyter Notebook DataFrames and printed DataFrames
2. New directory structure for `pandas-challenge/`:
```
pandas-challenge/
|
|— PyCitySchools/
|   |— Resources/
|   |   — schools_complete.csv
|   |   - students_complete.csv
|   |- snapshots/
|   |   - bottomPerforming_byOverallPassing.png
|   |   - district_snapshot.png
|   |   - mathScores_byGrade.png
|   |   - perSchool_summary.png
|   |   - readScores_byGrade.png
|   |   - scores_bySchoolType.png
|   |   - scores_bySize.png
|   |   - scores_bySpending.png
|   |   - topPerforming_byOverallPassing.png
|   |— main.ipynb (updated)
```
New directory paths indicate proper running and exporting of DataFrames.

---

## Final Analysis:    
### Type & Size of School:  
- **<ins>Intro:</ins>**  
    It's immediately apparent from the `Highest-Performing Schools (% Overall Passing)`  
    and `Lowest-Performing Schools (% Overall Passing)` or even better the  
    `Scores by School Type` that there is a major difference between charter  
    and district type schools based off of their `% Overall Passing`.  

- **<ins>Observable Quantity:</ins>**  
    In all scenarios, charter type schools had better testing  
    scores than district type schools by a drastic margin. On average the  
    percent difference of students passing both reading and math exams from  
    charter and district type schools was 36.76%.  

- **<ins>Important Relationships:</ins>**  
    Charter and district school observations are also  
    recognizable from their budgets or sizing without the school type when  
    binned and categorized. This is because the budgets for each school is  
    proportional to the size of the school and the way their resources are allocated.  
    Generally, charter schools may spend less per student while districts spend more  
    per student, but the budget is not strictly indicative of how well students did.  
    It is actually more representative of the schools themselves and their need for  
    more resources as a larger school that serves a wider demographic.  

- **<ins>Main Factors:</ins>**  
    All charter schools, except one, are classified as `Small (<1000)`  
    or `Medium (1000-2000)` sized schools, while every single district school is  
    `Large (2000-5000)`. Ignoring the school type completely, the data in  
    `Scores by School Size` shows that the rates of success of large size schools  
    are almost identical the rate of success of district type schools, and the  
    rates of success of medium and small sized schools are both approximately  
    90% (near to the high level of success seen in charter schools). This data by  
    itself can suggest that, regardless of the budget or type of the school,  
    schools that have more students have difficulty maintaining high test scores  
    with all students.  

- **<ins>Implied Story:</ins>**  
    Taking the type of school into account again, the aforementioned  
    difficulty in raising/maintaining test scores could be for a plethora of reasons  
    some of which are outside the control of the school. For example, which  
    students are assigned to which school zones, whether some of their budget per  
    students has to be allocated to additional social services that aren't generally  
    required of charter schools, and how many students are assigned to each classroom.  
    The way the size of a school changes the performance of each individual student isn't  
    always important but it seems that once it reaches a certain number the success  
    rate begins to drop, especially in mathematics.  

- **<ins>Summary Story:</ins>**  
    The larger the school is the higher the chance is of a student not  
    receiving adequate resources to help achieve passing test scores. Additionally, within  
    this School District, charter and district type schools are almost exclusively of a  
    smaller and larger size respectively.  


### Reading & Math Scores:  
- **<ins>Intro:</ins>**  
    While there isn't an obvious correlation between them, the snapshots of  
    `Reading Scores by Grade` and `Math Scores by Grade` do shed light on how difficult  
    students find the tests depending on their grade. These snapshots are helpful but a  
    little limited because it only shows how difficult random samples of students did in  
    each grade, and not how difficult a student found the tests in each of the grades.  

- **<ins>Observable Quantity:</ins>**  
    While reading and math scores on average don't deviate too  
    strongly from each other, math scores do vary the most out of the two, especially in  
    relation to other variables in question. In terms of impact, math scores make the  
    largest ones for the `% Overall Passing` in every consecutive DataFrame. The quantitative  
    data shows:
    ```
    Read Scores by Grade Numerical Summary (Averages for 9th-12th):
        Mean = 82.53326469678984
        Max = 84.36234496688002
        Min = 80.49302138528849
        Diff = (3.86932358159153)
        Std Dev = 1.5707706608878393

    Math Scores by Grade Numerical Summary (Averages for 9th-12th):
        Mean = 80.4325622269647
        Max = 84.28450314388449
        Min = 76.22184046310876
        Diff = (8.06266268077573)
        Std Dev = 3.4041960121066586
    ```
    These values provide truth to the prior and following statements in multiple ways.  
    Primarily, the standard deviation of the math scores by grade is more than twice that  
    of the reading scores by grade, which indicates that the spread of the math scores is  
    more than twice that of the reading score by grade. Lastly, the difference between  
    maximums and minimums follows this trend and shows that the scores at the tail ends of  
    the spread are even further apart with the minimum and maximum of the math scores being  
    lower than that of their respective reading scores.  

- **<ins>Important Relationships:</ins>**  
    When the metric of pass/fail at a score of `70.00` is  
    brought into the picture, the difference between a score of `75` and `80` is weighted  
    heavier than that of `85` and `95`. Math scores in particular reflect this property  
    whether it's in regards to math scores at different schools or reading scores. What's  
    also interesting about this district is the lack of any schools that show improvement in  
    their scores from one grade to the next. Students in grades 9th through 12th consistently  
    score the same throughout their school, meaning the scores are completely independent of  
    grades, but even more depedent on the schools.  

- **<ins>Main Factors:</ins>**  
    It's stated within [Type & Size of School](#type--size-of-school) that the type and size were  
    deterministic of each other (intertwined as variables), and size is what essentially  
    impacted the `% Overall Passing` values the most as it also impacts all the other factors  
    that are contributing to student test score. However, with this new lensing of the data,  
    we can also see that there is a high consistency of scores throughout each school for each  
    subject, independent of the grades, `9th, 10th, 11th, 12th`. A lack of change is not  
    inherently a negative feature, but from this perspective the scores that are nearing the  
    pass/fail limit must first be improved before overall maintenance can be considered.  
    Consistency, however, within this limited time frame of only one entry for one student,  
    is also an indicator of stabilization. Should more data be brought into the fold, a measurement  
    of how much a student is improving or declining could be added and used to uncover more information.  

- **<ins>Implied Story:</ins>**  
    The story that becomes clearer is of how schools are unable to help the students that are  
    struggling more in math even as they progress throughout the  school. Schools that have the  
    lowest math scores are incredibly indicative of schools with the lowest `% Overall Passing`.  
    In general, math tends to have a less comprehensive understanding by all demographics of people  
    and for all extensive purposes can be considered harder at times, and is most likely why schools  
    that struggle with resource allocation for larger class sizes would struggle even more with teaching  
    a difficult subject to a wider demographic of people.  

- **<ins>Summary Story:</ins>**  
    Math is already a difficult subject, but the data suggests that schools struggle with teaching students  
    regardless of resource allocation, however those with less resources per student will struggle even more  
    and produce worse test results overall. It's very likely that a worse a student is doing in math, the less  
    time they'll be able to produce quality results for reading as well.