## Custom changes

For the containerized cmorfixer, we have these functionalities that need to be met by cmor-fixer

- The ability to specify an output directory, so files are not written into the directory with the cmor-fixer.py script.
    - This allows for the usage of --olist flag even from read-only containers, as the output directory can be specified.
- Ensure that nemo-vertices is refered to with a path relative to cmor-fixer.py, instead of assuming its presence in the PWD.
    - This allows cmor-fixer.py to be called from any directory, and from external scripts, without first changing directory.

## Upstream status

- In commits 82c86072c7c83510c6fba24990ab6539973ca14 and 4b722d0ac71eb609429438c308c75d38f3759579, cmor-fixer now makes specification of LOGDIR mandatory with the use of --olist, and can now be run from any path.

## Patches

If there are custom requirements that are not yet met upstream or other issues with pending pull requests, patch files would be available under the patch-files directory.
- If the upstream is updated without these changes being pulled in, the easiest was is to apply the patches in the patch-files directory, after checking out the upstream repository, to get the additional functionality.

## Tests to be made

- Ability to specify custom output directory.
- Ability to call script from any location.
- Metadata fix with floating point values in json file.

## Test-cases to check for the above cases

```bash
mkdir -p $HOME/outputdir
rm -f $HOME/outputdir/*
sudo singularity build cmorfixerenv_post3_with_fix.simg Singularity
singularity exec --bind testfiles:/mnt cmorfixerenv_post3_with_fix.simg bash /opt/scripts/cmorfixerwrapper.sh --verbose --olist $HOME/outputdir --npp 1 --dry /mnt/CMIP6
singularity exec --bind testfiles:/mnt cmorfixerenv_post3_with_fix.simg bash /opt/scripts/cmorfixerwrapper.sh --verbose --olist $HOME/outputdir --npp 2 --metadata /mnt/recipe.json --dry /mnt/CMIP6
```
