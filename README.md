# <<电影院后台管理系统>>

电影院后台管理系统：SpringMVC+JSP+Tomcat+Mybatis+Bootstrap+Jquery+AnimateCSS+LayerJS

项目部署：该项目是IDEA版本，Maven项目

前端依赖：

+ Bootstrap-3.4.1
+ Animate.css- 4.1.1
+ Jquery-3.6.0
+ Layer-v3.5.1
+ Bootstrapvalidator

项目功能：

+ 登录
+ 增删改查影片
+ 增删改查影厅
+ 增删改查排片
+ 增删改查订单
+ 增删改查会员
+ 增删改查账户

## 项目预览

### 一、影片功能

1. 管理员登录

?                  <img src="https://cdn.jsdelivr.net/gh/OriginalCoder0/gallery@master/images/1625574296603-1-管理员登录.png" alt="Alt" style="zoom:50%;" />

2. 影片列表

<img src="https://cdn.jsdelivr.net/gh/OriginalCoder0/gallery@master/images/1625574312621-2-影片列表.png" alt="Alt" style="zoom:50%;" />



3. 影片详情

<img src="https://cdn.jsdelivr.net/gh/OriginalCoder0/gallery@master/images/1625574318314-3-影片详情.png" alt="Alt" style="zoom:50%;" />

4. 影片修改

<img src="https://cdn.jsdelivr.net/gh/OriginalCoder0/gallery@master/images/1625574323504-4-影片修改.png" alt="Alt" style="zoom:50%;" />



5. 影片新增

<img src="https://cdn.jsdelivr.net/gh/OriginalCoder0/gallery@master/images/1625574337764-5-影片新增.png" alt="Alt" style="zoom:50%;" />



6. 影片删除

<img src="https://cdn.jsdelivr.net/gh/OriginalCoder0/gallery@master/images/1625574342537-6-影片删除.png" alt="Alt" style="zoom:50%;" />



7. 批量删除

<img src="https://cdn.jsdelivr.net/gh/OriginalCoder0/gallery@master/images/1625574347972-7-批量删除.png" alt="Alt" style="zoom:50%;" />



### 二、影厅功能

1. 影厅列表

   <img src="https://cdn.jsdelivr.net/gh/OriginalCoder0/gallery@master/images/1625574357865-8-影厅列表.png" alt="Alt" style="zoom:50%;" />

2. 影厅新增

   <img src="https://cdn.jsdelivr.net/gh/OriginalCoder0/gallery@master/images/1625574363676-9-影厅新增.png" alt="Alt" style="zoom:50%;" />



## 需求分析(数据库设计)
### 后台功能（管理员）
1. 影片管理（增删改查：CRUD）
> 影片表：id,影片名称，封面图，电影类型，导演，主要演员，上映时间，电影评分，影片介绍，状态

2. 影厅管理（增删改查：CRUD）
> 影厅表：id,影厅名，类型，座位数，座位布局，状态

3. 排片管理（增删改查）
> 排片表：id，电影id，影厅id，放映时间，票价，座位状态

4. 订单管理（查询，修改，删除）
> 订单表：id,订单号，用户id,排片id,座位号，订单状态，订单时间，订单金额

5. 会员管理（查询，修改，删除）
> 会员表：id,账号，头像，昵称，密码，性别，生日，电话，邮箱，余额，状态

6. 系统管理（管理员功能，系统属性设置...）
> 管理员表：id，账号，密码，姓名，联系电话，状态

### 前台功能（普通用户）
1. 首页数据展示
2. 注册/登录
3. 买票选座
4. 创建订单
5. 我的信息



## 技术选型
+ 数据持久层（JDBC-->Mybatis/Hiberate/SpringData JPA）
> ORM：对象关系映射（一个Java对象等同于数据库表中一条记录）

## 架构搭建（IDEA）



## 功能完成度

### 影片部分

- [x] 添加影片
- [x] 删除影片
- [x] 查看影片详情
- [x] 编辑影片信息
- [x] 批量删除影片

### 影厅部分

- [ ] 添加影厅
- [x] 删除影厅
- [x] 查看影厅详情
- [ ] 编辑影厅信息
- [x] 批量删除影厅





