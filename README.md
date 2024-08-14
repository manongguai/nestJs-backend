# IM

### 介绍 📖

基于NestJs+Monorepo 的 rbac模板

### 一、在线文档


### 二、Git 仓库地址 (欢迎 Star⭐)

[https://github.com/manongguai/nestJs-rbac](https://github.com/manongguai/nestJs-rbac)

### 三、🔨🔨🔨 项目功能

* [X] 用户管理
* [X] 角色管理
* [X] 部门管理
* [X] 岗位管理
* [X] 菜单管理
* [X] 文件上传（当前只完成上传本地，未兼容 oss）
* [ ] 定时任务

### 四、安装使用步骤 📑

- **安装：**

```shell
git clone https://github.com/manongguai/nestJs-rbac.git

cd nestJs-rbac

pnpm install
```

- **启动：**

```MySql``` 数据库文件在 ```nest-admin/db/nest_rbac.sql``` ，可以通过 ```MySQL WorkBench``` 或 ```Navicat``` 等工具软件导入。

导入的账号：

|   账号  |  密码   |    权限    |
| :-----: | :-----: | :--------: |
|  admin  |  admin  | 超级管理员 |
|  kirk   | Q123456 | 测试用户   |

> 批量导入的用户默认密码： Q123456 ， 可在 ```apps/servers/src/config``` 中配置 初始密码

* docker
  
```shell
pnpm docker:start
# stop
pnpm docker:stop
# delete
pnpm docker:delete

```

* 本地
  
```shell
# 开发环境
pnpm server:dev
# 打包
pnpm server:build
# 生产环境
pnpm server:start

```

### 五、主要文件资源目录 📚

```text
IM
.
├── README.md
├── apps
│   ├── servers  // 服务器代码
├── commitlint.config.js
├── lint-staged.config.js
├── package.json
├── packages
│   ├── tsconfig   // 通用tsconfig
│   ├── utils  // 通用工具函数
├── pnpm-lock.yaml
├── pnpm-workspace.yaml
├── turbo.json  // turborepo 脚本
└── watermark.png
```

### 六、开发脚本 🧩

- 全局安装turbo后可以直接执行turbo中的脚本

- **test：**

```javascript
 pnpm test
```

### 七、捐赠 🍵

如果你正在使用这个项目或者喜欢这个项目的，可以通过以下方式支持我：

- Star、Fork、Watch 一键三连 🚀
- 通过微信、支付宝一次性捐款 ❤

|                                        微信                                        |                                        支付宝                                        |
| :--------------------------------------------------------------------------------: | :----------------------------------------------------------------------------------: |
| <img src="http://admin.kirk.wang/images/weixin.png" alt="Alipay QRcode" width=170> | <img src="http://admin.kirk.wang/images/zhifubao.png" alt="Wechat QRcode" width=170> |
