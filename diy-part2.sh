#!/bin/bash
#
# Copyright (c) 2019-2020 P3TERX <https://p3terx.com>
#
# This is free software, licensed under the MIT License.
# See /LICENSE for more information.
#
# https://github.com/P3TERX/Actions-OpenWrt
# File name: diy-part2.sh
# Description: OpenWrt DIY script part 2 (After Update feeds)
#

# Modify default IP
sed -i 's/192.168.1.1/192.168.3.66/g' package/base-files/files/bin/config_generate

# Modify default passwd
sed -i '/$1$V4UetPzk$CYXluq4wUazHjmCDBCqXF./ d' package/lean/default-settings/files/zzz-default-settings

# zh netdata
rm -rf ./feeds/luci/applications/luci-app-netdata/
git clone https://github.com/Jason6111/luci-app-netdata ./feeds/luci/applications/luci-app-netdata/
# netdata 1.33.1
#rm -rf ./feeds/packages/admin/netdata
#git clone -b 1.33.1 https://github.com/Jason6111/luci-app-netdata ./feeds/packages/admin/netdata

#v2ray_server
# sed -i s/"cp -a"/"ln -s"/g feeds/luci/applications/luci-app-v2ray-server/luasrc/model/cbi/v2ray_server/api/app.lua
# sed -i s/"-config"/"run -config"/g feeds/luci/applications/luci-app-v2ray-server/luasrc/model/cbi/v2ray_server/api/app.lua
# sed -i s/"xray -version"/"xray version"/g feeds/luci/applications/luci-app-v2ray-server/luasrc/model/cbi/v2ray_server/api/v2ray.lua
# sed -i s/"xray -version"/"xray version"/g feeds/luci/applications/luci-app-v2ray-server/luasrc/view/v2ray_server/v2ray.htm

# 添加新主题  
# rm -rf ./feeds/luci/themes/luci-theme-argon
# git clone -b 18.06 https://github.com/jerrykuku/luci-theme-argon.git ./feeds/luci/themes/luci-theme-argon
# git clone https://github.com/jerrykuku/luci-app-argon-config.git ./package/lean/luci-app-argon-config
#sed -i s/5.19/5.18/g  target/linux/x86/Makefile
#svn co https://github.com/xiaobashen/xiaobashenNB/trunk/other ./feeds/luci/themes/luci-theme-argon-mod/htdocs/luci-static/argon/background/
#rm -rf ./feeds/luci/themes/luci-theme-argon-mod/htdocs/luci-static/argon/background/.svn/
mkdir -p ./feeds/luci/themes/luci-theme-argon-mod/htdocs/luci-static/argon/background/ && curl -o ./feeds/luci/themes/luci-theme-argon-mod/htdocs/luci-static/argon/background/MM.mp4 https://raw.githubusercontent.com/xiaobashen/xiaobashenNB/main/other/MM.mp4
#恢复主机型号
sed -i 's/(dmesg | grep .*/{a}${b}${c}${d}${e}${f}/g' package/lean/autocore/files/x86/autocore
#sed -i 's/(cat \/tmp.*/\{a}${b}${c}${d}${e}${f}/g' package/lean/autocore/files/x86/autocore
sed -i '/h=${g}.*/d' package/lean/autocore/files/x86/autocore
sed -i 's/echo $h/echo $g/g' package/lean/autocore/files/x86/autocore

#日期
sed -i 's/os.date(/&"%Y-%m-%d %H:%M:%S"/' package/lean/autocore/files/x86/index.htm

#关闭串口跑码
sed -i 's/console=tty0//g'  target/linux/x86/image/Makefile
#tr
#sed -i "s/&& LINUX_VERSION_CODE < KERNEL_VERSION(5, 18, 0)//g" package/lean/shortcut-fe/fast-classifier/src/fast-classifier.c

# 临时
sed -i 's/6.1/6.6/g'  ./target/linux/x86/Makefile
sed -i 's/1024/256/g'  target/linux/x86/image/Makefile

# ddns cloudflare
#curl -o new_update_cloudflare_com_v4.sh https://raw.githubusercontent.com/Jason6111/Openwrt_Beta/refs/heads/main/patch/update_cloudflare_com_v4.sh
#mv new_update_cloudflare_com_v4.sh ./feeds/packages/net/ddns-scripts/files/usr/lib/ddns/update_cloudflare_com_v4.sh
#sed -i '1,$d' ./feeds/packages/net/ddns-scripts/files/usr/lib/ddns/update_cloudflare_com_v4.sh && cat <(curl -s https://raw.githubusercontent.com/Jason6111/Openwrt_Beta/refs/heads/main/patch/update_cloudflare_com_v4.sh) >> ./feeds/packages/net/ddns-scripts/files/usr/lib/ddns/update_cloudflare_com_v4.sh
