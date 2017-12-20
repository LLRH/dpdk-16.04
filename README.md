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

			忽略编译生成的文件
				
3.  增加 install.sh

			source install.sh
			
## 修改大页面内存
			vim /etc/default/grub
			在约11行的位置将
			GRUB_CMDLINE_LINUX_DEFAULT="quiet splash" 
			中加入 
			default_hugepagesz=1G hugepagesz=1G hugepages=10
			更改为
			GRUB_CMDLINE_LINUX_DEFAULT="quiet splash default_hugepagesz=1G hugepagesz=1G hugepages=10"
			
			sudo update-grub
			
			


