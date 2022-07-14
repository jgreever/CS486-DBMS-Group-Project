#!/usr/bin/env python3

# project_1.py - CSV to PostgreSQL Database Importer Script
# Author: Justin Greever
# Project: CS486 Project 1 (Group project)(Spring 2022)
# Date: 2022-05-10
#
# Description: This script imports a directory that contains CSV files into a PostgreSQL database.
#              The script will create a table for each CSV file and import the data into the table.
#              The script will also create the column names from the first row of the CSV file.
#
# Usage:
#       Populate your .env file with the following variables:
#           CONN_TYPE: The type of connection to use.
#           DB_USER: The username to use when connecting to the database.
#           DB_PW: The password to use when connecting to the database.
#           DP_IP: The IP address of the database.
#           DB_PORT: The port of the database.
#           DB_NAME: The name of the database.
#
#       Example:
#           CONN_TYPE=postgres
#           DB_USER=postgres
#           DB_PW=password
#           DB_IP=127.0.0.1
#           DB_PORT=5432
#           DB_NAME=postgres
#
#       Run the script with the following command:
#           python3 project_1.py
#
#       You will need to place all the CSV files in a directory called 'data' that is in the
#       same directory as this script.
#
#       Example:
#       <project_directory>
#           ./project_1.py (this script)
#           ./data/
#               |- file1.csv
#               |- file2.csv
#               |- file3.csv
#

# Import modules
import os

import pandas as pd
from dotenv import load_dotenv
from sqlalchemy import create_engine

# Defining global variables for the script to use
engine = 0
cursor = 0


# This is our main function
def main():
    # Connect to the database
    db_connect()
    # Start the process of reading in the data
    # WARNING: This will delete all data in the database as well as create new tables
    # WARNING: Only run this once unless you need to recreate the database.
    # TODO: Uncomment the line below to start the process of reading in the data
    # start_import()
    # Print the first row of each table for testing
    print_tables()


# This function connects to the database
def db_connect():
    # Load .env file, make sure you have entered the correct information in the .env file
    load_dotenv(os.path.join(".env"))
    # Global variables for the database connection
    global engine
    global cursor
    # Get the database username/password from the .env file
    conntype = os.getenv('CONN_TYPE')
    dbuser = os.getenv('DB_USER')
    dbpw = os.getenv('DB_PW')
    dbip = os.getenv('DB_IP')
    dbport = os.getenv('DB_PORT')
    dbname = os.getenv('DB_NAME')
    # Create the connection string
    connection_string = f"{conntype}://{dbuser}:{dbpw}@{dbip}:{dbport}/{dbname}"
    # Connect to the database
    engine = create_engine(connection_string)
    connection = engine.raw_connection()
    cursor = connection.cursor()
    # Set the maximum number of rows to display to None
    pd.set_option('display.max_rows', None)


# This function reads in the filenames and imports the data from each csv file to the database
def read_in_data(file_name):
    # Read in the data from the file
    data = pd.read_csv(file_name)
    # Set the table name to the file name without the extension and lowercase starting with p_
    table_name = 'p_' + file_name.split('.')[0].lower()
    # Insert the data into the table
    data.to_sql(table_name, engine, if_exists='replace')


# This function will start the process of importing the data into the database
def start_import():
    # Get the current working directory
    cwd = os.getcwd()
    # If not in the 'data' directory, change to it
    if cwd != 'data':
        os.chdir('data')
    # Get the list of files in the directory
    files = os.listdir()
    # Loop through the files
    for file in files:
        # If the file is a csv file, read in the data
        if file.endswith('.csv'):
            read_in_data(file)


# This function just prints our data from the database for verification
def print_tables():
    # Get the list of tables in the database that start with 'p_' (the tables we created)
    # Print the table names, then print the first row in each table
    cursor.execute("SELECT \"table_name\" FROM information_schema.tables WHERE \"table_name\" LIKE 'p\_%';")
    tables = cursor.fetchall()
    for table in tables:
        print(f'\n{table[0]}')
        # We are only going to print the first row of each table to verify that the data was imported correctly
        cursor.execute('SELECT * FROM ' + '"' + table[0] + '"' + ' LIMIT 1;')
        print(cursor.fetchall())


# Let's run the main function
if __name__ == '__main__':
    main()
