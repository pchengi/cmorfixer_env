# Environment for cmor-fixer

- A tool to create an environment to allow easy use of the [cmor-fixer tool](https://github.com/EC-Earth/cmor-fixer)

- cmorfixer_env is a singularity container which comes with preinstalled miniconda3 

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

# To download a prebuilt singularity image:

- [Link to prebuilt image](https://esg-dn2.nsc.liu.se/virtualtestbed/cmorfixerenv.simg)
