<%--
  Created by IntelliJ IDEA.
  User: Administrator
  Date: 2021/6/23
  Time: 15:27
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" isELIgnored="false" %>
<%--引入核心标签库--%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<html>
<head>
    <base href="${pageContext.servletContext.contextPath}/">
    <title>传媒影院-影片管理</title>
    <meta charset="utf-8">
    <link rel="stylesheet" href="./static/bootstrap-3.4.1-dist/css/bootstrap.css">
    <style>
        table td {
            font-size: 10pt !important;
        }
        #moviesDetailsDialog .row{
            margin-bottom: 10px;
        }
    </style>
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
            <li class="active">影片管理</li>
        </ol>
        <%--  操作面板--%>
        <div class="panel panel-primary">
            <div class="panel-heading">
                影片管理
            </div>
            <div class="panel-body">
                <%--   按钮组--%>
                <div class="btn-group" style="margin-bottom: 20px">
                    <a class="btn btn-primary" href="addMovies.jsp">
                        <span class="glyphicon glyphicon-cloud-upload"></span>
                        影片添加
                    </a>
                    <button class="btn btn-danger" type="button" id="delVolumnBtn">
                        <span class="glyphicon glyphicon-trash"></span>
                        批量删除
                    </button>
                </div>
                <%-- 数据表格--%>
                <form action="movies/dels" id="movieIdForm">
                    <table class="table table-bordered table-hover table-striped table-condensed">
                    <tr>
                        <th><input type="checkbox" id="checkedAll"></th>
                        <th>序号</th>
                        <th>影片名称</th>
                        <th>封面</th>
                        <th>类型</th>
                        <th>导演</th>
                        <th>主演</th>
<%--                        <th>上映时间</th>--%>
                        <th>状态</th>
                        <th>操作</th>
                    </tr>
                    <c:forEach items="${pageInfo.list}" var="m">
                        <tr>
                            <th><input type="checkbox" name="id" value="${m.id}"></th>
                            <td>${m.id}</td>
                            <td>${m.name}</td>
                            <td><img src="${m.img}" alt="${m.img}" height="80px"></td>
                            <td>${m.category}</td>
                            <td>${m.director}</td>
                            <td>${m.actor}</td>
<%--                            <td>${m.publishtime}</td>--%>
                            <td>${m.status == 1 ? '<span class="label label-success">正在热映</span>' : '<span class="label label-danger">即将上映</span>'}</td>
                            <td>
                                <button type="button" class="btn btn-info btn-xs btn-details" data-info="${m}" data-toggle="modal" data-target="#moviesDetailsDialog"><span class="glyphicon glyphicon-info-sign"></span>
                                    详情
                                </button>
                                <button type="button" class="btn btn-warning btn-xs btn-edit" data-info="${m}"><span class="glyphicon glyphicon-pencil"></span>
                                    编辑
                                </button>
                                <button type="button" class="btn btn-danger btn-xs" onclick="del(${m.id})"><span
                                        class="glyphicon glyphicon-minus"></span> 删除
                                </button>
                            </td>
                        </tr>
                    </c:forEach>
                </table>
                </form>
                <%-- 分页链接--%>
                <nav class="text-center">
                    <ul class="pagination">
                        <c:if test="${page > 1}">
                            <li>
                                <a href="movies/list?page=${page - 1}">
                                    <span aria-hidden="true">&laquo;</span>
                                </a>
                            </li>
                        </c:if>
                        <c:forEach begin="1" end="${pageInfo.pages}" var="i">
                            <c:choose>
                                <c:when test="${page == i}">
                                    <li class="active"><a href="javascript:;">${i}</a></li>
                                </c:when>
                                <c:otherwise>
                                    <li><a href="movies/list?page=${i}">${i}</a></li>
                                </c:otherwise>
                            </c:choose>
                        </c:forEach>
                        <c:if test="${page < pageInfo.pages}">
                            <li>
                                <a href="movies/list?page=${page + 1}">
                                    <span aria-hidden="true">&raquo;</span>
                                </a>
                            </li>
                        </c:if>
                    </ul>
                </nav>
            </div>
            <div class="panel-footer text-center">
                &copy;武汉传媒学院 2021
            </div>
        </div>
    </div>
</div>

<%--影片详情显示的模态框--%>
<div class="modal fade" id="moviesDetailsDialog">
    <div class="modal-dialog">
        <div class="modal-content">
            <div class="modal-header">
                <button type="button" class="close" data-dismiss="modal">&times;</button>
                <h4>影片详情</h4>
            </div>
            <div class="modal-body">
                <div class="row">
                    <div class="col-md-2"></div>
                    <div class="col-md-10"><img id="mImg" src="http://qv23gzdbt.hn-bkt.clouddn.com/1.jpg" alt="" width="160px"></div>
                </div>
                <div class="row">
                    <div class="col-md-2">影片名:</div>
                    <div class="col-md-10" id="mName">《了不起的爸爸》</div>
                </div>
                <div class="row">
                    <div class="col-md-2">影片类型:</div>
                    <div class="col-md-10" id="mCategory">剧情,喜剧,运动</div>
                </div>
                <div class="row">
                    <div class="col-md-2">产地:</div>
                    <div class="col-md-10" id="mCountry">中国大陆</div>
                </div>
                <div class="row">
                    <div class="col-md-2">导演:</div>
                    <div class="col-md-10" id="mDirector">周元青</div>
                </div>
                <div class="row">
                    <div class="col-md-2">主演:</div>
                    <div class="col-md-10" id="mActor">王砚辉,张宥浩,龚蓓苾,李小胖</div>
                </div>
                <div class="row">
                    <div class="col-md-2">上映时间:</div>
                    <div class="col-md-10" id="mPublishtime">Jun+18,+2021+8:00:00+AM</div>
                </div>
                <div class="row">
                    <div class="col-md-2">影片评分:</div>
                    <div class="col-md-10" id="mRank">9.3</div>
                </div>
                <div class="row">
                    <div class="col-md-2">上映类型:</div>
                    <div class="col-md-10" id="mStatus">正在热映</div>
                </div>
                <div class="row">
                    <div class="col-md-2">影片介绍:</div>
                    <div class="col-md-10" id="mSummary">一个患有罕见疾病却怀有“马拉松梦”的少年肖尔东（张宥浩+饰），一个固执逼迫儿子预习“盲人生活”的出租车司机父亲肖大明（王砚辉+饰），互不理解的父子俩，却在一场马拉松比赛中“互换身份”，并肩站在了起跑线上……影片通过对“命运”持有不同态度的一对单亲家庭父子，讲述了一个用爱向阳而生的故事。</div>
                </div>
            </div>
            <div class="modal-footer">
                <button type="button" class="btn btn-default" data-dismiss="modal">关闭</button>
                <button type="button" class="btn btn-warning" id="editBtn">编辑</button>
            </div>
        </div>
    </div>
</div>

<script src="./static/jquery/jquery-3.6.0.js"></script>
<script src="./static/bootstrap-3.4.1-dist/js/bootstrap.js"></script>
<script src="./static/layer-v3.5.1/layer/layer.js"></script>
<script>

    if("${msg}"){
        layer.msg("${msg}");
    }

    function del(mid) {
        layer.confirm('确定删除该条纪录吗?', {icon: 3}, function () {
            //请求后台执行删除操作
            location.href = "movies/del?mid=" + mid;
        })
    }

    $(function(){
        //全选
        $('#checkedAll').on('click',function(){
            $('input[name=id]').prop('checked',$(this).prop('checked'));
        })

        //批量删除
        $('#delVolumnBtn').on('click',function(){
            //判断是否有列表项被选中
            let len = $('input[name=id]:checked').length;
            if(len < 1){
                layer.msg('请选择需要删除影片!');
                return;
            }
            layer.confirm(`确认需要删除这${"${len}"}项`,{icon:3},function(){
                //提交表单
                $('#movieIdForm').submit();
            })

        })

        //用于回显的数据
        var echoData;
        //详情展示
        $('#moviesDetailsDialog').on('show.bs.modal',function(event){
            //获取出发事件的按钮对象
            let btnDetails = event.relatedTarget;
            //取得按钮上data-info的属性值
            let info = $(btnDetails).data('info');
            //将数据解码
            info = decodeURI(info);
            // %3A => :
            // %2C => ,
            // %2F => /
            info = info.replaceAll("%3A",":").replaceAll("%2C",",").replaceAll("%2F","/");
            //记录回显数据（经过转换之后的json字符串）
            echoData = info;
            //将json字符串解析为js对象
            info = JSON.parse(info);
            //将数据绑定到指定区域
            $('#mImg').prop('src',info.img);
            $('#mName').text('《'+info.name+'》');
            $('#mCategory').text(info.category);
            $('#mCountry').text(info.country);
            $('#mDirector').text(info.director);
            $('#mActor').text(info.actor);
            $('#mPublishtime').text(info.publishtime);
            $('#mRank').text(info.rank);
            $('#mStatus').html(info.status == 0 ? '<span class="label label-danger">即将上映</span>' : '<span class="label label-success">正在热映</span>');
            $('#mSummary').text(info.summary);
        })

        //进入编辑界面(列表项编辑按钮跳转)
        $('.btn-edit').on('click',function(){
            //获取当前按钮上绑定的数据
            let info = $(this).data('info');
            //将数据解码
            info = decodeURI(info);
            //将无法正常解码的字符串替换为合适的符号
            echoData = info.replaceAll("%3A",":").replaceAll("%2C",",").replaceAll("%2F","/");
            //存储当前数据行到缓存中
            sessionStorage.setItem('data',echoData);
            //跳转到编辑界面
            location.href="editMovies.jsp";
        })

        //进入编辑界面(详情弹框按钮跳转)
        $('#editBtn').on('click',function(){
            //存储当前数据行到缓存中
            sessionStorage.setItem('data',echoData);
            //跳转到编辑界面
            location.href="editMovies.jsp";
        })

    })
</script>
</body>
</html>
