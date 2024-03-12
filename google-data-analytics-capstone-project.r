{
 "cells": [
  {
   "cell_type": "code",
   "execution_count": 1,
   "id": "eb00da4b",
   "metadata": {
    "_cell_guid": "5f56cba9-6e37-4b31-97b6-229c1d001b50",
    "_execution_state": "idle",
    "_uuid": "f2caaa25-6cc0-48b5-b74d-0ef5ab2fe521",
    "collapsed": false,
    "execution": {
     "iopub.execute_input": "2024-03-12T03:02:07.333913Z",
     "iopub.status.busy": "2024-03-12T03:02:07.331284Z",
     "iopub.status.idle": "2024-03-12T03:02:08.724472Z",
     "shell.execute_reply": "2024-03-12T03:02:08.722549Z"
    },
    "jupyter": {
     "outputs_hidden": false
    },
    "papermill": {
     "duration": 1.412982,
     "end_time": "2024-03-12T03:02:08.727103",
     "exception": false,
     "start_time": "2024-03-12T03:02:07.314121",
     "status": "completed"
    },
    "tags": []
   },
   "outputs": [
    {
     "name": "stderr",
     "output_type": "stream",
     "text": [
      "── \u001b[1mAttaching core tidyverse packages\u001b[22m ──────────────────────── tidyverse 2.0.0 ──\n",
      "\u001b[32m✔\u001b[39m \u001b[34mdplyr    \u001b[39m 1.1.4     \u001b[32m✔\u001b[39m \u001b[34mreadr    \u001b[39m 2.1.4\n",
      "\u001b[32m✔\u001b[39m \u001b[34mforcats  \u001b[39m 1.0.0     \u001b[32m✔\u001b[39m \u001b[34mstringr  \u001b[39m 1.5.1\n",
      "\u001b[32m✔\u001b[39m \u001b[34mggplot2  \u001b[39m 3.4.4     \u001b[32m✔\u001b[39m \u001b[34mtibble   \u001b[39m 3.2.1\n",
      "\u001b[32m✔\u001b[39m \u001b[34mlubridate\u001b[39m 1.9.3     \u001b[32m✔\u001b[39m \u001b[34mtidyr    \u001b[39m 1.3.0\n",
      "\u001b[32m✔\u001b[39m \u001b[34mpurrr    \u001b[39m 1.0.2     \n",
      "── \u001b[1mConflicts\u001b[22m ────────────────────────────────────────── tidyverse_conflicts() ──\n",
      "\u001b[31m✖\u001b[39m \u001b[34mdplyr\u001b[39m::\u001b[32mfilter()\u001b[39m masks \u001b[34mstats\u001b[39m::filter()\n",
      "\u001b[31m✖\u001b[39m \u001b[34mdplyr\u001b[39m::\u001b[32mlag()\u001b[39m    masks \u001b[34mstats\u001b[39m::lag()\n",
      "\u001b[36mℹ\u001b[39m Use the conflicted package (\u001b[3m\u001b[34m<http://conflicted.r-lib.org/>\u001b[39m\u001b[23m) to force all conflicts to become errors\n"
     ]
    },
    {
     "data": {
      "text/html": [
       "'divvy-datasets'"
      ],
      "text/latex": [
       "'divvy-datasets'"
      ],
      "text/markdown": [
       "'divvy-datasets'"
      ],
      "text/plain": [
       "[1] \"divvy-datasets\""
      ]
     },
     "metadata": {},
     "output_type": "display_data"
    }
   ],
   "source": [
    "# This R environment comes with many helpful analytics packages installed\n",
    "# It is defined by the kaggle/rstats Docker image: https://github.com/kaggle/docker-rstats\n",
    "# For example, here's a helpful package to load\n",
    "\n",
    "library(tidyverse) # metapackage of all tidyverse packages\n",
    "\n",
    "# Input data files are available in the read-only \"../input/\" directory\n",
    "# For example, running this (by clicking run or pressing Shift+Enter) will list all files under the input directory\n",
    "\n",
    "list.files(path = \"../input\")\n",
    "\n",
    "# You can write up to 20GB to the current directory (/kaggle/working/) that gets preserved as output when you create a version using \"Save & Run All\" \n",
    "# You can also write temporary files to /kaggle/temp/, but they won't be saved outside of the current session"
   ]
  },
  {
   "cell_type": "markdown",
   "id": "c80029a6",
   "metadata": {
    "_cell_guid": "b516acb0-e9b9-4b86-a6f2-7699ad524a2f",
    "_uuid": "4dff2e8e-39d8-49a8-80b2-0ea314b0c517",
    "papermill": {
     "duration": 0.013996,
     "end_time": "2024-03-12T03:02:08.756164",
     "exception": false,
     "start_time": "2024-03-12T03:02:08.742168",
     "status": "completed"
    },
    "tags": []
   },
   "source": [
    "# Introduction\n",
    "\n",
    "Cyclistic is a fictional bike-sharing company located in Chicago. In this scenario I am a junior data analyst working for the Marketing team at Cyclistic. One of the key stakeholders believes that the company's future success depends on maximizing the number of annual memberships. My team's goal is to understand how casual riders and annual members use Cyclistic differently. My team will develop a new marketing startegy to convert casual riders into annual members. This will be done upon approval of my recommendations for the company which should be backed up with compelling data insights and professional data visualizations."
   ]
  },
  {
   "cell_type": "markdown",
   "id": "0c8c1685",
   "metadata": {
    "_cell_guid": "aa1d2aef-5317-4e26-babd-dd45cd0cbf2e",
    "_uuid": "007f9144-2cc5-4091-b0d2-e3ae3e302831",
    "papermill": {
     "duration": 0.01457,
     "end_time": "2024-03-12T03:02:08.785887",
     "exception": false,
     "start_time": "2024-03-12T03:02:08.771317",
     "status": "completed"
    },
    "tags": []
   },
   "source": [
    "# Step 1: Ask\n",
    "Key tasks:\n",
    "\n",
    "**1.Identify the business task**\n",
    "\n",
    "In order to achieve a set clear goal of designing a new marketing strategy, first of all I and my team need to better understand how annual members and casual riders differ, why casual riders would buy a membership, and how digital media could affect their marketing tactics.\n",
    "\n",
    "**2.Consider key stakeholders**\n",
    "\n",
    "The main stakeholders are: Lily Moreno, the marketing director; Cyclistic marketing analytics team,responsible for collecting, analyzing, and reporting data that helps guide Cyclistic marketing strategy; and Cyclistic executive team, who will decide whether to approve the recommended marketing program."
   ]
  },
  {
   "cell_type": "markdown",
   "id": "dc57d747",
   "metadata": {
    "_cell_guid": "92f49a99-8117-4719-ab0d-68daa22623fa",
    "_uuid": "34463a7c-0c41-4257-959c-c4a9dbfd4a5c",
    "papermill": {
     "duration": 0.015349,
     "end_time": "2024-03-12T03:02:08.817204",
     "exception": false,
     "start_time": "2024-03-12T03:02:08.801855",
     "status": "completed"
    },
    "tags": []
   },
   "source": [
    "# Step 2: Prepare\n",
    "\n",
    "Key tasks:\n",
    "\n",
    "**1. Download data and store it appropriately**\n",
    "\n",
    "Historical trip data to be analyzed is downloaded from [here](https://divvy-tripdata.s3.amazonaws.com/index.html) and stored locally in my Desktop. The selected range includes data from Divvy_Trips_2019_Q2 to Divvy_Trips_2020_Q1. (Note: The datasets have a different name because Cyclistic is a fictional company. For the purposes of this case study, the datasets are appropriate. The data has been made available by Motivate International Inc. under [this](https://divvybikes.com/data-license-agreement) license.)\n",
    "\n",
    "**2. Identify how it’s organized**\n",
    "\n",
    "Data is organized by compressed folders, folder names are self-explanatory and clear. Some of the folders are organized by quarters, others - by months. When it comes to the content of the files, columns'names might differ, e.g. **trip_id** in Divvy_Trips_2019_Q4 versus **ride_id** in Divvy_Trips_2020_Q1. Furthermore, there are fields with no/missing data, as well as columns containing redundant data.\n",
    "\n",
    "**3. Determine the credibility of the data**\n",
    "\n",
    "Data comes from a reliable source, and it is made publicly available under the [license agreement](https://divvybikes.com/data-license-agreement). The information collected belongs to real users of Divvy, which is a bicycle sharing service operated by Lyft Bikes and Scooters, LLC (“Bikeshare”)  in the city of Chicago (“City”). The City permits Bikeshare to make certain Divvy system data owned by the City available to the public, subject to the terms and conditions of the License Agreement.\n",
    "\n",
    "**4. Sort and filter the data**\n",
    "\n",
    "In order to start working with data, I install and load required packages."
   ]
  },
  {
   "cell_type": "code",
   "execution_count": 2,
   "id": "67d132ff",
   "metadata": {
    "_cell_guid": "632afe68-3564-4532-b7c3-102e63053233",
    "_uuid": "f0840fc6-a0c7-4f98-ad12-82b89169449a",
    "collapsed": false,
    "execution": {
     "iopub.execute_input": "2024-03-12T03:02:08.889809Z",
     "iopub.status.busy": "2024-03-12T03:02:08.850930Z",
     "iopub.status.idle": "2024-03-12T03:02:09.223314Z",
     "shell.execute_reply": "2024-03-12T03:02:09.221024Z"
    },
    "jupyter": {
     "outputs_hidden": false
    },
    "papermill": {
     "duration": 0.393526,
     "end_time": "2024-03-12T03:02:09.226075",
     "exception": false,
     "start_time": "2024-03-12T03:02:08.832549",
     "status": "completed"
    },
    "tags": []
   },
   "outputs": [
    {
     "name": "stderr",
     "output_type": "stream",
     "text": [
      "\u001b[1m\u001b[22m\u001b[90m[conflicted]\u001b[39m Will prefer \u001b[1m\u001b[34mdplyr\u001b[39m\u001b[22m::filter over any other package.\n",
      "\u001b[1m\u001b[22m\u001b[90m[conflicted]\u001b[39m Will prefer \u001b[1m\u001b[34mdplyr\u001b[39m\u001b[22m::lag over any other package.\n"
     ]
    }
   ],
   "source": [
    "library(tidyverse)  # helps wrangle data\n",
    "# Use the conflicted package to manage conflicts\n",
    "library(conflicted)\n",
    "\n",
    "# Set dplyr::filter and dplyr::lag as the default choices\n",
    "conflict_prefer(\"filter\", \"dplyr\")\n",
    "conflict_prefer(\"lag\", \"dplyr\")"
   ]
  },
  {
   "cell_type": "code",
   "execution_count": 3,
   "id": "da9467fb",
   "metadata": {
    "_cell_guid": "2fdb590d-d540-47fd-b9ec-7907184a6ea0",
    "_kg_hide-output": false,
    "_uuid": "afa561e1-e2b6-41e4-b904-8fdba1f9d216",
    "execution": {
     "iopub.execute_input": "2024-03-12T03:02:09.259299Z",
     "iopub.status.busy": "2024-03-12T03:02:09.257472Z",
     "iopub.status.idle": "2024-03-12T03:02:20.986998Z",
     "shell.execute_reply": "2024-03-12T03:02:20.984737Z"
    },
    "papermill": {
     "duration": 11.750176,
     "end_time": "2024-03-12T03:02:20.990830",
     "exception": false,
     "start_time": "2024-03-12T03:02:09.240654",
     "status": "completed"
    },
    "tags": []
   },
   "outputs": [
    {
     "name": "stderr",
     "output_type": "stream",
     "text": [
      "\u001b[1mRows: \u001b[22m\u001b[34m1108163\u001b[39m \u001b[1mColumns: \u001b[22m\u001b[34m12\u001b[39m\n",
      "\u001b[36m──\u001b[39m \u001b[1mColumn specification\u001b[22m \u001b[36m────────────────────────────────────────────────────────\u001b[39m\n",
      "\u001b[1mDelimiter:\u001b[22m \",\"\n",
      "\u001b[31mchr\u001b[39m  (4): 03 - Rental Start Station Name, 02 - Rental End Station Name, User...\n",
      "\u001b[32mdbl\u001b[39m  (5): 01 - Rental Details Rental ID, 01 - Rental Details Bike ID, 03 - R...\n",
      "\u001b[32mnum\u001b[39m  (1): 01 - Rental Details Duration In Seconds Uncapped\n",
      "\u001b[34mdttm\u001b[39m (2): 01 - Rental Details Local Start Time, 01 - Rental Details Local En...\n",
      "\n",
      "\u001b[36mℹ\u001b[39m Use `spec()` to retrieve the full column specification for this data.\n",
      "\u001b[36mℹ\u001b[39m Specify the column types or set `show_col_types = FALSE` to quiet this message.\n",
      "\u001b[1mRows: \u001b[22m\u001b[34m1640718\u001b[39m \u001b[1mColumns: \u001b[22m\u001b[34m12\u001b[39m\n",
      "\u001b[36m──\u001b[39m \u001b[1mColumn specification\u001b[22m \u001b[36m────────────────────────────────────────────────────────\u001b[39m\n",
      "\u001b[1mDelimiter:\u001b[22m \",\"\n",
      "\u001b[31mchr\u001b[39m  (4): from_station_name, to_station_name, usertype, gender\n",
      "\u001b[32mdbl\u001b[39m  (5): trip_id, bikeid, from_station_id, to_station_id, birthyear\n",
      "\u001b[32mnum\u001b[39m  (1): tripduration\n",
      "\u001b[34mdttm\u001b[39m (2): start_time, end_time\n",
      "\n",
      "\u001b[36mℹ\u001b[39m Use `spec()` to retrieve the full column specification for this data.\n",
      "\u001b[36mℹ\u001b[39m Specify the column types or set `show_col_types = FALSE` to quiet this message.\n",
      "\u001b[1mRows: \u001b[22m\u001b[34m704054\u001b[39m \u001b[1mColumns: \u001b[22m\u001b[34m12\u001b[39m\n",
      "\u001b[36m──\u001b[39m \u001b[1mColumn specification\u001b[22m \u001b[36m────────────────────────────────────────────────────────\u001b[39m\n",
      "\u001b[1mDelimiter:\u001b[22m \",\"\n",
      "\u001b[31mchr\u001b[39m  (4): from_station_name, to_station_name, usertype, gender\n",
      "\u001b[32mdbl\u001b[39m  (5): trip_id, bikeid, from_station_id, to_station_id, birthyear\n",
      "\u001b[32mnum\u001b[39m  (1): tripduration\n",
      "\u001b[34mdttm\u001b[39m (2): start_time, end_time\n",
      "\n",
      "\u001b[36mℹ\u001b[39m Use `spec()` to retrieve the full column specification for this data.\n",
      "\u001b[36mℹ\u001b[39m Specify the column types or set `show_col_types = FALSE` to quiet this message.\n",
      "\u001b[1mRows: \u001b[22m\u001b[34m426887\u001b[39m \u001b[1mColumns: \u001b[22m\u001b[34m13\u001b[39m\n",
      "\u001b[36m──\u001b[39m \u001b[1mColumn specification\u001b[22m \u001b[36m────────────────────────────────────────────────────────\u001b[39m\n",
      "\u001b[1mDelimiter:\u001b[22m \",\"\n",
      "\u001b[31mchr\u001b[39m  (5): ride_id, rideable_type, start_station_name, end_station_name, memb...\n",
      "\u001b[32mdbl\u001b[39m  (6): start_station_id, end_station_id, start_lat, start_lng, end_lat, e...\n",
      "\u001b[34mdttm\u001b[39m (2): started_at, ended_at\n",
      "\n",
      "\u001b[36mℹ\u001b[39m Use `spec()` to retrieve the full column specification for this data.\n",
      "\u001b[36mℹ\u001b[39m Specify the column types or set `show_col_types = FALSE` to quiet this message.\n"
     ]
    }
   ],
   "source": [
    "# Uploading Divvy datasets - Divvy_Trips_2019_Q2, Divvy_Trips_2019_Q3, Divvy_Trips_2019_Q4, Divvy_Trips_2020_Q1.\n",
    "\n",
    "q2_2019 <- read_csv(\"/kaggle/input/divvy-datasets/Divvy_Trips_2019_Q2.csv\")\n",
    "q3_2019 <- read_csv(\"/kaggle/input/divvy-datasets/Divvy_Trips_2019_Q3.csv\")\n",
    "q4_2019 <- read_csv(\"/kaggle/input/divvy-datasets/Divvy_Trips_2019_Q4.csv\")\n",
    "q1_2020 <- read_csv(\"/kaggle/input/divvy-datasets/Divvy_Trips_2020_Q1.csv\")"
   ]
  },
  {
   "cell_type": "code",
   "execution_count": 4,
   "id": "6b8d908a",
   "metadata": {
    "_cell_guid": "977007f8-e0d0-490b-948b-2dcc8be53de6",
    "_kg_hide-output": false,
    "_uuid": "320375f5-f2c8-4cb5-8b52-74a547d1fdc3",
    "collapsed": false,
    "execution": {
     "iopub.execute_input": "2024-03-12T03:02:21.025314Z",
     "iopub.status.busy": "2024-03-12T03:02:21.023547Z",
     "iopub.status.idle": "2024-03-12T03:02:21.047211Z",
     "shell.execute_reply": "2024-03-12T03:02:21.044607Z"
    },
    "jupyter": {
     "outputs_hidden": false
    },
    "papermill": {
     "duration": 0.04442,
     "end_time": "2024-03-12T03:02:21.050403",
     "exception": false,
     "start_time": "2024-03-12T03:02:21.005983",
     "status": "completed"
    },
    "tags": []
   },
   "outputs": [
    {
     "data": {
      "text/html": [
       "<style>\n",
       ".list-inline {list-style: none; margin:0; padding: 0}\n",
       ".list-inline>li {display: inline-block}\n",
       ".list-inline>li:not(:last-child)::after {content: \"\\00b7\"; padding: 0 .5ex}\n",
       "</style>\n",
       "<ol class=list-inline><li>'01 - Rental Details Rental ID'</li><li>'01 - Rental Details Local Start Time'</li><li>'01 - Rental Details Local End Time'</li><li>'01 - Rental Details Bike ID'</li><li>'01 - Rental Details Duration In Seconds Uncapped'</li><li>'03 - Rental Start Station ID'</li><li>'03 - Rental Start Station Name'</li><li>'02 - Rental End Station ID'</li><li>'02 - Rental End Station Name'</li><li>'User Type'</li><li>'Member Gender'</li><li>'05 - Member Details Member Birthday Year'</li></ol>\n"
      ],
      "text/latex": [
       "\\begin{enumerate*}\n",
       "\\item '01 - Rental Details Rental ID'\n",
       "\\item '01 - Rental Details Local Start Time'\n",
       "\\item '01 - Rental Details Local End Time'\n",
       "\\item '01 - Rental Details Bike ID'\n",
       "\\item '01 - Rental Details Duration In Seconds Uncapped'\n",
       "\\item '03 - Rental Start Station ID'\n",
       "\\item '03 - Rental Start Station Name'\n",
       "\\item '02 - Rental End Station ID'\n",
       "\\item '02 - Rental End Station Name'\n",
       "\\item 'User Type'\n",
       "\\item 'Member Gender'\n",
       "\\item '05 - Member Details Member Birthday Year'\n",
       "\\end{enumerate*}\n"
      ],
      "text/markdown": [
       "1. '01 - Rental Details Rental ID'\n",
       "2. '01 - Rental Details Local Start Time'\n",
       "3. '01 - Rental Details Local End Time'\n",
       "4. '01 - Rental Details Bike ID'\n",
       "5. '01 - Rental Details Duration In Seconds Uncapped'\n",
       "6. '03 - Rental Start Station ID'\n",
       "7. '03 - Rental Start Station Name'\n",
       "8. '02 - Rental End Station ID'\n",
       "9. '02 - Rental End Station Name'\n",
       "10. 'User Type'\n",
       "11. 'Member Gender'\n",
       "12. '05 - Member Details Member Birthday Year'\n",
       "\n",
       "\n"
      ],
      "text/plain": [
       " [1] \"01 - Rental Details Rental ID\"                   \n",
       " [2] \"01 - Rental Details Local Start Time\"            \n",
       " [3] \"01 - Rental Details Local End Time\"              \n",
       " [4] \"01 - Rental Details Bike ID\"                     \n",
       " [5] \"01 - Rental Details Duration In Seconds Uncapped\"\n",
       " [6] \"03 - Rental Start Station ID\"                    \n",
       " [7] \"03 - Rental Start Station Name\"                  \n",
       " [8] \"02 - Rental End Station ID\"                      \n",
       " [9] \"02 - Rental End Station Name\"                    \n",
       "[10] \"User Type\"                                       \n",
       "[11] \"Member Gender\"                                   \n",
       "[12] \"05 - Member Details Member Birthday Year\"        "
      ]
     },
     "metadata": {},
     "output_type": "display_data"
    }
   ],
   "source": [
    "# Wrangling data and combining into single file\n",
    "# Comparing column names for each dataset. \n",
    "# N.B. While the names don't have to be in the same order, they DO need to match perfectly in order to join them into one file\n",
    "\n",
    "colnames(q2_2019)"
   ]
  },
  {
   "cell_type": "code",
   "execution_count": 5,
   "id": "50d93526",
   "metadata": {
    "_cell_guid": "442bfd36-179e-4047-b73d-ffbee3265c18",
    "_kg_hide-output": false,
    "_uuid": "12a01942-ad13-4b51-9527-a7de61b66e40",
    "collapsed": false,
    "execution": {
     "iopub.execute_input": "2024-03-12T03:02:21.083760Z",
     "iopub.status.busy": "2024-03-12T03:02:21.082001Z",
     "iopub.status.idle": "2024-03-12T03:02:21.104307Z",
     "shell.execute_reply": "2024-03-12T03:02:21.101777Z"
    },
    "jupyter": {
     "outputs_hidden": false
    },
    "papermill": {
     "duration": 0.042478,
     "end_time": "2024-03-12T03:02:21.107475",
     "exception": false,
     "start_time": "2024-03-12T03:02:21.064997",
     "status": "completed"
    },
    "tags": []
   },
   "outputs": [
    {
     "data": {
      "text/html": [
       "<style>\n",
       ".list-inline {list-style: none; margin:0; padding: 0}\n",
       ".list-inline>li {display: inline-block}\n",
       ".list-inline>li:not(:last-child)::after {content: \"\\00b7\"; padding: 0 .5ex}\n",
       "</style>\n",
       "<ol class=list-inline><li>'trip_id'</li><li>'start_time'</li><li>'end_time'</li><li>'bikeid'</li><li>'tripduration'</li><li>'from_station_id'</li><li>'from_station_name'</li><li>'to_station_id'</li><li>'to_station_name'</li><li>'usertype'</li><li>'gender'</li><li>'birthyear'</li></ol>\n"
      ],
      "text/latex": [
       "\\begin{enumerate*}\n",
       "\\item 'trip\\_id'\n",
       "\\item 'start\\_time'\n",
       "\\item 'end\\_time'\n",
       "\\item 'bikeid'\n",
       "\\item 'tripduration'\n",
       "\\item 'from\\_station\\_id'\n",
       "\\item 'from\\_station\\_name'\n",
       "\\item 'to\\_station\\_id'\n",
       "\\item 'to\\_station\\_name'\n",
       "\\item 'usertype'\n",
       "\\item 'gender'\n",
       "\\item 'birthyear'\n",
       "\\end{enumerate*}\n"
      ],
      "text/markdown": [
       "1. 'trip_id'\n",
       "2. 'start_time'\n",
       "3. 'end_time'\n",
       "4. 'bikeid'\n",
       "5. 'tripduration'\n",
       "6. 'from_station_id'\n",
       "7. 'from_station_name'\n",
       "8. 'to_station_id'\n",
       "9. 'to_station_name'\n",
       "10. 'usertype'\n",
       "11. 'gender'\n",
       "12. 'birthyear'\n",
       "\n",
       "\n"
      ],
      "text/plain": [
       " [1] \"trip_id\"           \"start_time\"        \"end_time\"         \n",
       " [4] \"bikeid\"            \"tripduration\"      \"from_station_id\"  \n",
       " [7] \"from_station_name\" \"to_station_id\"     \"to_station_name\"  \n",
       "[10] \"usertype\"          \"gender\"            \"birthyear\"        "
      ]
     },
     "metadata": {},
     "output_type": "display_data"
    }
   ],
   "source": [
    "colnames(q3_2019)"
   ]
  },
  {
   "cell_type": "code",
   "execution_count": 6,
   "id": "7342dd81",
   "metadata": {
    "_cell_guid": "3ba737c4-eb1f-45a4-bb68-fc8887ecf0b8",
    "_uuid": "413988c2-08b4-4274-922f-913b3d23ae9f",
    "collapsed": false,
    "execution": {
     "iopub.execute_input": "2024-03-12T03:02:21.141390Z",
     "iopub.status.busy": "2024-03-12T03:02:21.139589Z",
     "iopub.status.idle": "2024-03-12T03:02:21.285474Z",
     "shell.execute_reply": "2024-03-12T03:02:21.282724Z"
    },
    "jupyter": {
     "outputs_hidden": false
    },
    "papermill": {
     "duration": 0.166502,
     "end_time": "2024-03-12T03:02:21.288817",
     "exception": false,
     "start_time": "2024-03-12T03:02:21.122315",
     "status": "completed"
    },
    "tags": []
   },
   "outputs": [
    {
     "data": {
      "text/html": [
       "<style>\n",
       ".list-inline {list-style: none; margin:0; padding: 0}\n",
       ".list-inline>li {display: inline-block}\n",
       ".list-inline>li:not(:last-child)::after {content: \"\\00b7\"; padding: 0 .5ex}\n",
       "</style>\n",
       "<ol class=list-inline><li>'trip_id'</li><li>'start_time'</li><li>'end_time'</li><li>'bikeid'</li><li>'tripduration'</li><li>'from_station_id'</li><li>'from_station_name'</li><li>'to_station_id'</li><li>'to_station_name'</li><li>'usertype'</li><li>'gender'</li><li>'birthyear'</li></ol>\n"
      ],
      "text/latex": [
       "\\begin{enumerate*}\n",
       "\\item 'trip\\_id'\n",
       "\\item 'start\\_time'\n",
       "\\item 'end\\_time'\n",
       "\\item 'bikeid'\n",
       "\\item 'tripduration'\n",
       "\\item 'from\\_station\\_id'\n",
       "\\item 'from\\_station\\_name'\n",
       "\\item 'to\\_station\\_id'\n",
       "\\item 'to\\_station\\_name'\n",
       "\\item 'usertype'\n",
       "\\item 'gender'\n",
       "\\item 'birthyear'\n",
       "\\end{enumerate*}\n"
      ],
      "text/markdown": [
       "1. 'trip_id'\n",
       "2. 'start_time'\n",
       "3. 'end_time'\n",
       "4. 'bikeid'\n",
       "5. 'tripduration'\n",
       "6. 'from_station_id'\n",
       "7. 'from_station_name'\n",
       "8. 'to_station_id'\n",
       "9. 'to_station_name'\n",
       "10. 'usertype'\n",
       "11. 'gender'\n",
       "12. 'birthyear'\n",
       "\n",
       "\n"
      ],
      "text/plain": [
       " [1] \"trip_id\"           \"start_time\"        \"end_time\"         \n",
       " [4] \"bikeid\"            \"tripduration\"      \"from_station_id\"  \n",
       " [7] \"from_station_name\" \"to_station_id\"     \"to_station_name\"  \n",
       "[10] \"usertype\"          \"gender\"            \"birthyear\"        "
      ]
     },
     "metadata": {},
     "output_type": "display_data"
    }
   ],
   "source": [
    "colnames(q4_2019)"
   ]
  },
  {
   "cell_type": "code",
   "execution_count": 7,
   "id": "d2b8231a",
   "metadata": {
    "_cell_guid": "a58b9eee-de9a-4e64-9e32-0b0f5198188c",
    "_uuid": "560018ce-5cdd-4752-992c-35c52dca1fbe",
    "collapsed": false,
    "execution": {
     "iopub.execute_input": "2024-03-12T03:02:21.324587Z",
     "iopub.status.busy": "2024-03-12T03:02:21.322936Z",
     "iopub.status.idle": "2024-03-12T03:02:21.345325Z",
     "shell.execute_reply": "2024-03-12T03:02:21.342833Z"
    },
    "jupyter": {
     "outputs_hidden": false
    },
    "papermill": {
     "duration": 0.044013,
     "end_time": "2024-03-12T03:02:21.348580",
     "exception": false,
     "start_time": "2024-03-12T03:02:21.304567",
     "status": "completed"
    },
    "tags": []
   },
   "outputs": [
    {
     "data": {
      "text/html": [
       "<style>\n",
       ".list-inline {list-style: none; margin:0; padding: 0}\n",
       ".list-inline>li {display: inline-block}\n",
       ".list-inline>li:not(:last-child)::after {content: \"\\00b7\"; padding: 0 .5ex}\n",
       "</style>\n",
       "<ol class=list-inline><li>'ride_id'</li><li>'rideable_type'</li><li>'started_at'</li><li>'ended_at'</li><li>'start_station_name'</li><li>'start_station_id'</li><li>'end_station_name'</li><li>'end_station_id'</li><li>'start_lat'</li><li>'start_lng'</li><li>'end_lat'</li><li>'end_lng'</li><li>'member_casual'</li></ol>\n"
      ],
      "text/latex": [
       "\\begin{enumerate*}\n",
       "\\item 'ride\\_id'\n",
       "\\item 'rideable\\_type'\n",
       "\\item 'started\\_at'\n",
       "\\item 'ended\\_at'\n",
       "\\item 'start\\_station\\_name'\n",
       "\\item 'start\\_station\\_id'\n",
       "\\item 'end\\_station\\_name'\n",
       "\\item 'end\\_station\\_id'\n",
       "\\item 'start\\_lat'\n",
       "\\item 'start\\_lng'\n",
       "\\item 'end\\_lat'\n",
       "\\item 'end\\_lng'\n",
       "\\item 'member\\_casual'\n",
       "\\end{enumerate*}\n"
      ],
      "text/markdown": [
       "1. 'ride_id'\n",
       "2. 'rideable_type'\n",
       "3. 'started_at'\n",
       "4. 'ended_at'\n",
       "5. 'start_station_name'\n",
       "6. 'start_station_id'\n",
       "7. 'end_station_name'\n",
       "8. 'end_station_id'\n",
       "9. 'start_lat'\n",
       "10. 'start_lng'\n",
       "11. 'end_lat'\n",
       "12. 'end_lng'\n",
       "13. 'member_casual'\n",
       "\n",
       "\n"
      ],
      "text/plain": [
       " [1] \"ride_id\"            \"rideable_type\"      \"started_at\"        \n",
       " [4] \"ended_at\"           \"start_station_name\" \"start_station_id\"  \n",
       " [7] \"end_station_name\"   \"end_station_id\"     \"start_lat\"         \n",
       "[10] \"start_lng\"          \"end_lat\"            \"end_lng\"           \n",
       "[13] \"member_casual\"     "
      ]
     },
     "metadata": {},
     "output_type": "display_data"
    }
   ],
   "source": [
    "colnames(q1_2020)"
   ]
  },
  {
   "cell_type": "code",
   "execution_count": 8,
   "id": "09590d5a",
   "metadata": {
    "_cell_guid": "3e3ffe41-5c51-429e-ad69-f7b5787d25a6",
    "_kg_hide-output": false,
    "_uuid": "820147ae-2eda-4161-8efc-2e41e7aac74c",
    "collapsed": false,
    "execution": {
     "iopub.execute_input": "2024-03-12T03:02:21.383185Z",
     "iopub.status.busy": "2024-03-12T03:02:21.381520Z",
     "iopub.status.idle": "2024-03-12T03:02:21.460106Z",
     "shell.execute_reply": "2024-03-12T03:02:21.457148Z"
    },
    "jupyter": {
     "outputs_hidden": false
    },
    "papermill": {
     "duration": 0.099904,
     "end_time": "2024-03-12T03:02:21.463781",
     "exception": false,
     "start_time": "2024-03-12T03:02:21.363877",
     "status": "completed"
    },
    "tags": []
   },
   "outputs": [
    {
     "data": {
      "text/html": [
       "<table class=\"dataframe\">\n",
       "<caption>A tibble: 6 × 12</caption>\n",
       "<thead>\n",
       "\t<tr><th scope=col>ride_id</th><th scope=col>started_at</th><th scope=col>ended_at</th><th scope=col>rideable_type</th><th scope=col>01 - Rental Details Duration In Seconds Uncapped</th><th scope=col>start_station_id</th><th scope=col>start_station_name</th><th scope=col>end_station_id</th><th scope=col>end_station_name</th><th scope=col>member_casual</th><th scope=col>Member Gender</th><th scope=col>05 - Member Details Member Birthday Year</th></tr>\n",
       "\t<tr><th scope=col>&lt;dbl&gt;</th><th scope=col>&lt;dttm&gt;</th><th scope=col>&lt;dttm&gt;</th><th scope=col>&lt;dbl&gt;</th><th scope=col>&lt;dbl&gt;</th><th scope=col>&lt;dbl&gt;</th><th scope=col>&lt;chr&gt;</th><th scope=col>&lt;dbl&gt;</th><th scope=col>&lt;chr&gt;</th><th scope=col>&lt;chr&gt;</th><th scope=col>&lt;chr&gt;</th><th scope=col>&lt;dbl&gt;</th></tr>\n",
       "</thead>\n",
       "<tbody>\n",
       "\t<tr><td>22178529</td><td>2019-04-01 00:02:22</td><td>2019-04-01 00:09:48</td><td>6251</td><td> 446</td><td> 81</td><td><span style=white-space:pre-wrap>Daley Center Plaza       </span></td><td> 56</td><td>Desplaines St &amp; Kinzie St</td><td>Subscriber</td><td><span style=white-space:pre-wrap>Male  </span></td><td>1975</td></tr>\n",
       "\t<tr><td>22178530</td><td>2019-04-01 00:03:02</td><td>2019-04-01 00:20:30</td><td>6226</td><td>1048</td><td>317</td><td><span style=white-space:pre-wrap>Wood St &amp; Taylor St      </span></td><td> 59</td><td>Wabash Ave &amp; Roosevelt Rd</td><td>Subscriber</td><td>Female</td><td>1984</td></tr>\n",
       "\t<tr><td>22178531</td><td>2019-04-01 00:11:07</td><td>2019-04-01 00:15:19</td><td>5649</td><td> 252</td><td>283</td><td>LaSalle St &amp; Jackson Blvd</td><td>174</td><td><span style=white-space:pre-wrap>Canal St &amp; Madison St    </span></td><td>Subscriber</td><td><span style=white-space:pre-wrap>Male  </span></td><td>1990</td></tr>\n",
       "\t<tr><td>22178532</td><td>2019-04-01 00:13:01</td><td>2019-04-01 00:18:58</td><td>4151</td><td> 357</td><td> 26</td><td>McClurg Ct &amp; Illinois St </td><td>133</td><td>Kingsbury St &amp; Kinzie St </td><td>Subscriber</td><td><span style=white-space:pre-wrap>Male  </span></td><td>1993</td></tr>\n",
       "\t<tr><td>22178533</td><td>2019-04-01 00:19:26</td><td>2019-04-01 00:36:13</td><td>3270</td><td>1007</td><td>202</td><td><span style=white-space:pre-wrap>Halsted St &amp; 18th St     </span></td><td>129</td><td>Blue Island Ave &amp; 18th St</td><td>Subscriber</td><td><span style=white-space:pre-wrap>Male  </span></td><td>1992</td></tr>\n",
       "\t<tr><td>22178534</td><td>2019-04-01 00:19:39</td><td>2019-04-01 00:23:56</td><td>3123</td><td> 257</td><td>420</td><td><span style=white-space:pre-wrap>Ellis Ave &amp; 55th St      </span></td><td>426</td><td><span style=white-space:pre-wrap>Ellis Ave &amp; 60th St      </span></td><td>Subscriber</td><td><span style=white-space:pre-wrap>Male  </span></td><td>1999</td></tr>\n",
       "</tbody>\n",
       "</table>\n"
      ],
      "text/latex": [
       "A tibble: 6 × 12\n",
       "\\begin{tabular}{llllllllllll}\n",
       " ride\\_id & started\\_at & ended\\_at & rideable\\_type & 01 - Rental Details Duration In Seconds Uncapped & start\\_station\\_id & start\\_station\\_name & end\\_station\\_id & end\\_station\\_name & member\\_casual & Member Gender & 05 - Member Details Member Birthday Year\\\\\n",
       " <dbl> & <dttm> & <dttm> & <dbl> & <dbl> & <dbl> & <chr> & <dbl> & <chr> & <chr> & <chr> & <dbl>\\\\\n",
       "\\hline\n",
       "\t 22178529 & 2019-04-01 00:02:22 & 2019-04-01 00:09:48 & 6251 &  446 &  81 & Daley Center Plaza        &  56 & Desplaines St \\& Kinzie St & Subscriber & Male   & 1975\\\\\n",
       "\t 22178530 & 2019-04-01 00:03:02 & 2019-04-01 00:20:30 & 6226 & 1048 & 317 & Wood St \\& Taylor St       &  59 & Wabash Ave \\& Roosevelt Rd & Subscriber & Female & 1984\\\\\n",
       "\t 22178531 & 2019-04-01 00:11:07 & 2019-04-01 00:15:19 & 5649 &  252 & 283 & LaSalle St \\& Jackson Blvd & 174 & Canal St \\& Madison St     & Subscriber & Male   & 1990\\\\\n",
       "\t 22178532 & 2019-04-01 00:13:01 & 2019-04-01 00:18:58 & 4151 &  357 &  26 & McClurg Ct \\& Illinois St  & 133 & Kingsbury St \\& Kinzie St  & Subscriber & Male   & 1993\\\\\n",
       "\t 22178533 & 2019-04-01 00:19:26 & 2019-04-01 00:36:13 & 3270 & 1007 & 202 & Halsted St \\& 18th St      & 129 & Blue Island Ave \\& 18th St & Subscriber & Male   & 1992\\\\\n",
       "\t 22178534 & 2019-04-01 00:19:39 & 2019-04-01 00:23:56 & 3123 &  257 & 420 & Ellis Ave \\& 55th St       & 426 & Ellis Ave \\& 60th St       & Subscriber & Male   & 1999\\\\\n",
       "\\end{tabular}\n"
      ],
      "text/markdown": [
       "\n",
       "A tibble: 6 × 12\n",
       "\n",
       "| ride_id &lt;dbl&gt; | started_at &lt;dttm&gt; | ended_at &lt;dttm&gt; | rideable_type &lt;dbl&gt; | 01 - Rental Details Duration In Seconds Uncapped &lt;dbl&gt; | start_station_id &lt;dbl&gt; | start_station_name &lt;chr&gt; | end_station_id &lt;dbl&gt; | end_station_name &lt;chr&gt; | member_casual &lt;chr&gt; | Member Gender &lt;chr&gt; | 05 - Member Details Member Birthday Year &lt;dbl&gt; |\n",
       "|---|---|---|---|---|---|---|---|---|---|---|---|\n",
       "| 22178529 | 2019-04-01 00:02:22 | 2019-04-01 00:09:48 | 6251 |  446 |  81 | Daley Center Plaza        |  56 | Desplaines St &amp; Kinzie St | Subscriber | Male   | 1975 |\n",
       "| 22178530 | 2019-04-01 00:03:02 | 2019-04-01 00:20:30 | 6226 | 1048 | 317 | Wood St &amp; Taylor St       |  59 | Wabash Ave &amp; Roosevelt Rd | Subscriber | Female | 1984 |\n",
       "| 22178531 | 2019-04-01 00:11:07 | 2019-04-01 00:15:19 | 5649 |  252 | 283 | LaSalle St &amp; Jackson Blvd | 174 | Canal St &amp; Madison St     | Subscriber | Male   | 1990 |\n",
       "| 22178532 | 2019-04-01 00:13:01 | 2019-04-01 00:18:58 | 4151 |  357 |  26 | McClurg Ct &amp; Illinois St  | 133 | Kingsbury St &amp; Kinzie St  | Subscriber | Male   | 1993 |\n",
       "| 22178533 | 2019-04-01 00:19:26 | 2019-04-01 00:36:13 | 3270 | 1007 | 202 | Halsted St &amp; 18th St      | 129 | Blue Island Ave &amp; 18th St | Subscriber | Male   | 1992 |\n",
       "| 22178534 | 2019-04-01 00:19:39 | 2019-04-01 00:23:56 | 3123 |  257 | 420 | Ellis Ave &amp; 55th St       | 426 | Ellis Ave &amp; 60th St       | Subscriber | Male   | 1999 |\n",
       "\n"
      ],
      "text/plain": [
       "  ride_id  started_at          ended_at            rideable_type\n",
       "1 22178529 2019-04-01 00:02:22 2019-04-01 00:09:48 6251         \n",
       "2 22178530 2019-04-01 00:03:02 2019-04-01 00:20:30 6226         \n",
       "3 22178531 2019-04-01 00:11:07 2019-04-01 00:15:19 5649         \n",
       "4 22178532 2019-04-01 00:13:01 2019-04-01 00:18:58 4151         \n",
       "5 22178533 2019-04-01 00:19:26 2019-04-01 00:36:13 3270         \n",
       "6 22178534 2019-04-01 00:19:39 2019-04-01 00:23:56 3123         \n",
       "  01 - Rental Details Duration In Seconds Uncapped start_station_id\n",
       "1  446                                              81             \n",
       "2 1048                                             317             \n",
       "3  252                                             283             \n",
       "4  357                                              26             \n",
       "5 1007                                             202             \n",
       "6  257                                             420             \n",
       "  start_station_name        end_station_id end_station_name         \n",
       "1 Daley Center Plaza         56            Desplaines St & Kinzie St\n",
       "2 Wood St & Taylor St        59            Wabash Ave & Roosevelt Rd\n",
       "3 LaSalle St & Jackson Blvd 174            Canal St & Madison St    \n",
       "4 McClurg Ct & Illinois St  133            Kingsbury St & Kinzie St \n",
       "5 Halsted St & 18th St      129            Blue Island Ave & 18th St\n",
       "6 Ellis Ave & 55th St       426            Ellis Ave & 60th St      \n",
       "  member_casual Member Gender 05 - Member Details Member Birthday Year\n",
       "1 Subscriber    Male          1975                                    \n",
       "2 Subscriber    Female        1984                                    \n",
       "3 Subscriber    Male          1990                                    \n",
       "4 Subscriber    Male          1993                                    \n",
       "5 Subscriber    Male          1992                                    \n",
       "6 Subscriber    Male          1999                                    "
      ]
     },
     "metadata": {},
     "output_type": "display_data"
    }
   ],
   "source": [
    "# Renaming columns to make them consistent with q1_2020 \n",
    "\n",
    "(q2_2019 <-rename(q2_2019,\n",
    "                 ride_id = `01 - Rental Details Rental ID`,\n",
    "                 rideable_type = `01 - Rental Details Bike ID`,\n",
    "                 started_at = `01 - Rental Details Local Start Time`,\n",
    "                 ended_at = `01 - Rental Details Local End Time`,\n",
    "                 start_station_name = `03 - Rental Start Station Name`,\n",
    "                 start_station_id = `03 - Rental Start Station ID`,\n",
    "                 end_station_name = `02 - Rental End Station Name`,\n",
    "                 end_station_id = `02 - Rental End Station ID`,\n",
    "                 member_casual = `User Type`)) %>%\n",
    "head(6)"
   ]
  },
  {
   "cell_type": "code",
   "execution_count": 9,
   "id": "1b9d3881",
   "metadata": {
    "_cell_guid": "9de551c8-35d8-4289-8f2d-78407abed29b",
    "_kg_hide-input": false,
    "_kg_hide-output": false,
    "_uuid": "87fadae8-c3c6-427f-8818-925c3f061615",
    "collapsed": false,
    "execution": {
     "iopub.execute_input": "2024-03-12T03:02:21.499435Z",
     "iopub.status.busy": "2024-03-12T03:02:21.497649Z",
     "iopub.status.idle": "2024-03-12T03:02:21.832974Z",
     "shell.execute_reply": "2024-03-12T03:02:21.830371Z"
    },
    "jupyter": {
     "outputs_hidden": false
    },
    "papermill": {
     "duration": 0.356524,
     "end_time": "2024-03-12T03:02:21.836170",
     "exception": false,
     "start_time": "2024-03-12T03:02:21.479646",
     "status": "completed"
    },
    "tags": []
   },
   "outputs": [
    {
     "data": {
      "text/html": [
       "<table class=\"dataframe\">\n",
       "<caption>A tibble: 6 × 12</caption>\n",
       "<thead>\n",
       "\t<tr><th scope=col>ride_id</th><th scope=col>started_at</th><th scope=col>ended_at</th><th scope=col>rideable_type</th><th scope=col>tripduration</th><th scope=col>start_station_id</th><th scope=col>start_station_name</th><th scope=col>end_station_id</th><th scope=col>end_station_name</th><th scope=col>member_casual</th><th scope=col>gender</th><th scope=col>birthyear</th></tr>\n",
       "\t<tr><th scope=col>&lt;dbl&gt;</th><th scope=col>&lt;dttm&gt;</th><th scope=col>&lt;dttm&gt;</th><th scope=col>&lt;dbl&gt;</th><th scope=col>&lt;dbl&gt;</th><th scope=col>&lt;dbl&gt;</th><th scope=col>&lt;chr&gt;</th><th scope=col>&lt;dbl&gt;</th><th scope=col>&lt;chr&gt;</th><th scope=col>&lt;chr&gt;</th><th scope=col>&lt;chr&gt;</th><th scope=col>&lt;dbl&gt;</th></tr>\n",
       "</thead>\n",
       "<tbody>\n",
       "\t<tr><td>23479388</td><td>2019-07-01 00:00:27</td><td>2019-07-01 00:20:41</td><td>3591</td><td>1214</td><td>117</td><td><span style=white-space:pre-wrap>Wilton Ave &amp; Belmont Ave     </span></td><td>497</td><td><span style=white-space:pre-wrap>Kimball Ave &amp; Belmont Ave    </span></td><td>Subscriber</td><td>Male</td><td>1992</td></tr>\n",
       "\t<tr><td>23479389</td><td>2019-07-01 00:01:16</td><td>2019-07-01 00:18:44</td><td>5353</td><td>1048</td><td>381</td><td><span style=white-space:pre-wrap>Western Ave &amp; Monroe St      </span></td><td>203</td><td><span style=white-space:pre-wrap>Western Ave &amp; 21st St        </span></td><td><span style=white-space:pre-wrap>Customer  </span></td><td><span style=white-space:pre-wrap>NA  </span></td><td><span style=white-space:pre-wrap>  NA</span></td></tr>\n",
       "\t<tr><td>23479390</td><td>2019-07-01 00:01:48</td><td>2019-07-01 00:27:42</td><td>6180</td><td>1554</td><td>313</td><td>Lakeview Ave &amp; Fullerton Pkwy</td><td>144</td><td><span style=white-space:pre-wrap>Larrabee St &amp; Webster Ave    </span></td><td><span style=white-space:pre-wrap>Customer  </span></td><td><span style=white-space:pre-wrap>NA  </span></td><td><span style=white-space:pre-wrap>  NA</span></td></tr>\n",
       "\t<tr><td>23479391</td><td>2019-07-01 00:02:07</td><td>2019-07-01 00:27:10</td><td>5540</td><td>1503</td><td>313</td><td>Lakeview Ave &amp; Fullerton Pkwy</td><td>144</td><td><span style=white-space:pre-wrap>Larrabee St &amp; Webster Ave    </span></td><td><span style=white-space:pre-wrap>Customer  </span></td><td><span style=white-space:pre-wrap>NA  </span></td><td><span style=white-space:pre-wrap>  NA</span></td></tr>\n",
       "\t<tr><td>23479392</td><td>2019-07-01 00:02:13</td><td>2019-07-01 00:22:26</td><td>6014</td><td>1213</td><td>168</td><td><span style=white-space:pre-wrap>Michigan Ave &amp; 14th St       </span></td><td> 62</td><td><span style=white-space:pre-wrap>McCormick Place              </span></td><td><span style=white-space:pre-wrap>Customer  </span></td><td><span style=white-space:pre-wrap>NA  </span></td><td><span style=white-space:pre-wrap>  NA</span></td></tr>\n",
       "\t<tr><td>23479393</td><td>2019-07-01 00:02:21</td><td>2019-07-01 00:07:31</td><td>4941</td><td> 310</td><td>300</td><td><span style=white-space:pre-wrap>Broadway &amp; Barry Ave         </span></td><td>232</td><td>Pine Grove Ave &amp; Waveland Ave</td><td>Subscriber</td><td>Male</td><td>1990</td></tr>\n",
       "</tbody>\n",
       "</table>\n"
      ],
      "text/latex": [
       "A tibble: 6 × 12\n",
       "\\begin{tabular}{llllllllllll}\n",
       " ride\\_id & started\\_at & ended\\_at & rideable\\_type & tripduration & start\\_station\\_id & start\\_station\\_name & end\\_station\\_id & end\\_station\\_name & member\\_casual & gender & birthyear\\\\\n",
       " <dbl> & <dttm> & <dttm> & <dbl> & <dbl> & <dbl> & <chr> & <dbl> & <chr> & <chr> & <chr> & <dbl>\\\\\n",
       "\\hline\n",
       "\t 23479388 & 2019-07-01 00:00:27 & 2019-07-01 00:20:41 & 3591 & 1214 & 117 & Wilton Ave \\& Belmont Ave      & 497 & Kimball Ave \\& Belmont Ave     & Subscriber & Male & 1992\\\\\n",
       "\t 23479389 & 2019-07-01 00:01:16 & 2019-07-01 00:18:44 & 5353 & 1048 & 381 & Western Ave \\& Monroe St       & 203 & Western Ave \\& 21st St         & Customer   & NA   &   NA\\\\\n",
       "\t 23479390 & 2019-07-01 00:01:48 & 2019-07-01 00:27:42 & 6180 & 1554 & 313 & Lakeview Ave \\& Fullerton Pkwy & 144 & Larrabee St \\& Webster Ave     & Customer   & NA   &   NA\\\\\n",
       "\t 23479391 & 2019-07-01 00:02:07 & 2019-07-01 00:27:10 & 5540 & 1503 & 313 & Lakeview Ave \\& Fullerton Pkwy & 144 & Larrabee St \\& Webster Ave     & Customer   & NA   &   NA\\\\\n",
       "\t 23479392 & 2019-07-01 00:02:13 & 2019-07-01 00:22:26 & 6014 & 1213 & 168 & Michigan Ave \\& 14th St        &  62 & McCormick Place               & Customer   & NA   &   NA\\\\\n",
       "\t 23479393 & 2019-07-01 00:02:21 & 2019-07-01 00:07:31 & 4941 &  310 & 300 & Broadway \\& Barry Ave          & 232 & Pine Grove Ave \\& Waveland Ave & Subscriber & Male & 1990\\\\\n",
       "\\end{tabular}\n"
      ],
      "text/markdown": [
       "\n",
       "A tibble: 6 × 12\n",
       "\n",
       "| ride_id &lt;dbl&gt; | started_at &lt;dttm&gt; | ended_at &lt;dttm&gt; | rideable_type &lt;dbl&gt; | tripduration &lt;dbl&gt; | start_station_id &lt;dbl&gt; | start_station_name &lt;chr&gt; | end_station_id &lt;dbl&gt; | end_station_name &lt;chr&gt; | member_casual &lt;chr&gt; | gender &lt;chr&gt; | birthyear &lt;dbl&gt; |\n",
       "|---|---|---|---|---|---|---|---|---|---|---|---|\n",
       "| 23479388 | 2019-07-01 00:00:27 | 2019-07-01 00:20:41 | 3591 | 1214 | 117 | Wilton Ave &amp; Belmont Ave      | 497 | Kimball Ave &amp; Belmont Ave     | Subscriber | Male | 1992 |\n",
       "| 23479389 | 2019-07-01 00:01:16 | 2019-07-01 00:18:44 | 5353 | 1048 | 381 | Western Ave &amp; Monroe St       | 203 | Western Ave &amp; 21st St         | Customer   | NA   |   NA |\n",
       "| 23479390 | 2019-07-01 00:01:48 | 2019-07-01 00:27:42 | 6180 | 1554 | 313 | Lakeview Ave &amp; Fullerton Pkwy | 144 | Larrabee St &amp; Webster Ave     | Customer   | NA   |   NA |\n",
       "| 23479391 | 2019-07-01 00:02:07 | 2019-07-01 00:27:10 | 5540 | 1503 | 313 | Lakeview Ave &amp; Fullerton Pkwy | 144 | Larrabee St &amp; Webster Ave     | Customer   | NA   |   NA |\n",
       "| 23479392 | 2019-07-01 00:02:13 | 2019-07-01 00:22:26 | 6014 | 1213 | 168 | Michigan Ave &amp; 14th St        |  62 | McCormick Place               | Customer   | NA   |   NA |\n",
       "| 23479393 | 2019-07-01 00:02:21 | 2019-07-01 00:07:31 | 4941 |  310 | 300 | Broadway &amp; Barry Ave          | 232 | Pine Grove Ave &amp; Waveland Ave | Subscriber | Male | 1990 |\n",
       "\n"
      ],
      "text/plain": [
       "  ride_id  started_at          ended_at            rideable_type tripduration\n",
       "1 23479388 2019-07-01 00:00:27 2019-07-01 00:20:41 3591          1214        \n",
       "2 23479389 2019-07-01 00:01:16 2019-07-01 00:18:44 5353          1048        \n",
       "3 23479390 2019-07-01 00:01:48 2019-07-01 00:27:42 6180          1554        \n",
       "4 23479391 2019-07-01 00:02:07 2019-07-01 00:27:10 5540          1503        \n",
       "5 23479392 2019-07-01 00:02:13 2019-07-01 00:22:26 6014          1213        \n",
       "6 23479393 2019-07-01 00:02:21 2019-07-01 00:07:31 4941           310        \n",
       "  start_station_id start_station_name            end_station_id\n",
       "1 117              Wilton Ave & Belmont Ave      497           \n",
       "2 381              Western Ave & Monroe St       203           \n",
       "3 313              Lakeview Ave & Fullerton Pkwy 144           \n",
       "4 313              Lakeview Ave & Fullerton Pkwy 144           \n",
       "5 168              Michigan Ave & 14th St         62           \n",
       "6 300              Broadway & Barry Ave          232           \n",
       "  end_station_name              member_casual gender birthyear\n",
       "1 Kimball Ave & Belmont Ave     Subscriber    Male   1992     \n",
       "2 Western Ave & 21st St         Customer      NA       NA     \n",
       "3 Larrabee St & Webster Ave     Customer      NA       NA     \n",
       "4 Larrabee St & Webster Ave     Customer      NA       NA     \n",
       "5 McCormick Place               Customer      NA       NA     \n",
       "6 Pine Grove Ave & Waveland Ave Subscriber    Male   1990     "
      ]
     },
     "metadata": {},
     "output_type": "display_data"
    }
   ],
   "source": [
    "(q3_2019 <- rename(q3_2019,\n",
    "                 ride_id = trip_id,\n",
    "                 rideable_type = bikeid,\n",
    "                 started_at = start_time,\n",
    "                 ended_at = end_time,\n",
    "                 start_station_name = from_station_name,\n",
    "                 start_station_id = from_station_id,\n",
    "                 end_station_name = to_station_name,\n",
    "                 end_station_id = to_station_id,\n",
    "                 member_casual = usertype)) %>%\n",
    "head(6)"
   ]
  },
  {
   "cell_type": "code",
   "execution_count": 10,
   "id": "c4d942f4",
   "metadata": {
    "_cell_guid": "9b60ebb8-87f6-495a-836a-a207d66cc3c1",
    "_kg_hide-output": false,
    "_uuid": "90d6a714-089b-4dd3-b77a-ece65df703c0",
    "collapsed": false,
    "execution": {
     "iopub.execute_input": "2024-03-12T03:02:21.877105Z",
     "iopub.status.busy": "2024-03-12T03:02:21.872502Z",
     "iopub.status.idle": "2024-03-12T03:02:21.936584Z",
     "shell.execute_reply": "2024-03-12T03:02:21.933976Z"
    },
    "jupyter": {
     "outputs_hidden": false
    },
    "papermill": {
     "duration": 0.087591,
     "end_time": "2024-03-12T03:02:21.940176",
     "exception": false,
     "start_time": "2024-03-12T03:02:21.852585",
     "status": "completed"
    },
    "tags": []
   },
   "outputs": [
    {
     "data": {
      "text/html": [
       "<table class=\"dataframe\">\n",
       "<caption>A tibble: 6 × 12</caption>\n",
       "<thead>\n",
       "\t<tr><th scope=col>ride_id</th><th scope=col>started_at</th><th scope=col>ended_at</th><th scope=col>rideable_type</th><th scope=col>tripduration</th><th scope=col>start_station_id</th><th scope=col>start_station_name</th><th scope=col>end_station_id</th><th scope=col>end_station_name</th><th scope=col>member_casual</th><th scope=col>gender</th><th scope=col>birthyear</th></tr>\n",
       "\t<tr><th scope=col>&lt;dbl&gt;</th><th scope=col>&lt;dttm&gt;</th><th scope=col>&lt;dttm&gt;</th><th scope=col>&lt;dbl&gt;</th><th scope=col>&lt;dbl&gt;</th><th scope=col>&lt;dbl&gt;</th><th scope=col>&lt;chr&gt;</th><th scope=col>&lt;dbl&gt;</th><th scope=col>&lt;chr&gt;</th><th scope=col>&lt;chr&gt;</th><th scope=col>&lt;chr&gt;</th><th scope=col>&lt;dbl&gt;</th></tr>\n",
       "</thead>\n",
       "<tbody>\n",
       "\t<tr><td>25223640</td><td>2019-10-01 00:01:39</td><td>2019-10-01 00:17:20</td><td>2215</td><td> 940</td><td> 20</td><td><span style=white-space:pre-wrap>Sheffield Ave &amp; Kingsbury St  </span></td><td>309</td><td><span style=white-space:pre-wrap>Leavitt St &amp; Armitage Ave  </span></td><td>Subscriber</td><td><span style=white-space:pre-wrap>Male  </span></td><td>1987</td></tr>\n",
       "\t<tr><td>25223641</td><td>2019-10-01 00:02:16</td><td>2019-10-01 00:06:34</td><td>6328</td><td> 258</td><td> 19</td><td>Throop (Loomis) St &amp; Taylor St</td><td>241</td><td><span style=white-space:pre-wrap>Morgan St &amp; Polk St        </span></td><td>Subscriber</td><td><span style=white-space:pre-wrap>Male  </span></td><td>1998</td></tr>\n",
       "\t<tr><td>25223642</td><td>2019-10-01 00:04:32</td><td>2019-10-01 00:18:43</td><td>3003</td><td> 850</td><td> 84</td><td><span style=white-space:pre-wrap>Milwaukee Ave &amp; Grand Ave     </span></td><td>199</td><td><span style=white-space:pre-wrap>Wabash Ave &amp; Grand Ave     </span></td><td>Subscriber</td><td>Female</td><td>1991</td></tr>\n",
       "\t<tr><td>25223643</td><td>2019-10-01 00:04:32</td><td>2019-10-01 00:43:43</td><td>3275</td><td>2350</td><td>313</td><td>Lakeview Ave &amp; Fullerton Pkwy </td><td>290</td><td><span style=white-space:pre-wrap>Kedzie Ave &amp; Palmer Ct     </span></td><td>Subscriber</td><td><span style=white-space:pre-wrap>Male  </span></td><td>1990</td></tr>\n",
       "\t<tr><td>25223644</td><td>2019-10-01 00:04:34</td><td>2019-10-01 00:35:42</td><td>5294</td><td>1867</td><td>210</td><td><span style=white-space:pre-wrap>Ashland Ave &amp; Division St     </span></td><td>382</td><td>Western Ave &amp; Congress Pkwy</td><td>Subscriber</td><td><span style=white-space:pre-wrap>Male  </span></td><td>1987</td></tr>\n",
       "\t<tr><td>25223645</td><td>2019-10-01 00:04:38</td><td>2019-10-01 00:10:51</td><td>1891</td><td> 373</td><td>156</td><td><span style=white-space:pre-wrap>Clark St &amp; Wellington Ave     </span></td><td>226</td><td><span style=white-space:pre-wrap>Racine Ave &amp; Belmont Ave   </span></td><td>Subscriber</td><td>Female</td><td>1994</td></tr>\n",
       "</tbody>\n",
       "</table>\n"
      ],
      "text/latex": [
       "A tibble: 6 × 12\n",
       "\\begin{tabular}{llllllllllll}\n",
       " ride\\_id & started\\_at & ended\\_at & rideable\\_type & tripduration & start\\_station\\_id & start\\_station\\_name & end\\_station\\_id & end\\_station\\_name & member\\_casual & gender & birthyear\\\\\n",
       " <dbl> & <dttm> & <dttm> & <dbl> & <dbl> & <dbl> & <chr> & <dbl> & <chr> & <chr> & <chr> & <dbl>\\\\\n",
       "\\hline\n",
       "\t 25223640 & 2019-10-01 00:01:39 & 2019-10-01 00:17:20 & 2215 &  940 &  20 & Sheffield Ave \\& Kingsbury St   & 309 & Leavitt St \\& Armitage Ave   & Subscriber & Male   & 1987\\\\\n",
       "\t 25223641 & 2019-10-01 00:02:16 & 2019-10-01 00:06:34 & 6328 &  258 &  19 & Throop (Loomis) St \\& Taylor St & 241 & Morgan St \\& Polk St         & Subscriber & Male   & 1998\\\\\n",
       "\t 25223642 & 2019-10-01 00:04:32 & 2019-10-01 00:18:43 & 3003 &  850 &  84 & Milwaukee Ave \\& Grand Ave      & 199 & Wabash Ave \\& Grand Ave      & Subscriber & Female & 1991\\\\\n",
       "\t 25223643 & 2019-10-01 00:04:32 & 2019-10-01 00:43:43 & 3275 & 2350 & 313 & Lakeview Ave \\& Fullerton Pkwy  & 290 & Kedzie Ave \\& Palmer Ct      & Subscriber & Male   & 1990\\\\\n",
       "\t 25223644 & 2019-10-01 00:04:34 & 2019-10-01 00:35:42 & 5294 & 1867 & 210 & Ashland Ave \\& Division St      & 382 & Western Ave \\& Congress Pkwy & Subscriber & Male   & 1987\\\\\n",
       "\t 25223645 & 2019-10-01 00:04:38 & 2019-10-01 00:10:51 & 1891 &  373 & 156 & Clark St \\& Wellington Ave      & 226 & Racine Ave \\& Belmont Ave    & Subscriber & Female & 1994\\\\\n",
       "\\end{tabular}\n"
      ],
      "text/markdown": [
       "\n",
       "A tibble: 6 × 12\n",
       "\n",
       "| ride_id &lt;dbl&gt; | started_at &lt;dttm&gt; | ended_at &lt;dttm&gt; | rideable_type &lt;dbl&gt; | tripduration &lt;dbl&gt; | start_station_id &lt;dbl&gt; | start_station_name &lt;chr&gt; | end_station_id &lt;dbl&gt; | end_station_name &lt;chr&gt; | member_casual &lt;chr&gt; | gender &lt;chr&gt; | birthyear &lt;dbl&gt; |\n",
       "|---|---|---|---|---|---|---|---|---|---|---|---|\n",
       "| 25223640 | 2019-10-01 00:01:39 | 2019-10-01 00:17:20 | 2215 |  940 |  20 | Sheffield Ave &amp; Kingsbury St   | 309 | Leavitt St &amp; Armitage Ave   | Subscriber | Male   | 1987 |\n",
       "| 25223641 | 2019-10-01 00:02:16 | 2019-10-01 00:06:34 | 6328 |  258 |  19 | Throop (Loomis) St &amp; Taylor St | 241 | Morgan St &amp; Polk St         | Subscriber | Male   | 1998 |\n",
       "| 25223642 | 2019-10-01 00:04:32 | 2019-10-01 00:18:43 | 3003 |  850 |  84 | Milwaukee Ave &amp; Grand Ave      | 199 | Wabash Ave &amp; Grand Ave      | Subscriber | Female | 1991 |\n",
       "| 25223643 | 2019-10-01 00:04:32 | 2019-10-01 00:43:43 | 3275 | 2350 | 313 | Lakeview Ave &amp; Fullerton Pkwy  | 290 | Kedzie Ave &amp; Palmer Ct      | Subscriber | Male   | 1990 |\n",
       "| 25223644 | 2019-10-01 00:04:34 | 2019-10-01 00:35:42 | 5294 | 1867 | 210 | Ashland Ave &amp; Division St      | 382 | Western Ave &amp; Congress Pkwy | Subscriber | Male   | 1987 |\n",
       "| 25223645 | 2019-10-01 00:04:38 | 2019-10-01 00:10:51 | 1891 |  373 | 156 | Clark St &amp; Wellington Ave      | 226 | Racine Ave &amp; Belmont Ave    | Subscriber | Female | 1994 |\n",
       "\n"
      ],
      "text/plain": [
       "  ride_id  started_at          ended_at            rideable_type tripduration\n",
       "1 25223640 2019-10-01 00:01:39 2019-10-01 00:17:20 2215           940        \n",
       "2 25223641 2019-10-01 00:02:16 2019-10-01 00:06:34 6328           258        \n",
       "3 25223642 2019-10-01 00:04:32 2019-10-01 00:18:43 3003           850        \n",
       "4 25223643 2019-10-01 00:04:32 2019-10-01 00:43:43 3275          2350        \n",
       "5 25223644 2019-10-01 00:04:34 2019-10-01 00:35:42 5294          1867        \n",
       "6 25223645 2019-10-01 00:04:38 2019-10-01 00:10:51 1891           373        \n",
       "  start_station_id start_station_name             end_station_id\n",
       "1  20              Sheffield Ave & Kingsbury St   309           \n",
       "2  19              Throop (Loomis) St & Taylor St 241           \n",
       "3  84              Milwaukee Ave & Grand Ave      199           \n",
       "4 313              Lakeview Ave & Fullerton Pkwy  290           \n",
       "5 210              Ashland Ave & Division St      382           \n",
       "6 156              Clark St & Wellington Ave      226           \n",
       "  end_station_name            member_casual gender birthyear\n",
       "1 Leavitt St & Armitage Ave   Subscriber    Male   1987     \n",
       "2 Morgan St & Polk St         Subscriber    Male   1998     \n",
       "3 Wabash Ave & Grand Ave      Subscriber    Female 1991     \n",
       "4 Kedzie Ave & Palmer Ct      Subscriber    Male   1990     \n",
       "5 Western Ave & Congress Pkwy Subscriber    Male   1987     \n",
       "6 Racine Ave & Belmont Ave    Subscriber    Female 1994     "
      ]
     },
     "metadata": {},
     "output_type": "display_data"
    }
   ],
   "source": [
    "(q4_2019<-rename(q4_2019,\n",
    "                 ride_id=trip_id,\n",
    "                 rideable_type=bikeid,\n",
    "                 started_at=start_time,\n",
    "                 ended_at=end_time,\n",
    "                 start_station_name=from_station_name,\n",
    "                 start_station_id=from_station_id,\n",
    "                 end_station_name=to_station_name,\n",
    "                 end_station_id=to_station_id,\n",
    "                 member_casual=usertype))%>%\n",
    "head(6)"
   ]
  },
  {
   "cell_type": "code",
   "execution_count": 11,
   "id": "93f11071",
   "metadata": {
    "_cell_guid": "c2f5b234-9bc0-42af-8fcd-62d8c466a2eb",
    "_kg_hide-output": true,
    "_uuid": "2924f27e-8477-4b65-950d-861ee6fd5618",
    "collapsed": false,
    "execution": {
     "iopub.execute_input": "2024-03-12T03:02:21.986431Z",
     "iopub.status.busy": "2024-03-12T03:02:21.984064Z",
     "iopub.status.idle": "2024-03-12T03:02:22.160035Z",
     "shell.execute_reply": "2024-03-12T03:02:22.157503Z"
    },
    "jupyter": {
     "outputs_hidden": false
    },
    "papermill": {
     "duration": 0.20514,
     "end_time": "2024-03-12T03:02:22.163022",
     "exception": false,
     "start_time": "2024-03-12T03:02:21.957882",
     "status": "completed"
    },
    "tags": []
   },
   "outputs": [
    {
     "name": "stdout",
     "output_type": "stream",
     "text": [
      "spc_tbl_ [1,108,163 × 12] (S3: spec_tbl_df/tbl_df/tbl/data.frame)\n",
      " $ ride_id                                         : num [1:1108163] 22178529 22178530 22178531 22178532 22178533 ...\n",
      " $ started_at                                      : POSIXct[1:1108163], format: \"2019-04-01 00:02:22\" \"2019-04-01 00:03:02\" ...\n",
      " $ ended_at                                        : POSIXct[1:1108163], format: \"2019-04-01 00:09:48\" \"2019-04-01 00:20:30\" ...\n",
      " $ rideable_type                                   : num [1:1108163] 6251 6226 5649 4151 3270 ...\n",
      " $ 01 - Rental Details Duration In Seconds Uncapped: num [1:1108163] 446 1048 252 357 1007 ...\n",
      " $ start_station_id                                : num [1:1108163] 81 317 283 26 202 420 503 260 211 211 ...\n",
      " $ start_station_name                              : chr [1:1108163] \"Daley Center Plaza\" \"Wood St & Taylor St\" \"LaSalle St & Jackson Blvd\" \"McClurg Ct & Illinois St\" ...\n",
      " $ end_station_id                                  : num [1:1108163] 56 59 174 133 129 426 500 499 211 211 ...\n",
      " $ end_station_name                                : chr [1:1108163] \"Desplaines St & Kinzie St\" \"Wabash Ave & Roosevelt Rd\" \"Canal St & Madison St\" \"Kingsbury St & Kinzie St\" ...\n",
      " $ member_casual                                   : chr [1:1108163] \"Subscriber\" \"Subscriber\" \"Subscriber\" \"Subscriber\" ...\n",
      " $ Member Gender                                   : chr [1:1108163] \"Male\" \"Female\" \"Male\" \"Male\" ...\n",
      " $ 05 - Member Details Member Birthday Year        : num [1:1108163] 1975 1984 1990 1993 1992 ...\n",
      " - attr(*, \"spec\")=\n",
      "  .. cols(\n",
      "  ..   `01 - Rental Details Rental ID` = \u001b[32mcol_double()\u001b[39m,\n",
      "  ..   `01 - Rental Details Local Start Time` = \u001b[34mcol_datetime(format = \"\")\u001b[39m,\n",
      "  ..   `01 - Rental Details Local End Time` = \u001b[34mcol_datetime(format = \"\")\u001b[39m,\n",
      "  ..   `01 - Rental Details Bike ID` = \u001b[32mcol_double()\u001b[39m,\n",
      "  ..   `01 - Rental Details Duration In Seconds Uncapped` = \u001b[32mcol_number()\u001b[39m,\n",
      "  ..   `03 - Rental Start Station ID` = \u001b[32mcol_double()\u001b[39m,\n",
      "  ..   `03 - Rental Start Station Name` = \u001b[31mcol_character()\u001b[39m,\n",
      "  ..   `02 - Rental End Station ID` = \u001b[32mcol_double()\u001b[39m,\n",
      "  ..   `02 - Rental End Station Name` = \u001b[31mcol_character()\u001b[39m,\n",
      "  ..   `User Type` = \u001b[31mcol_character()\u001b[39m,\n",
      "  ..   `Member Gender` = \u001b[31mcol_character()\u001b[39m,\n",
      "  ..   `05 - Member Details Member Birthday Year` = \u001b[32mcol_double()\u001b[39m\n",
      "  .. )\n",
      " - attr(*, \"problems\")=<externalptr> \n",
      "spc_tbl_ [1,640,718 × 12] (S3: spec_tbl_df/tbl_df/tbl/data.frame)\n",
      " $ ride_id           : num [1:1640718] 23479388 23479389 23479390 23479391 23479392 ...\n",
      " $ started_at        : POSIXct[1:1640718], format: \"2019-07-01 00:00:27\" \"2019-07-01 00:01:16\" ...\n",
      " $ ended_at          : POSIXct[1:1640718], format: \"2019-07-01 00:20:41\" \"2019-07-01 00:18:44\" ...\n",
      " $ rideable_type     : num [1:1640718] 3591 5353 6180 5540 6014 ...\n",
      " $ tripduration      : num [1:1640718] 1214 1048 1554 1503 1213 ...\n",
      " $ start_station_id  : num [1:1640718] 117 381 313 313 168 300 168 313 43 43 ...\n",
      " $ start_station_name: chr [1:1640718] \"Wilton Ave & Belmont Ave\" \"Western Ave & Monroe St\" \"Lakeview Ave & Fullerton Pkwy\" \"Lakeview Ave & Fullerton Pkwy\" ...\n",
      " $ end_station_id    : num [1:1640718] 497 203 144 144 62 232 62 144 195 195 ...\n",
      " $ end_station_name  : chr [1:1640718] \"Kimball Ave & Belmont Ave\" \"Western Ave & 21st St\" \"Larrabee St & Webster Ave\" \"Larrabee St & Webster Ave\" ...\n",
      " $ member_casual     : chr [1:1640718] \"Subscriber\" \"Customer\" \"Customer\" \"Customer\" ...\n",
      " $ gender            : chr [1:1640718] \"Male\" NA NA NA ...\n",
      " $ birthyear         : num [1:1640718] 1992 NA NA NA NA ...\n",
      " - attr(*, \"spec\")=\n",
      "  .. cols(\n",
      "  ..   trip_id = \u001b[32mcol_double()\u001b[39m,\n",
      "  ..   start_time = \u001b[34mcol_datetime(format = \"\")\u001b[39m,\n",
      "  ..   end_time = \u001b[34mcol_datetime(format = \"\")\u001b[39m,\n",
      "  ..   bikeid = \u001b[32mcol_double()\u001b[39m,\n",
      "  ..   tripduration = \u001b[32mcol_number()\u001b[39m,\n",
      "  ..   from_station_id = \u001b[32mcol_double()\u001b[39m,\n",
      "  ..   from_station_name = \u001b[31mcol_character()\u001b[39m,\n",
      "  ..   to_station_id = \u001b[32mcol_double()\u001b[39m,\n",
      "  ..   to_station_name = \u001b[31mcol_character()\u001b[39m,\n",
      "  ..   usertype = \u001b[31mcol_character()\u001b[39m,\n",
      "  ..   gender = \u001b[31mcol_character()\u001b[39m,\n",
      "  ..   birthyear = \u001b[32mcol_double()\u001b[39m\n",
      "  .. )\n",
      " - attr(*, \"problems\")=<externalptr> \n",
      "spc_tbl_ [704,054 × 12] (S3: spec_tbl_df/tbl_df/tbl/data.frame)\n",
      " $ ride_id           : num [1:704054] 25223640 25223641 25223642 25223643 25223644 ...\n",
      " $ started_at        : POSIXct[1:704054], format: \"2019-10-01 00:01:39\" \"2019-10-01 00:02:16\" ...\n",
      " $ ended_at          : POSIXct[1:704054], format: \"2019-10-01 00:17:20\" \"2019-10-01 00:06:34\" ...\n",
      " $ rideable_type     : num [1:704054] 2215 6328 3003 3275 5294 ...\n",
      " $ tripduration      : num [1:704054] 940 258 850 2350 1867 ...\n",
      " $ start_station_id  : num [1:704054] 20 19 84 313 210 156 84 156 156 336 ...\n",
      " $ start_station_name: chr [1:704054] \"Sheffield Ave & Kingsbury St\" \"Throop (Loomis) St & Taylor St\" \"Milwaukee Ave & Grand Ave\" \"Lakeview Ave & Fullerton Pkwy\" ...\n",
      " $ end_station_id    : num [1:704054] 309 241 199 290 382 226 142 463 463 336 ...\n",
      " $ end_station_name  : chr [1:704054] \"Leavitt St & Armitage Ave\" \"Morgan St & Polk St\" \"Wabash Ave & Grand Ave\" \"Kedzie Ave & Palmer Ct\" ...\n",
      " $ member_casual     : chr [1:704054] \"Subscriber\" \"Subscriber\" \"Subscriber\" \"Subscriber\" ...\n",
      " $ gender            : chr [1:704054] \"Male\" \"Male\" \"Female\" \"Male\" ...\n",
      " $ birthyear         : num [1:704054] 1987 1998 1991 1990 1987 ...\n",
      " - attr(*, \"spec\")=\n",
      "  .. cols(\n",
      "  ..   trip_id = \u001b[32mcol_double()\u001b[39m,\n",
      "  ..   start_time = \u001b[34mcol_datetime(format = \"\")\u001b[39m,\n",
      "  ..   end_time = \u001b[34mcol_datetime(format = \"\")\u001b[39m,\n",
      "  ..   bikeid = \u001b[32mcol_double()\u001b[39m,\n",
      "  ..   tripduration = \u001b[32mcol_number()\u001b[39m,\n",
      "  ..   from_station_id = \u001b[32mcol_double()\u001b[39m,\n",
      "  ..   from_station_name = \u001b[31mcol_character()\u001b[39m,\n",
      "  ..   to_station_id = \u001b[32mcol_double()\u001b[39m,\n",
      "  ..   to_station_name = \u001b[31mcol_character()\u001b[39m,\n",
      "  ..   usertype = \u001b[31mcol_character()\u001b[39m,\n",
      "  ..   gender = \u001b[31mcol_character()\u001b[39m,\n",
      "  ..   birthyear = \u001b[32mcol_double()\u001b[39m\n",
      "  .. )\n",
      " - attr(*, \"problems\")=<externalptr> \n",
      "spc_tbl_ [426,887 × 13] (S3: spec_tbl_df/tbl_df/tbl/data.frame)\n",
      " $ ride_id           : chr [1:426887] \"EACB19130B0CDA4A\" \"8FED874C809DC021\" \"789F3C21E472CA96\" \"C9A388DAC6ABF313\" ...\n",
      " $ rideable_type     : chr [1:426887] \"docked_bike\" \"docked_bike\" \"docked_bike\" \"docked_bike\" ...\n",
      " $ started_at        : POSIXct[1:426887], format: \"2020-01-21 20:06:59\" \"2020-01-30 14:22:39\" ...\n",
      " $ ended_at          : POSIXct[1:426887], format: \"2020-01-21 20:14:30\" \"2020-01-30 14:26:22\" ...\n",
      " $ start_station_name: chr [1:426887] \"Western Ave & Leland Ave\" \"Clark St & Montrose Ave\" \"Broadway & Belmont Ave\" \"Clark St & Randolph St\" ...\n",
      " $ start_station_id  : num [1:426887] 239 234 296 51 66 212 96 96 212 38 ...\n",
      " $ end_station_name  : chr [1:426887] \"Clark St & Leland Ave\" \"Southport Ave & Irving Park Rd\" \"Wilton Ave & Belmont Ave\" \"Fairbanks Ct & Grand Ave\" ...\n",
      " $ end_station_id    : num [1:426887] 326 318 117 24 212 96 212 212 96 100 ...\n",
      " $ start_lat         : num [1:426887] 42 42 41.9 41.9 41.9 ...\n",
      " $ start_lng         : num [1:426887] -87.7 -87.7 -87.6 -87.6 -87.6 ...\n",
      " $ end_lat           : num [1:426887] 42 42 41.9 41.9 41.9 ...\n",
      " $ end_lng           : num [1:426887] -87.7 -87.7 -87.7 -87.6 -87.6 ...\n",
      " $ member_casual     : chr [1:426887] \"member\" \"member\" \"member\" \"member\" ...\n",
      " - attr(*, \"spec\")=\n",
      "  .. cols(\n",
      "  ..   ride_id = \u001b[31mcol_character()\u001b[39m,\n",
      "  ..   rideable_type = \u001b[31mcol_character()\u001b[39m,\n",
      "  ..   started_at = \u001b[34mcol_datetime(format = \"\")\u001b[39m,\n",
      "  ..   ended_at = \u001b[34mcol_datetime(format = \"\")\u001b[39m,\n",
      "  ..   start_station_name = \u001b[31mcol_character()\u001b[39m,\n",
      "  ..   start_station_id = \u001b[32mcol_double()\u001b[39m,\n",
      "  ..   end_station_name = \u001b[31mcol_character()\u001b[39m,\n",
      "  ..   end_station_id = \u001b[32mcol_double()\u001b[39m,\n",
      "  ..   start_lat = \u001b[32mcol_double()\u001b[39m,\n",
      "  ..   start_lng = \u001b[32mcol_double()\u001b[39m,\n",
      "  ..   end_lat = \u001b[32mcol_double()\u001b[39m,\n",
      "  ..   end_lng = \u001b[32mcol_double()\u001b[39m,\n",
      "  ..   member_casual = \u001b[31mcol_character()\u001b[39m\n",
      "  .. )\n",
      " - attr(*, \"problems\")=<externalptr> \n"
     ]
    }
   ],
   "source": [
    "# Inspecting the dataframes and looking for incongruencies\n",
    "str(q2_2019)\n",
    "str(q3_2019)\n",
    "str(q4_2019)\n",
    "str(q1_2020)"
   ]
  },
  {
   "cell_type": "code",
   "execution_count": 12,
   "id": "e2b2834c",
   "metadata": {
    "_cell_guid": "64375e25-2c87-4e4e-9df1-6a122411843e",
    "_uuid": "a2e2801e-3db4-4f5e-bcae-90fdd829cc38",
    "collapsed": false,
    "execution": {
     "iopub.execute_input": "2024-03-12T03:02:22.211975Z",
     "iopub.status.busy": "2024-03-12T03:02:22.209030Z",
     "iopub.status.idle": "2024-03-12T03:02:22.258753Z",
     "shell.execute_reply": "2024-03-12T03:02:22.256136Z"
    },
    "jupyter": {
     "outputs_hidden": false
    },
    "papermill": {
     "duration": 0.075049,
     "end_time": "2024-03-12T03:02:22.262381",
     "exception": false,
     "start_time": "2024-03-12T03:02:22.187332",
     "status": "completed"
    },
    "tags": []
   },
   "outputs": [],
   "source": [
    "# Converting ride_id and rideable_type in q2_2019, q3_2019, q4_2019 from double format to character so that they match with q1_2020\n",
    "\n",
    "q2_2019<-mutate(q2_2019,\n",
    "                ride_id=as.character(ride_id),\n",
    "                rideable_type=as.character(rideable_type))\n",
    "\n",
    "q3_2019<-mutate(q3_2019,\n",
    "                ride_id=as.character(ride_id),\n",
    "                rideable_type=as.character(rideable_type))\n",
    "\n",
    "q4_2019<-mutate(q4_2019,\n",
    "                ride_id=as.character(ride_id),\n",
    "                rideable_type=as.character(rideable_type))"
   ]
  },
  {
   "cell_type": "code",
   "execution_count": 13,
   "id": "d932399e",
   "metadata": {
    "_cell_guid": "ff89aa22-f9d8-416b-9e9c-d0081c0b9e9f",
    "_uuid": "aa9cfe04-728a-4b53-b6b6-3af7b4a53f30",
    "collapsed": false,
    "execution": {
     "iopub.execute_input": "2024-03-12T03:02:22.309790Z",
     "iopub.status.busy": "2024-03-12T03:02:22.306006Z",
     "iopub.status.idle": "2024-03-12T03:02:38.229375Z",
     "shell.execute_reply": "2024-03-12T03:02:38.227447Z"
    },
    "jupyter": {
     "outputs_hidden": false
    },
    "papermill": {
     "duration": 15.947055,
     "end_time": "2024-03-12T03:02:38.232362",
     "exception": false,
     "start_time": "2024-03-12T03:02:22.285307",
     "status": "completed"
    },
    "tags": []
   },
   "outputs": [
    {
     "data": {
      "text/html": [
       "<table class=\"dataframe\">\n",
       "<caption>A tibble: 6 × 19</caption>\n",
       "<thead>\n",
       "\t<tr><th scope=col>ride_id</th><th scope=col>started_at</th><th scope=col>ended_at</th><th scope=col>rideable_type</th><th scope=col>01 - Rental Details Duration In Seconds Uncapped</th><th scope=col>start_station_id</th><th scope=col>start_station_name</th><th scope=col>end_station_id</th><th scope=col>end_station_name</th><th scope=col>member_casual</th><th scope=col>Member Gender</th><th scope=col>05 - Member Details Member Birthday Year</th><th scope=col>tripduration</th><th scope=col>gender</th><th scope=col>birthyear</th><th scope=col>start_lat</th><th scope=col>start_lng</th><th scope=col>end_lat</th><th scope=col>end_lng</th></tr>\n",
       "\t<tr><th scope=col>&lt;chr&gt;</th><th scope=col>&lt;dttm&gt;</th><th scope=col>&lt;dttm&gt;</th><th scope=col>&lt;chr&gt;</th><th scope=col>&lt;dbl&gt;</th><th scope=col>&lt;dbl&gt;</th><th scope=col>&lt;chr&gt;</th><th scope=col>&lt;dbl&gt;</th><th scope=col>&lt;chr&gt;</th><th scope=col>&lt;chr&gt;</th><th scope=col>&lt;chr&gt;</th><th scope=col>&lt;dbl&gt;</th><th scope=col>&lt;dbl&gt;</th><th scope=col>&lt;chr&gt;</th><th scope=col>&lt;dbl&gt;</th><th scope=col>&lt;dbl&gt;</th><th scope=col>&lt;dbl&gt;</th><th scope=col>&lt;dbl&gt;</th><th scope=col>&lt;dbl&gt;</th></tr>\n",
       "</thead>\n",
       "<tbody>\n",
       "\t<tr><td>22178529</td><td>2019-04-01 00:02:22</td><td>2019-04-01 00:09:48</td><td>6251</td><td> 446</td><td> 81</td><td><span style=white-space:pre-wrap>Daley Center Plaza       </span></td><td> 56</td><td>Desplaines St &amp; Kinzie St</td><td>Subscriber</td><td><span style=white-space:pre-wrap>Male  </span></td><td>1975</td><td>NA</td><td>NA</td><td>NA</td><td>NA</td><td>NA</td><td>NA</td><td>NA</td></tr>\n",
       "\t<tr><td>22178530</td><td>2019-04-01 00:03:02</td><td>2019-04-01 00:20:30</td><td>6226</td><td>1048</td><td>317</td><td><span style=white-space:pre-wrap>Wood St &amp; Taylor St      </span></td><td> 59</td><td>Wabash Ave &amp; Roosevelt Rd</td><td>Subscriber</td><td>Female</td><td>1984</td><td>NA</td><td>NA</td><td>NA</td><td>NA</td><td>NA</td><td>NA</td><td>NA</td></tr>\n",
       "\t<tr><td>22178531</td><td>2019-04-01 00:11:07</td><td>2019-04-01 00:15:19</td><td>5649</td><td> 252</td><td>283</td><td>LaSalle St &amp; Jackson Blvd</td><td>174</td><td><span style=white-space:pre-wrap>Canal St &amp; Madison St    </span></td><td>Subscriber</td><td><span style=white-space:pre-wrap>Male  </span></td><td>1990</td><td>NA</td><td>NA</td><td>NA</td><td>NA</td><td>NA</td><td>NA</td><td>NA</td></tr>\n",
       "\t<tr><td>22178532</td><td>2019-04-01 00:13:01</td><td>2019-04-01 00:18:58</td><td>4151</td><td> 357</td><td> 26</td><td>McClurg Ct &amp; Illinois St </td><td>133</td><td>Kingsbury St &amp; Kinzie St </td><td>Subscriber</td><td><span style=white-space:pre-wrap>Male  </span></td><td>1993</td><td>NA</td><td>NA</td><td>NA</td><td>NA</td><td>NA</td><td>NA</td><td>NA</td></tr>\n",
       "\t<tr><td>22178533</td><td>2019-04-01 00:19:26</td><td>2019-04-01 00:36:13</td><td>3270</td><td>1007</td><td>202</td><td><span style=white-space:pre-wrap>Halsted St &amp; 18th St     </span></td><td>129</td><td>Blue Island Ave &amp; 18th St</td><td>Subscriber</td><td><span style=white-space:pre-wrap>Male  </span></td><td>1992</td><td>NA</td><td>NA</td><td>NA</td><td>NA</td><td>NA</td><td>NA</td><td>NA</td></tr>\n",
       "\t<tr><td>22178534</td><td>2019-04-01 00:19:39</td><td>2019-04-01 00:23:56</td><td>3123</td><td> 257</td><td>420</td><td><span style=white-space:pre-wrap>Ellis Ave &amp; 55th St      </span></td><td>426</td><td><span style=white-space:pre-wrap>Ellis Ave &amp; 60th St      </span></td><td>Subscriber</td><td><span style=white-space:pre-wrap>Male  </span></td><td>1999</td><td>NA</td><td>NA</td><td>NA</td><td>NA</td><td>NA</td><td>NA</td><td>NA</td></tr>\n",
       "</tbody>\n",
       "</table>\n"
      ],
      "text/latex": [
       "A tibble: 6 × 19\n",
       "\\begin{tabular}{lllllllllllllllllll}\n",
       " ride\\_id & started\\_at & ended\\_at & rideable\\_type & 01 - Rental Details Duration In Seconds Uncapped & start\\_station\\_id & start\\_station\\_name & end\\_station\\_id & end\\_station\\_name & member\\_casual & Member Gender & 05 - Member Details Member Birthday Year & tripduration & gender & birthyear & start\\_lat & start\\_lng & end\\_lat & end\\_lng\\\\\n",
       " <chr> & <dttm> & <dttm> & <chr> & <dbl> & <dbl> & <chr> & <dbl> & <chr> & <chr> & <chr> & <dbl> & <dbl> & <chr> & <dbl> & <dbl> & <dbl> & <dbl> & <dbl>\\\\\n",
       "\\hline\n",
       "\t 22178529 & 2019-04-01 00:02:22 & 2019-04-01 00:09:48 & 6251 &  446 &  81 & Daley Center Plaza        &  56 & Desplaines St \\& Kinzie St & Subscriber & Male   & 1975 & NA & NA & NA & NA & NA & NA & NA\\\\\n",
       "\t 22178530 & 2019-04-01 00:03:02 & 2019-04-01 00:20:30 & 6226 & 1048 & 317 & Wood St \\& Taylor St       &  59 & Wabash Ave \\& Roosevelt Rd & Subscriber & Female & 1984 & NA & NA & NA & NA & NA & NA & NA\\\\\n",
       "\t 22178531 & 2019-04-01 00:11:07 & 2019-04-01 00:15:19 & 5649 &  252 & 283 & LaSalle St \\& Jackson Blvd & 174 & Canal St \\& Madison St     & Subscriber & Male   & 1990 & NA & NA & NA & NA & NA & NA & NA\\\\\n",
       "\t 22178532 & 2019-04-01 00:13:01 & 2019-04-01 00:18:58 & 4151 &  357 &  26 & McClurg Ct \\& Illinois St  & 133 & Kingsbury St \\& Kinzie St  & Subscriber & Male   & 1993 & NA & NA & NA & NA & NA & NA & NA\\\\\n",
       "\t 22178533 & 2019-04-01 00:19:26 & 2019-04-01 00:36:13 & 3270 & 1007 & 202 & Halsted St \\& 18th St      & 129 & Blue Island Ave \\& 18th St & Subscriber & Male   & 1992 & NA & NA & NA & NA & NA & NA & NA\\\\\n",
       "\t 22178534 & 2019-04-01 00:19:39 & 2019-04-01 00:23:56 & 3123 &  257 & 420 & Ellis Ave \\& 55th St       & 426 & Ellis Ave \\& 60th St       & Subscriber & Male   & 1999 & NA & NA & NA & NA & NA & NA & NA\\\\\n",
       "\\end{tabular}\n"
      ],
      "text/markdown": [
       "\n",
       "A tibble: 6 × 19\n",
       "\n",
       "| ride_id &lt;chr&gt; | started_at &lt;dttm&gt; | ended_at &lt;dttm&gt; | rideable_type &lt;chr&gt; | 01 - Rental Details Duration In Seconds Uncapped &lt;dbl&gt; | start_station_id &lt;dbl&gt; | start_station_name &lt;chr&gt; | end_station_id &lt;dbl&gt; | end_station_name &lt;chr&gt; | member_casual &lt;chr&gt; | Member Gender &lt;chr&gt; | 05 - Member Details Member Birthday Year &lt;dbl&gt; | tripduration &lt;dbl&gt; | gender &lt;chr&gt; | birthyear &lt;dbl&gt; | start_lat &lt;dbl&gt; | start_lng &lt;dbl&gt; | end_lat &lt;dbl&gt; | end_lng &lt;dbl&gt; |\n",
       "|---|---|---|---|---|---|---|---|---|---|---|---|---|---|---|---|---|---|---|\n",
       "| 22178529 | 2019-04-01 00:02:22 | 2019-04-01 00:09:48 | 6251 |  446 |  81 | Daley Center Plaza        |  56 | Desplaines St &amp; Kinzie St | Subscriber | Male   | 1975 | NA | NA | NA | NA | NA | NA | NA |\n",
       "| 22178530 | 2019-04-01 00:03:02 | 2019-04-01 00:20:30 | 6226 | 1048 | 317 | Wood St &amp; Taylor St       |  59 | Wabash Ave &amp; Roosevelt Rd | Subscriber | Female | 1984 | NA | NA | NA | NA | NA | NA | NA |\n",
       "| 22178531 | 2019-04-01 00:11:07 | 2019-04-01 00:15:19 | 5649 |  252 | 283 | LaSalle St &amp; Jackson Blvd | 174 | Canal St &amp; Madison St     | Subscriber | Male   | 1990 | NA | NA | NA | NA | NA | NA | NA |\n",
       "| 22178532 | 2019-04-01 00:13:01 | 2019-04-01 00:18:58 | 4151 |  357 |  26 | McClurg Ct &amp; Illinois St  | 133 | Kingsbury St &amp; Kinzie St  | Subscriber | Male   | 1993 | NA | NA | NA | NA | NA | NA | NA |\n",
       "| 22178533 | 2019-04-01 00:19:26 | 2019-04-01 00:36:13 | 3270 | 1007 | 202 | Halsted St &amp; 18th St      | 129 | Blue Island Ave &amp; 18th St | Subscriber | Male   | 1992 | NA | NA | NA | NA | NA | NA | NA |\n",
       "| 22178534 | 2019-04-01 00:19:39 | 2019-04-01 00:23:56 | 3123 |  257 | 420 | Ellis Ave &amp; 55th St       | 426 | Ellis Ave &amp; 60th St       | Subscriber | Male   | 1999 | NA | NA | NA | NA | NA | NA | NA |\n",
       "\n"
      ],
      "text/plain": [
       "  ride_id  started_at          ended_at            rideable_type\n",
       "1 22178529 2019-04-01 00:02:22 2019-04-01 00:09:48 6251         \n",
       "2 22178530 2019-04-01 00:03:02 2019-04-01 00:20:30 6226         \n",
       "3 22178531 2019-04-01 00:11:07 2019-04-01 00:15:19 5649         \n",
       "4 22178532 2019-04-01 00:13:01 2019-04-01 00:18:58 4151         \n",
       "5 22178533 2019-04-01 00:19:26 2019-04-01 00:36:13 3270         \n",
       "6 22178534 2019-04-01 00:19:39 2019-04-01 00:23:56 3123         \n",
       "  01 - Rental Details Duration In Seconds Uncapped start_station_id\n",
       "1  446                                              81             \n",
       "2 1048                                             317             \n",
       "3  252                                             283             \n",
       "4  357                                              26             \n",
       "5 1007                                             202             \n",
       "6  257                                             420             \n",
       "  start_station_name        end_station_id end_station_name         \n",
       "1 Daley Center Plaza         56            Desplaines St & Kinzie St\n",
       "2 Wood St & Taylor St        59            Wabash Ave & Roosevelt Rd\n",
       "3 LaSalle St & Jackson Blvd 174            Canal St & Madison St    \n",
       "4 McClurg Ct & Illinois St  133            Kingsbury St & Kinzie St \n",
       "5 Halsted St & 18th St      129            Blue Island Ave & 18th St\n",
       "6 Ellis Ave & 55th St       426            Ellis Ave & 60th St      \n",
       "  member_casual Member Gender 05 - Member Details Member Birthday Year\n",
       "1 Subscriber    Male          1975                                    \n",
       "2 Subscriber    Female        1984                                    \n",
       "3 Subscriber    Male          1990                                    \n",
       "4 Subscriber    Male          1993                                    \n",
       "5 Subscriber    Male          1992                                    \n",
       "6 Subscriber    Male          1999                                    \n",
       "  tripduration gender birthyear start_lat start_lng end_lat end_lng\n",
       "1 NA           NA     NA        NA        NA        NA      NA     \n",
       "2 NA           NA     NA        NA        NA        NA      NA     \n",
       "3 NA           NA     NA        NA        NA        NA      NA     \n",
       "4 NA           NA     NA        NA        NA        NA      NA     \n",
       "5 NA           NA     NA        NA        NA        NA      NA     \n",
       "6 NA           NA     NA        NA        NA        NA      NA     "
      ]
     },
     "metadata": {},
     "output_type": "display_data"
    },
    {
     "data": {
      "text/html": [
       "<style>\n",
       ".list-inline {list-style: none; margin:0; padding: 0}\n",
       ".list-inline>li {display: inline-block}\n",
       ".list-inline>li:not(:last-child)::after {content: \"\\00b7\"; padding: 0 .5ex}\n",
       "</style>\n",
       "<ol class=list-inline><li>'ride_id'</li><li>'started_at'</li><li>'ended_at'</li><li>'rideable_type'</li><li>'01 - Rental Details Duration In Seconds Uncapped'</li><li>'start_station_id'</li><li>'start_station_name'</li><li>'end_station_id'</li><li>'end_station_name'</li><li>'member_casual'</li><li>'Member Gender'</li><li>'05 - Member Details Member Birthday Year'</li><li>'tripduration'</li><li>'gender'</li><li>'birthyear'</li><li>'start_lat'</li><li>'start_lng'</li><li>'end_lat'</li><li>'end_lng'</li></ol>\n"
      ],
      "text/latex": [
       "\\begin{enumerate*}\n",
       "\\item 'ride\\_id'\n",
       "\\item 'started\\_at'\n",
       "\\item 'ended\\_at'\n",
       "\\item 'rideable\\_type'\n",
       "\\item '01 - Rental Details Duration In Seconds Uncapped'\n",
       "\\item 'start\\_station\\_id'\n",
       "\\item 'start\\_station\\_name'\n",
       "\\item 'end\\_station\\_id'\n",
       "\\item 'end\\_station\\_name'\n",
       "\\item 'member\\_casual'\n",
       "\\item 'Member Gender'\n",
       "\\item '05 - Member Details Member Birthday Year'\n",
       "\\item 'tripduration'\n",
       "\\item 'gender'\n",
       "\\item 'birthyear'\n",
       "\\item 'start\\_lat'\n",
       "\\item 'start\\_lng'\n",
       "\\item 'end\\_lat'\n",
       "\\item 'end\\_lng'\n",
       "\\end{enumerate*}\n"
      ],
      "text/markdown": [
       "1. 'ride_id'\n",
       "2. 'started_at'\n",
       "3. 'ended_at'\n",
       "4. 'rideable_type'\n",
       "5. '01 - Rental Details Duration In Seconds Uncapped'\n",
       "6. 'start_station_id'\n",
       "7. 'start_station_name'\n",
       "8. 'end_station_id'\n",
       "9. 'end_station_name'\n",
       "10. 'member_casual'\n",
       "11. 'Member Gender'\n",
       "12. '05 - Member Details Member Birthday Year'\n",
       "13. 'tripduration'\n",
       "14. 'gender'\n",
       "15. 'birthyear'\n",
       "16. 'start_lat'\n",
       "17. 'start_lng'\n",
       "18. 'end_lat'\n",
       "19. 'end_lng'\n",
       "\n",
       "\n"
      ],
      "text/plain": [
       " [1] \"ride_id\"                                         \n",
       " [2] \"started_at\"                                      \n",
       " [3] \"ended_at\"                                        \n",
       " [4] \"rideable_type\"                                   \n",
       " [5] \"01 - Rental Details Duration In Seconds Uncapped\"\n",
       " [6] \"start_station_id\"                                \n",
       " [7] \"start_station_name\"                              \n",
       " [8] \"end_station_id\"                                  \n",
       " [9] \"end_station_name\"                                \n",
       "[10] \"member_casual\"                                   \n",
       "[11] \"Member Gender\"                                   \n",
       "[12] \"05 - Member Details Member Birthday Year\"        \n",
       "[13] \"tripduration\"                                    \n",
       "[14] \"gender\"                                          \n",
       "[15] \"birthyear\"                                       \n",
       "[16] \"start_lat\"                                       \n",
       "[17] \"start_lng\"                                       \n",
       "[18] \"end_lat\"                                         \n",
       "[19] \"end_lng\"                                         "
      ]
     },
     "metadata": {},
     "output_type": "display_data"
    }
   ],
   "source": [
    "# Now that our data's column names are matching and in the same format, we should stack individual quarter's data frames into one big data frame\n",
    "\n",
    "all_trips <- bind_rows(q2_2019, q3_2019, q4_2019, q1_2020)\n",
    "head(all_trips)\n",
    "colnames(all_trips)"
   ]
  },
  {
   "cell_type": "code",
   "execution_count": 14,
   "id": "abbbd5e4",
   "metadata": {
    "_cell_guid": "4361c7ef-cc4f-4808-8af8-1f02bc2e34bc",
    "_uuid": "98ef185b-50f6-443b-9415-c6c128adc96b",
    "collapsed": false,
    "execution": {
     "iopub.execute_input": "2024-03-12T03:02:38.274288Z",
     "iopub.status.busy": "2024-03-12T03:02:38.272541Z",
     "iopub.status.idle": "2024-03-12T03:02:38.302186Z",
     "shell.execute_reply": "2024-03-12T03:02:38.300127Z"
    },
    "jupyter": {
     "outputs_hidden": false
    },
    "papermill": {
     "duration": 0.054469,
     "end_time": "2024-03-12T03:02:38.304879",
     "exception": false,
     "start_time": "2024-03-12T03:02:38.250410",
     "status": "completed"
    },
    "tags": []
   },
   "outputs": [],
   "source": [
    "# Removing redundant and repetitive fields - lat, long, birthyear, gender fields, as this data was dropped beginning in 2020\n",
    "# Also removing tripduration field, since not all entries contained this information, and thereby it will be recreated for all entries during process phase\n",
    "\n",
    "all_trips <- all_trips %>%  \n",
    "  select(-c(start_lat, start_lng, end_lat, end_lng, birthyear, \n",
    "            gender, tripduration, `Member Gender`, `05 - Member Details Member Birthday Year`, \n",
    "            `01 - Rental Details Duration In Seconds Uncapped`\n",
    "           ))"
   ]
  },
  {
   "cell_type": "markdown",
   "id": "35fff999",
   "metadata": {
    "_cell_guid": "49b60ce9-a076-4b94-9d90-d901dad74a03",
    "_uuid": "5e6a2a69-33bb-44c9-82b9-84674607765a",
    "papermill": {
     "duration": 0.017537,
     "end_time": "2024-03-12T03:02:38.340821",
     "exception": false,
     "start_time": "2024-03-12T03:02:38.323284",
     "status": "completed"
    },
    "tags": []
   },
   "source": [
    "# Step 3: Process\n",
    "\n",
    "Key tasks:\n",
    "\n",
    "**1. Check the data for errors.**"
   ]
  },
  {
   "cell_type": "code",
   "execution_count": 15,
   "id": "91864e47",
   "metadata": {
    "_cell_guid": "54d3032a-a50b-488e-b8e5-35d5885201e5",
    "_uuid": "21be1dcf-ebe9-4504-a2da-8241a182447b",
    "collapsed": false,
    "execution": {
     "iopub.execute_input": "2024-03-12T03:02:38.381559Z",
     "iopub.status.busy": "2024-03-12T03:02:38.379704Z",
     "iopub.status.idle": "2024-03-12T03:02:38.400347Z",
     "shell.execute_reply": "2024-03-12T03:02:38.398429Z"
    },
    "jupyter": {
     "outputs_hidden": false
    },
    "papermill": {
     "duration": 0.044293,
     "end_time": "2024-03-12T03:02:38.402929",
     "exception": false,
     "start_time": "2024-03-12T03:02:38.358636",
     "status": "completed"
    },
    "tags": []
   },
   "outputs": [
    {
     "data": {
      "text/html": [
       "<style>\n",
       ".list-inline {list-style: none; margin:0; padding: 0}\n",
       ".list-inline>li {display: inline-block}\n",
       ".list-inline>li:not(:last-child)::after {content: \"\\00b7\"; padding: 0 .5ex}\n",
       "</style>\n",
       "<ol class=list-inline><li>'ride_id'</li><li>'started_at'</li><li>'ended_at'</li><li>'rideable_type'</li><li>'start_station_id'</li><li>'start_station_name'</li><li>'end_station_id'</li><li>'end_station_name'</li><li>'member_casual'</li></ol>\n"
      ],
      "text/latex": [
       "\\begin{enumerate*}\n",
       "\\item 'ride\\_id'\n",
       "\\item 'started\\_at'\n",
       "\\item 'ended\\_at'\n",
       "\\item 'rideable\\_type'\n",
       "\\item 'start\\_station\\_id'\n",
       "\\item 'start\\_station\\_name'\n",
       "\\item 'end\\_station\\_id'\n",
       "\\item 'end\\_station\\_name'\n",
       "\\item 'member\\_casual'\n",
       "\\end{enumerate*}\n"
      ],
      "text/markdown": [
       "1. 'ride_id'\n",
       "2. 'started_at'\n",
       "3. 'ended_at'\n",
       "4. 'rideable_type'\n",
       "5. 'start_station_id'\n",
       "6. 'start_station_name'\n",
       "7. 'end_station_id'\n",
       "8. 'end_station_name'\n",
       "9. 'member_casual'\n",
       "\n",
       "\n"
      ],
      "text/plain": [
       "[1] \"ride_id\"            \"started_at\"         \"ended_at\"          \n",
       "[4] \"rideable_type\"      \"start_station_id\"   \"start_station_name\"\n",
       "[7] \"end_station_id\"     \"end_station_name\"   \"member_casual\"     "
      ]
     },
     "metadata": {},
     "output_type": "display_data"
    }
   ],
   "source": [
    "# Inspecting the new table that has been created:\n",
    "\n",
    "colnames(all_trips)  # List of column names"
   ]
  },
  {
   "cell_type": "code",
   "execution_count": 16,
   "id": "515dfc98",
   "metadata": {
    "_cell_guid": "41818358-726a-47f3-9572-944ca1f210e4",
    "_uuid": "40e162f4-290b-4eb8-a36b-ba1c06d7edac",
    "collapsed": false,
    "execution": {
     "iopub.execute_input": "2024-03-12T03:02:38.442036Z",
     "iopub.status.busy": "2024-03-12T03:02:38.440280Z",
     "iopub.status.idle": "2024-03-12T03:02:38.465824Z",
     "shell.execute_reply": "2024-03-12T03:02:38.463571Z"
    },
    "jupyter": {
     "outputs_hidden": false
    },
    "papermill": {
     "duration": 0.048103,
     "end_time": "2024-03-12T03:02:38.468561",
     "exception": false,
     "start_time": "2024-03-12T03:02:38.420458",
     "status": "completed"
    },
    "tags": []
   },
   "outputs": [
    {
     "data": {
      "text/html": [
       "3879822"
      ],
      "text/latex": [
       "3879822"
      ],
      "text/markdown": [
       "3879822"
      ],
      "text/plain": [
       "[1] 3879822"
      ]
     },
     "metadata": {},
     "output_type": "display_data"
    }
   ],
   "source": [
    "nrow(all_trips) # number of rows in data frame"
   ]
  },
  {
   "cell_type": "code",
   "execution_count": 17,
   "id": "83c3afa9",
   "metadata": {
    "_cell_guid": "d181dad7-2154-43b9-8da8-f6ca7f1c2660",
    "_uuid": "714ccb10-e1ba-408a-8cf9-345c1ed715a0",
    "collapsed": false,
    "execution": {
     "iopub.execute_input": "2024-03-12T03:02:38.512797Z",
     "iopub.status.busy": "2024-03-12T03:02:38.510188Z",
     "iopub.status.idle": "2024-03-12T03:02:38.539402Z",
     "shell.execute_reply": "2024-03-12T03:02:38.536755Z"
    },
    "jupyter": {
     "outputs_hidden": false
    },
    "papermill": {
     "duration": 0.055087,
     "end_time": "2024-03-12T03:02:38.543252",
     "exception": false,
     "start_time": "2024-03-12T03:02:38.488165",
     "status": "completed"
    },
    "tags": []
   },
   "outputs": [
    {
     "data": {
      "text/html": [
       "<style>\n",
       ".list-inline {list-style: none; margin:0; padding: 0}\n",
       ".list-inline>li {display: inline-block}\n",
       ".list-inline>li:not(:last-child)::after {content: \"\\00b7\"; padding: 0 .5ex}\n",
       "</style>\n",
       "<ol class=list-inline><li>3879822</li><li>9</li></ol>\n"
      ],
      "text/latex": [
       "\\begin{enumerate*}\n",
       "\\item 3879822\n",
       "\\item 9\n",
       "\\end{enumerate*}\n"
      ],
      "text/markdown": [
       "1. 3879822\n",
       "2. 9\n",
       "\n",
       "\n"
      ],
      "text/plain": [
       "[1] 3879822       9"
      ]
     },
     "metadata": {},
     "output_type": "display_data"
    }
   ],
   "source": [
    "dim(all_trips) # dimensions of data frame"
   ]
  },
  {
   "cell_type": "code",
   "execution_count": 18,
   "id": "06560bad",
   "metadata": {
    "_cell_guid": "b36c1290-db6c-4f3d-a09c-f453427334ee",
    "_uuid": "c4ce6a5f-53eb-4d8d-b694-9acb4f229242",
    "collapsed": false,
    "execution": {
     "iopub.execute_input": "2024-03-12T03:02:38.585423Z",
     "iopub.status.busy": "2024-03-12T03:02:38.582755Z",
     "iopub.status.idle": "2024-03-12T03:02:38.645087Z",
     "shell.execute_reply": "2024-03-12T03:02:38.641899Z"
    },
    "jupyter": {
     "outputs_hidden": false
    },
    "papermill": {
     "duration": 0.087303,
     "end_time": "2024-03-12T03:02:38.648856",
     "exception": false,
     "start_time": "2024-03-12T03:02:38.561553",
     "status": "completed"
    },
    "tags": []
   },
   "outputs": [
    {
     "data": {
      "text/html": [
       "<table class=\"dataframe\">\n",
       "<caption>A tibble: 6 × 9</caption>\n",
       "<thead>\n",
       "\t<tr><th scope=col>ride_id</th><th scope=col>started_at</th><th scope=col>ended_at</th><th scope=col>rideable_type</th><th scope=col>start_station_id</th><th scope=col>start_station_name</th><th scope=col>end_station_id</th><th scope=col>end_station_name</th><th scope=col>member_casual</th></tr>\n",
       "\t<tr><th scope=col>&lt;chr&gt;</th><th scope=col>&lt;dttm&gt;</th><th scope=col>&lt;dttm&gt;</th><th scope=col>&lt;chr&gt;</th><th scope=col>&lt;dbl&gt;</th><th scope=col>&lt;chr&gt;</th><th scope=col>&lt;dbl&gt;</th><th scope=col>&lt;chr&gt;</th><th scope=col>&lt;chr&gt;</th></tr>\n",
       "</thead>\n",
       "<tbody>\n",
       "\t<tr><td>22178529</td><td>2019-04-01 00:02:22</td><td>2019-04-01 00:09:48</td><td>6251</td><td> 81</td><td><span style=white-space:pre-wrap>Daley Center Plaza       </span></td><td> 56</td><td>Desplaines St &amp; Kinzie St</td><td>Subscriber</td></tr>\n",
       "\t<tr><td>22178530</td><td>2019-04-01 00:03:02</td><td>2019-04-01 00:20:30</td><td>6226</td><td>317</td><td><span style=white-space:pre-wrap>Wood St &amp; Taylor St      </span></td><td> 59</td><td>Wabash Ave &amp; Roosevelt Rd</td><td>Subscriber</td></tr>\n",
       "\t<tr><td>22178531</td><td>2019-04-01 00:11:07</td><td>2019-04-01 00:15:19</td><td>5649</td><td>283</td><td>LaSalle St &amp; Jackson Blvd</td><td>174</td><td><span style=white-space:pre-wrap>Canal St &amp; Madison St    </span></td><td>Subscriber</td></tr>\n",
       "\t<tr><td>22178532</td><td>2019-04-01 00:13:01</td><td>2019-04-01 00:18:58</td><td>4151</td><td> 26</td><td>McClurg Ct &amp; Illinois St </td><td>133</td><td>Kingsbury St &amp; Kinzie St </td><td>Subscriber</td></tr>\n",
       "\t<tr><td>22178533</td><td>2019-04-01 00:19:26</td><td>2019-04-01 00:36:13</td><td>3270</td><td>202</td><td><span style=white-space:pre-wrap>Halsted St &amp; 18th St     </span></td><td>129</td><td>Blue Island Ave &amp; 18th St</td><td>Subscriber</td></tr>\n",
       "\t<tr><td>22178534</td><td>2019-04-01 00:19:39</td><td>2019-04-01 00:23:56</td><td>3123</td><td>420</td><td><span style=white-space:pre-wrap>Ellis Ave &amp; 55th St      </span></td><td>426</td><td><span style=white-space:pre-wrap>Ellis Ave &amp; 60th St      </span></td><td>Subscriber</td></tr>\n",
       "</tbody>\n",
       "</table>\n"
      ],
      "text/latex": [
       "A tibble: 6 × 9\n",
       "\\begin{tabular}{lllllllll}\n",
       " ride\\_id & started\\_at & ended\\_at & rideable\\_type & start\\_station\\_id & start\\_station\\_name & end\\_station\\_id & end\\_station\\_name & member\\_casual\\\\\n",
       " <chr> & <dttm> & <dttm> & <chr> & <dbl> & <chr> & <dbl> & <chr> & <chr>\\\\\n",
       "\\hline\n",
       "\t 22178529 & 2019-04-01 00:02:22 & 2019-04-01 00:09:48 & 6251 &  81 & Daley Center Plaza        &  56 & Desplaines St \\& Kinzie St & Subscriber\\\\\n",
       "\t 22178530 & 2019-04-01 00:03:02 & 2019-04-01 00:20:30 & 6226 & 317 & Wood St \\& Taylor St       &  59 & Wabash Ave \\& Roosevelt Rd & Subscriber\\\\\n",
       "\t 22178531 & 2019-04-01 00:11:07 & 2019-04-01 00:15:19 & 5649 & 283 & LaSalle St \\& Jackson Blvd & 174 & Canal St \\& Madison St     & Subscriber\\\\\n",
       "\t 22178532 & 2019-04-01 00:13:01 & 2019-04-01 00:18:58 & 4151 &  26 & McClurg Ct \\& Illinois St  & 133 & Kingsbury St \\& Kinzie St  & Subscriber\\\\\n",
       "\t 22178533 & 2019-04-01 00:19:26 & 2019-04-01 00:36:13 & 3270 & 202 & Halsted St \\& 18th St      & 129 & Blue Island Ave \\& 18th St & Subscriber\\\\\n",
       "\t 22178534 & 2019-04-01 00:19:39 & 2019-04-01 00:23:56 & 3123 & 420 & Ellis Ave \\& 55th St       & 426 & Ellis Ave \\& 60th St       & Subscriber\\\\\n",
       "\\end{tabular}\n"
      ],
      "text/markdown": [
       "\n",
       "A tibble: 6 × 9\n",
       "\n",
       "| ride_id &lt;chr&gt; | started_at &lt;dttm&gt; | ended_at &lt;dttm&gt; | rideable_type &lt;chr&gt; | start_station_id &lt;dbl&gt; | start_station_name &lt;chr&gt; | end_station_id &lt;dbl&gt; | end_station_name &lt;chr&gt; | member_casual &lt;chr&gt; |\n",
       "|---|---|---|---|---|---|---|---|---|\n",
       "| 22178529 | 2019-04-01 00:02:22 | 2019-04-01 00:09:48 | 6251 |  81 | Daley Center Plaza        |  56 | Desplaines St &amp; Kinzie St | Subscriber |\n",
       "| 22178530 | 2019-04-01 00:03:02 | 2019-04-01 00:20:30 | 6226 | 317 | Wood St &amp; Taylor St       |  59 | Wabash Ave &amp; Roosevelt Rd | Subscriber |\n",
       "| 22178531 | 2019-04-01 00:11:07 | 2019-04-01 00:15:19 | 5649 | 283 | LaSalle St &amp; Jackson Blvd | 174 | Canal St &amp; Madison St     | Subscriber |\n",
       "| 22178532 | 2019-04-01 00:13:01 | 2019-04-01 00:18:58 | 4151 |  26 | McClurg Ct &amp; Illinois St  | 133 | Kingsbury St &amp; Kinzie St  | Subscriber |\n",
       "| 22178533 | 2019-04-01 00:19:26 | 2019-04-01 00:36:13 | 3270 | 202 | Halsted St &amp; 18th St      | 129 | Blue Island Ave &amp; 18th St | Subscriber |\n",
       "| 22178534 | 2019-04-01 00:19:39 | 2019-04-01 00:23:56 | 3123 | 420 | Ellis Ave &amp; 55th St       | 426 | Ellis Ave &amp; 60th St       | Subscriber |\n",
       "\n"
      ],
      "text/plain": [
       "  ride_id  started_at          ended_at            rideable_type\n",
       "1 22178529 2019-04-01 00:02:22 2019-04-01 00:09:48 6251         \n",
       "2 22178530 2019-04-01 00:03:02 2019-04-01 00:20:30 6226         \n",
       "3 22178531 2019-04-01 00:11:07 2019-04-01 00:15:19 5649         \n",
       "4 22178532 2019-04-01 00:13:01 2019-04-01 00:18:58 4151         \n",
       "5 22178533 2019-04-01 00:19:26 2019-04-01 00:36:13 3270         \n",
       "6 22178534 2019-04-01 00:19:39 2019-04-01 00:23:56 3123         \n",
       "  start_station_id start_station_name        end_station_id\n",
       "1  81              Daley Center Plaza         56           \n",
       "2 317              Wood St & Taylor St        59           \n",
       "3 283              LaSalle St & Jackson Blvd 174           \n",
       "4  26              McClurg Ct & Illinois St  133           \n",
       "5 202              Halsted St & 18th St      129           \n",
       "6 420              Ellis Ave & 55th St       426           \n",
       "  end_station_name          member_casual\n",
       "1 Desplaines St & Kinzie St Subscriber   \n",
       "2 Wabash Ave & Roosevelt Rd Subscriber   \n",
       "3 Canal St & Madison St     Subscriber   \n",
       "4 Kingsbury St & Kinzie St  Subscriber   \n",
       "5 Blue Island Ave & 18th St Subscriber   \n",
       "6 Ellis Ave & 60th St       Subscriber   "
      ]
     },
     "metadata": {},
     "output_type": "display_data"
    }
   ],
   "source": [
    "head(all_trips) # the first 6 rows of data frame"
   ]
  },
  {
   "cell_type": "code",
   "execution_count": 19,
   "id": "41ae43e1",
   "metadata": {
    "_cell_guid": "3c4dcde7-4dd5-475e-bea2-869b29b71677",
    "_uuid": "899ba3c8-c5ac-4cd0-9971-d7c89e5ff426",
    "collapsed": false,
    "execution": {
     "iopub.execute_input": "2024-03-12T03:02:38.746981Z",
     "iopub.status.busy": "2024-03-12T03:02:38.744316Z",
     "iopub.status.idle": "2024-03-12T03:02:38.799231Z",
     "shell.execute_reply": "2024-03-12T03:02:38.796100Z"
    },
    "jupyter": {
     "outputs_hidden": false
    },
    "papermill": {
     "duration": 0.083309,
     "end_time": "2024-03-12T03:02:38.803691",
     "exception": false,
     "start_time": "2024-03-12T03:02:38.720382",
     "status": "completed"
    },
    "tags": []
   },
   "outputs": [
    {
     "name": "stdout",
     "output_type": "stream",
     "text": [
      "tibble [3,879,822 × 9] (S3: tbl_df/tbl/data.frame)\n",
      " $ ride_id           : chr [1:3879822] \"22178529\" \"22178530\" \"22178531\" \"22178532\" ...\n",
      " $ started_at        : POSIXct[1:3879822], format: \"2019-04-01 00:02:22\" \"2019-04-01 00:03:02\" ...\n",
      " $ ended_at          : POSIXct[1:3879822], format: \"2019-04-01 00:09:48\" \"2019-04-01 00:20:30\" ...\n",
      " $ rideable_type     : chr [1:3879822] \"6251\" \"6226\" \"5649\" \"4151\" ...\n",
      " $ start_station_id  : num [1:3879822] 81 317 283 26 202 420 503 260 211 211 ...\n",
      " $ start_station_name: chr [1:3879822] \"Daley Center Plaza\" \"Wood St & Taylor St\" \"LaSalle St & Jackson Blvd\" \"McClurg Ct & Illinois St\" ...\n",
      " $ end_station_id    : num [1:3879822] 56 59 174 133 129 426 500 499 211 211 ...\n",
      " $ end_station_name  : chr [1:3879822] \"Desplaines St & Kinzie St\" \"Wabash Ave & Roosevelt Rd\" \"Canal St & Madison St\" \"Kingsbury St & Kinzie St\" ...\n",
      " $ member_casual     : chr [1:3879822] \"Subscriber\" \"Subscriber\" \"Subscriber\" \"Subscriber\" ...\n"
     ]
    }
   ],
   "source": [
    "str(all_trips) # to see list of columns and data types (e.g.numeric, character)"
   ]
  },
  {
   "cell_type": "code",
   "execution_count": 20,
   "id": "7be1e45a",
   "metadata": {
    "_cell_guid": "925b644b-a5ee-47e1-8c3b-4264b87e5559",
    "_uuid": "47aa45dc-c9c0-410a-99a0-8485929f1885",
    "collapsed": false,
    "execution": {
     "iopub.execute_input": "2024-03-12T03:02:38.848871Z",
     "iopub.status.busy": "2024-03-12T03:02:38.845888Z",
     "iopub.status.idle": "2024-03-12T03:02:41.200437Z",
     "shell.execute_reply": "2024-03-12T03:02:41.198576Z"
    },
    "jupyter": {
     "outputs_hidden": false
    },
    "papermill": {
     "duration": 2.380842,
     "end_time": "2024-03-12T03:02:41.203101",
     "exception": false,
     "start_time": "2024-03-12T03:02:38.822259",
     "status": "completed"
    },
    "tags": []
   },
   "outputs": [
    {
     "data": {
      "text/plain": [
       "   ride_id            started_at                     ended_at                  \n",
       " Length:3879822     Min.   :2019-04-01 00:02:22   Min.   :2019-04-01 00:09:48  \n",
       " Class :character   1st Qu.:2019-06-23 07:49:09   1st Qu.:2019-06-23 08:20:27  \n",
       " Mode  :character   Median :2019-08-14 17:43:38   Median :2019-08-14 18:02:04  \n",
       "                    Mean   :2019-08-26 00:49:59   Mean   :2019-08-26 01:14:37  \n",
       "                    3rd Qu.:2019-10-12 12:10:21   3rd Qu.:2019-10-12 12:36:16  \n",
       "                    Max.   :2020-03-31 23:51:34   Max.   :2020-05-19 20:10:34  \n",
       "                                                                               \n",
       " rideable_type      start_station_id start_station_name end_station_id \n",
       " Length:3879822     Min.   :  1.0    Length:3879822     Min.   :  1.0  \n",
       " Class :character   1st Qu.: 77.0    Class :character   1st Qu.: 77.0  \n",
       " Mode  :character   Median :174.0    Mode  :character   Median :174.0  \n",
       "                    Mean   :202.9                       Mean   :203.8  \n",
       "                    3rd Qu.:291.0                       3rd Qu.:291.0  \n",
       "                    Max.   :675.0                       Max.   :675.0  \n",
       "                                                        NA's   :1      \n",
       " end_station_name   member_casual     \n",
       " Length:3879822     Length:3879822    \n",
       " Class :character   Class :character  \n",
       " Mode  :character   Mode  :character  \n",
       "                                      \n",
       "                                      \n",
       "                                      \n",
       "                                      "
      ]
     },
     "metadata": {},
     "output_type": "display_data"
    }
   ],
   "source": [
    "summary(all_trips) # to see statistical summary of data frame"
   ]
  },
  {
   "cell_type": "markdown",
   "id": "91d2aaa0",
   "metadata": {
    "_cell_guid": "9742f447-3c5d-43e9-b6a3-63d5b82e30f5",
    "_uuid": "f050df6d-50ff-4118-b033-00c1eda81eca",
    "papermill": {
     "duration": 0.020286,
     "end_time": "2024-03-12T03:02:41.242380",
     "exception": false,
     "start_time": "2024-03-12T03:02:41.222094",
     "status": "completed"
    },
    "tags": []
   },
   "source": [
    "We will need to fix several problems that this data frame has.\n",
    "\n",
    "* The *member_casual* column has 4 different names - member, casual, Customer, Subscriber. These names will need to be consolidated from four to two labels. We can check this by using *unique()* function:"
   ]
  },
  {
   "cell_type": "code",
   "execution_count": 21,
   "id": "612e6362",
   "metadata": {
    "_cell_guid": "4a3cf6ea-6a54-4331-be5f-bbbeeed03c22",
    "_uuid": "1e349633-9844-4a6a-81c3-356e9069f3de",
    "collapsed": false,
    "execution": {
     "iopub.execute_input": "2024-03-12T03:02:41.286761Z",
     "iopub.status.busy": "2024-03-12T03:02:41.285118Z",
     "iopub.status.idle": "2024-03-12T03:02:41.385327Z",
     "shell.execute_reply": "2024-03-12T03:02:41.383325Z"
    },
    "jupyter": {
     "outputs_hidden": false
    },
    "papermill": {
     "duration": 0.125196,
     "end_time": "2024-03-12T03:02:41.388099",
     "exception": false,
     "start_time": "2024-03-12T03:02:41.262903",
     "status": "completed"
    },
    "tags": []
   },
   "outputs": [
    {
     "data": {
      "text/html": [
       "<style>\n",
       ".list-inline {list-style: none; margin:0; padding: 0}\n",
       ".list-inline>li {display: inline-block}\n",
       ".list-inline>li:not(:last-child)::after {content: \"\\00b7\"; padding: 0 .5ex}\n",
       "</style>\n",
       "<ol class=list-inline><li>'Subscriber'</li><li>'Customer'</li><li>'member'</li><li>'casual'</li></ol>\n"
      ],
      "text/latex": [
       "\\begin{enumerate*}\n",
       "\\item 'Subscriber'\n",
       "\\item 'Customer'\n",
       "\\item 'member'\n",
       "\\item 'casual'\n",
       "\\end{enumerate*}\n"
      ],
      "text/markdown": [
       "1. 'Subscriber'\n",
       "2. 'Customer'\n",
       "3. 'member'\n",
       "4. 'casual'\n",
       "\n",
       "\n"
      ],
      "text/plain": [
       "[1] \"Subscriber\" \"Customer\"   \"member\"     \"casual\"    "
      ]
     },
     "metadata": {},
     "output_type": "display_data"
    }
   ],
   "source": [
    "unique(all_trips$member_casual)"
   ]
  },
  {
   "cell_type": "markdown",
   "id": "3b58834b",
   "metadata": {
    "_cell_guid": "5de2aed1-b091-4a0b-8afa-47af45170799",
    "_uuid": "6481b2b1-a961-4ad9-b11c-b4700a1bc1e8",
    "papermill": {
     "duration": 0.01926,
     "end_time": "2024-03-12T03:02:41.426150",
     "exception": false,
     "start_time": "2024-03-12T03:02:41.406890",
     "status": "completed"
    },
    "tags": []
   },
   "source": [
    "* In its current condition our data can only be aggregated at the ride-level (by *ride_id*), and that is  too granular. In order to have additional opportunities to aggregate the data, we will add new columns -- such as day, month, year, taken from the datetime columns. We will also add weekdays.\n",
    "* In order to maintain consistency, we will need to add a calculated field for *ride_length* for all entries, since the 2020Q1 data did not have the *tripduration* column. \n",
    "* There are some entries where length of ride is negative. Also, there are several hundred rides where Divvy took bikes out of circulation for Quality Control reasons. We will need to delete these rides."
   ]
  },
  {
   "cell_type": "markdown",
   "id": "1153291d",
   "metadata": {
    "_cell_guid": "a8219ba6-4bc4-45f3-961b-f6b60a1463f5",
    "_uuid": "31b69cf3-a773-42fe-bb23-5dcabb2346f2",
    "papermill": {
     "duration": 0.018842,
     "end_time": "2024-03-12T03:02:41.463975",
     "exception": false,
     "start_time": "2024-03-12T03:02:41.445133",
     "status": "completed"
    },
    "tags": []
   },
   "source": [
    "**2. Choose your tools.**\n",
    "\n",
    "In conducting data clean up and preparation for further analysis I will be using R."
   ]
  },
  {
   "cell_type": "markdown",
   "id": "51703c10",
   "metadata": {
    "_cell_guid": "f2210326-86cc-4904-922e-f224817a2fba",
    "_uuid": "0a095947-0ab0-4c66-aad9-58b4a0ff42df",
    "papermill": {
     "duration": 0.021033,
     "end_time": "2024-03-12T03:02:41.503466",
     "exception": false,
     "start_time": "2024-03-12T03:02:41.482433",
     "status": "completed"
    },
    "tags": []
   },
   "source": [
    "**3. Transform the data to work effectively with it.**"
   ]
  },
  {
   "cell_type": "code",
   "execution_count": 22,
   "id": "a14c7073",
   "metadata": {
    "_cell_guid": "825f08bf-c1c0-45bc-adc5-0c2383e80a28",
    "_uuid": "1ee9669b-0a74-49f8-8228-34594b7b2b59",
    "collapsed": false,
    "execution": {
     "iopub.execute_input": "2024-03-12T03:02:41.545706Z",
     "iopub.status.busy": "2024-03-12T03:02:41.543917Z",
     "iopub.status.idle": "2024-03-12T03:02:42.700881Z",
     "shell.execute_reply": "2024-03-12T03:02:42.698748Z"
    },
    "jupyter": {
     "outputs_hidden": false
    },
    "papermill": {
     "duration": 1.180804,
     "end_time": "2024-03-12T03:02:42.703726",
     "exception": false,
     "start_time": "2024-03-12T03:02:41.522922",
     "status": "completed"
    },
    "tags": []
   },
   "outputs": [
    {
     "data": {
      "text/plain": [
       "\n",
       "    casual   Customer     member Subscriber \n",
       "     48480     857474     378407    2595461 "
      ]
     },
     "metadata": {},
     "output_type": "display_data"
    }
   ],
   "source": [
    "#First, checking how many observations fall under each type in member_casual column\n",
    "table(all_trips$member_casual)"
   ]
  },
  {
   "cell_type": "code",
   "execution_count": 23,
   "id": "99c241ce",
   "metadata": {
    "_cell_guid": "5b219705-2203-48a4-a155-5347093777da",
    "_uuid": "f0dd7563-be37-43fa-a018-558e83a93b3e",
    "collapsed": false,
    "execution": {
     "iopub.execute_input": "2024-03-12T03:02:42.748191Z",
     "iopub.status.busy": "2024-03-12T03:02:42.746228Z",
     "iopub.status.idle": "2024-03-12T03:02:43.557001Z",
     "shell.execute_reply": "2024-03-12T03:02:43.555173Z"
    },
    "jupyter": {
     "outputs_hidden": false
    },
    "papermill": {
     "duration": 0.836807,
     "end_time": "2024-03-12T03:02:43.559428",
     "exception": false,
     "start_time": "2024-03-12T03:02:42.722621",
     "status": "completed"
    },
    "tags": []
   },
   "outputs": [
    {
     "data": {
      "text/plain": [
       "\n",
       " casual  member \n",
       " 905954 2973868 "
      ]
     },
     "metadata": {},
     "output_type": "display_data"
    }
   ],
   "source": [
    "# Then, modyfing member_casual column --replacing \"Subscriber\" with \"member\",and \"Customer\" with \"casual\"\n",
    "\n",
    "all_trips <-  all_trips %>% \n",
    "  mutate(member_casual = recode(member_casual\n",
    "                                ,\"Subscriber\" = \"member\"\n",
    "                                ,\"Customer\" = \"casual\"))\n",
    "\n",
    "# Checking to make sure the proper number of observations were reassigned\n",
    "\n",
    "table(all_trips$member_casual)"
   ]
  },
  {
   "cell_type": "markdown",
   "id": "49e14de0",
   "metadata": {
    "_cell_guid": "f76d1862-1a1f-4275-ac62-f6925dfe7fbe",
    "_uuid": "701f25e4-286d-45dc-ba7a-f35588665275",
    "papermill": {
     "duration": 0.020695,
     "end_time": "2024-03-12T03:02:43.600516",
     "exception": false,
     "start_time": "2024-03-12T03:02:43.579821",
     "status": "completed"
    },
    "tags": []
   },
   "source": [
    "* Adding additional columns for the date, month, day, year, and day of the week of each ride."
   ]
  },
  {
   "cell_type": "code",
   "execution_count": 24,
   "id": "6435a5a0",
   "metadata": {
    "_cell_guid": "f78b36bd-3988-458b-99d7-2901a505fd1f",
    "_uuid": "1eac4e01-e552-4bf7-990b-a14ec5bdc5b0",
    "collapsed": false,
    "execution": {
     "iopub.execute_input": "2024-03-12T03:02:43.643098Z",
     "iopub.status.busy": "2024-03-12T03:02:43.641197Z",
     "iopub.status.idle": "2024-03-12T03:02:49.523059Z",
     "shell.execute_reply": "2024-03-12T03:02:49.521114Z"
    },
    "jupyter": {
     "outputs_hidden": false
    },
    "papermill": {
     "duration": 5.905865,
     "end_time": "2024-03-12T03:02:49.525730",
     "exception": false,
     "start_time": "2024-03-12T03:02:43.619865",
     "status": "completed"
    },
    "tags": []
   },
   "outputs": [],
   "source": [
    "all_trips$date <- as.Date(all_trips$started_at)  # The default format is yyyy-mm-dd\n",
    "all_trips$month <- format(as.Date(all_trips$date), \"%m\")\n",
    "all_trips$day <- format(as.Date(all_trips$date), \"%d\")\n",
    "all_trips$year <- format(as.Date(all_trips$date), \"%Y\")\n",
    "all_trips$day_of_week <- format(as.Date(all_trips$date), \"%A\")"
   ]
  },
  {
   "cell_type": "markdown",
   "id": "624b6d5c",
   "metadata": {
    "_cell_guid": "5a265b63-29f8-4d5d-81c1-d575c9427ab5",
    "_uuid": "51afe8a2-0ec1-42c2-af46-c04226c8b040",
    "papermill": {
     "duration": 0.01882,
     "end_time": "2024-03-12T03:02:49.563475",
     "exception": false,
     "start_time": "2024-03-12T03:02:49.544655",
     "status": "completed"
    },
    "tags": []
   },
   "source": [
    "* Adding a \"ride_length\" calculation to all_trips (in seconds)"
   ]
  },
  {
   "cell_type": "code",
   "execution_count": 25,
   "id": "9262d46c",
   "metadata": {
    "_cell_guid": "d0ee2000-aa87-45c5-9c64-e758593eacf2",
    "_uuid": "d737caf5-bea1-4db9-b1e0-01a73a27baf6",
    "collapsed": false,
    "execution": {
     "iopub.execute_input": "2024-03-12T03:02:49.604833Z",
     "iopub.status.busy": "2024-03-12T03:02:49.603181Z",
     "iopub.status.idle": "2024-03-12T03:02:49.650708Z",
     "shell.execute_reply": "2024-03-12T03:02:49.648749Z"
    },
    "jupyter": {
     "outputs_hidden": false
    },
    "papermill": {
     "duration": 0.071378,
     "end_time": "2024-03-12T03:02:49.653514",
     "exception": false,
     "start_time": "2024-03-12T03:02:49.582136",
     "status": "completed"
    },
    "tags": []
   },
   "outputs": [],
   "source": [
    "# ride_length column is calculated by subtracting ride started_at from ride ended_at\n",
    "\n",
    "all_trips$ride_length <- difftime(all_trips$ended_at,all_trips$started_at)"
   ]
  },
  {
   "cell_type": "code",
   "execution_count": 26,
   "id": "a66e68b9",
   "metadata": {
    "_cell_guid": "30191ab6-66a9-4122-81c9-3d078a2ea878",
    "_uuid": "b2714c9a-55ad-458e-b3bf-7e19aa91834f",
    "collapsed": false,
    "execution": {
     "iopub.execute_input": "2024-03-12T03:02:49.696207Z",
     "iopub.status.busy": "2024-03-12T03:02:49.694341Z",
     "iopub.status.idle": "2024-03-12T03:02:49.749831Z",
     "shell.execute_reply": "2024-03-12T03:02:49.746918Z"
    },
    "jupyter": {
     "outputs_hidden": false
    },
    "papermill": {
     "duration": 0.080477,
     "end_time": "2024-03-12T03:02:49.752971",
     "exception": false,
     "start_time": "2024-03-12T03:02:49.672494",
     "status": "completed"
    },
    "tags": []
   },
   "outputs": [
    {
     "name": "stdout",
     "output_type": "stream",
     "text": [
      "tibble [3,879,822 × 15] (S3: tbl_df/tbl/data.frame)\n",
      " $ ride_id           : chr [1:3879822] \"22178529\" \"22178530\" \"22178531\" \"22178532\" ...\n",
      " $ started_at        : POSIXct[1:3879822], format: \"2019-04-01 00:02:22\" \"2019-04-01 00:03:02\" ...\n",
      " $ ended_at          : POSIXct[1:3879822], format: \"2019-04-01 00:09:48\" \"2019-04-01 00:20:30\" ...\n",
      " $ rideable_type     : chr [1:3879822] \"6251\" \"6226\" \"5649\" \"4151\" ...\n",
      " $ start_station_id  : num [1:3879822] 81 317 283 26 202 420 503 260 211 211 ...\n",
      " $ start_station_name: chr [1:3879822] \"Daley Center Plaza\" \"Wood St & Taylor St\" \"LaSalle St & Jackson Blvd\" \"McClurg Ct & Illinois St\" ...\n",
      " $ end_station_id    : num [1:3879822] 56 59 174 133 129 426 500 499 211 211 ...\n",
      " $ end_station_name  : chr [1:3879822] \"Desplaines St & Kinzie St\" \"Wabash Ave & Roosevelt Rd\" \"Canal St & Madison St\" \"Kingsbury St & Kinzie St\" ...\n",
      " $ member_casual     : chr [1:3879822] \"member\" \"member\" \"member\" \"member\" ...\n",
      " $ date              : Date[1:3879822], format: \"2019-04-01\" \"2019-04-01\" ...\n",
      " $ month             : chr [1:3879822] \"04\" \"04\" \"04\" \"04\" ...\n",
      " $ day               : chr [1:3879822] \"01\" \"01\" \"01\" \"01\" ...\n",
      " $ year              : chr [1:3879822] \"2019\" \"2019\" \"2019\" \"2019\" ...\n",
      " $ day_of_week       : chr [1:3879822] \"Monday\" \"Monday\" \"Monday\" \"Monday\" ...\n",
      " $ ride_length       : 'difftime' num [1:3879822] 446 1048 252 357 ...\n",
      "  ..- attr(*, \"units\")= chr \"secs\"\n"
     ]
    }
   ],
   "source": [
    "# Inspecting the structure of the columns\n",
    "str(all_trips)"
   ]
  },
  {
   "cell_type": "markdown",
   "id": "4de01376",
   "metadata": {
    "_cell_guid": "8d3afe6e-fcf1-4e34-a148-372d316b8f88",
    "_uuid": "9582de99-2979-4135-83d4-2fdaa3307d25",
    "papermill": {
     "duration": 0.019219,
     "end_time": "2024-03-12T03:02:49.792219",
     "exception": false,
     "start_time": "2024-03-12T03:02:49.773000",
     "status": "completed"
    },
    "tags": []
   },
   "source": [
    "* Converting \"ride_length\" from Factor to numeric so we can run calculations on the data"
   ]
  },
  {
   "cell_type": "code",
   "execution_count": 27,
   "id": "27b60b0d",
   "metadata": {
    "_cell_guid": "10b7de71-5f1f-4ae9-9df4-841cb2a4209d",
    "_uuid": "dd9ab4f3-03b2-4f83-b217-da110819f204",
    "collapsed": false,
    "execution": {
     "iopub.execute_input": "2024-03-12T03:02:49.836070Z",
     "iopub.status.busy": "2024-03-12T03:02:49.834238Z",
     "iopub.status.idle": "2024-03-12T03:02:54.840149Z",
     "shell.execute_reply": "2024-03-12T03:02:54.837444Z"
    },
    "jupyter": {
     "outputs_hidden": false
    },
    "papermill": {
     "duration": 5.032182,
     "end_time": "2024-03-12T03:02:54.843828",
     "exception": false,
     "start_time": "2024-03-12T03:02:49.811646",
     "status": "completed"
    },
    "tags": []
   },
   "outputs": [
    {
     "data": {
      "text/html": [
       "FALSE"
      ],
      "text/latex": [
       "FALSE"
      ],
      "text/markdown": [
       "FALSE"
      ],
      "text/plain": [
       "[1] FALSE"
      ]
     },
     "metadata": {},
     "output_type": "display_data"
    },
    {
     "data": {
      "text/html": [
       "TRUE"
      ],
      "text/latex": [
       "TRUE"
      ],
      "text/markdown": [
       "TRUE"
      ],
      "text/plain": [
       "[1] TRUE"
      ]
     },
     "metadata": {},
     "output_type": "display_data"
    }
   ],
   "source": [
    "is.factor(all_trips$ride_length)  # to check whether ride_length is factor\n",
    "all_trips$ride_length <- as.numeric(as.character(all_trips$ride_length))\n",
    "is.numeric(all_trips$ride_length)"
   ]
  },
  {
   "cell_type": "markdown",
   "id": "0049a39a",
   "metadata": {
    "_cell_guid": "713dbaf4-f1e6-4351-905a-f06227a73c44",
    "_uuid": "7c12507a-bc30-4567-8c88-d69225023be7",
    "papermill": {
     "duration": 0.020628,
     "end_time": "2024-03-12T03:02:54.884347",
     "exception": false,
     "start_time": "2024-03-12T03:02:54.863719",
     "status": "completed"
    },
    "tags": []
   },
   "source": [
    "* Removing \"bad\" data"
   ]
  },
  {
   "cell_type": "code",
   "execution_count": 28,
   "id": "bc924108",
   "metadata": {
    "_cell_guid": "996589a9-f331-4a31-a702-54c3adb1790f",
    "_uuid": "d7adb4c6-17c7-47bd-850a-c4aa94ae1e65",
    "collapsed": false,
    "execution": {
     "iopub.execute_input": "2024-03-12T03:02:54.927279Z",
     "iopub.status.busy": "2024-03-12T03:02:54.925395Z",
     "iopub.status.idle": "2024-03-12T03:02:54.953336Z",
     "shell.execute_reply": "2024-03-12T03:02:54.951250Z"
    },
    "jupyter": {
     "outputs_hidden": false
    },
    "papermill": {
     "duration": 0.052178,
     "end_time": "2024-03-12T03:02:54.956057",
     "exception": false,
     "start_time": "2024-03-12T03:02:54.903879",
     "status": "completed"
    },
    "tags": []
   },
   "outputs": [
    {
     "data": {
      "text/html": [
       "-3382"
      ],
      "text/latex": [
       "-3382"
      ],
      "text/markdown": [
       "-3382"
      ],
      "text/plain": [
       "[1] -3382"
      ]
     },
     "metadata": {},
     "output_type": "display_data"
    }
   ],
   "source": [
    "# checking whether ride_length column has invalid entries, such as negative values\n",
    "\n",
    "min(all_trips$ride_length)"
   ]
  },
  {
   "cell_type": "code",
   "execution_count": 29,
   "id": "f67e260e",
   "metadata": {
    "_cell_guid": "c2abd79d-3303-449e-bda9-84847077d26f",
    "_uuid": "bee3264d-4e8c-4c83-a452-cd487c12ab60",
    "collapsed": false,
    "execution": {
     "iopub.execute_input": "2024-03-12T03:02:55.001549Z",
     "iopub.status.busy": "2024-03-12T03:02:54.999642Z",
     "iopub.status.idle": "2024-03-12T03:02:56.782027Z",
     "shell.execute_reply": "2024-03-12T03:02:56.780045Z"
    },
    "jupyter": {
     "outputs_hidden": false
    },
    "papermill": {
     "duration": 1.806832,
     "end_time": "2024-03-12T03:02:56.784754",
     "exception": false,
     "start_time": "2024-03-12T03:02:54.977922",
     "status": "completed"
    },
    "tags": []
   },
   "outputs": [],
   "source": [
    "# remvoing entries where ride_length was negative\n",
    "# removing entries where bikes were taken out of docks and checked for quality (where start_station is \"HQ QR\")\n",
    "# creating a new version of the data frame (v2) since the data is being removed\n",
    "\n",
    "all_trips_v2 <- all_trips[!(all_trips$start_station_name == \"HQ QR\" | all_trips$ride_length<0),]"
   ]
  },
  {
   "cell_type": "markdown",
   "id": "2915fb66",
   "metadata": {
    "_cell_guid": "34c0ef7b-b55b-4caa-b461-77126677a3d4",
    "_uuid": "fc2aa41c-7851-4488-895e-ff5157b76280",
    "papermill": {
     "duration": 0.020005,
     "end_time": "2024-03-12T03:02:56.824149",
     "exception": false,
     "start_time": "2024-03-12T03:02:56.804144",
     "status": "completed"
    },
    "tags": []
   },
   "source": [
    "# Step 4: Analyze\n",
    "\n",
    "Key tasks:\n",
    "\n",
    "**1. Perform calculations; organize and format data.**\n",
    " \n",
    "*  Implementing descriptive analysis of the *ride_length* column (figures are in seconds)"
   ]
  },
  {
   "cell_type": "code",
   "execution_count": 30,
   "id": "787581ea",
   "metadata": {
    "_cell_guid": "8cdb481d-17ef-4bd4-8b49-bd8352a7cf93",
    "_uuid": "7a072165-c665-42a3-aa81-d3dac86fc380",
    "collapsed": false,
    "execution": {
     "iopub.execute_input": "2024-03-12T03:02:56.868167Z",
     "iopub.status.busy": "2024-03-12T03:02:56.866286Z",
     "iopub.status.idle": "2024-03-12T03:02:57.024883Z",
     "shell.execute_reply": "2024-03-12T03:02:57.022743Z"
    },
    "jupyter": {
     "outputs_hidden": false
    },
    "papermill": {
     "duration": 0.183857,
     "end_time": "2024-03-12T03:02:57.027508",
     "exception": false,
     "start_time": "2024-03-12T03:02:56.843651",
     "status": "completed"
    },
    "tags": []
   },
   "outputs": [
    {
     "data": {
      "text/html": [
       "1479.13902790527"
      ],
      "text/latex": [
       "1479.13902790527"
      ],
      "text/markdown": [
       "1479.13902790527"
      ],
      "text/plain": [
       "[1] 1479.139"
      ]
     },
     "metadata": {},
     "output_type": "display_data"
    },
    {
     "data": {
      "text/html": [
       "712"
      ],
      "text/latex": [
       "712"
      ],
      "text/markdown": [
       "712"
      ],
      "text/plain": [
       "[1] 712"
      ]
     },
     "metadata": {},
     "output_type": "display_data"
    },
    {
     "data": {
      "text/html": [
       "9387024"
      ],
      "text/latex": [
       "9387024"
      ],
      "text/markdown": [
       "9387024"
      ],
      "text/plain": [
       "[1] 9387024"
      ]
     },
     "metadata": {},
     "output_type": "display_data"
    },
    {
     "data": {
      "text/html": [
       "1"
      ],
      "text/latex": [
       "1"
      ],
      "text/markdown": [
       "1"
      ],
      "text/plain": [
       "[1] 1"
      ]
     },
     "metadata": {},
     "output_type": "display_data"
    }
   ],
   "source": [
    "mean(all_trips_v2$ride_length) #straight average (total ride length / rides)\n",
    "median(all_trips_v2$ride_length) #midpoint number in the ascending array of ride lengths\n",
    "max(all_trips_v2$ride_length) #longest ride\n",
    "min(all_trips_v2$ride_length) #shortest ride"
   ]
  },
  {
   "cell_type": "code",
   "execution_count": 31,
   "id": "a8b63b23",
   "metadata": {
    "_cell_guid": "b0e5e1a2-6031-462c-932d-672edd3bc2a8",
    "_uuid": "c1959c0c-52d2-4932-9a43-5d5bd0f075bd",
    "collapsed": false,
    "execution": {
     "iopub.execute_input": "2024-03-12T03:02:57.071838Z",
     "iopub.status.busy": "2024-03-12T03:02:57.070086Z",
     "iopub.status.idle": "2024-03-12T03:02:57.328134Z",
     "shell.execute_reply": "2024-03-12T03:02:57.325964Z"
    },
    "jupyter": {
     "outputs_hidden": false
    },
    "papermill": {
     "duration": 0.283135,
     "end_time": "2024-03-12T03:02:57.330871",
     "exception": false,
     "start_time": "2024-03-12T03:02:57.047736",
     "status": "completed"
    },
    "tags": []
   },
   "outputs": [
    {
     "data": {
      "text/plain": [
       "   Min. 1st Qu.  Median    Mean 3rd Qu.    Max. \n",
       "      1     412     712    1479    1289 9387024 "
      ]
     },
     "metadata": {},
     "output_type": "display_data"
    }
   ],
   "source": [
    "summary(all_trips_v2$ride_length)  # the four lines above can also be condesned to one line using summary()"
   ]
  },
  {
   "cell_type": "markdown",
   "id": "18845505",
   "metadata": {
    "_cell_guid": "a89e681c-e2f1-4c62-8e7a-c76e422e1cad",
    "_uuid": "ac3991a6-f119-4823-8bb7-0ee2e4f7b548",
    "papermill": {
     "duration": 0.020527,
     "end_time": "2024-03-12T03:02:57.373594",
     "exception": false,
     "start_time": "2024-03-12T03:02:57.353067",
     "status": "completed"
    },
    "tags": []
   },
   "source": [
    "**2. Aggregate the data to make it useful and accessible.**\n",
    "\n",
    "* Comparing aggregated data on *ride_length* between casual riders and members by checking min, max, median, and mean"
   ]
  },
  {
   "cell_type": "code",
   "execution_count": 32,
   "id": "beb85dd5",
   "metadata": {
    "_cell_guid": "f6a37503-a0df-4695-bfce-e0ad09467bbb",
    "_uuid": "3dcabae8-33cd-429f-a1ef-ed7d911dc7ff",
    "collapsed": false,
    "execution": {
     "iopub.execute_input": "2024-03-12T03:02:57.417279Z",
     "iopub.status.busy": "2024-03-12T03:02:57.415580Z",
     "iopub.status.idle": "2024-03-12T03:02:59.867091Z",
     "shell.execute_reply": "2024-03-12T03:02:59.865167Z"
    },
    "jupyter": {
     "outputs_hidden": false
    },
    "papermill": {
     "duration": 2.476302,
     "end_time": "2024-03-12T03:02:59.869718",
     "exception": false,
     "start_time": "2024-03-12T03:02:57.393416",
     "status": "completed"
    },
    "tags": []
   },
   "outputs": [
    {
     "data": {
      "text/html": [
       "<table class=\"dataframe\">\n",
       "<caption>A data.frame: 2 × 2</caption>\n",
       "<thead>\n",
       "\t<tr><th scope=col>all_trips_v2$member_casual</th><th scope=col>all_trips_v2$ride_length</th></tr>\n",
       "\t<tr><th scope=col>&lt;chr&gt;</th><th scope=col>&lt;dbl&gt;</th></tr>\n",
       "</thead>\n",
       "<tbody>\n",
       "\t<tr><td>casual</td><td>3552.7502</td></tr>\n",
       "\t<tr><td>member</td><td> 850.0662</td></tr>\n",
       "</tbody>\n",
       "</table>\n"
      ],
      "text/latex": [
       "A data.frame: 2 × 2\n",
       "\\begin{tabular}{ll}\n",
       " all\\_trips\\_v2\\$member\\_casual & all\\_trips\\_v2\\$ride\\_length\\\\\n",
       " <chr> & <dbl>\\\\\n",
       "\\hline\n",
       "\t casual & 3552.7502\\\\\n",
       "\t member &  850.0662\\\\\n",
       "\\end{tabular}\n"
      ],
      "text/markdown": [
       "\n",
       "A data.frame: 2 × 2\n",
       "\n",
       "| all_trips_v2$member_casual &lt;chr&gt; | all_trips_v2$ride_length &lt;dbl&gt; |\n",
       "|---|---|\n",
       "| casual | 3552.7502 |\n",
       "| member |  850.0662 |\n",
       "\n"
      ],
      "text/plain": [
       "  all_trips_v2$member_casual all_trips_v2$ride_length\n",
       "1 casual                     3552.7502               \n",
       "2 member                      850.0662               "
      ]
     },
     "metadata": {},
     "output_type": "display_data"
    }
   ],
   "source": [
    "aggregate(all_trips_v2$ride_length ~ all_trips_v2$member_casual, FUN = mean) #mean"
   ]
  },
  {
   "cell_type": "code",
   "execution_count": 33,
   "id": "6147427b",
   "metadata": {
    "_cell_guid": "b332a6a2-a8c5-4d98-8fcc-9c3aee550fc4",
    "_uuid": "0aa9780a-15f0-482a-8247-139901308aff",
    "collapsed": false,
    "execution": {
     "iopub.execute_input": "2024-03-12T03:02:59.915394Z",
     "iopub.status.busy": "2024-03-12T03:02:59.913746Z",
     "iopub.status.idle": "2024-03-12T03:03:02.360593Z",
     "shell.execute_reply": "2024-03-12T03:03:02.358738Z"
    },
    "jupyter": {
     "outputs_hidden": false
    },
    "papermill": {
     "duration": 2.472706,
     "end_time": "2024-03-12T03:03:02.363220",
     "exception": false,
     "start_time": "2024-03-12T03:02:59.890514",
     "status": "completed"
    },
    "tags": []
   },
   "outputs": [
    {
     "data": {
      "text/html": [
       "<table class=\"dataframe\">\n",
       "<caption>A data.frame: 2 × 2</caption>\n",
       "<thead>\n",
       "\t<tr><th scope=col>all_trips_v2$member_casual</th><th scope=col>all_trips_v2$ride_length</th></tr>\n",
       "\t<tr><th scope=col>&lt;chr&gt;</th><th scope=col>&lt;dbl&gt;</th></tr>\n",
       "</thead>\n",
       "<tbody>\n",
       "\t<tr><td>casual</td><td>1546</td></tr>\n",
       "\t<tr><td>member</td><td> 589</td></tr>\n",
       "</tbody>\n",
       "</table>\n"
      ],
      "text/latex": [
       "A data.frame: 2 × 2\n",
       "\\begin{tabular}{ll}\n",
       " all\\_trips\\_v2\\$member\\_casual & all\\_trips\\_v2\\$ride\\_length\\\\\n",
       " <chr> & <dbl>\\\\\n",
       "\\hline\n",
       "\t casual & 1546\\\\\n",
       "\t member &  589\\\\\n",
       "\\end{tabular}\n"
      ],
      "text/markdown": [
       "\n",
       "A data.frame: 2 × 2\n",
       "\n",
       "| all_trips_v2$member_casual &lt;chr&gt; | all_trips_v2$ride_length &lt;dbl&gt; |\n",
       "|---|---|\n",
       "| casual | 1546 |\n",
       "| member |  589 |\n",
       "\n"
      ],
      "text/plain": [
       "  all_trips_v2$member_casual all_trips_v2$ride_length\n",
       "1 casual                     1546                    \n",
       "2 member                      589                    "
      ]
     },
     "metadata": {},
     "output_type": "display_data"
    }
   ],
   "source": [
    "aggregate(all_trips_v2$ride_length ~ all_trips_v2$member_casual, FUN = median) #median"
   ]
  },
  {
   "cell_type": "code",
   "execution_count": 34,
   "id": "5a43fb6c",
   "metadata": {
    "_cell_guid": "86a473fe-4535-4f3b-80ec-f38c3a53cbdf",
    "_uuid": "93e065d3-99c8-4cb5-bec2-1a6b4be3d7e7",
    "collapsed": false,
    "execution": {
     "iopub.execute_input": "2024-03-12T03:03:02.408989Z",
     "iopub.status.busy": "2024-03-12T03:03:02.407245Z",
     "iopub.status.idle": "2024-03-12T03:03:05.106242Z",
     "shell.execute_reply": "2024-03-12T03:03:05.104364Z"
    },
    "jupyter": {
     "outputs_hidden": false
    },
    "papermill": {
     "duration": 2.724308,
     "end_time": "2024-03-12T03:03:05.108944",
     "exception": false,
     "start_time": "2024-03-12T03:03:02.384636",
     "status": "completed"
    },
    "tags": []
   },
   "outputs": [
    {
     "data": {
      "text/html": [
       "<table class=\"dataframe\">\n",
       "<caption>A data.frame: 2 × 2</caption>\n",
       "<thead>\n",
       "\t<tr><th scope=col>all_trips_v2$member_casual</th><th scope=col>all_trips_v2$ride_length</th></tr>\n",
       "\t<tr><th scope=col>&lt;chr&gt;</th><th scope=col>&lt;dbl&gt;</th></tr>\n",
       "</thead>\n",
       "<tbody>\n",
       "\t<tr><td>casual</td><td>9387024</td></tr>\n",
       "\t<tr><td>member</td><td>9056634</td></tr>\n",
       "</tbody>\n",
       "</table>\n"
      ],
      "text/latex": [
       "A data.frame: 2 × 2\n",
       "\\begin{tabular}{ll}\n",
       " all\\_trips\\_v2\\$member\\_casual & all\\_trips\\_v2\\$ride\\_length\\\\\n",
       " <chr> & <dbl>\\\\\n",
       "\\hline\n",
       "\t casual & 9387024\\\\\n",
       "\t member & 9056634\\\\\n",
       "\\end{tabular}\n"
      ],
      "text/markdown": [
       "\n",
       "A data.frame: 2 × 2\n",
       "\n",
       "| all_trips_v2$member_casual &lt;chr&gt; | all_trips_v2$ride_length &lt;dbl&gt; |\n",
       "|---|---|\n",
       "| casual | 9387024 |\n",
       "| member | 9056634 |\n",
       "\n"
      ],
      "text/plain": [
       "  all_trips_v2$member_casual all_trips_v2$ride_length\n",
       "1 casual                     9387024                 \n",
       "2 member                     9056634                 "
      ]
     },
     "metadata": {},
     "output_type": "display_data"
    }
   ],
   "source": [
    "aggregate(all_trips_v2$ride_length ~ all_trips_v2$member_casual, FUN = max) #max"
   ]
  },
  {
   "cell_type": "code",
   "execution_count": 35,
   "id": "81cae4b7",
   "metadata": {
    "_cell_guid": "ca57d999-70cd-40bd-8dc5-ce2e853c73a5",
    "_uuid": "7fbf01ad-83f5-4193-9142-a2f62202527d",
    "collapsed": false,
    "execution": {
     "iopub.execute_input": "2024-03-12T03:03:05.156952Z",
     "iopub.status.busy": "2024-03-12T03:03:05.155357Z",
     "iopub.status.idle": "2024-03-12T03:03:07.557362Z",
     "shell.execute_reply": "2024-03-12T03:03:07.555510Z"
    },
    "jupyter": {
     "outputs_hidden": false
    },
    "papermill": {
     "duration": 2.428831,
     "end_time": "2024-03-12T03:03:07.560016",
     "exception": false,
     "start_time": "2024-03-12T03:03:05.131185",
     "status": "completed"
    },
    "tags": []
   },
   "outputs": [
    {
     "data": {
      "text/html": [
       "<table class=\"dataframe\">\n",
       "<caption>A data.frame: 2 × 2</caption>\n",
       "<thead>\n",
       "\t<tr><th scope=col>all_trips_v2$member_casual</th><th scope=col>all_trips_v2$ride_length</th></tr>\n",
       "\t<tr><th scope=col>&lt;chr&gt;</th><th scope=col>&lt;dbl&gt;</th></tr>\n",
       "</thead>\n",
       "<tbody>\n",
       "\t<tr><td>casual</td><td>2</td></tr>\n",
       "\t<tr><td>member</td><td>1</td></tr>\n",
       "</tbody>\n",
       "</table>\n"
      ],
      "text/latex": [
       "A data.frame: 2 × 2\n",
       "\\begin{tabular}{ll}\n",
       " all\\_trips\\_v2\\$member\\_casual & all\\_trips\\_v2\\$ride\\_length\\\\\n",
       " <chr> & <dbl>\\\\\n",
       "\\hline\n",
       "\t casual & 2\\\\\n",
       "\t member & 1\\\\\n",
       "\\end{tabular}\n"
      ],
      "text/markdown": [
       "\n",
       "A data.frame: 2 × 2\n",
       "\n",
       "| all_trips_v2$member_casual &lt;chr&gt; | all_trips_v2$ride_length &lt;dbl&gt; |\n",
       "|---|---|\n",
       "| casual | 2 |\n",
       "| member | 1 |\n",
       "\n"
      ],
      "text/plain": [
       "  all_trips_v2$member_casual all_trips_v2$ride_length\n",
       "1 casual                     2                       \n",
       "2 member                     1                       "
      ]
     },
     "metadata": {},
     "output_type": "display_data"
    }
   ],
   "source": [
    "aggregate(all_trips_v2$ride_length ~ all_trips_v2$member_casual, FUN = min) #min"
   ]
  },
  {
   "cell_type": "markdown",
   "id": "286ccce9",
   "metadata": {
    "_cell_guid": "9e5e49a3-df22-4f06-884a-9c52f09e613a",
    "_uuid": "fa55bccd-cf5c-48a9-99c0-e24ef3a1b727",
    "papermill": {
     "duration": 0.021035,
     "end_time": "2024-03-12T03:03:07.602344",
     "exception": false,
     "start_time": "2024-03-12T03:03:07.581309",
     "status": "completed"
    },
    "tags": []
   },
   "source": [
    "* Checking the average ride time by each day for members and casual users"
   ]
  },
  {
   "cell_type": "code",
   "execution_count": 36,
   "id": "80351003",
   "metadata": {
    "_cell_guid": "b7ba8ee6-8786-4c39-b832-6d0ca09483c3",
    "_uuid": "3928a205-7721-47a2-b45f-a3b236c0a042",
    "collapsed": false,
    "execution": {
     "iopub.execute_input": "2024-03-12T03:03:07.648082Z",
     "iopub.status.busy": "2024-03-12T03:03:07.646462Z",
     "iopub.status.idle": "2024-03-12T03:03:10.506638Z",
     "shell.execute_reply": "2024-03-12T03:03:10.504806Z"
    },
    "jupyter": {
     "outputs_hidden": false
    },
    "papermill": {
     "duration": 2.886054,
     "end_time": "2024-03-12T03:03:10.509293",
     "exception": false,
     "start_time": "2024-03-12T03:03:07.623239",
     "status": "completed"
    },
    "tags": []
   },
   "outputs": [
    {
     "data": {
      "text/html": [
       "<table class=\"dataframe\">\n",
       "<caption>A data.frame: 14 × 3</caption>\n",
       "<thead>\n",
       "\t<tr><th scope=col>all_trips_v2$member_casual</th><th scope=col>all_trips_v2$day_of_week</th><th scope=col>all_trips_v2$ride_length</th></tr>\n",
       "\t<tr><th scope=col>&lt;chr&gt;</th><th scope=col>&lt;chr&gt;</th><th scope=col>&lt;dbl&gt;</th></tr>\n",
       "</thead>\n",
       "<tbody>\n",
       "\t<tr><td>casual</td><td>Friday   </td><td>3773.8351</td></tr>\n",
       "\t<tr><td>member</td><td>Friday   </td><td> 824.5305</td></tr>\n",
       "\t<tr><td>casual</td><td>Monday   </td><td>3372.2869</td></tr>\n",
       "\t<tr><td>member</td><td>Monday   </td><td> 842.5726</td></tr>\n",
       "\t<tr><td>casual</td><td>Saturday </td><td>3331.9138</td></tr>\n",
       "\t<tr><td>member</td><td>Saturday </td><td> 968.9337</td></tr>\n",
       "\t<tr><td>casual</td><td>Sunday   </td><td>3581.4054</td></tr>\n",
       "\t<tr><td>member</td><td>Sunday   </td><td> 919.9746</td></tr>\n",
       "\t<tr><td>casual</td><td>Thursday </td><td>3682.9847</td></tr>\n",
       "\t<tr><td>member</td><td>Thursday </td><td> 823.9278</td></tr>\n",
       "\t<tr><td>casual</td><td>Tuesday  </td><td>3596.3599</td></tr>\n",
       "\t<tr><td>member</td><td>Tuesday  </td><td> 826.1427</td></tr>\n",
       "\t<tr><td>casual</td><td>Wednesday</td><td>3718.6619</td></tr>\n",
       "\t<tr><td>member</td><td>Wednesday</td><td> 823.9996</td></tr>\n",
       "</tbody>\n",
       "</table>\n"
      ],
      "text/latex": [
       "A data.frame: 14 × 3\n",
       "\\begin{tabular}{lll}\n",
       " all\\_trips\\_v2\\$member\\_casual & all\\_trips\\_v2\\$day\\_of\\_week & all\\_trips\\_v2\\$ride\\_length\\\\\n",
       " <chr> & <chr> & <dbl>\\\\\n",
       "\\hline\n",
       "\t casual & Friday    & 3773.8351\\\\\n",
       "\t member & Friday    &  824.5305\\\\\n",
       "\t casual & Monday    & 3372.2869\\\\\n",
       "\t member & Monday    &  842.5726\\\\\n",
       "\t casual & Saturday  & 3331.9138\\\\\n",
       "\t member & Saturday  &  968.9337\\\\\n",
       "\t casual & Sunday    & 3581.4054\\\\\n",
       "\t member & Sunday    &  919.9746\\\\\n",
       "\t casual & Thursday  & 3682.9847\\\\\n",
       "\t member & Thursday  &  823.9278\\\\\n",
       "\t casual & Tuesday   & 3596.3599\\\\\n",
       "\t member & Tuesday   &  826.1427\\\\\n",
       "\t casual & Wednesday & 3718.6619\\\\\n",
       "\t member & Wednesday &  823.9996\\\\\n",
       "\\end{tabular}\n"
      ],
      "text/markdown": [
       "\n",
       "A data.frame: 14 × 3\n",
       "\n",
       "| all_trips_v2$member_casual &lt;chr&gt; | all_trips_v2$day_of_week &lt;chr&gt; | all_trips_v2$ride_length &lt;dbl&gt; |\n",
       "|---|---|---|\n",
       "| casual | Friday    | 3773.8351 |\n",
       "| member | Friday    |  824.5305 |\n",
       "| casual | Monday    | 3372.2869 |\n",
       "| member | Monday    |  842.5726 |\n",
       "| casual | Saturday  | 3331.9138 |\n",
       "| member | Saturday  |  968.9337 |\n",
       "| casual | Sunday    | 3581.4054 |\n",
       "| member | Sunday    |  919.9746 |\n",
       "| casual | Thursday  | 3682.9847 |\n",
       "| member | Thursday  |  823.9278 |\n",
       "| casual | Tuesday   | 3596.3599 |\n",
       "| member | Tuesday   |  826.1427 |\n",
       "| casual | Wednesday | 3718.6619 |\n",
       "| member | Wednesday |  823.9996 |\n",
       "\n"
      ],
      "text/plain": [
       "   all_trips_v2$member_casual all_trips_v2$day_of_week all_trips_v2$ride_length\n",
       "1  casual                     Friday                   3773.8351               \n",
       "2  member                     Friday                    824.5305               \n",
       "3  casual                     Monday                   3372.2869               \n",
       "4  member                     Monday                    842.5726               \n",
       "5  casual                     Saturday                 3331.9138               \n",
       "6  member                     Saturday                  968.9337               \n",
       "7  casual                     Sunday                   3581.4054               \n",
       "8  member                     Sunday                    919.9746               \n",
       "9  casual                     Thursday                 3682.9847               \n",
       "10 member                     Thursday                  823.9278               \n",
       "11 casual                     Tuesday                  3596.3599               \n",
       "12 member                     Tuesday                   826.1427               \n",
       "13 casual                     Wednesday                3718.6619               \n",
       "14 member                     Wednesday                 823.9996               "
      ]
     },
     "metadata": {},
     "output_type": "display_data"
    }
   ],
   "source": [
    "aggregate(all_trips_v2$ride_length ~ all_trips_v2$member_casual + all_trips_v2$day_of_week, FUN = mean)"
   ]
  },
  {
   "cell_type": "code",
   "execution_count": 37,
   "id": "483bd52a",
   "metadata": {
    "_cell_guid": "208f1a4d-7698-45ca-a8dc-083b547a9dd9",
    "_uuid": "383d7044-0964-433f-a369-39f95c38bed6",
    "collapsed": false,
    "execution": {
     "iopub.execute_input": "2024-03-12T03:03:10.557351Z",
     "iopub.status.busy": "2024-03-12T03:03:10.555681Z",
     "iopub.status.idle": "2024-03-12T03:03:13.769639Z",
     "shell.execute_reply": "2024-03-12T03:03:13.767763Z"
    },
    "jupyter": {
     "outputs_hidden": false
    },
    "papermill": {
     "duration": 3.241596,
     "end_time": "2024-03-12T03:03:13.772251",
     "exception": false,
     "start_time": "2024-03-12T03:03:10.530655",
     "status": "completed"
    },
    "tags": []
   },
   "outputs": [
    {
     "data": {
      "text/html": [
       "<table class=\"dataframe\">\n",
       "<caption>A data.frame: 14 × 3</caption>\n",
       "<thead>\n",
       "\t<tr><th scope=col>all_trips_v2$member_casual</th><th scope=col>all_trips_v2$day_of_week</th><th scope=col>all_trips_v2$ride_length</th></tr>\n",
       "\t<tr><th scope=col>&lt;chr&gt;</th><th scope=col>&lt;ord&gt;</th><th scope=col>&lt;dbl&gt;</th></tr>\n",
       "</thead>\n",
       "<tbody>\n",
       "\t<tr><td>casual</td><td>Sunday   </td><td>3581.4054</td></tr>\n",
       "\t<tr><td>member</td><td>Sunday   </td><td> 919.9746</td></tr>\n",
       "\t<tr><td>casual</td><td>Monday   </td><td>3372.2869</td></tr>\n",
       "\t<tr><td>member</td><td>Monday   </td><td> 842.5726</td></tr>\n",
       "\t<tr><td>casual</td><td>Tuesday  </td><td>3596.3599</td></tr>\n",
       "\t<tr><td>member</td><td>Tuesday  </td><td> 826.1427</td></tr>\n",
       "\t<tr><td>casual</td><td>Wednesday</td><td>3718.6619</td></tr>\n",
       "\t<tr><td>member</td><td>Wednesday</td><td> 823.9996</td></tr>\n",
       "\t<tr><td>casual</td><td>Thursday </td><td>3682.9847</td></tr>\n",
       "\t<tr><td>member</td><td>Thursday </td><td> 823.9278</td></tr>\n",
       "\t<tr><td>casual</td><td>Friday   </td><td>3773.8351</td></tr>\n",
       "\t<tr><td>member</td><td>Friday   </td><td> 824.5305</td></tr>\n",
       "\t<tr><td>casual</td><td>Saturday </td><td>3331.9138</td></tr>\n",
       "\t<tr><td>member</td><td>Saturday </td><td> 968.9337</td></tr>\n",
       "</tbody>\n",
       "</table>\n"
      ],
      "text/latex": [
       "A data.frame: 14 × 3\n",
       "\\begin{tabular}{lll}\n",
       " all\\_trips\\_v2\\$member\\_casual & all\\_trips\\_v2\\$day\\_of\\_week & all\\_trips\\_v2\\$ride\\_length\\\\\n",
       " <chr> & <ord> & <dbl>\\\\\n",
       "\\hline\n",
       "\t casual & Sunday    & 3581.4054\\\\\n",
       "\t member & Sunday    &  919.9746\\\\\n",
       "\t casual & Monday    & 3372.2869\\\\\n",
       "\t member & Monday    &  842.5726\\\\\n",
       "\t casual & Tuesday   & 3596.3599\\\\\n",
       "\t member & Tuesday   &  826.1427\\\\\n",
       "\t casual & Wednesday & 3718.6619\\\\\n",
       "\t member & Wednesday &  823.9996\\\\\n",
       "\t casual & Thursday  & 3682.9847\\\\\n",
       "\t member & Thursday  &  823.9278\\\\\n",
       "\t casual & Friday    & 3773.8351\\\\\n",
       "\t member & Friday    &  824.5305\\\\\n",
       "\t casual & Saturday  & 3331.9138\\\\\n",
       "\t member & Saturday  &  968.9337\\\\\n",
       "\\end{tabular}\n"
      ],
      "text/markdown": [
       "\n",
       "A data.frame: 14 × 3\n",
       "\n",
       "| all_trips_v2$member_casual &lt;chr&gt; | all_trips_v2$day_of_week &lt;ord&gt; | all_trips_v2$ride_length &lt;dbl&gt; |\n",
       "|---|---|---|\n",
       "| casual | Sunday    | 3581.4054 |\n",
       "| member | Sunday    |  919.9746 |\n",
       "| casual | Monday    | 3372.2869 |\n",
       "| member | Monday    |  842.5726 |\n",
       "| casual | Tuesday   | 3596.3599 |\n",
       "| member | Tuesday   |  826.1427 |\n",
       "| casual | Wednesday | 3718.6619 |\n",
       "| member | Wednesday |  823.9996 |\n",
       "| casual | Thursday  | 3682.9847 |\n",
       "| member | Thursday  |  823.9278 |\n",
       "| casual | Friday    | 3773.8351 |\n",
       "| member | Friday    |  824.5305 |\n",
       "| casual | Saturday  | 3331.9138 |\n",
       "| member | Saturday  |  968.9337 |\n",
       "\n"
      ],
      "text/plain": [
       "   all_trips_v2$member_casual all_trips_v2$day_of_week all_trips_v2$ride_length\n",
       "1  casual                     Sunday                   3581.4054               \n",
       "2  member                     Sunday                    919.9746               \n",
       "3  casual                     Monday                   3372.2869               \n",
       "4  member                     Monday                    842.5726               \n",
       "5  casual                     Tuesday                  3596.3599               \n",
       "6  member                     Tuesday                   826.1427               \n",
       "7  casual                     Wednesday                3718.6619               \n",
       "8  member                     Wednesday                 823.9996               \n",
       "9  casual                     Thursday                 3682.9847               \n",
       "10 member                     Thursday                  823.9278               \n",
       "11 casual                     Friday                   3773.8351               \n",
       "12 member                     Friday                    824.5305               \n",
       "13 casual                     Saturday                 3331.9138               \n",
       "14 member                     Saturday                  968.9337               "
      ]
     },
     "metadata": {},
     "output_type": "display_data"
    }
   ],
   "source": [
    "# Let's put the days of the week in order, and run the previous code again\n",
    "\n",
    "all_trips_v2$day_of_week <- ordered(all_trips_v2$day_of_week, \n",
    "                                    levels=c(\"Sunday\", \"Monday\", \"Tuesday\", \"Wednesday\", \"Thursday\", \"Friday\", \"Saturday\"))\n",
    "\n",
    "aggregate(all_trips_v2$ride_length ~ all_trips_v2$member_casual + all_trips_v2$day_of_week, FUN = mean)"
   ]
  },
  {
   "cell_type": "markdown",
   "id": "71d1591a",
   "metadata": {
    "_cell_guid": "3c382a9f-ab4a-4db9-982d-94d75cba2b49",
    "_uuid": "a99c3348-2b2d-4818-8845-473dfb31401e",
    "papermill": {
     "duration": 0.023361,
     "end_time": "2024-03-12T03:03:13.817966",
     "exception": false,
     "start_time": "2024-03-12T03:03:13.794605",
     "status": "completed"
    },
    "tags": []
   },
   "source": [
    "**3.Identify trends and relationships.**\n",
    "\n",
    "* Analyzing ridership data by type and weekday"
   ]
  },
  {
   "cell_type": "code",
   "execution_count": 38,
   "id": "1acc2887",
   "metadata": {
    "_cell_guid": "7fbb600d-2225-4df6-bbda-bb2149bb4c6d",
    "_uuid": "93f0bc28-786e-47a8-b724-7e003192e4c5",
    "collapsed": false,
    "execution": {
     "iopub.execute_input": "2024-03-12T03:03:13.867438Z",
     "iopub.status.busy": "2024-03-12T03:03:13.865718Z",
     "iopub.status.idle": "2024-03-12T03:03:17.837506Z",
     "shell.execute_reply": "2024-03-12T03:03:17.835528Z"
    },
    "jupyter": {
     "outputs_hidden": false
    },
    "papermill": {
     "duration": 4.000954,
     "end_time": "2024-03-12T03:03:17.840995",
     "exception": false,
     "start_time": "2024-03-12T03:03:13.840041",
     "status": "completed"
    },
    "tags": []
   },
   "outputs": [
    {
     "name": "stderr",
     "output_type": "stream",
     "text": [
      "\u001b[1m\u001b[22m`summarise()` has grouped output by 'member_casual'. You can override using the\n",
      "`.groups` argument.\n"
     ]
    },
    {
     "data": {
      "text/html": [
       "<table class=\"dataframe\">\n",
       "<caption>A grouped_df: 14 × 4</caption>\n",
       "<thead>\n",
       "\t<tr><th scope=col>member_casual</th><th scope=col>weekday</th><th scope=col>number_of_rides</th><th scope=col>average_duration</th></tr>\n",
       "\t<tr><th scope=col>&lt;chr&gt;</th><th scope=col>&lt;ord&gt;</th><th scope=col>&lt;int&gt;</th><th scope=col>&lt;dbl&gt;</th></tr>\n",
       "</thead>\n",
       "<tbody>\n",
       "\t<tr><td>casual</td><td>Sun</td><td>181293</td><td>3581.4054</td></tr>\n",
       "\t<tr><td>casual</td><td>Mon</td><td>103296</td><td>3372.2869</td></tr>\n",
       "\t<tr><td>casual</td><td>Tue</td><td> 90510</td><td>3596.3599</td></tr>\n",
       "\t<tr><td>casual</td><td>Wed</td><td> 92457</td><td>3718.6619</td></tr>\n",
       "\t<tr><td>casual</td><td>Thu</td><td>102679</td><td>3682.9847</td></tr>\n",
       "\t<tr><td>casual</td><td>Fri</td><td>122404</td><td>3773.8351</td></tr>\n",
       "\t<tr><td>casual</td><td>Sat</td><td>209543</td><td>3331.9138</td></tr>\n",
       "\t<tr><td>member</td><td>Sun</td><td>267965</td><td> 919.9746</td></tr>\n",
       "\t<tr><td>member</td><td>Mon</td><td>472196</td><td> 842.5726</td></tr>\n",
       "\t<tr><td>member</td><td>Tue</td><td>508445</td><td> 826.1427</td></tr>\n",
       "\t<tr><td>member</td><td>Wed</td><td>500329</td><td> 823.9996</td></tr>\n",
       "\t<tr><td>member</td><td>Thu</td><td>484177</td><td> 823.9278</td></tr>\n",
       "\t<tr><td>member</td><td>Fri</td><td>452790</td><td> 824.5305</td></tr>\n",
       "\t<tr><td>member</td><td>Sat</td><td>287958</td><td> 968.9337</td></tr>\n",
       "</tbody>\n",
       "</table>\n"
      ],
      "text/latex": [
       "A grouped\\_df: 14 × 4\n",
       "\\begin{tabular}{llll}\n",
       " member\\_casual & weekday & number\\_of\\_rides & average\\_duration\\\\\n",
       " <chr> & <ord> & <int> & <dbl>\\\\\n",
       "\\hline\n",
       "\t casual & Sun & 181293 & 3581.4054\\\\\n",
       "\t casual & Mon & 103296 & 3372.2869\\\\\n",
       "\t casual & Tue &  90510 & 3596.3599\\\\\n",
       "\t casual & Wed &  92457 & 3718.6619\\\\\n",
       "\t casual & Thu & 102679 & 3682.9847\\\\\n",
       "\t casual & Fri & 122404 & 3773.8351\\\\\n",
       "\t casual & Sat & 209543 & 3331.9138\\\\\n",
       "\t member & Sun & 267965 &  919.9746\\\\\n",
       "\t member & Mon & 472196 &  842.5726\\\\\n",
       "\t member & Tue & 508445 &  826.1427\\\\\n",
       "\t member & Wed & 500329 &  823.9996\\\\\n",
       "\t member & Thu & 484177 &  823.9278\\\\\n",
       "\t member & Fri & 452790 &  824.5305\\\\\n",
       "\t member & Sat & 287958 &  968.9337\\\\\n",
       "\\end{tabular}\n"
      ],
      "text/markdown": [
       "\n",
       "A grouped_df: 14 × 4\n",
       "\n",
       "| member_casual &lt;chr&gt; | weekday &lt;ord&gt; | number_of_rides &lt;int&gt; | average_duration &lt;dbl&gt; |\n",
       "|---|---|---|---|\n",
       "| casual | Sun | 181293 | 3581.4054 |\n",
       "| casual | Mon | 103296 | 3372.2869 |\n",
       "| casual | Tue |  90510 | 3596.3599 |\n",
       "| casual | Wed |  92457 | 3718.6619 |\n",
       "| casual | Thu | 102679 | 3682.9847 |\n",
       "| casual | Fri | 122404 | 3773.8351 |\n",
       "| casual | Sat | 209543 | 3331.9138 |\n",
       "| member | Sun | 267965 |  919.9746 |\n",
       "| member | Mon | 472196 |  842.5726 |\n",
       "| member | Tue | 508445 |  826.1427 |\n",
       "| member | Wed | 500329 |  823.9996 |\n",
       "| member | Thu | 484177 |  823.9278 |\n",
       "| member | Fri | 452790 |  824.5305 |\n",
       "| member | Sat | 287958 |  968.9337 |\n",
       "\n"
      ],
      "text/plain": [
       "   member_casual weekday number_of_rides average_duration\n",
       "1  casual        Sun     181293          3581.4054       \n",
       "2  casual        Mon     103296          3372.2869       \n",
       "3  casual        Tue      90510          3596.3599       \n",
       "4  casual        Wed      92457          3718.6619       \n",
       "5  casual        Thu     102679          3682.9847       \n",
       "6  casual        Fri     122404          3773.8351       \n",
       "7  casual        Sat     209543          3331.9138       \n",
       "8  member        Sun     267965           919.9746       \n",
       "9  member        Mon     472196           842.5726       \n",
       "10 member        Tue     508445           826.1427       \n",
       "11 member        Wed     500329           823.9996       \n",
       "12 member        Thu     484177           823.9278       \n",
       "13 member        Fri     452790           824.5305       \n",
       "14 member        Sat     287958           968.9337       "
      ]
     },
     "metadata": {},
     "output_type": "display_data"
    }
   ],
   "source": [
    "all_trips_v2 %>% \n",
    "  mutate(weekday = wday(started_at, label = TRUE)) %>%  #creates weekday field using wday()\n",
    "  group_by(member_casual, weekday) %>%  #groups by usertype and weekday\n",
    "  summarise(number_of_rides = n()  #calculates the number of rides \n",
    "            ,average_duration = mean(ride_length)) %>%  #calculates the average duration\n",
    "  arrange(member_casual, weekday)  #sorts"
   ]
  },
  {
   "cell_type": "markdown",
   "id": "3c989a88",
   "metadata": {
    "_cell_guid": "61e6e8ec-02b6-4667-8206-d7d64850e647",
    "_uuid": "e5572701-d61a-4162-8157-bf99b96d98e0",
    "papermill": {
     "duration": 0.023478,
     "end_time": "2024-03-12T03:03:17.890922",
     "exception": false,
     "start_time": "2024-03-12T03:03:17.867444",
     "status": "completed"
    },
    "tags": []
   },
   "source": [
    "# Step 5: Share\n",
    "\n",
    "Key tasks:\n",
    "\n",
    "**1.Determine the best way to share your findings.**\n",
    "\n",
    "* Now that we have summary analysis, as well as infomration on ride trends by usertype and days of the week, we may proceed to creation of visuals.\n",
    "\n",
    "**2.Create effective data visualizations.**\n",
    "\n",
    "* Let's visualize the percentage share of riders by user type"
   ]
  },
  {
   "cell_type": "code",
   "execution_count": 39,
   "id": "0ba24e26",
   "metadata": {
    "_cell_guid": "877f1943-2d7a-4f60-bad2-977c70382aff",
    "_uuid": "6455f39e-be0b-42fc-aae3-24b885973277",
    "execution": {
     "iopub.execute_input": "2024-03-12T03:03:17.939026Z",
     "iopub.status.busy": "2024-03-12T03:03:17.937318Z",
     "iopub.status.idle": "2024-03-12T03:03:18.694306Z",
     "shell.execute_reply": "2024-03-12T03:03:18.692239Z"
    },
    "papermill": {
     "duration": 0.784172,
     "end_time": "2024-03-12T03:03:18.696888",
     "exception": false,
     "start_time": "2024-03-12T03:03:17.912716",
     "status": "completed"
    },
    "tags": []
   },
   "outputs": [
    {
     "data": {
      "image/png": "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"
     },
     "metadata": {
      "image/png": {
       "height": 420,
       "width": 420
      }
     },
     "output_type": "display_data"
    }
   ],
   "source": [
    "# Calculate the percentage distribution of user types\n",
    "user_type_counts <- table(all_trips_v2$member_casual)\n",
    "percentage_distribution <- prop.table(user_type_counts) * 100\n",
    "\n",
    "# Create a bar plot using ggplot2\n",
    "ggplot(data = data.frame(User_type = names(percentage_distribution), Percentage = as.numeric(percentage_distribution)), \n",
    "  aes(x = User_type, y = Percentage)) +\n",
    "  geom_bar(stat = \"identity\", fill = \"Dark Turquoise\") +\n",
    "  labs(title = \"Percentage Distribution by User Type\\n\",\n",
    "       x = \"User Type\",y = \"Total, %\", tag=\"Fig.1\") + theme(plot.tag.position = \"topleft\") +\n",
    "  scale_y_continuous(labels = scales::percent_format(scale = 1)) +\n",
    "  theme_minimal(base_size = 14) +\n",
    "  theme(axis.title.y = element_text(vjust = +3),\n",
    "    axis.title.x = element_text(vjust = -0.75))"
   ]
  },
  {
   "cell_type": "markdown",
   "id": "e38b16c8",
   "metadata": {
    "_cell_guid": "4da0f34b-d63d-456f-8c47-8d9a1802826f",
    "_uuid": "753df182-8a39-43ae-8188-922d93a7794b",
    "papermill": {
     "duration": 0.023511,
     "end_time": "2024-03-12T03:03:18.743122",
     "exception": false,
     "start_time": "2024-03-12T03:03:18.719611",
     "status": "completed"
    },
    "tags": []
   },
   "source": [
    "* As shown on Figure 1, the majority (77%) of users consists of members, as compared to casual riders (23%).\n",
    "* Next, let's visualize the number of rides by rider type and weekdays"
   ]
  },
  {
   "cell_type": "code",
   "execution_count": 40,
   "id": "e0e833f7",
   "metadata": {
    "_cell_guid": "ff521e39-11e7-4969-80fb-e0469b76282c",
    "_kg_hide-output": false,
    "_uuid": "e77f7fb6-5079-460b-8096-76d6789becf5",
    "collapsed": false,
    "execution": {
     "iopub.execute_input": "2024-03-12T03:03:18.792256Z",
     "iopub.status.busy": "2024-03-12T03:03:18.790531Z",
     "iopub.status.idle": "2024-03-12T03:03:23.019271Z",
     "shell.execute_reply": "2024-03-12T03:03:23.017037Z"
    },
    "jupyter": {
     "outputs_hidden": false
    },
    "papermill": {
     "duration": 4.256426,
     "end_time": "2024-03-12T03:03:23.022018",
     "exception": false,
     "start_time": "2024-03-12T03:03:18.765592",
     "status": "completed"
    },
    "tags": []
   },
   "outputs": [
    {
     "name": "stderr",
     "output_type": "stream",
     "text": [
      "\u001b[1m\u001b[22m`summarise()` has grouped output by 'member_casual'. You can override using the\n",
      "`.groups` argument.\n"
     ]
    },
    {
     "data": {
      "image/png": "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"
     },
     "metadata": {
      "image/png": {
       "height": 420,
       "width": 420
      }
     },
     "output_type": "display_data"
    }
   ],
   "source": [
    "all_trips_v2 %>% \n",
    "  mutate(weekday = wday(started_at, label = TRUE)) %>% \n",
    "  group_by(member_casual, weekday) %>% \n",
    "  summarise(number_of_rides = n()\n",
    "            ,average_duration = mean(ride_length)) %>% \n",
    "  arrange(member_casual, weekday)  %>%\n",
    "  ggplot(aes(x = weekday, y = number_of_rides, fill = member_casual)) +\n",
    "  geom_col(position = \"dodge\") +\n",
    "  labs(title = \"Number of Rides by User Type and Days\\n\", x = \"Day of the Week\", \n",
    "       y = \"Number of rides\", fill=\"User type\", tag=\"Fig.2\") + theme(plot.tag.position = \"topleft\") +\n",
    "       scale_y_continuous(labels = scales::comma) +\n",
    "       theme_minimal(base_size = 14) +\n",
    "       theme(axis.title.y = element_text(vjust = +3),\n",
    "       axis.title.x = element_text(vjust = -0.75))"
   ]
  },
  {
   "cell_type": "markdown",
   "id": "a6f31566",
   "metadata": {
    "_cell_guid": "462bb674-5dd7-460a-8833-eed3dfb69e57",
    "_uuid": "f228c854-d619-411f-a740-5b270ff005d5",
    "papermill": {
     "duration": 0.030751,
     "end_time": "2024-03-12T03:03:23.076357",
     "exception": false,
     "start_time": "2024-03-12T03:03:23.045606",
     "status": "completed"
    },
    "tags": []
   },
   "source": [
    "* The number of rides by members is highest during weekdays (Monday to Friday), as opposed to casual riders, who prefer to use bikes more on Saturdays and Sundays.\n",
    "* Further, let's visualize the number of rides by rider type and months"
   ]
  },
  {
   "cell_type": "code",
   "execution_count": 41,
   "id": "26037645",
   "metadata": {
    "_cell_guid": "5b85ee8d-6607-4663-ae99-a39898b7e9cd",
    "_uuid": "b498a93d-6399-4a9f-9d20-4bb30dc7a201",
    "collapsed": false,
    "execution": {
     "iopub.execute_input": "2024-03-12T03:03:23.130076Z",
     "iopub.status.busy": "2024-03-12T03:03:23.128304Z",
     "iopub.status.idle": "2024-03-12T03:03:27.744632Z",
     "shell.execute_reply": "2024-03-12T03:03:27.742557Z"
    },
    "jupyter": {
     "outputs_hidden": false
    },
    "papermill": {
     "duration": 4.646598,
     "end_time": "2024-03-12T03:03:27.747304",
     "exception": false,
     "start_time": "2024-03-12T03:03:23.100706",
     "status": "completed"
    },
    "tags": []
   },
   "outputs": [
    {
     "name": "stderr",
     "output_type": "stream",
     "text": [
      "\u001b[1m\u001b[22m`summarise()` has grouped output by 'member_casual'. You can override using the\n",
      "`.groups` argument.\n"
     ]
    },
    {
     "data": {
      "image/png": "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\nctBxZe9PNutcWn1SRDp1rqNLkZz0XoV7DShvNd9ZdjEmY93Zc8g96OL6Cb9diy/ecvSoNxr6\nphiE1i2oRZ+PBzwfeufs2il/3shYp+npPuhFc8LZsTP/yNpuM0qj9WjYfUKrQj4398/cF2N0\n7WCgDszYwRnCD21a+OPm42cvxSRafPLkq1jt+Td6vF7Q/e40wJ/9Ok+Lrfnt6IoTps49ceWO\nwSugUFjZ1j371yv5iBOsGWWMOr1swcpdB/+JjLcGhRaq2aBZp9b13DUP/O8ffmj9N0vW/XPh\nhs4rb4Vq9Tu/1S7MK/1fjQINOsjyifP/uD6hfoHkhREH5ptFOtUP/WhpBvbAzr6dvkp86btv\nXpr9yeTfDp8btvj7aj7pnEuK/nf+lSRL0UZvGjyKvp7fe+nVbTvu9H3B/+5aHVu3zPf6tFfM\nPyz46Y87RsXbP1+lZxt06dk20xXt39g0tvTSz8P6fXOy4+zl7UO9ktsv7dVh1e2A71bM9Mz4\nNUZLe7Rfa6yxcvHg5CVRp8d1+d+B7vNXtsrrka3HlT0DyFyfaf9k7al458zObxasPHL6ssYr\nX42G7bu9dO6NXmt6L1zZLM+jh6TRiYjsP3mnVvXglMvzPjXgq69iPfL5Ji9J47cp3UMuDbOX\nn9G55RvdpeojX63ff9jsXUMOz14jtXqJyJ0zu+d+t+bQifMJVrdCpSo2e71bo8qhIrK2V4e5\n4XEiMuvN1+f7Vlu1dEzaRYOr9ela8eDC3yavafVUqzDfxzWLObdv/tIfD574LzpJyZs/rFaD\nlm+2rG2bO9w9pvukIxGjlq6qkeLM79Zhb35xKvrjZd+Xt+M95B5Nqz6V14zc/f2O6zWaF7Yt\nSveN63H7AWDGDtnu9t+L+nw48+Bl5bmGzdq1faVamPeeX5aNGL4iZRtL0sX33pseV6Bap+49\nWzeoEH5y7/QRg68ZLY/r007GO0cG9xrx444TxavWfbVVo5JBCWsWfNZn1AJLihmFuKtr+n04\nJy6gZOMWTSsU0e/bumJonw+uG9Of4DH4Vm0a6PHvd9tSLty55LRHYLOnHwxJ9uwBUYzfDhl2\nzlCqXbe3irqn/yfh8Ny9ItLqtaIi8kKnEiLyw48XUzYI3/nJ59/vCqpQs2XrZhUK6/7YtHRw\nv4/vpNzyjFS0c2PT3tL89d7UajTbv/s3ub0p7q/vr8eH1Ho7E6nOHtl0XGWrdH+yaYu9tLHv\n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"
     },
     "metadata": {
      "image/png": {
       "height": 420,
       "width": 420
      }
     },
     "output_type": "display_data"
    }
   ],
   "source": [
    "all_trips_v2 %>% \n",
    "  mutate(month = month(started_at, label = TRUE)) %>% \n",
    "  group_by(member_casual, month) %>% \n",
    "  summarise(number_of_rides = n()\n",
    "            ,average_duration = mean(ride_length)) %>% \n",
    "  arrange(member_casual, month)  %>% \n",
    "  ggplot(aes(x = month, y = number_of_rides, fill = member_casual)) +\n",
    "  geom_col(position = \"dodge\") +\n",
    "  labs(title = \"Number of Rides by User Type and Months\\n\", x = \"Months\", \n",
    "  y = \"Number of Rides\", fill=\"User Type\", tag=\"Fig.3\") + theme(plot.tag.position = \"topleft\") +\n",
    "  scale_y_continuous(labels = scales::comma) +\n",
    "  theme_minimal(base_size = 14) +\n",
    "  theme(axis.title.y = element_text(vjust = +3),\n",
    "axis.title.x = element_text(vjust = -0.75))"
   ]
  },
  {
   "cell_type": "markdown",
   "id": "108f34d9",
   "metadata": {
    "_cell_guid": "bb3b8ae3-a083-4074-9bbe-76269dd49d77",
    "_uuid": "8f78da01-5813-4559-97b4-f0e1444a68df",
    "papermill": {
     "duration": 0.024445,
     "end_time": "2024-03-12T03:03:27.796449",
     "exception": false,
     "start_time": "2024-03-12T03:03:27.772004",
     "status": "completed"
    },
    "tags": []
   },
   "source": [
    "* Here we can observe similar trend in rides between members and casual users during specific months of the year. Both user types generally ride more during warmer months - from April to October. The lowest number of rides can be observed during months of January and February for both user types, assuming that Chicago weather might not be very comfotable for rides during winter months.\n",
    "* Finally, let's visualize average duration of rides"
   ]
  },
  {
   "cell_type": "code",
   "execution_count": 42,
   "id": "b935ad2a",
   "metadata": {
    "_cell_guid": "d7850ba3-6d8c-449f-a2dd-dc8d192e7671",
    "_uuid": "fb428897-aa66-4e8c-bf84-9873a62865dd",
    "collapsed": false,
    "execution": {
     "iopub.execute_input": "2024-03-12T03:03:27.849417Z",
     "iopub.status.busy": "2024-03-12T03:03:27.847522Z",
     "iopub.status.idle": "2024-03-12T03:03:31.977871Z",
     "shell.execute_reply": "2024-03-12T03:03:31.975823Z"
    },
    "jupyter": {
     "outputs_hidden": false
    },
    "papermill": {
     "duration": 4.160179,
     "end_time": "2024-03-12T03:03:31.980989",
     "exception": false,
     "start_time": "2024-03-12T03:03:27.820810",
     "status": "completed"
    },
    "tags": []
   },
   "outputs": [
    {
     "name": "stderr",
     "output_type": "stream",
     "text": [
      "\u001b[1m\u001b[22m`summarise()` has grouped output by 'member_casual'. You can override using the\n",
      "`.groups` argument.\n"
     ]
    },
    {
     "data": {
      "image/png": "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\nTkSuQmCC"
     },
     "metadata": {
      "image/png": {
       "height": 420,
       "width": 420
      }
     },
     "output_type": "display_data"
    }
   ],
   "source": [
    "all_trips_v2 %>% \n",
    "  mutate(weekday = wday(started_at, label = TRUE)) %>% \n",
    "  group_by(member_casual, weekday) %>% \n",
    "  summarise(number_of_rides = n()\n",
    "            ,average_duration = mean(ride_length)) %>% \n",
    "  arrange(member_casual, weekday)  %>% \n",
    "  ggplot(aes(x = weekday, y = average_duration, fill = member_casual)) +\n",
    "  geom_col(position = \"dodge\") +\n",
    "  labs(title = \"Average Duration of Trip by User Type and Days\\n\", \n",
    "       x = \"Day of the week\", y = \"Average duration of trip, in sec\", fill=\"User Type\", tag=\"Fig.4\") +\n",
    "       theme(plot.tag.position = \"topleft\") +\n",
    "       theme_minimal(base_size = 14) +\n",
    "       theme(axis.title.y = element_text(vjust = +3),\n",
    "       axis.title.x = element_text(vjust = -0.75))"
   ]
  },
  {
   "cell_type": "markdown",
   "id": "4fbb62e4",
   "metadata": {
    "_cell_guid": "be1e0258-e760-4c41-b788-9dae5b344727",
    "_uuid": "a07fa47a-6516-4abb-b3b9-b30a0f3f6cd5",
    "papermill": {
     "duration": 0.028514,
     "end_time": "2024-03-12T03:03:32.037824",
     "exception": false,
     "start_time": "2024-03-12T03:03:32.009310",
     "status": "completed"
    },
    "tags": []
   },
   "source": [
    "* Average duration of trips for members is similar throughout the week - members typically have shorter rides. In contrast, casual users spend longer time riding a bike, and their trip duration doesn't change significantly throughout the week."
   ]
  },
  {
   "cell_type": "markdown",
   "id": "783b5cfc",
   "metadata": {
    "_cell_guid": "6389d203-3b69-4469-b1bf-48676562a3d6",
    "_uuid": "66b5f384-04fd-40dd-8402-f044775c9fdd",
    "papermill": {
     "duration": 0.02593,
     "end_time": "2024-03-12T03:03:32.091939",
     "exception": false,
     "start_time": "2024-03-12T03:03:32.066009",
     "status": "completed"
    },
    "tags": []
   },
   "source": [
    "# Step 6: Act\n",
    "\n",
    "Key tasks:\n",
    "\n",
    "**Provide top three recommendations based on the analysis.**\n",
    "\n",
    "After analysis and visualisation of data the main noticeable insights are as following:\n",
    "\n",
    "* There is a significantly higher number of member users, as compared to casual riders.\n",
    "* Casual riders tend to use bicycles more on weekends, whereas members' usage is higher on weekdays. This might mean that casual riders prefer bikes for leisure purposes, as opposed to members, who use bikes more consistently - for work/school/other daily activities.\n",
    "* Both casuals and members are using bikes more often during warmer months - from April to October; the least common months for usage are January and February.\n",
    "* Average trip duration has similar stable trends for both user types - casual riders ride for longer periods of time, whereas members- for shorter. This may further support our assumption of usage purposes, which are: leisure for casuals, and work for members.\n",
    "\n",
    "**Based on the above findings my recommendations would be:**\n",
    "\n",
    "1. Since casual riders use bikes more during the weekends, it might be beneficial to launch marketing campaigns focused on providing a discount for weekend rides with a purchase of membership.\n",
    "2. It would be also beneficial to start actively promoting digital media campaigns before and during the peak season - from mid of March until end of October.\n",
    "3. Due to a longer ride durations by members it might also be a good idea to launch promotions and incentives for membership purchases for those who reach a certain mileage in ride."
   ]
  }
 ],
 "metadata": {
  "kaggle": {
   "accelerator": "none",
   "dataSources": [
    {
     "datasetId": 4545548,
     "sourceId": 7770082,
     "sourceType": "datasetVersion"
    }
   ],
   "dockerImageVersionId": 30618,
   "isGpuEnabled": false,
   "isInternetEnabled": false,
   "language": "r",
   "sourceType": "notebook"
  },
  "kernelspec": {
   "display_name": "R",
   "language": "R",
   "name": "ir"
  },
  "language_info": {
   "codemirror_mode": "r",
   "file_extension": ".r",
   "mimetype": "text/x-r-source",
   "name": "R",
   "pygments_lexer": "r",
   "version": "4.0.5"
  },
  "papermill": {
   "default_parameters": {},
   "duration": 89.124653,
   "end_time": "2024-03-12T03:03:32.341217",
   "environment_variables": {},
   "exception": null,
   "input_path": "__notebook__.ipynb",
   "output_path": "__notebook__.ipynb",
   "parameters": {},
   "start_time": "2024-03-12T03:02:03.216564",
   "version": "2.5.0"
  }
 },
 "nbformat": 4,
 "nbformat_minor": 5
}
