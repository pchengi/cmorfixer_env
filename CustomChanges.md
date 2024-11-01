For the containerized cmorfixer, we have some additional requirements which as of 1st Nov 2024 were not provided by the official cmorfixer. 
These features are as follows:

- The ability to specify an output directory, so files are not written into the directory with the cmor-fixer.py script.
    - This allows for the usage of --olist flag even from read-only containers, as the output directory can be specified.
- Ensure that nemo-vertices is refered to with a path relative to cmor-fixer.py, instead of assuming its presence in the PWD.
    - This allows cmor-fixer.py to be called from any directory, and from external scripts, without first changing directory.

## Tests to be made

- Ensure that a custom output directory can be specified
- Ensure that the script can be called from anywhere and there is no error due to nemo-vertices not being in the PWD.

## Test parameters to successfully test for both of the above:

```bash
mkdir -p $HOME/outputdir
singularity exec --bind testfiles:/mnt cmorfixerenv.simg bash /opt/scripts/cmorfixerwrapper.sh --verbose --olist --npp 1 --dry --output-dir $HOME/outputdir /mnt/CMIP6
```
