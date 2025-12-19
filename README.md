# Enterprise Performance Analytics Pipeline

![Status](https://img.shields.io/badge/Status-In%20Development-yellow) ![Stack](https://img.shields.io/badge/Stack-Snowflake%20%7C%20dbt%20%7C%20Python-blue)

## 📋 Project Overview
This project is an end-to-end **ELT (Extract, Load, Transform)** pipeline designed to measure business performance metrics. It ingests raw transactional data, loads it into **Snowflake**, and transforms it into a **Star Schema** using **dbt** for high-performance reporting.

## 🏗 Architecture
**Source API** $\rightarrow$ **Python (Extract)** $\rightarrow$ **Snowflake (Raw Stage)** $\rightarrow$ **dbt (Transform & Test)** $\rightarrow$ **BI Layer**

## 🛠 Tech Stack
- **Data Warehouse:** Snowflake
- **Transformation:** dbt Core (Data Build Tool)
- **Ingestion:** Python (Pandas, Requests)
- **Data Modeling:** Dimensional Modeling (Kimball Star Schema)
- **Orchestration:** Airflow (Planned)

## 📂 Repository Structure
```text
├── dags/                  # Airflow DAGs for scheduling
├── dbt_project/           # dbt models, snapshots, and tests
│   ├── models/
│   │   ├── staging/       # Cleaned raw data (1:1 with source)
│   │   └── marts/         # Final Fact/Dimension tables (Star Schema)
├── src/                   # Python extraction scripts
└── README.md
