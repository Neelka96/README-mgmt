# NoSQL Challenge – Eat Safe, Love
`Module 12`  
`EdX(2U) & UT Data Analytics and Visualization Bootcamp`  
`Cohort UTA-VIRT-DATA-PT-11-2024-U-LOLC`  
By: **Neel Kumar Agarwal**

## Table of Contents
1. [Introduction](#introduction)  
2. [Challenge Overview](#challenge-overview)  
3. [Deliverables](#deliverables)  
4. [Setup and Usage](#setup-and-usage)  
   - [Prerequisites](#prerequisites)  
   - [Instructions](#instructions)  
   - [Limitations](#limitations)  
5. [Files and Directory Structure](#files-and-directory-structure)  
6. [Expected Results](#expected-results)  
7. [Analysis & Explanation](#analysis--explanation)  
   - [Database Setup (Part 1)](#database-setup-part-1)  
   - [Update the Database (Part 2)](#update-the-database-part-2)  
   - [Exploratory Analysis (Part 3)](#exploratory-analysis-part-3)  
8. [Citations / References](#citations--references)

---

## Introduction
In this challenge, we explore and analyze a dataset from the UK Food Standards Agency using **MongoDB** (a NoSQL database). We:

1. **Set up** a MongoDB database named `uk_food`.
2. **Import** a large JSON dataset containing establishment information.
3. **Query** and **update** the database with Python using `pymongo`.
4. **Perform Exploratory Analysis** on the data to answer questions such as:
    - Which establishments have a hygiene score of 20?
    - Which are in London with a certain rating?
    - How many have a hygiene score of 0 in each Local Authority area?

The final product is an operational local MongoDB with an updated dataset plus code-based queries and analysis in Jupyter Notebooks.

---

## Challenge Overview  
1. **Part 1**: **Database and Jupyter Notebook Set Up**  
    - Import the `establishments.json` file into MongoDB.  
    - Verify the database creation and data insertion.  

2. **Part 2**: **Update the Database**  
    - Insert a new restaurant ("Penang Flavours") into the collection.  
    - Adjust `BusinessTypeID` for the new entry.  
    - Remove undesired documents (e.g., those with `LocalAuthorityName` = "Dover").  
    - Clean up data types for `latitude`, `longitude`, and `RatingValue`.  

3. **Part 3**: **Exploratory Analysis**  
    - Query for hygiene score = 20.  
    - Query for certain local authorities with rating >= 4.  
    - Find top establishments with rating = 5 near the newly inserted restaurant.  
    - Aggregate documents by `LocalAuthorityName` for those with a hygiene score = 0.  

By the end, we have a **NoSQL** dataset loaded into MongoDB with relevant queries and manipulations performed.

[:arrow_up: Return to TOC](#table-of-contents)  

---

## Deliverables
1. **NoSQL_setup.ipynb**  
    - Executes tasks to connect to MongoDB, create/insert documents, remove specific entries, and adjust data types. Prints results at various points to the cell outputs in Jupyter Notebook.  

2. **NoSQL_analysis.ipynb**  
    - Performs exploratory queries and aggregations.  
    - Prints results to the cell outputs in Jupyter Notebook.  

3. **README.md** (this file)  
    - Summarizes the project, usage instructions, and major findings.  

[:arrow_up: Return to TOC](#table-of-contents)  

---

## Setup and Usage
### Prerequisites
- **Python 3.x**  
- **MongoDB** server installed and running on localhost `port = 27017`.  
- **pymongo** library for Python (`pip install pymongo`).  
- **pandas** Library for Python Data Manipulation (`pip install pandas`).  
- A Jupyter Notebook or equivalent environment to run / view code output.  
- The **establishments.json** file provided by the challenge.  

### Instructions
1. **Install Dependencies**:  
    ```bash  
    pip install pymongo
    ```  

2. **Ensure MongoDB** is installed locally and running 
    - For Linux: `sudo service mongod start`  
    - For Mac: `brew services start mongodb-community@8.0`  
    - For Windows: *No operation should be necessary*
    - Or using MongoDB Compass App  

3. **Clone** this repository via HTTPS/SSH (from [GitHub Link](https://www.github.com/Neelka96/nosql-challenge)).  

4. **Import the data** (as per instructions in the assignment):  
    ```bash
    # Navigate to the Repo Clone Directory
    cd YOUR/PATH/TO/REPO/HERE/nosql-challenge

    # From the directory where your JSON file is located:
    mongoimport --type json -d uk_food -c establishments --drop --jsonArray Resources/establishments.json
    ```  

5. **Run all cells in `NoSQL_setup.ipynb`** to:  
    - Connect to MongoDB.  
    - Verify the database and collection.  
    - Insert a new restaurant.  
    - Perform data cleaning / type casting.  
    - Shows results of validating CRUD throughout Notebook.  

6. **Run all cell in `NoSQL_analysis.ipynb`** for the exploratory queries and aggregation tasks:
    - Identify establishments with hygiene score = 20.  
    - Compare rating values, etc.  
    - Shows the results of exploration throughout Jupyter environment.  

### Limitations
- **Local environment**: The code expects a local MongoDB instance on port 27017. For other setups, update your `MongoClient` connection string.  
- **Large dataset**: The JSON file may contain thousands of documents, so queries or updates can take noticeable time depending on your hardware.  
- **Static dataset**: This challenge uses a static sample of the UK Food dataset (not automatically updated).  

[:arrow_up: Return to TOC](#table-of-contents)  

---

## Directory Structure
```
NoSQL-challenge/
├── Resources/
│   └── establishments.json
│
├──.gitignore
├── NoSQL_analysis.ipynb
├── NoSQL_setup.ipynb
└── README.md
```

[:arrow_up: Return to TOC](#table-of-contents)  

---

## Expected Results
After running **NoSQL_setup.py**:
- A new document for **Penang Flavours** is inserted with the correct `BusinessTypeID`.  
- All entries with `LocalAuthorityName` = "Dover" are removed.  
- Coordinates and `RatingValue` are cast to numeric types.  

After running **NoSQL_analysis.py**:
- You’ll see the number of establishments with a hygiene score = 20, and a sample document printed.  
- You’ll see a list of establishments in “London” with rating >= 4.  
- The top 5 with rating=5 near “Penang Flavours” will be displayed, sorted by hygiene.  
- A final aggregation showing how many establishments in each `LocalAuthorityName` have a hygiene score = 0.  

Use a Jupyter Notebook or any other environment that can load and run these `.py` scripts to view the logs and results.

[:arrow_up: Return to TOC](#table-of-contents)  

---

## Analysis & Explanation

### Database Setup (Part 1)
1. **Importing JSON**: We drop the existing `establishments` collection and load the data from `establishments.json` into `uk_food.establishments`.  
2. **Validation**: We check if the database and collection exist, verifying document counts.

### Update the Database (Part 2)
1. **Insert “Penang Flavours”**: A dictionary object is inserted into the `establishments` collection.  
2. **Adjust Field**: We retrieve the correct `BusinessTypeID` for “Restaurant/Cafe/Canteen” and apply that to the new record.  
3. **Remove Dover**: We remove all documents with `LocalAuthorityName` = “Dover.”  
4. **Cleaning**: We cast `latitude`/`longitude` to `float` (double in Mongo) and convert `RatingValue` to integer (null for certain non-integer values).

### Exploratory Analysis (Part 3)
1. **Hygiene Score == 20**: We locate all documents where `scores.Hygiene` = 20.  
2. **Greater or Equal to 4**: We locate establishments with `LocalAuthorityName` containing “London” and `RatingValue >= 4`.  
3. **Rating=5, sorted by Hygiene** near "Penang Flavours": We find top five within ±0.01 degrees lat/long.  
4. **Aggregate by Hygiene=0**: We group by `LocalAuthorityName` and count how many have `scores.Hygiene`=0, sorted descending.

[:arrow_up: Return to TOC](#table-of-contents)  

---

## Citations / References  
- **EdX/2U**: Provided the dataset and instructions for the “NoSQL Challenge.”  
- **README.md**: Created using OpenAI's [ChatGPT LLM](https://www.chatgpt.com), trained using prior READMEs from project owner and sole contributor's repository [Neel Agarwal (Neelka96)](https://www.github.com/Neelka96), the two deliverables, and the provided rubric given by edX/2U  
- **MongoDB Documentation**: [https://www.mongodb.com/docs/manual/](https://www.mongodb.com/docs/manual/)  
- **pymongo Documentation**: [https://pypi.org/project/pymongo/](https://pypi.org/project/pymongo/)  

[:arrow_up: Return to TOC](#table-of-contents)  

---