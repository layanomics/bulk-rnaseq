# 🧬 Bulk RNA-seq Pipeline – 01_Preprocessing
[![Conda Environment](https://img.shields.io/badge/env-conda-blue)](https://docs.conda.io/)   
[![License: MIT](https://img.shields.io/badge/license-MIT-blue.svg)](../LICENSE)

Preprocessing step for paired-end bulk RNA-seq data using `fastqc` and `fastp`.

This module performs quality control and trimming of raw FASTQ files before downstream alignment or quantification.

---

## 🚀 How to Run Preprocessing (Paired-End FASTQ)

Make sure your Conda environment is activated and all dependencies (e.g., `fastqc`, `fastp`) are installed.

```bash
# Activate the environment
conda activate bulkrnaseq

# Navigate to the preprocessing script
cd 01_preprocessing/scripts

# Run the preprocessing pipeline
bash preprocess_paired.sh
```

---

## 📊 MultiQC Summary Report

After running FastQC and fastp, you can generate a unified quality control report using [MultiQC](https://multiqc.info/).

### ✅ How to Run

Make sure you’ve activated your environment and installed MultiQC:

```bash
conda activate bulkrnaseq
conda install -c bioconda multiqc
```

Then run the script:

```bash
cd 01_preprocessing/scripts
bash run_multiqc.sh
```

This will scan all outputs in `results/` and create a summary report.

---

### 📂 Output

- `results/multiqc_report/` — Contains `multiqc_report.html` and associated files

You can open the HTML file in your browser to explore:
- FastQC results (before and after trimming)
- fastp trimming statistics
- Overall project quality trends

---

## 📂 Output Directories

- `results/fastqc_raw/` — FastQC reports for raw reads  
- `results/fastp_cleaned/` — Trimmed FASTQ files and fastp HTML/JSON reports  
- `results/fastqc_cleaned/` — FastQC reports for cleaned reads  
- `results/multiqc_report/` — MultiQC HTML summary of all QC steps

---

## 📎 Notes

- Configuration is set in `config.sh`  
- Input FASTQ files must be in `data/raw/` and follow the naming pattern:  
  `sampleID_1.fastq` and `sampleID_2.fastq`  
- The script processes each pair and runs both raw and post-trimming FastQC

---

## 🔧 Dependencies

The following tools are required in the `bulkrnaseq` conda environment:

- `fastqc`  
- `fastp`  
- `multiqc`

Install using:

```bash
conda install -c bioconda fastqc fastp multiqc
```

---

## 📁 Folder Structure

```
01_preprocessing/
├── config.sh                # Configuration (paths and threads)
├── README.md                # This file
├── results/                 # All outputs go here
│   ├── fastqc_raw/
│   ├── fastp_cleaned/
│   ├── fastqc_cleaned/
│   └── multiqc_report/      # ✅ NEW: summary report folder
└── scripts/
    ├── preprocess_paired.sh
    └── run_multiqc.sh       # ✅ NEW: script to run MultiQC
```

---

## 📘 License

This project is licensed under the MIT License. See the [LICENSE](../LICENSE) file for details.
