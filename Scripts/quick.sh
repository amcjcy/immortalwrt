#!/bin/bash

# 移除要替换的包
rm -rf feeds/packages/net/alist
rm -rf feeds/packages/net/aria2
rm -rf feeds/packages/net/ariang
rm -rf feeds/packages/net/mosdns
rm -rf feeds/packages/net/msd_lite
rm -rf feeds/packages/net/smartdns
rm -rf feeds/luci/applications/luci-app-mosdns
rm -rf feeds/luci/applications/luci-app-msd_lite
rm -rf feeds/luci/applications/luci-app-smartdns
rm -rf feeds/luci/themes/luci-theme-argon
rm -rf feeds/luci/themes/luci-theme-netgear
rm -rf feeds/luci/applications/luci-app-netdata
rm -rf feeds/luci/applications/luci-app-serverchan
#rm -rf feeds/luci/applications/luci-app-homeproxy
rm -rf feeds/luci/applications/luci-app-openclash
rm -rf feeds/luci/applications/luci-app-passwall
rm -rf feeds/luci/applications/luci-app-passwall2
rm -rf feeds/luci/applications/luci-app-turboacc
#rm -rf feeds/packages/net/shadowsocks-libev

# Git稀疏克隆，只克隆指定目录到本地
function git_sparse_clone() {
  branch="$1" repourl="$2" && shift 2
  git clone --depth=1 -b $branch --single-branch --filter=blob:none --sparse $repourl
  repodir=$(echo $repourl | awk -F '/' '{print $(NF)}')
  cd $repodir && git sparse-checkout set $@
  mv -f $@ ../package
  cd .. && rm -rf $repodir
}

echo 'src-git kenzo https://github.com/kenzok8/openwrt-packages' >> feeds.conf.default
#echo 'src-git small https://github.com/kenzok8/small' >> feeds.conf.default
######################################################################################
git clone --depth=1 https://github.com/immortalwrt/homeproxy package/homeproxy
git_sparse_clone main https://github.com/kiddin9/kwrt-packages luci-app-homeproxy
######################################################################################
#git clone --depth=1 -b main https://github.com/fw876/helloworld package/luci-app-ssr-plus
git clone --depth=1 https://github.com/xiaorouji/openwrt-passwall-packages package/openwrt-passwall
git clone --depth=1 https://github.com/xiaorouji/openwrt-passwall package/luci-app-passwall
git clone --depth=1 https://github.com/xiaorouji/openwrt-passwall2 package/luci-app-passwall2
git_sparse_clone master https://github.com/vernesong/OpenClash luci-app-openclash
git_sparse_clone main https://github.com/kiddin9/kwrt-packages luci-app-bypass
#######################################################################################
git_sparse_clone main https://github.com/kiddin9/kwrt-packages dnsforwarder
#git_sparse_clone master https://github.com/rmoyulong/AX6-Actions_Lede qca
git_sparse_clone master https://github.com/rmoyulong/AX6-Actions_Lede pcre
#git_sparse_clone master https://github.com/rmoyulong/AX6-Actions_Lede aria2
#git_sparse_clone main https://github.com/kenzok8/small-package ariang
#git_sparse_clone main https://github.com/kiddin9/kwrt-packages luci-app-zerotier
git_sparse_clone main https://github.com/kiddin9/kwrt-packages v2dat
#git_sparse_clone main https://github.com/kiddin9/kwrt-packages luci-app-mosdns
git_sparse_clone main https://github.com/kiddin9/kwrt-packages luci-app-ssr-plus
git_sparse_clone main https://github.com/kiddin9/kwrt-packages shadow-tls
git_sparse_clone main https://github.com/kiddin9/kwrt-packages lua-neturl
git_sparse_clone main https://github.com/kiddin9/kwrt-packages redsocks2
git_sparse_clone main https://github.com/kiddin9/kwrt-packages luci-app-turboacc
git_sparse_clone main https://github.com/kiddin9/kwrt-packages luci-app-filetransfer
git_sparse_clone main https://github.com/kiddin9/kwrt-packages luci-app-v2ray-server
git_sparse_clone master https://github.com/jerrykuku/lua-maxminddb lua-maxminddb
rm -rf  package/openwrt-passwall/shadowsocks-rust
git_sparse_clone main https://github.com/kiddin9/kwrt-packages shadowsocks-rust
#git_sparse_clone main https://github.com/kenzok8/small-package luci-app-kodexplorer
#git_sparse_clone main https://github.com/kiddin9/kwrt-packages luci-app-usb-printer
#git_sparse_clone main https://github.com/kiddin9/kwrt-packages shadowsocksr-libev

#git clone --depth=1 https://github.com/esirplayground/luci-app-poweroff package/luci-app-poweroff
#git clone --depth=1 https://github.com/Jason6111/luci-app-netdata package/luci-app-netdata
#git clone --depth=1 https://github.com/destan19/OpenAppFilter package/OpenAppFilter
#git clone --depth=1 -b openwrt-18.06 https://github.com/tty228/luci-app-wechatpush package/luci-app-serverchan

# 在线用户
git_sparse_clone main https://github.com/kiddin9/kwrt-packages luci-app-onliner
sudo chmod -Rf 755 package/luci-app-onliner
# Lucky原版
git clone  https://github.com/gdy666/luci-app-lucky.git package/lucky
# Lucky大吉
#git clone https://github.com/sirpdboy/luci-app-lucky.git package/lucky

# msd_lite
#git clone --depth=1 https://github.com/ximiTech/luci-app-msd_lite package/luci-app-msd_lite
#git clone --depth=1 https://github.com/ximiTech/msd_lite package/msd_lite

# remove v2ray-geodata package from feeds (openwrt-22.03 & master)
#rm -rf feeds/packages/net/v2ray-geodata

#git clone https://github.com/sbwml/luci-app-mosdns -b v5 package/mosdns
#git clone https://github.com/sbwml/v2ray-geodata package/v2ray-geodata
