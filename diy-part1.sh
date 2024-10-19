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

#Zh-Netdata
#rm -rf ./package/lean/luci-app-netdata
#git clone https://github.com/Jason6111/luci-app-netdata ./package/lean/luci-app-netdata

# Uncomment a feed source
#sed -i 's/^#\(.*helloworld\)/\1/' feeds.conf.default

#LINUX_VERSION
sed -i 's/IMG_PREFIX:=/IMG_PREFIX:=$(LINUX_VERSION)-/g' include/image.mk

# Add a feed source
sed -i 's/^#src-git luci https:\/\/github.com\/coolsnowwolf\/luci/src-git luci https:\/\/github.com\/coolsnowwolf\/luci/' ./feeds.conf.default
sed -i 's/^src-git luci https:\/\/github.com\/coolsnowwolf\/luci\.git;openwrt-23\.05/#src-git luci https:\/\/github.com\/coolsnowwolf\/luci.git;openwrt-23.05/' ./feeds.conf.default
#echo 'src-git helloworld https://github.com/Jason6111/helloworld' >>feeds.conf.default
echo 'src-git helloworld https://github.com/fw876/helloworld' >>feeds.conf.default
#echo 'src-git passwall https://github.com/xiaorouji/openwrt-passwall' >>feeds.conf.default
