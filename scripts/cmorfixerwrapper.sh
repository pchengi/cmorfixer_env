#!/bin/bash

source /opt/cmor_fixer/miniconda3/etc/profile.d/conda.sh
export PATH=/opt/scripts:/opt/cmor_fixer/miniconda3/bin:$PATH
conda activate cmorfixer

/opt/cmor_fixer/cmor-fixer/cmor-fixer.py "$@"
