# DingTalkGPSCheat


## 开发环境
0. 安装XCode
    ```bash
    xcode-select --install
    ```
1. 安装CocoaPods
    ```bash
    curl -L get.rvm.io | bash -s stable
    rvm install 2.3.0
    gem sources --remove https://rubygems.org/
    gem sources -a https://gems.ruby-china.com
    sudo gem install cocoapods
    ```
2. 安装brew
    ```bash
    export HOMEBREW_BREW_GIT_REMOTE="https://mirrors.tuna.tsinghua.edu.cn/git/homebrew/brew.git"
    export HOMEBREW_CORE_GIT_REMOTE="https://mirrors.tuna.tsinghua.edu.cn/git/homebrew/homebrew-core.git"
    export HOMEBREW_BOTTLE_DOMAIN="https://mirrors.tuna.tsinghua.edu.cn/homebrew-bottles"
    # 添加上面三行到环境变量
    /bin/bash -c "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/master/install.sh)"
    ```
3. 安装theos
    ```bash
    brew install ldid xz
    sudo git clone --recursive https://github.com/theos/theos.git /opt/theos
    # 添加下面内容到环境变量
    export THEOS=/opt/theos
    export PATH="$THEOS/bin:$PATH"
    export SDKVERSION=13.2
    export THEOS_DEVICE_IP=#越狱手机IP
    ```
4. 安装MonkeyDev
    ```bash
    sudo /bin/sh -c "$(curl -fsSL https://raw.githubusercontent.com/AloneMonkey/MonkeyDev/master/bin/md-install)"
    # 添加下面内容到环境变量
    export MonkeyDevPath=/opt/MonkeyDev
    export MonkeyDevDeviceIP=#越狱手机IP
    export MonkeyDevDevicePort=22 #越狱手机SSH端口
    export PATH="$MonkeyDevPath/bin:$PATH"
    ```
5. 安装frida-ios-dump
    ```bash
    brew install python wget libimobiledevice usbmuxd
    git clone git@github.com:AloneMonkey/frida-ios-dump.git -b 3.x
    sudo pip3 install -r requirements.txt --upgrade
    ```
6. 在越狱手机上安装frida，在`cydia`中添加源`http://build.frida.re/`，并安装`frida`
7. 说明：最好可FQ，不然github上的代码库可能下载不全，导致运行和编译错误

## 砸壳
1. 在越狱手机上从商店或者第三方商店上安装`DingTalk`
2. 使用USB连接到Mac，控制台运行`iproxy 2222 22`
3. 新控制台进入`frida-ios-dump`，运行
    ```bash
    ./dump.py -l
    ./dump.py com.laiwang.DingTalk
    ```
    
4. 运行成功后会有`Generating DingTalk`字样，把生成`DingTalk.ipa`拷贝到当前工程的`test\TargetApp\`目录
5. 运行`pod install`
6. 编译安装，安装前需要把真包从手里里给卸载掉
