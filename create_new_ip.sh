#!/bin/bash

IP_REPO_VERSION=1.0

IP_NAME=$1
IP_VERSION=1.0
README=$IP_NAME/trunk/README.txt

declare -A dirs=(
    ["d00"]=branches
    ["d01"]=tags
    ["d02"]=trunk
	["d03"]=trunk/doc
	["d04"]=trunk/doc/EDS
	["d05"]=trunk/doc/EPS
	["d06"]=trunk/doc/User_Guide
	["d07"]=trunk/gen
	["d08"]=trunk/gen/c
	["d09"]=trunk/gen/hdl
	["d10"]=trunk/gen/python
	["d11"]=trunk/intel_quartus
	["d12"]=trunk/intel_quartus/15.1
	["d13"]=trunk/intel_quartus/18.1
	["d14"]=trunk/scripts
	["d15"]=trunk/sim
	["d16"]=trunk/sim/models
	["d17"]=trunk/sim/tb
	["d18"]=trunk/sim_uvm
	["d19"]=trunk/src
	["d20"]=trunk/src/c
	["d21"]=trunk/src/hdl
	["d22"]=trunk/src/regdef
	["d23"]=trunk/src/sdc
	["d24"]=trunk/xilinx_vivado
	["d25"]=trunk/xilinx_vivado/2019.2
)

declare -A files=(
	["f00"]=${dirs["d12"]}/${IP_NAME}_hw.tcl
	["f01"]=${dirs["d13"]}/${IP_NAME}_hw.tcl
	["f02"]=${dirs["d17"]}/${IP_NAME}_tb.vhd
	["f03"]=${dirs["d18"]}/${IP_NAME}_config.py
	["f04"]=${dirs["d20"]}/${IP_NAME}.c
	["f05"]=${dirs["d21"]}/${IP_NAME}.vhd
	["f06"]=${dirs["d22"]}/${IP_NAME}.regdef
	["f07"]=${dirs["d23"]}/${IP_NAME}.sdc
	["f08"]=${dirs["d25"]}/${IP_NAME}_hw.tcl
)

if [ -d "$IP_NAME" ] ; then
	echo "$IP_NAME already exist."
	exit 1
fi

mkdir $IP_NAME

echo "creating $IP_NAME directory structure."
for k in "${!dirs[@]}" ; do
	mkdir -p "$IP_NAME/${dirs[${k}]}"
done

echo "IP-REPOSITORY-VERSION: $IP_REPO_VERSION" >> $README
echo " " >> $README
echo "IP-NAME: $IP_NAME" >> $README
echo "IP-VERSION: $IP_VERSION" >> $README

for k in "${!files[@]}" ; do
	touch "$IP_NAME/${files[${k}]}"
done
