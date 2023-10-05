# Flutter

- [Flutter](#flutter)
  - [1. 安装 Flutter](#1-安装-flutter)
    - [1.1. 环境变量](#11-环境变量)
    - [1.2. 使用命令行](#12-使用命令行)
  - [2. 安装工具链](#2-安装工具链)
    - [2.1. Android SDK](#21-android-sdk)
      - [2.1.1. 安装 Android Studio](#211-安装-android-studio)
      - [2.1.2. 安装 Android Command line tools](#212-安装-android-command-line-tools)
    - [2.2. iOS](#22-ios)
      - [2.2.1. 安装 XCode](#221-安装-xcode)
      - [2.2.2. 配置 iOS 模拟器](#222-配置-ios-模拟器)
    - [2.3. C++ 工具链](#23-c-工具链)
      - [2.3.1. Linux 桌面](#231-linux-桌面)
      - [2.3.2. Windows 桌面](#232-windows-桌面)
      - [2.3.3. macOS 桌面](#233-macos-桌面)
  - [3. 创建和运行项目](#3-创建和运行项目)
    - [3.1. 为 Android 项目设置仓库代理](#31-为-android-项目设置仓库代理)
    - [3.2. 执行项目](#32-执行项目)
    - [3.3. 编译项目](#33-编译项目)

## 1. 安装 Flutter

从 [官方网站](https://docs.flutter.dev/release/archive) 下载各个平台的二进制安装包 (或者通过 [中文网站](https://flutter.cn/docs/release/archive) 下载)

将下载的二进制包解压到任意位置的 `flutter` 目录下 (例如: `C:\flutter`)

### 1.1. 环境变量

设置 `PATH` 环境变量 (以 Linux 为例)

```bash
export PATH="$PATH:$HOME/flutter/bin"
```

设置国内代理

```bash
export FLUTTER_STORAGE_BASE_URL=https://storage.flutter-io.cn
export PUB_HOSTED_URL=https://pub.flutter-io.cn
```

### 1.2. 使用命令行

- 通过 `flutter doctor` 命令可以检查工具链的安装情况

- 通过 `flutter config` 可以对 Flutter 进行设置, 例如

  ```bash
  flutter config --android-sdk ~/android-sdk # 设置 Android SDK 的安装目录
  flutter config --no-analytics # 取消使用分析数据的上报
  ```

其它和项目相关的命令行参考 [创建和运行项目](#3-创建和运行项目) 章节

- 通过 `flutter upgrade` 来升级 Flutter 工具链

## 2. 安装工具链

### 2.1. Android SDK

#### 2.1.1. 安装 Android Studio

直接 [下载](https://developer.android.google.cn/studio) 并安装 Android Studio IDE, 并通过其附带 SDK Manager 工具可以一站式的安装完整的 Android SDK

也可以直接 [下载](https://developer.android.com/studio#downloads) Command line tools, 通过命令行安装

#### 2.1.2. 安装 Android Command line tools

从 [官方网站](https://developer.android.com/studio#downloads) 下载最新的二进制文件, 解压缩到任意路径的 `android-sdk/cmdline-tools/latest` 路径下 (注意, 如果不是该路径, 则需要通过 `sdkmanager --sdk_root` 命令设置正确的路径)

注意: 解压路径务必是当前用户有访问权限的路径, `sdkmanager` 不支持和 `sudo` 等命令一起使用

解压后, 配置如下的环境变量 (假设解压到 `$HOME` 路径下)

```bash
export ANDROID_HOME="$HOME/android-sdk"
export ANDROID_SDK_ROOT=${ANDROID_HOME}
export PATH="$PATH:${ANDROID_HOME}/cmdline-tools/latest/bin:${ANDROID_HOME}/platform-tools:${ANDROID_HOME}/tools:${ANDROID_HOME}/tools/bin"
```

通过如下命令, 同意所有的协议

```bash
yes | sdkmanager --licenses
```

安装所需的 SDK 和工具

```bash
sdkmanager --install \
    "platform-tools" \
    "emulator" \
    "platforms;android-33" \
    "build-tools;30.0.3" \
    "patcher;v4"
```

> 也可以通过 `sdkmanager --list` 查看所有的 SDK 和工具版本, 安装合适的版本
>
> 也可以暂时不安装 Android SDK, 当为 Android 编译 Flutter 应用时, 会自动下载合适的版本

注意, Android 环境依赖于 OpenJDK 和 Gradle 工具

### 2.2. iOS

开发 iOS 需要一台具备 XCode 开发环境的 Mac 设备

#### 2.2.1. 安装 XCode

1. [下载](https://developer.apple.com/xcode/) 或者通过应用商店安装最新版 Xcode

2. 配置 Xcode 命令行工具

   ```bash
   sudo xcode-select -s /Applications/Xcode.app/Contents/Developer
   sudo xcodebuild -runFirstLaunch
   ```

3. 同意 Xcode 的许可协议

   ```bash
   sudo xcodebuild --license
   ```

#### 2.2.2. 配置 iOS 模拟器

1. 启动模拟器

   ```bash
   open -a Simulator
   ```

2. 设置模拟器使用 64 位设备

   - 在 Xcode 中, 选择 `Product`>`Destination`>`Choose your target device`
   - 在模拟器应用中, 选择 `File`>`Open Simulator`>`Choose your target iOS device`
   - 要检查模拟器的 iOS 版本, 打开 `Settings app`>`General`>`About`

3. 模拟高 DPI 的 iOS 设备可能会导致屏幕显示溢出, 此时需要在模拟器应用程序中更改显示的大小

   - 要减小显示尺寸, 需要设置 `Window`>`Physical Size` 或使用组合键 `⌘`+`1`
   - 要显示合适的尺寸, 需要设置 `Window`>`Point Accurate` 或使用组合键 `⌘`+`2`
   - 要显示高 DPI 尺寸, 需要设置 `Window`>`Pixel Accurate` 或使用组合键 `⌘`+`3`, 这是模拟器的默认设置
   - 要自适应显示尺寸, 需要设置 `Window`>`Fit Screen` 或使用组合键 `⌘`+`4`

如果要部署 Flutter 应用到物理设备, 请参考 [官网说明](https://docs.flutter.dev/get-started/install/macos#deploy-to-physical-ios-devices)

### 2.3. C++ 工具链

如果要为桌面编译代码, 则需要安装 C++ 工具链 (clang++)

#### 2.3.1. Linux 桌面

执行如下命令安装工具链

```bash
sudo apt install clang cmake ninja-build pkg-config libgtk-3-dev liblzma-dev libstdc++-12-dev
```

#### 2.3.2. Windows 桌面

Windows 下需要安装 [Visual Studio 2022 Community](https://visualstudio.microsoft.com/downloads/) 或 [Visual Studio 2022 Build Tools](https://visualstudio.microsoft.com/downloads/#build-tools-for-visual-studio-2022), 并在安装时选择 "使用 C++ 的桌面开发" 并包括所有默认组件 (包括必要的 C++ 工具链和 Windows SDK 头文件)

#### 2.3.3. macOS 桌面

macOS 下开发桌面应用, 需要安装 [Xcode](https://developer.apple.com/xcode/) 和 [CocoaPods](https://cocoapods.org/) (如需使用插件)

## 3. 创建和运行项目

通过如下命令创建 Flutter 项目

```bash
flutter create <项目名称>
```

此命令会以 `<项目名称>` 创建目录, 目录中包含了范例代码和各个平台的编译命令

### 3.1. 为 Android 项目设置仓库代理

进入项目的 `android` 目录, 编辑 `build.gradle` 文件, 将其中的 `repositories` 内容改为如下地址

```gradle
repositories {
  maven {
    url "https://maven.aliyun.com/repository/google"
  }
  maven {
    url "https://maven.aliyun.com/repository/public"
  }
  maven {
    url "https://maven.aliyun.com/repository/jcenter"
  }
}
```

### 3.2. 执行项目

本例使用 Android Subsystem Android 作为 Android 模拟器, 需要打开 WSA 的开发者模式, 之后可以得知模拟器的调试地址, 本例假设为 (127.0.0.1:58526)

1. 测试 Flutter 应用

   ```bash
   flutter test
   ```

2. 连接 Android 模拟器 (或设备)

   ```bash
   adb connect 192.168.0.254:58526
   ```

3. 查看 Flutter 连接的设备列表

   ```bash
   flutter devices

   2 connected devices:

   Subsystem for Android TM (mobile) • 127.0.0.1:58526 • android-x64 • Android 13 (API 33)
   Linux (desktop)                   • linux           • linux-x64   • Ubuntu 22.04.3 LTS
   ```

4. 选择合适的设备启动 Flutter 应用

   ```bash
   flutter -d Linux run
   ```

   或

   ```bash
   flutter -d "Subsystem for Android TM" run
   ```

5. 查看日志

   ```bash
   flutter logs
   ```

### 3.3. 编译项目

可以为不同的目标系统编译不同的应用

```bash
flutter build

Usage: flutter build <subcommand> [arguments]
-h, --help    Print this usage information.

Available subcommands:
  aar         Build a repository containing an AAR and a POM file.
  apk         Build an Android APK file from your app.
  appbundle   Build an Android App Bundle file from your app.
  bundle      Build the Flutter assets directory from your app.
  linux       Build a Linux desktop application.
  web         Build a web application bundle.
```

例如:

```bash
flutter build linux
```
