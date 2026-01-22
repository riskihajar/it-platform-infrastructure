#!/bin/bash

# Create Submission Package for Deep Learning & Big Data Course
# Muhammad Rizky Hajar - 24.55.2714

echo "Creating submission package for DL-Tugas..."

# Set variables
STUDENT_NAME="Muhammad_Rizky_Hajar"
NIM="24_55_2714"
TIMESTAMP=$(date +"%Y%m%d")
PACKAGE_NAME="${STUDENT_NAME}_${NIM}_DL_Tugas_${TIMESTAMP}"

# Create submission directory
mkdir -p "submission/${PACKAGE_NAME}"

# Copy notebooks and PDFs
echo "Copying notebooks and PDFs..."
mkdir -p "submission/${PACKAGE_NAME}/notebooks"
cp notebooks/*.ipynb "submission/${PACKAGE_NAME}/notebooks/"
cp notebooks/*.pdf "submission/${PACKAGE_NAME}/notebooks/"

# Copy essential data files (not all data, as some are large)
echo "Copying sample data files..."
mkdir -p "submission/${PACKAGE_NAME}/data"
cp data/winequality-red.csv "submission/${PACKAGE_NAME}/data/"

# Create data README to explain where to get full datasets
cat > "submission/${PACKAGE_NAME}/data/README_DATASETS.txt" << EOF
DATASET INFORMATION
==================

1. Wine Quality Dataset (Included)
   - File: winequality-red.csv
   - Size: Small (included in submission)

2. MovieLens 100K Dataset (Not included - too large)
   - Download from: https://grouplens.org/datasets/movielens/100k/
   - Extract to: data/ml-100k/
   - Required files: u.data, u.item, u.user

3. Flight Network Dataset (Not included - too large)
   - Files needed:
     - flights.csv (26MB)
     - airports.dat (1.1MB)
   - Available from course materials or instructor

Note: Full datasets not included due to size constraints.
Please download from the sources mentioned above.
EOF

# Copy documentation
echo "Copying documentation..."
cp README.md "submission/${PACKAGE_NAME}/"
cp requirements.txt "submission/${PACKAGE_NAME}/"

# Copy Neo4j script if exists
if [ -f "run_neo4j.sh" ]; then
    cp run_neo4j.sh "submission/${PACKAGE_NAME}/"
fi

# Create submission info file
cat > "submission/${PACKAGE_NAME}/SUBMISSION_INFO.txt" << EOF
=====================================
DEEP LEARNING & BIG DATA - SUBMISSION
=====================================

Student Name: Muhammad Rizky Hajar
NIM: 24.55.2714
Program: PJJ Informatika - BDPA
Course: IT Platform and Infrastructure
Submission Date: $(date +"%d %B %Y")

INCLUDED ASSIGNMENTS:
--------------------
1. Tugas 2: PySpark Classification (Wine Quality)
   - Notebook: notebooks/pyspark_classification.ipynb
   - PDF: notebooks/pyspark_classification.pdf

2. Tugas 3: Recommender System (MovieLens)
   - Notebook: notebooks/recommender_system.ipynb
   - PDF: notebooks/recommender_system.pdf

3. Tugas 4: Graph Analysis (Flight Network)
   - Notebook: notebooks/graph_analysis.ipynb
   - PDF: notebooks/graph_analysis.pdf

SETUP INSTRUCTIONS:
------------------
1. Install Python 3.12+
2. Create virtual environment: python -m venv venv
3. Activate: source venv/bin/activate
4. Install dependencies: pip install -r requirements.txt
5. Download missing datasets (see data/README_DATASETS.txt)
6. Run Jupyter: jupyter notebook

TECHNOLOGY STACK:
----------------
- Apache Spark 4.1.1
- PySpark MLlib
- GraphFrames 0.10.0
- Jupyter Notebook
- Python libraries: pandas, numpy, matplotlib, seaborn, networkx, folium

NOTES:
------
- All notebooks have been tested and run successfully
- PDF exports are included for offline review
- Full datasets not included due to size (see data/README_DATASETS.txt)
- Neo4j integration is optional (requires Docker)

=====================================
EOF

# Create ZIP archive
echo "Creating ZIP archive..."
cd submission
zip -r "${PACKAGE_NAME}.zip" "${PACKAGE_NAME}"
cd ..

# Calculate file sizes
echo ""
echo "Submission package created successfully!"
echo "----------------------------------------"
echo "Package location: submission/${PACKAGE_NAME}.zip"
echo "Package contents:"
ls -lah "submission/${PACKAGE_NAME}/"*
echo ""
echo "Archive size:"
ls -lah "submission/${PACKAGE_NAME}.zip"

echo ""
echo "✅ Submission package ready for upload!"
echo "File: submission/${PACKAGE_NAME}.zip"