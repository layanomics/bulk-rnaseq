#!/bin/bash
set -e
# Activate your conda environment with star installed (if applicable)
# shellcheck disable=SC1091
source ./config.sh

# Create output directory
mkdir -p "$ALIGN_OUT_DIR"

for R1 in "${INPUT_DIR}"/*_1_trimmed.fastq; do
    R2="${R1/_1_trimmed.fastq/_2_trimmed.fastq}"
    SAMPLE=$(basename "$R1" _1_trimmed.fastq)

    if [[ -f "$R1" && -f "$R2" ]]; then
        echo "🔄 Aligning sample: $SAMPLE"

        STAR --runThreadN "$THREADS" \
            --genomeDir "$INDEX_DIR" \
            --readFilesIn "$R1" "$R2" \
            --outFileNamePrefix "${ALIGN_OUT_DIR}/${SAMPLE}_" \
            --outSAMtype BAM SortedByCoordinate \
            --outSAMattrRGline ID:"${SAMPLE}" SM:"${SAMPLE}"

        echo "✅ Finished $SAMPLE"
    else
        echo "⚠️  One or both files missing for $SAMPLE — skipping."
    fi
done

echo "✅ All STAR alignments complete. Output in $ALIGN_OUT_DIR"
