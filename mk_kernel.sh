#!/bin/bash

if [ $(which nproc) ]; then
    CORES=$(nproc)
else
    CORES=1
fi

config="omap2plus_defconfig"

echo "Starting compile kernel"
make ARCH=${ARCH} CROSS_COMPILE=${CC} distclean
make ARCH=${ARCH} CROSS_COMPILE=${CC} ${config}
make -j${CORES} ARCH=${ARCH} CROSS_COMPILE=${CC} zImage modules
