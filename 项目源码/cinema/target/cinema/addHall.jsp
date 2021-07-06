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
    <title>传媒影院-影厅新增</title>
    <meta charset="utf-8">
    <link rel="stylesheet" href="./static/bootstrap-3.4.1-dist/css/bootstrap.css">
    <link rel="stylesheet" href="./static/bootstrapvalidator/css/bootstrapValidator.css">
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
            <li><a href="hall/list">影厅列表</a></li>
            <li class="active">影厅新增</li>
        </ol>
        <%--  操作面板区域--%>
        <div class="panel panel-primary">
            <div class="panel-heading">影厅新增</div>
            <div class="panel-body">
                <div class="col-md-6">
                    <form action="hall/add" method="post">
                        <div class="form-group">
                            <label for="exampleInputName">影厅名</label>
                            <input type="text" class="form-control" name="name" id="exampleInputName" placeholder="请输入影片名称">
                        </div>
                        <div class="form-group">
                            <label for="exampleInputCountry">影厅类型</label>
                            <select name="halltype" id="exampleInputCountry" class="form-control">
                                <option value="IMAX厅">IMAX厅</option>
                                <option value="杜比全景声厅">杜比全景声厅</option>
                                <option value="4DX厅">4DX厅</option>
                                <option value="巨幕厅">巨幕厅</option>
                                <option value="CGS中国巨幕厅">CGS中国巨幕厅</option>
                                <option value="4D厅">4D厅</option>
                                <option value="4K厅">4K厅</option>
                            </select>
                        </div>
                        <div class="form-group">
                            <label>座位分布</label>
                            <div id="seats">
                                <div class="input-group" style="width: 300px;margin-bottom: 10px">
                                    <div class="input-group-addon">第A排</div>
                                    <input type="number" class="form-control" name="row" placeholder="输入座位数">
                                </div>
                            </div>
                            <button class="btn btn-info btn-sm" type="button" id="addMore">新增一排</button>
                        </div>
                        <div class="form-group">
                            <label>影厅介绍</label>
                            <textarea rows="5" class="form-control" name="summary"></textarea>
                        </div>
                        <div class="form-group text-center">
                            <button type="submit" class="btn btn-primary" style="width: 30%">添加影厅</button>
                        </div>
                    </form>
                </div>
            </div>
            <div class="panel-footer text-center">
                &copy;武汉传媒学院 2021
            </div>
        </div>

    </div>
</div>
<%--引入jquery的插件--%>
<script src="./static/jquery/jquery-3.6.0.js"></script>
<script src="./static/layer-v3.5.1/layer/layer.js"></script>
<%--引入bootstrapvalidator插件（基于bootstrap验证框架）--%>
<script src="./static/bootstrapvalidator/js/bootstrapValidator.js"></script>
<script>
    $(function(){

        $('form').bootstrapValidator({
            message:'输入内容有误',
            feedbackIcons:{
                valid:'glyphicon glyphicon-ok',
                invalid:'glyphicon glyphicon-remove',
                validating:'glyphicon glyphicon-refresh'
            },
            fields:{
                name:{
                    message:'请输入影厅名称',
                    validators:{
                        notEmpty:{
                            message:'影厅名称不能为空'
                        }
                    }
                },
                row:{
                    message:'请输入座位数',
                    validators:{
                        notEmpty:{
                            message:'座位数不能为空'
                        },
                        regexp:{
                            message:'请输入正确的数字',
                            regexp: /^\d{1,2}$/
                        }
                    }
                },
                summary:{
                    message:'请输入影厅介绍',
                    validators:{
                        notEmpty:{
                            message:'影厅介绍不能为空'
                        },
                        stringLength:{
                            message:'影厅介绍介绍不能少于20个字,最多1000个字',
                            min:20,
                            max:1000
                        }
                    }
                }
            }
        });

        let rn = 65;
        $('#addMore').on('click',function(){
            //转换数值为字符串
            let no = String.fromCharCode(++rn);
            if(rn > 84){
                layer.msg('最多20排座位!',{offset:['300px','800px']});
                return;
            }
            let row = ` <div class="input-group" style="width: 300px;margin-bottom: 10px">
                                    <div class="input-group-addon">第${"${no}"}排</div>
                                    <input type="number" class="form-control" name="row" placeholder="输入座位数">
                                    <div class="input-group-addon remove-row" style="cursor:pointer">删除</div>
                                </div>`;
            $('#seats').append(row);
        })

        $('#seats').on('click','.remove-row',function(){
            rn--;
            $('#seats .input-group:last').remove();
        })

    })
</script>
</body>
</html>
