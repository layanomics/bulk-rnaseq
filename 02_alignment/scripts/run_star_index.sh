#!/bin/bash
set -e

# Activate your conda environment with star installed (if applicable)

# shellcheck disable=SC1091
source ./config.sh

# Create output directory
mkdir -p "$INDEX_DIR"

# Unzip genome and annotation temporarily (STAR doesn’t accept .gz)
gunzip -c "$GENOME_FA_GZ" >genome.fa
gunzip -c "$ANNOTATION_GTF_GZ" >annotation.gtf

# Run STAR indexing
STAR --runThreadN "$THREADS" \
    --runMode genomeGenerate \
    --genomeDir "$INDEX_DIR" \
    --genomeFastaFiles genome.fa \
    --sjdbGTFfile annotation.gtf \
    --sjdbOverhang "$SJDB_OVERHANG"

# Clean up temp files
rm genome.fa annotation.gtf

echo "✅ STAR indexing complete. Index stored in $INDEX_DIR"
