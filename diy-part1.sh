#!/bin/bash
#
# Copyright (c) 2019-2020 P3TERX <https://p3terx.com>
#
# This is free software, licensed under the MIT License.
# See /LICENSE for more information.
#
# https://github.com/P3TERX/Actions-OpenWrt
# File name: diy-part1.sh
# Description: OpenWrt DIY script part 1 (Before Update feeds)
#Update Kernel
sed -i '/KERNEL_PATCHVER=/ d; s/KERNEL_TESTING_PATCHVER/KERNEL_PATCHVER/g' ./target/linux/x86/Makefile

#Zh-Netdata
rm -rf ./package/lean/luci-app-netdata
git clone https://github.com/Jason6111/luci-app-netdata ./package/lean/luci-app-netdata

# Uncomment a feed source
sed -i 's/^#\(.*helloworld\)/\1/' feeds.conf.default

# Add a feed source
echo 'src-git helloworld https://github.com/fw876/helloworld' >>feeds.conf.default
#echo 'src-git passwall https://github.com/xiaorouji/openwrt-passwall' >>feeds.conf.default
