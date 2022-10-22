#!/bin/bash
#chmod -R 777 ./
#make clean
#make uninstall
#rm -rf $(pwd)/android
./build_one_lib_config.sh armv7-a
./build_one_lib_config.sh armv8-a
#./build_multi_lib_config.sh armv7-a
#./build_multi_lib_config.sh armv8-a