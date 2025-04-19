#!/bin/bash
set -euxo pipefail

# Load config if needed
# shellcheck disable=SC1091
source ../config.sh

# Output directory
MULTIQC_OUT="../results/multiqc_report"

# Create the output directory
mkdir -p "$MULTIQC_OUT"

# Run MultiQC on all results (FastQC and fastp)
multiqc ../results/ -o "$MULTIQC_OUT"

echo "✅ MultiQC report generated in $MULTIQC_OUT"
