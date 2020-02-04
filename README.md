# Environment for cmor-fixer

- A tool to create an environment to allow easy use of the [cmor-fixer tool](https://github.com/EC-Earth/cmor-fixer)

- cmorfixer_env is a singularity container which comes with preinstalled miniconda3 

# Prerequisites

You need the singularity program installed. Follow the instructions here, to install singularity on your machine.

[https://singularity.lbl.gov/install-linux](https://singularity.lbl.gov/install-linux)

# To download a prebuilt singularity image:

- If you'd like to use a prebuilt image, you could download from the link below; if you'd rather build the container yourself, follow the build instructing in the To build section.
- [Link to prebuilt image](https://esg-dn2.nsc.liu.se/virtualtestbed/cmorfixerenv.simg)

# To build
````
sudo singularity build cmorfixerenv.simg Singularity
````
# To initialize container (and optionally mount external filesystems)

- If you don't have to mount any non-root filesystems, you could start the container like this:
````
 singularity shell cmorfixerenv.simg
````
- If you don't see on the container the filesystem which is accessible on the host machine, you could try this, and once inside the container, you'll be able to see the filesystem mounted on /mnt.
```
 singularity shell --bind <path to filesystem you want mounted on the container>:/mnt cmorfixerenv.simg
````
- Inside the container, do the following
````
source /etc/bashrc
activateminiconda3
conda activate cmorfixer
````
- Execute cmorfixer (present in /opt/cmor_fixer/cmor-fixer/cmor-fixer.py, in the container)
````
cd /root
script -c '/opt/cmor_fixer/cmor-fixer/cmor-fixer.py --verbose --forceid --olist --npp 1 --dry /mnt/CMIP6/ScenarioMIP/EC-Earth-Consortium/EC-Earth3/ssp126/' scriptout_cmorfix_dryrun
````

