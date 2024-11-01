#!/bin/bash

source /opt/cmor_fixer/mamba/etc/profile.d/conda.sh
export PATH=/opt/scripts:/opt/cmor_fixer/mamba/bin:$PATH
conda activate cmorfixer

/opt/cmor_fixer/cmor-fixer/cmor-fixer.py $@
