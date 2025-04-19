#!/bin/bash
set -euxo pipefail

# Load config
source "$(dirname "$0")/../config.sh"

# Create output directory
mkdir -p "$MULTIQC_OUT"

# Run MultiQC on the results in the current module
multiqc ./results/ -o "$MULTIQC_OUT"

echo "✅ MultiQC report generated at: $MULTIQC_OUT/multiqc_report.html"
