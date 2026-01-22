# Deep Learning & Big Data - Tugas 2, 3, dan 4
**Mata Kuliah**: IT Platform and Infrastructure  
**Mahasiswa**: Muhammad Rizky Hajar  
**NIM**: 24.55.2714  
**Program**: PJJ Informatika - BDPA  

## 📋 Deskripsi Proyek
Repository ini berisi implementasi tugas-tugas mata kuliah Deep Learning & Big Data menggunakan Apache Spark dan berbagai teknik machine learning.

### Tugas yang Diimplementasikan:
1. **Tugas 2**: PySpark Classification - Random Forest pada Wine Quality Dataset
2. **Tugas 3**: Recommender System - Collaborative Filtering dan Matrix Factorization
3. **Tugas 4**: Graph Analysis - GraphFrames untuk Analisis Jaringan Penerbangan

## 🚀 Quick Start

### Prerequisites
- Python 3.12+
- Java 8 atau 11 (untuk PySpark)
- Docker (opsional, untuk Neo4j)

### Setup Environment

```bash
# Clone repository
git clone <repository-url>

# Buat virtual environment
python -m venv venv

# Aktivasi virtual environment
source venv/bin/activate  # MacOS/Linux
# atau
venv\Scripts\activate  # Windows

# Install dependencies
pip install -r requirements.txt
```

### Menjalankan Jupyter Notebook

```bash
# Start Jupyter
jupyter notebook

# Buka browser dan navigasi ke notebooks/
```

## 📁 Struktur Proyek

```
.
├── notebooks/
│   ├── pyspark_classification.ipynb    # Tugas 2: Wine Quality Classification
│   ├── recommender_system.ipynb        # Tugas 3: Movie Recommender System
│   ├── graph_analysis.ipynb            # Tugas 4: Flight Network Analysis
│   └── *.pdf                           # PDF exports dari notebooks
├── data/
│   ├── winequality-red.csv            # Dataset wine quality
│   ├── ml-100k/                        # MovieLens 100K dataset
│   │   ├── u.data                     # Ratings data
│   │   ├── u.item                     # Movie information
│   │   └── u.user                     # User information
│   └── flights/                        # Flight network data
│       ├── flights.csv                 # Flight delay data
│       └── airports.dat                # Airport information
├── requirements.txt                     # Python dependencies
├── run_neo4j.sh                        # Script untuk Neo4j Docker
└── README.md                           # Dokumentasi ini
```

## 📊 Detail Implementasi

### Tugas 2: PySpark Classification
**File**: `notebooks/pyspark_classification.ipynb`

**Fitur Utama**:
- Analisis dataset Wine Quality (red wine)
- Preprocessing: handling missing values, feature scaling
- Random Forest Classifier dengan hyperparameter tuning
- Evaluasi: Accuracy, Precision, Recall, F1-Score
- Feature importance analysis
- Visualisasi: Confusion matrix, ROC curve

**Teknologi**: PySpark MLlib, Pandas, Matplotlib, Seaborn

### Tugas 3: Recommender System
**File**: `notebooks/recommender_system.ipynb`

**Fitur Utama**:
- Dataset: MovieLens 100K (100,000 ratings)
- User-based Collaborative Filtering (Cosine & Pearson similarity)
- Item-based Collaborative Filtering 
- ALS (Alternating Least Squares) Matrix Factorization
- Hyperparameter tuning (K=10, 20, 50)
- Top-10 movie recommendations
- Evaluasi: RMSE, MAE
- Visualisasi perbandingan performa

**Teknologi**: PySpark MLlib, Pandas, NumPy, Matplotlib

### Tugas 4: Graph Analysis
**File**: `notebooks/graph_analysis.ipynb`

**Fitur Utama**:
- Analisis jaringan penerbangan (26MB flight data)
- Graph construction: Airports sebagai vertices, Flights sebagai edges
- Algoritma GraphFrames:
  - PageRank: Airport importance ranking
  - Connected Components: Network connectivity
  - Shortest Path: Optimal flight routes
  - Motif Finding: Pattern discovery
  - Label Propagation: Community detection
- Visualisasi:
  - NetworkX: Graph structure visualization
  - Folium: Interactive geographical maps
- Neo4j integration untuk graph database

**Teknologi**: GraphFrames 0.10.0, NetworkX, Folium, Neo4j

## 🔧 Konfigurasi Khusus

### GraphFrames untuk Spark 4.x
GraphFrames memerlukan konfigurasi khusus untuk Spark 4.x:

```python
from pyspark.sql import SparkSession

spark = SparkSession.builder \
    .appName("GraphAnalysis") \
    .config("spark.jars.packages", "io.graphframes:graphframes-spark4_2.13:0.10.0") \
    .config("spark.sql.adaptive.enabled", "true") \
    .config("spark.sql.adaptive.coalescePartitions.enabled", "true") \
    .getOrCreate()

# Set checkpoint directory untuk Connected Components
spark.sparkContext.setCheckpointDir("/tmp/graphframes-checkpoint")
```

### Neo4j Docker Setup (Opsional)
Untuk menjalankan Neo4j database:

```bash
# Menggunakan script yang disediakan
chmod +x run_neo4j.sh
./run_neo4j.sh

# Atau manual dengan Docker
docker run -d --name neo4j-graph \
  -p 7474:7474 -p 7687:7687 \
  -e NEO4J_AUTH=neo4j/password123 \
  neo4j:latest
```

Akses Neo4j Browser: http://localhost:7474  
Credentials: neo4j / password123

## ⚠️ Troubleshooting

### Common Issues & Solutions

1. **GraphFrames Import Error**
   ```
   Solution: Pastikan menggunakan GraphFrames 0.10.0 untuk Spark 4.x
   ```

2. **PySpark Function Conflicts**
   ```python
   # Hindari: from pyspark.sql.functions import *
   # Gunakan: Specific imports
   from pyspark.sql.functions import col, avg, count, desc
   ```

3. **DataFrame Join Ambiguity**
   ```python
   # Gunakan alias untuk menghindari ambiguous column references
   df1_alias = df1.alias("a")
   df2_alias = df2.alias("b")
   result = df1_alias.join(df2_alias, col("a.id") == col("b.id"))
   ```

4. **Memory Issues dengan Large Datasets**
   ```python
   # Sample data untuk testing
   df_sample = df.sample(fraction=0.1, seed=42)
   ```

## 📈 Hasil dan Evaluasi

### Tugas 2 - Wine Classification
- **Accuracy**: ~89% pada test set
- **Best Parameters**: maxDepth=10, numTrees=100
- **Top Features**: Alcohol, Sulphates, Volatile Acidity

### Tugas 3 - Recommender System
- **Best Model**: ALS dengan K=20
- **RMSE**: 0.92 pada test set
- **Coverage**: 95% untuk top-10 recommendations

### Tugas 4 - Graph Analysis
- **Total Airports**: 341 nodes
- **Total Flights**: 5,991 edges
- **Top Hub**: ATL (Atlanta) dengan highest PageRank
- **Connected Components**: 1 (fully connected network)

## 🤝 Kontributor
Muhammad Rizky Hajar - 24.55.2714

## 📄 License
This project is for educational purposes - IT Platform and Infrastructure Course

---
*Last Updated: January 2025*