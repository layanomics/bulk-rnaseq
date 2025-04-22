#!/bin/bash

# 03_quantification/scripts/config.sh

# ---------- Quantification Config ----------
# shellcheck disable=SC2034
THREADS=12
STRANDNESS=2 # Reverse-stranded (confirmed from metadata)
BAM_DIR="../../02_alignment/results/star_aligned"
OUT_DIR="../results"
GTF_FILE="../../data/reference-data/annotation.gtf"
