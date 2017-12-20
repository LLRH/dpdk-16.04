echo "Please [source install.sh]"
export RTE_SDK=$PWD
export RTE_TARGET=x86_64-native-linuxapp-gcc
echo RTE_SDK=$RTE_SDK
echo RTE_TARGET=$RTE_TARGET

sdk=$RTE_SDK
target=$RTE_TARGET
lscpu
cd $sdk
make config T=$target && make
make install T=$target
modprobe uio
insmod build/kmod/igb_uio.ko
grep -i numa /var/log/dmesg

#SMP架构
echo 2048 > /sys/kernel/mm/hugepages/hugepages-2048kB/nr_hugepages

#NUMA架构
#echo 2048 > /sys/devices/system/node/node0/hugepages/hugepages-2048kB/nr_hugepages
#echo 2048 > /sys/devices/system/node/node1/hugepages/hugepages-2048kB/nr_hugepages

mkdir -p /mnt/huge
mount -t hugetlbfs nodev /mnt/huge

free
cd tools

#关闭网卡 -> 需要你的修改
ifconfig eth4 down

#绑定网卡 -> 需要你的修改
python dpdk_nic_bind.py --bind=igb_uio 0000:84:00.3

 
sudo cat /proc/meminfo | grep Huge
umount /mnt/huge
rm -rf /mnt/huge
mkdir -p /mnt/huge
mount -t hugetlbfs nodev /mnt/huge
sudo cat /proc/meminfo | grep Huge

python dpdk_nic_bind.py --status

cd ..
cd examples
echo "[l3fwd] ./build/l3fwd -c 0x6 -n 2 -- -p 0x3 --config=\"(0,0,1),(1,0,2)\""
echo [helloworld] ./build/helloworld -c 0x3 -n 2
echo [----------------------------------------------------]
echo [-------DPDK has been installed for you!-------------]
echo [-------------------------------by WenXingBeng-------]
echo [----------------------------------------------------]
