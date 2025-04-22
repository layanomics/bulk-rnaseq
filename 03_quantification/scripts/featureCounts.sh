#!/bin/bash
set -euo pipefail

# Load local config for quantification
# shellcheck disable=SC1091
source ./config.sh

# Create output directory if needed
mkdir -p "$OUT_DIR"

# Run featureCounts
featureCounts \
    -T "$THREADS" \
    -s "$STRANDNESS" \
    -a "$GTF_FILE" \
    -o "$OUT_DIR/gene_counts.txt" \
    -g gene_id \
    -t exon \
    -p \
    -B \
    -C \
    "$BAM_DIR"/*.bam

# Extract only the gene ID and count columns
cut -f1,7- >"$OUT_DIR/FeatureCounts_Mod.txt"

# Optional: Clean column names by removing path and _sorted.bam suffix
sed -i '1s|.*/||; 1s/_sorted.bam||g' "$OUT_DIR/FeatureCounts_Mod.txt"

echo "✅ featureCounts complete."
echo "🧬 Clean counts saved to $OUT_DIR/FeatureCounts_Mod.txt"
