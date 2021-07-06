<%--
  Created by IntelliJ IDEA.
  User: Administrator
  Date: 2021/6/23
  Time: 15:27
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" isELIgnored="false" %>
<html>
<head>
    <base href="${pageContext.servletContext.contextPath}/">
    <title>传媒影院-影厅管理</title>
    <meta charset="utf-8">
    <link rel="stylesheet" href="./static/bootstrap-3.4.1-dist/css/bootstrap.css">
</head>
<body>
<%--    顶部导航条--%>
<%@ include file="nav.jsp" %>
<div class="container-fluid">
    <%--    菜单容器--%>
    <%@include file="menu.jsp" %>
    <%--    操作区域--%>
    <div class="col-md-10" id="content">
        <%--  路径导航--%>
        <ol class="breadcrumb">
            <li><a href="main.jsp">主页</a></li>
            <li class="active"><a href="javascript:;">影厅管理</a></li>
        </ol>

        <div class="panel panel-primary">
            <div class="panel-heading">
                影厅列表
            </div>
            <div class="panel-body">
                <%--   按钮组--%>
                <div class="btn-group" style="margin-bottom: 20px">
                    <a class="btn btn-primary" href="addHall.jsp">
                        <span class="glyphicon glyphicon-cloud-upload"></span>
                        影厅新增
                    </a>
                </div>
                <%-- 数据表格--%>
                    <table class="table table-bordered table-hover table-striped">
                        <tr>
                            <th><input type="checkbox"></th>
                            <th>序号</th>
                            <th>影厅名</th>
                            <th>影厅类型</th>
                            <th>座位总数</th>
                            <th>影厅状态</th>
                            <th>操作</th>
                        </tr>

                        <tr>
                            <td><input type="checkbox"></td>
                            <td>1</td>
                            <td>1号放映厅</td>
                            <td>3DMAX厅</td>
                            <td>240</td>
                            <td><span class="label label-danger">使用中</span></td>
                            <td>
                                <div class="btn-group">
                                    <a class="btn btn-info btn-xs"><span class="glyphicon glyphicon-info-sign"></span> 详情</a>
                                    <a class="btn btn-warning btn-xs"><span class="glyphicon glyphicon-pencil"></span> 编辑</a>
                                    <a class="btn btn-danger btn-xs"><span class="glyphicon glyphicon-minus"></span> 删除</a>
                                </div>
                            </td>
                        </tr>

                        <tr>
                            <td><input type="checkbox"></td>
                            <td>1</td>
                            <td>2号放映厅</td>
                            <td>杜比4D环绕厅</td>
                            <td>360</td>
                            <td><span class="label label-success">未使用</span></td>
                            <td>
                                <div class="btn-group">
                                    <a class="btn btn-info btn-xs"><span class="glyphicon glyphicon-info-sign"></span> 详情</a>
                                    <a class="btn btn-warning btn-xs"><span class="glyphicon glyphicon-pencil"></span> 编辑</a>
                                    <a class="btn btn-danger btn-xs"><span class="glyphicon glyphicon-minus"></span> 删除</a>
                                </div>
                            </td>
                        </tr>
                        
                    </table>

            </div>
            <div class="panel-footer text-center">
                &copy;武汉传媒学院 2021
            </div>
        </div>

    </div>
</div>


</body>
</html>
