#!/bin/bash
# shellcheck disable=SC2034

# ---------- INPUT ----------
GENOME_FA_GZ="../../data/reference-data/genome.fa.gz"
ANNOTATION_GTF_GZ="../../data/reference-data/annotation.gtf.gz"
INPUT_DIR="../../01_preprocessing/results/fastp_cleaned"

# ---------- OUTPUT ----------
INDEX_DIR="../results/star_index"
ALIGN_OUT_DIR="../results/star_aligned"

# ---------- PARAMETERS ----------
THREADS=12
SJDB_OVERHANG=100 # Typically read length - 1
