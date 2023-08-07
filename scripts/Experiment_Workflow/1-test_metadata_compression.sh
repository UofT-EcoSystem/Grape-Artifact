#!/bin/bash -e

PROJECT_ROOT=$(git rev-parse --show-toplevel)
cd ${PROJECT_ROOT}

source scripts/hl

cd experiments

echo "Running the test cases on the metadata compression"

echo "[$(emph 1/3)] GPT-2"
pytest test_metadata_compression.py::test_gpt2

echo "[$(emph 2/3)] GPT-J"
pytest test_metadata_compression.py::test_gpt2

echo "[$(emph 3/3)] Wav2Vec2"
pytest test_metadata_compression.py::test_wav2vec2

echo "Visualizing the compression results ..."
csvtool readable metadata_compression.csv
