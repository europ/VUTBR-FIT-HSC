# This Catapult LB script has been generated to expand the characterization range(es)
# of components of the Catapult base library(ies) to fit the current design
# 
# Running this script is optional but using the updated library should result in improved correlation.
# 
# Run this script in Catapult LB with the base library loaded or uncomment the "library load" command(s)
#library load C:\PROGRA~1\MENTOR~1\CATAPU~1.0C\Mgc_home\pkgs\siflibs\xilinx\mgc_Xilinx-SPARTAN3-4_beh_xst.lib
library set /LIBS/mgc_Xilinx-SPARTAN3-4_beh_xst/MODS/mgc_mux1hot/PARAMETERS/ctrlw -- -CHAR_RANGE {1, 4 to 32}
library set /LIBS/mgc_Xilinx-SPARTAN3-4_beh_xst/MODS/mgc_mux1hot/PARAMETERS/width -- -CHAR_RANGE {1, 4 to 32}
# The "library characterize" command below requires that: 
#   1. characterization directory set in the library exists and write accessible;
#   2. paths to technology libraries are set to correct locations;
#   3. the downstream tool used to characterize the library is available;
library characterize
