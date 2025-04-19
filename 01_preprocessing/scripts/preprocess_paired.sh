#!/bin/bash

# exit at any error
set -euxo pipefail

# Load paths and parameters
# shellcheck disable=SC1091
source "$(dirname "$0")/../config.sh"

# Create output directories
mkdir -p "$FASTQC_RAW" "$FASTP_OUT" "$FASTQC_CLEANED"

# Loop through *_1.fastq and pair with *_2.fastq
for file1 in "$INPUT_DIR"/*_1.fastq; do
    # Extract the file name without the path and extension
    sample=$(basename "$file1" _1.fastq)
    file2="${INPUT_DIR}/${sample}_2.fastq"

    # Run FastQC
    echo "🔍 Running FastQC on raw reads: $sample"
    fastqc "$file1" "$file2" --threads "$THREADS" --outdir="$FASTQC_RAW"

    # Run Fastp
    echo "✨ Running Fastp to clean: $sample"
    fastp \
        -i "$file1" \
        -I "$file2" \
        -o "${FASTP_OUT}/${sample}_1_trimmed.fastq" \
        -O "${FASTP_OUT}/${sample}_2_trimmed.fastq" \
        -h "${FASTP_OUT}/${sample}_fastp.html" \
        -j "${FASTP_OUT}/${sample}_fastp.json"

    # re-run fastqc to assess post-trimming quality
    echo "🔁 Running FastQC on cleaned reads: $sample"
    fastqc \
        "${FASTP_OUT}/${sample}_1_trimmed.fastq" \
        "${FASTP_OUT}/${sample}_2_trimmed.fastq" \
        --threads "$THREADS" \
        --outdir="$FASTQC_CLEANED"
done

echo "✅ All preprocessing steps complete."
