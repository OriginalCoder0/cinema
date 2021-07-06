# day5 - 影院后台管理系统
## 目标功能
+ 影片管理
    + 影片列表展示(完成)
    + 影片分页显示(完成)
    + 影片上传(..)
    + 详情查看
    + 修改影片
    + 影片删除和批量删除
    
## 技术参数
+ EL(表达式)/JSTL（标准标签库）
+ Mybatis-pagerhelper插件
+ servlet3.0文件上传技术
+ 七牛云OSS

## 分页
>通常在进行数据查询时如果数据库中存在大量的
数据需要显示,此时页面中不适合一次性显示海量
>数据（消耗较大内存空间），因此需要在页面中
>将数据分页展示。

分页技术从技术实现手段分为两种方式：
1. 真分页（物理分页）：直接在数据库进行分页查询(limit)，查询多少显示多少
2. 假分页（逻辑分页）：一次性将数据全部查询出来，然后在页面端截取部分数据展示

## JSTL使用
> JSTL:JSP Standard TagLib（jsp标准标签库），基于Java实现的一种标签库技术，允许
>在jsp页面中通过预定义的标签对后台传递的Java对象（数据）进行操作

### 使用步骤
+ 引入标签库依赖
```xml
 <!-- jstl标准标签库-->
        <dependency>
            <groupId>jstl</groupId>
            <artifactId>jstl</artifactId>
            <version>1.2</version>
        </dependency>
```
+ 在需要使用标签库的jsp页面中配置`taglib`

```jsp
<%--引入核心标签库--%> 
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
```