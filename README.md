# Redmi AX6000 ImmortalWrt 110M

本仓库构建 [hanwckf/immortalwrt-mt798x](https://github.com/hanwckf/immortalwrt-mt798x)
`openwrt-21.02` 的 Redmi AX6000 精简固件。目标仅为
`xiaomi_redmi-router-ax6000`，使用
`mt7986a-xiaomi-redmi-router-ax6000.dts` 的 **110 MiB 单 UBI、非 stock**
布局。源码与四个标准 feeds 均固定到已审查的提交，避免定时构建因上游分支漂移而
产生不可预期的变化。

固件保留 LuCI、IPv4/IPv6、DHCP、PPPoE、防火墙、opkg、SSH，以及 AX6000
所需的 MTK Wi-Fi、HNAT/WARP、交换机、LED、NMBM/UBI 支持。PassWall、Xray、
v2ray geo 数据、Hysteria、HAProxy、FRP、ddns-go、serverchan、SmartDNS、
vlmcsd 和 ttyd 等可选服务不预装。

## GitHub Actions 构建

1. 打开仓库的 **Actions** 页面。
2. 选择 **Build Redmi AX6000 110M Firmware**。
3. 点击 **Run workflow**。通常不要勾选发布 Release；构建结果会出现在该次运行的
   **Artifacts** 中。

下载名称以 `redmi-ax6000-immortalwrt-110m-` 开头的产物。正常升级应选择文件名中
包含 `xiaomi_redmi-router-ax6000` 和 `sysupgrade` 的 `.bin` 文件。

## 升级安全

升级前先把镜像上传到路由器并执行兼容性检查：

```sh
sysupgrade -T /tmp/<sysupgrade-file>.bin
```

只有检查成功后才能升级。此固件 **不能用于 stock 分区布局，也不能用于
ubootmod 布局**；不要使用 stock/ubootmod 镜像混刷，且 **不要使用 `-F` 强制刷写**。
