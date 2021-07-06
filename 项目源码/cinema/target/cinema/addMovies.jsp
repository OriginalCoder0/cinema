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
    <title>传媒影院-影片新增</title>
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
            <li><a href="movies/list">影片列表</a></li>
            <li class="active">影片新增</li>
        </ol>
        <%--  操作面板区域--%>
        <div class="panel panel-primary">
            <div class="panel-heading">影片新增</div>
            <div class="panel-body">
                <div class="col-md-6">
                    <form action="movies/add" method="post" enctype="multipart/form-data">
                        <div class="form-group">
                            <label for="previewImg">影片封面图片</label>
                            <img src="" id="img" alt="" width="160px">
                            <input type="file" name="img" id="previewImg">
                            <p class="help-block">请选择影片封面.</p>
                        </div>
                        <div class="form-group">
                            <label for="exampleInputName">影片名</label>
                            <input type="text" class="form-control" name="name" id="exampleInputName" placeholder="请输入影片名称">
                        </div>
                        <div class="form-group">
                            <label for="exampleInputTypes">影片类型</label>
                            <input type="text" class="form-control" name="category" id="exampleInputTypes" placeholder="请输入影片类型,多个名称使用','隔开">
                        </div>
                        <div class="form-group">
                            <label for="exampleInputCountry">影片产地</label>
                            <select name="country" id="exampleInputCountry" class="form-control">
                                <option value="中国大陆">中国大陆</option>
                                <option value="中国香港">中国香港</option>
                                <option value="中国台湾">中国台湾</option>
                                <option value="欧美">欧美</option>
                                <option value="日韩">日韩</option>
                                <option value="东南亚">东南亚</option>
                            </select>
                        </div>
                        <div class="form-group">
                            <label for="exampleInputDirector">导演</label>
                            <input type="text" class="form-control" name="director" id="exampleInputDirector" placeholder="请输入导演姓名,多个名称使用','隔开">
                        </div>
                        <div class="form-group">
                            <label for="exampleInputActor">主演</label>
                            <input type="text" class="form-control" name="actor" id="exampleInputActor" placeholder="请输入主演姓名,多个名称使用','隔开">
                        </div>
                        <div class="form-group">
                            <label for="exampleInputTime">上映时间</label>
                            <input type="date" class="form-control" name="publishtime" id="exampleInputTime" placeholder="请输入上映时间">
                        </div>
                        <div class="form-group">
                            <label>上映状态</label>
                            <div>
                                <label class="radio-inline">
                                    <input type="radio" name="status" value="0" checked> 即将上映
                                </label>
                                <label class="radio-inline">
                                    <input type="radio" name="status" value="1"> 正在热映
                                </label>
                            </div>
                        </div>
                        <div class="form-group">
                            <label for="exampleInputTime">影片介绍</label>
                            <textarea rows="5" class="form-control" name="summary"></textarea>
                        </div>
                        <div class="form-group text-center">
                            <button type="submit" class="btn btn-primary" style="width: 30%">添加影片</button>
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
<%--引入bootstrapvalidator插件（基于bootstrap验证框架）--%>
<script src="./static/bootstrapvalidator/js/bootstrapValidator.js"></script>
<script src="./static/layer-v3.5.1/layer/layer.js"></script>
<script>
    $(function(){

        if("${msg}"){
            layer.msg("${msg}");
        }
        //图片预览
        $('#previewImg').on('change',function(){
            let url = window.URL || window.webkitURL;
            url = url.createObjectURL(this.files[0]);
            $('#img').prop('src',url);
        })

        $('form').bootstrapValidator({
            message:'输入内容有误',
            feedbackIcons:{
                valid:'glyphicon glyphicon-ok',
                invalid:'glyphicon glyphicon-remove',
                validating:'glyphicon glyphicon-refresh'
            },
            fields:{
                img:{
                    message:'请选择电影封面图',
                    validators:{
                        notEmpty:{
                            message:'必须指定电影的封面图片'
                        }
                    }
                },
                name:{
                    message:'请输入电影名称',
                    validators:{
                        notEmpty:{
                            message:'电影名称不能为空'
                        }
                    }
                },
                director:{
                    message:'请输入导演姓名',
                    validators:{
                        notEmpty:{
                            message:'导演姓名不能为空'
                        }
                    }
                },
                actor:{
                    message:'请输入主演名称',
                    validators:{
                        notEmpty:{
                            message:'主演姓名不能为空'
                        }
                    }
                },
                publishtime:{
                    message:'请输入上映时间',
                    validators:{
                        notEmpty:{
                            message:'上映时间不能为空'
                        }
                    }
                },
                category:{
                    message:'请输入影片类型',
                    validators:{
                        notEmpty:{
                            message:'影片类型不能为空'
                        }
                    }
                },
                summary:{
                    message:'请输入影片介绍',
                    validators:{
                        notEmpty:{
                            message:'影片介绍不能为空'
                        },
                        stringLength:{
                            message:'影片内容介绍不能少于20个字,最多1000个字',
                            min:20,
                            max:1000
                        }
                    }
                }
            }
        });

    })
</script>
</body>
</html>
