# 在中国网络环境下使用 Flutter

- [在中国网络环境下使用 Flutter](#在中国网络环境下使用-flutter)
  - [1. 下载二进制安装包](#1-下载二进制安装包)
  - [2. 为 Flutter 设定镜像配置](#2-为-flutter-设定镜像配置)
  - [3. 社区运行的镜像站点](#3-社区运行的镜像站点)
    - [3.1. Flutter 社区](#31-flutter-社区)
    - [3.2. 上海交大 Linux 用户组](#32-上海交大-linux-用户组)
    - [3.3. 清华大学 TUNA 协会](#33-清华大学-tuna-协会)
    - [2.4. OpenTUNA](#24-opentuna)
    - [3.5. CNNIC](#35-cnnic)
    - [3.6. 腾讯云开源镜像站](#36-腾讯云开源镜像站)
  - [4. 其他已知问题](#4-其他已知问题)

参考 [Flutter 中国官网](https://flutter.cn)

## 1. 下载二进制安装包

可以将将下载链接前缀替换镜像链接, 如:

原始链接:

<https://storage.googleapis.com/flutter_infra_release/releases/stable/windows/flutter_windows_3.3.0-stable.zip>

镜像之后的链接:

<https://storage.flutter-io.cn/flutter_infra_release/releases/stable/windows/flutter_windows_3.3.0-stable.zip>

## 2. 为 Flutter 设定镜像配置

如果你在国内使用 Flutter, 那么你可能需要找一个与官方同步的可信的镜像站点, 帮助你的 Flutter 命令行工具到该镜像站点下载其所需的资源. 你需要为此设置两个环境变量: `PUB_HOSTED_URL` 和 `FLUTTER_STORAGE_BASE_URL`, 然后再运行 Flutter 命令行工具

以 macOS 或者与 Linux 相近的系统为例, 这里有以下步骤帮助你设定镜像. 在系统终端里执行如下命令设定环境变量, 并通过 GitHub 检出 Flutter SDK:

```bash
export PUB_HOSTED_URL=https://pub.flutter-io.cn
export FLUTTER_STORAGE_BASE_URL=https://storage.flutter-io.cn

git clone -b dev https://github.com/flutter/flutter.git

export PATH="$PWD/flutter/bin:$PATH"

cd ./flutter
flutter doctor
```

如上步骤设定之后, 你可以继续进行 Flutter 安装的下一步: 编辑工具设定, 在这两个环境变量 (`PUB_HOSTED_URL` 和 `FLUTTER_STORAGE_BASE_URL`) 设定过后, 未来通过命令 `flutter pub get` 获取 packages 的时候, 网络请求将会通过 flutter-io.cn 提供的镜像进行.

flutter-io.cn 所提供的镜像由中国的 Flutter 开发者社区提供和维护, Flutter 团队无法保证其的长期稳定运作, 也可以使用其他可信的机构提供的镜像服务

## 3. 社区运行的镜像站点

如下列表为目前在国内提供镜像的社区以及其镜像配置, 由于镜像的实现方式有所不同, 可能会导致数据的滞后等问题. 我们制作了一个 [镜像可用性监控页面](https://stats.uptimerobot.com/JZK3ZTql79) 供参考

### 3.1. Flutter 社区

社区主镜像, 采用多种方式同步 Flutter 开发者资源 (推荐) . 有任何镜像相关的问题, 请与我们 反馈镜像问题, 中国镜像存储由七牛云提供服务

```bash
export PUB_HOSTED_URL=https://pub.flutter-io.cn
export FLUTTER_STORAGE_BASE_URL=https://storage.flutter-io.cn
```

### 3.2. 上海交大 Linux 用户组

使用全量同步方式建立 Flutter 镜像, 配置了完善的回源 (flutter-io.cn 主镜像和 GCS 站源) 策略 (推荐), 有任何镜像相关的问题, 请向上海交大 Linux 用户组 反馈镜像问题

查看帮助文档:  [Flutter 镜像安装帮助](https://mirrors.sjtug.sjtu.edu.cn/docs/flutter_infra), [Pub 镜像安装帮助](https://mirrors.sjtug.sjtu.edu.cn/docs/dart-pub)

```bash
export PUB_HOSTED_URL=https://mirror.sjtu.edu.cn/dart-pub
export FLUTTER_STORAGE_BASE_URL=https://mirror.sjtu.edu.cn
```

### 3.3. 清华大学 TUNA 协会

采取自定义脚本定时主动抓取策略, 并配置了完善的回源 (flutter-io.cn 主镜像和 GCS 站源) 策略 (推荐) , 有任何镜像相关的问题 (包含 TUNA、OpenTUNA), 请向清华大学 TUNA 协会 反馈镜像问题

查看帮助文档: [Flutter 镜像安装帮助](https://mirrors.tuna.tsinghua.edu.cn/help/flutter/), [Pub 镜像安装帮助](https://mirrors.tuna.tsinghua.edu.cn/help/dart-pub/)

```bash
export PUB_HOSTED_URL=https://mirrors.tuna.tsinghua.edu.cn/dart-pub
export FLUTTER_STORAGE_BASE_URL=https://mirrors.tuna.tsinghua.edu.cn/flutter
```

### 2.4. OpenTUNA

数据策略与 TUNA 镜像一致、由清华 TUNA 协会运行维护, OpenTUNA 镜像通过 CloudFront CDN 进行分发

已知问题: Pub API 与预期返回值不一致, 可能造成请求无效 (2021/6/8)

```bash
export PUB_HOSTED_URL=https://opentuna.cn/dart-pub
export FLUTTER_STORAGE_BASE_URL=https://opentuna.cn/flutter
```

### 3.5. CNNIC

基于 TUNA 协会的镜像服务, 数据策略和内容与 TUNA 一致, 通过非教育网的域名访问 (建议选择 TUNA). 暂无反馈渠道, 可尝试 TUNA 反馈渠道

```bash
export PUB_HOSTED_URL=http://mirrors.cnnic.cn/dart-pub
export FLUTTER_STORAGE_BASE_URL=http://mirrors.cnnic.cn/flutter
```

### 3.6. 腾讯云开源镜像站

使用 TUNA 开源的脚本每天凌晨 0 - 2 点执行同步, 未配置回源策略. 使用腾讯云服务器的用户, 可将源域名从 mirrors.cloud.tencent.com 修改为 mirrors.tencentyun.com, 使用内网流量不占用公网流量. 有任何镜像问题, 请通过邮件 (<mirrors@tencent.com>) 向腾讯云开源镜像站反馈

已知问题

- Flutter Storage 已经从 flutter_infra 调整为 flutter_infra_release, 腾讯云开源镜像并未对此做调整, 可能会在更新的 Flutter 版本里无法请求到完整数据 (2021/6/8)
- 根据反馈 (#1135), 腾讯云对 CIPD 的支持尚不确定是否完整

```bash
export PUB_HOSTED_URL=https://mirrors.cloud.tencent.com/dart-pub
export FLUTTER_STORAGE_BASE_URL=https://mirrors.cloud.tencent.com/flutter
```

## 4. 其他已知问题

- 所有 Flutter 镜像目前均不支持/也不应支持上传 packages 到 pub.dev 网站. 这个过程通常需要登陆谷歌账号, 而这将是一个无法绕开且复杂的挑战
- 上海大学的镜像 暂时只允许校内访问, 故暂未展示, 感谢上海大学 Linux 用户组的同学
- 腾讯云开源镜像站使用 TUNA 开源脚本制作, 每天同步一次, 经测试, 其数据延迟较大并尚未配置有效的回源策略, 有待于社区成员进一步验证
- 任何其他与镜像相关的问题, 请通过 Issue 向我们反馈
- 部分镜像的问题已经特别标识, 待镜像修复之后移除
