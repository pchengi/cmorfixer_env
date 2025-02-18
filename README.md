# Environment for cmor-fixer

- A tool to create an environment to allow easy use of the [cmor-fixer tool](https://github.com/EC-Earth/cmor-fixer)

- cmorfixer_env v4.0 is a singularity container which comes with preinstalled miniforge3
- cmorfixer_env v3.0 (legacy) is a singularity container which comes with preinstalled miniconda3
- Upstream cmor-fixer has now moved away from miniconda to miniforge and cmorfixer_env has also now done the same.

# Prerequisites

You need the apptainer program installed. Follow the instructions here, to install it on your machine.
Apptainer was earlier called singularity and was renamed when it was moved into the Linux Foundation.
On most systems, 'singularity' would simply be an alias to 'apptainer'.
See [announcement](https://apptainer.org/news/community-announcement-20211130/)

[https://apptainer.org/docs/admin/latest/installation.html#installation-on-linux](https://apptainer.org/docs/admin/latest/installation.html#installation-on-linux)


# To download a prebuilt singularity image:

- If you'd like to use a prebuilt image, you could download from the link below; if you'd rather build the container yourself, follow the build instructing in the To build section.
- [Link to prebuilt image of v4.0](https://esg-dn2.nsc.liu.se/virtualtestbed/cmorfixerenv_pre4.0.simg)
- [Link to prebuilt image of v3.0 (legacy)](https://esg-dn2.nsc.liu.se/virtualtestbed/cmorfixerenv.simg)

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

# Using the container (v4.0)

- Inside the container, do the following
````
source /etc/bashrc
activatecmorfixer
script -c '/opt/cmor_fixer/cmor-fixer/cmor-fixer.py --verbose --forceid --olist $HOME/outputdir --npp 1 --dry /mnt/CMIP6' scriptout_cmorfix_dryrun
````

# Wrapper to cmor-fixer.py

There exists a wrapper script to cmor-fixer.py which can be invoked from outside the container, which is useful if you wish to use the container from say a Slurm job on a supercomputer with support to run singularity images.
A testfile with an issue detectable by cmor-fixer.py is present under the testfiles/CMIP6 directory, which can be used for testing. 

To use the wrapper:

```bash
singularity exec --bind testfiles:/mnt cmorfixerenv.simg bash /opt/scripts/cmorfixerwrapper.sh --verbose --olist $HOME/outputdir --npp 1 --dry /mnt/CMIP6
2024-11-07 15:55:12 WARNING:cmor-fixer.py: Output file name /home/pchengi/outputdir/list-of-modified-files-1.txt already exists, trying /home/pchengi/outputdir/list-of-modified-files-2.txt
2024-11-07 15:55:13 INFO:cmor-fixer.py: Replacing the longitude and latitude t-grid vertices for vertices_longitude (none) in /mnt/CMIP6/chldiatos_Omon_EC-Earth3-ESM-1_abrupt-4xCO2_r1i1p1f1_gn_195401-195412.nc

singularity exec --bind testfiles:/mnt cmorfixerenv.simg bash /opt/scripts/cmorfixerwrapper.sh --verbose --olist $HOME/outputdir --npp 2 --meta /mnt/recipe.json --dry /mnt/CMIP6
2024-11-07 15:55:39 WARNING:cmor-fixer.py: Output file name /home/pchengi/outputdir/list-of-modified-files-1.txt already exists, trying /home/pchengi/outputdir/list-of-modified-files-2.txt
2024-11-07 15:55:39 WARNING:cmor-fixer.py: Output file name /home/pchengi/outputdir/list-of-modified-files-2.txt already exists, trying /home/pchengi/outputdir/list-of-modified-files-3.txt
2024-11-07 15:55:39 INFO:cmor-fixer.py: Setting metadata field branch_time_in_parent to 29218.0 in /mnt/CMIP6/siconca_SIday_EC-Earth3-Veg_historical_r1i1p1f1_gr_18800101-18801231.nc
2024-11-07 15:55:39 INFO:cmor-fixer.py: Replacing the longitude and latitude t-grid vertices for vertices_longitude (none) in /mnt/CMIP6/chldiatos_Omon_EC-Earth3-ESM-1_abrupt-4xCO2_r1i1p1f1_gn_195401-195412.nc
2024-11-07 15:55:39 INFO:cmor-fixer.py: Setting metadata field branch_time_in_parent to 29218.0 in /mnt/CMIP6/chldiatos_Omon_EC-Earth3-ESM-1_abrupt-4xCO2_r1i1p1f1_gn_195401-195412.nc
``` 
