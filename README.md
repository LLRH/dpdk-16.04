DPDK is a set of libraries and drivers for fast packet processing.
It supports many processor architectures and both FreeBSD and Linux.

The DPDK uses the Open Source BSD license for the core libraries and
drivers. The kernel components are GPLv2 licensed.

Please check the doc directory for release notes,
API documentation, and sample application information.

For questions and usage discussions, subscribe to: users@dpdk.org
Report bugs and issues to the development mailing list: dev@dpdk.org

## 原版修改记录
1. 增加了 pktgen-2.9.17  

			需要安装libpcap-dev
			sudo apt-get install libpcap-dev

2.  增加 .gitignore
3.  增加 install.sh

			echo "Please [source install.sh]"
			export RTE_SDK=$PWD
			export RTE_TARGET=x86_64-native-linuxapp-gcc
			echo RTE_SDK=$RTE_SDK
			echo RTE_TARGET=$RTE_TARGET


