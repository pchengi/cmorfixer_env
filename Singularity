Bootstrap: docker
From: debian

%files
    scripts/ /opt/
    cmor_fixer/ /opt/

%post
    apt-get update && apt-get install -y git wget make libssl-dev libpython3-dev build-essential vim screen bash
    cd /opt/cmor_fixer
    export SHELL=/bin/bash
    git clone https://github.com/pchengi/cmor-fixer.git
    wget https://github.com/conda-forge/miniforge/releases/download/24.9.0-0/Miniforge3-24.9.0-0-Linux-x86_64.sh
    bash Miniforge3-24.9.0-0-Linux-x86_64.sh -b -u -p /opt/cmor_fixer/mamba
    echo "mambapath=/opt/cmor_fixer/mamba/" >>/etc/bashrc
    echo "alias activatemamba='source /opt/cmor_fixer/mamba/etc/profile.d/conda.sh'" >>/etc/bashrc
    echo "alias activatecmorfixer='activatemamba; conda activate cmorfixer'" >>/etc/bashrc
    /bin/bash -c 'source /etc/bashrc'
    /bin/bash -c 'source /opt/cmor_fixer/mamba/etc/profile.d/conda.sh'
    /bin/bash -c '/opt/cmor_fixer/mamba/bin/mamba update -y --name base mamba'
    cd cmor-fixer && git checkout 612a119a7c327edfef499f94dcfdb5695a6f4e17
    /bin/bash -c '/opt/cmor_fixer/mamba/bin/mamba env create -f environment.yml'
