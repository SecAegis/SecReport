# SecReport
ChatGPT加持的，多人协同信息安全渗透测试报告`编写`/`导出`平台

[官方网站](https://sec-report.com)

* 标准化渗透测试流程
* 多人协同编辑
* 自定义导出模版
* ChatGPT生成漏洞简介及修复方案
* APP安全合规测试报告

> 报告模版demo已上传至template文件夹，欢迎社区通过pr提交优质报告模版。优质模版将在后续版本自动集成至官方模版库。

---

## 社区版私有部署方案

> 单机版仅供社区交流学习，禁止任何商业/OEM行为，商业版请联系邮箱[secaegis@outlook.com](mailto:secaegis@outlook.com)。

### 安装 && 运行

```shell
mkdir SecReport && cd SecReport
wget https://raw.githubusercontent.com/SecAegis/SecReport/main/run.sh
chmod +x run.sh
./run.sh
```

> [run.sh 命令介绍](#runsh-命令介绍)

Docker全部运行后访问 [http://127.0.0.1/](http://127.0.0.1/) 初始化管理员账号

### 激活

关注微信公众号: `信息安全报告`，点击公众号菜单栏`激活码`-`SecReport`，获取激活码。

<img width="250" src="./img/mp_wx.jpg">

获取到激活码后，请在后台: `后台管理`-`证书管理`，进行绑定。

## 版本区别

|      | 官网版本 | 社区版 | 商业版 |
| ---- | -------- | ------ | ------ |
| 用户 | /        | 5人   | 无限制 |
| 报告数量 | 无限制 | 10个  | 无限制 |
| 报告类型 | 渗透测试、APP检测 | 渗透测试  | 渗透测试、APP检测 |
| SSO     | / | 不支持 | 支持 |
| 价格 | 限时免费 | 非商用免费  | 联系微信或邮箱 |

## 沟通群

> 请加好友并备注：`SecReport加群`

<img width="250" src="./img/wx.jpg">

## run.sh 命令介绍

```shell
# 启动服务
./run.sh

# 停止服务
./run.sh stop

# 更新平台
./run.sh update

# 添加用户
./build.sh exec addUser -username xxx -password xxx -role admin

# 修改用户密码
./build.sh exec changeUserPassword -username xxx -password xxx

# 设置是否开启基础登录
./build.sh exec setBasisLogin -enabled true
```

## 其他作品

[SecAutoBan](https://github.com/SecAegis/SecAutoBan)：安全设备告警IP全自动封禁平台，支持百万IP秒级分析处理。

## Star History

<a href="https://github.com/SecAegis/SecReport/stargazers">
    <img width="500" alt="Star History Chart" src="https://api.star-history.com/svg?repos=SecAegis/SecReport&type=Date">
</a> 
