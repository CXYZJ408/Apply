<%@ page contentType="text/html;charset=UTF-8"%>
<html lang="en">
<head>
    <meta charset="utf-8"/>
    <link rel="apple-touch-icon" sizes="76x76" href="assets/img/apple-icon.png">
    <link rel="icon" type="image/png" href="assets/img/favicon.png">
    <meta http-equiv="X-UA-Compatible" content="IE=edge,chrome=1;charset=utf-8"/>
    <title>南信院社团招新网站</title>

    <meta content='width=device-width, initial-scale=1.0, maximum-scale=1.0, user-scalable=0' name='viewport'/>
    <meta name="viewport" content="width=device-width"/>

    <link href="http://netdna.bootstrapcdn.com/font-awesome/4.4.0/css/font-awesome.css" rel="stylesheet">

    <link href="assets/css/bootstrap.min.css" rel="stylesheet"/>
    <link href="assets/css/gsdk-bootstrap-wizard.css" rel="stylesheet"/>

    <link href="assets/css/demo.css" rel="stylesheet"/>
</head>

<body>
<div class="image-container set-full-height" style="background-image: url('assets/img/wizard.jpg')">
    <a href="#">
        <div class="logo-container">
            <div class="logo">
                <img src="assets/img/new_logo.png">
            </div>
            <div class="brand">
                欢迎您
            </div>
        </div>
    </a>
    <div class="container">
        <div class="row">
            <div class="col-sm-8 col-sm-offset-2">
                <div class="wizard-container">

                    <div class="card wizard-card" data-color="orange" id="wizardProfile">
                        <form action="result" method="post" id="apply" enctype="multipart/form-data">

                            <div class="wizard-header">
                                <h3>报名表<br>
                                    <small>请填写基本的个人信息</small>
                                </h3>
                            </div>

                            <div class="wizard-navigation">
                                <ul>
                                    <li><a href="#about" data-toggle="tab">基本信息</a></li>
                                    <li><a href="#account" data-toggle="tab">部门意向</a></li>
                                    <li><a href="#address" data-toggle="tab">个人简介</a></li>
                                </ul>

                            </div>

                            <div class="tab-content">
                                <div class="tab-pane" id="about">
                                    <div class="row">
                                        <h4 class="info-text"> 开始填写基本信息吧</h4>
                                        <div class="col-xs-4 col-sm-offset-1">
                                            <div class="picture-container">
                                                <div class="picture">
                                                    <img name="img" src="assets/img/default-avatar.png"
                                                         class="picture-src"
                                                         id="wizardPicturePreview" title=""/>
                                                    <input type="file" accept="image/gif,image/png,image/jpeg"
                                                           id="wizard-picture" name="img">
                                                </div>
                                                <h6>上传我的照片
                                                    <small id="picture_error"></small>
                                                </h6>
                                            </div>
                                        </div>
                                        <div class="col-sm-6" style="margin-bottom: 15px">
                                            <div class="form-online">
                                                <label>姓名
                                                </label>
                                                <input name="name" type="text" class="form-control" placeholder="我叫...">
                                            </div>
                                        </div>
                                        <div class="col-sm-6" style="margin-bottom: 15px">
                                            <div class="form-online">
                                                <label>性别:</label>
                                                <label for="sex"></label><select class="form-control" name="sex"
                                                                                 id="sex">
                                                <option>女</option>
                                                <option>男</option>
                                            </select>
                                            </div>
                                        </div>
                                        <div class="col-sm-5 col-sm-offset-1">
                                            <div class="form-group" style="margin-bottom: 15px">
                                                <label>学号
                                                </label>
                                                <input name="std" type="text" class="form-control"
                                                       placeholder="我的学号是...">
                                            </div>
                                            <div class="form-group">
                                                <label>手机
                                                </label>
                                                <input name="phone" type="text" class="form-control"
                                                       placeholder="我的手机为...">
                                            </div>
                                            <div class="form-group">
                                                <label>QQ
                                                </label>
                                                <input name="QQ" type="text" class="form-control"
                                                       placeholder="我的QQ为...">
                                            </div>
                                        </div>
                                        <div class="col-sm-5 ">
                                            <div class="form-group" style="margin-bottom: 15px">
                                                <label>专业
                                                </label>
                                                <input name="specialty" type="text" class="form-control"
                                                       placeholder="我的专业是...">
                                            </div>
                                            <div class="form-group">
                                                <label>宿舍
                                                </label>
                                                <input name="dormitory" type="text" class="form-control"
                                                       placeholder="例：10#101A">
                                            </div>
                                            <div class="form-group">
                                                <label>邮箱
                                                </label>
                                                <input name="mail" type="text" class="form-control"
                                                       placeholder="例：xxxxx@qq.com">
                                            </div>
                                        </div>
                                    </div>
                                    <div id="errMsg"></div>
                                </div>
                                <div class="tab-pane" id="account">
                                    <h4 class="info-text"> 你对哪个部门比较感兴趣？
                                        <small id="department_error"></small>
                                    </h4>
                                    <div class="row">
                                        <div class="col-sm-10 col-sm-offset-1">
                                            <div class="col-sm-4">
                                                <div class="choice" data-toggle="wizard-checkbox">
                                                    <input type="checkbox" name="department" value="部门1">
                                                    <div class="icon">
                                                        <i class="fa fa-pencil"></i>
                                                    </div>
                                                    <h6>部门1</h6>
                                                </div>
                                            </div>
                                            <div class="col-sm-4">
                                                <div class="choice" data-toggle="wizard-checkbox">
                                                    <input type="checkbox" name="department" value="部门2">
                                                    <div class="icon">
                                                        <i class="fa fa-terminal"></i>
                                                    </div>
                                                    <h6>部门2</h6>
                                                </div>
                                            </div>
                                            <div class="col-sm-4">
                                                <div class="choice" data-toggle="wizard-checkbox">
                                                    <input type="checkbox" name="department" value="部门3">
                                                    <div class="icon">
                                                        <i class="fa fa-laptop"></i>
                                                    </div>
                                                    <h6>部门3</h6>
                                                </div>
                                            </div>
                                        </div>
                                    </div>
                                </div>
                                <div class="tab-pane" id="address">
                                    <h4 class="info-text"> 你的个人简介：
                                        <small id="introduce_error"></small>
                                    </h4>
                                    <div class="row" style="text-align:center;">
                                        <div>
                                            <label>
                                                <textarea cols="80" rows="10" class="message"
                                                          name="introduce"
                                                          placeholder="请填写您的个人简介，可以包含个人的经历，兴趣爱好，特长等......"></textarea>
                                            </label>
                                        </div>
                                    </div>
                                </div>
                            </div>
                            <div class="wizard-footer height-wizard">
                                <div class="pull-right">
                                    <input type='button' class='btn btn-next btn-fill btn-warning btn-wd btn-sm'
                                           name='下一步' value='下一步'/>
                                    <input type='submit' class='btn btn-finish btn-fill btn-warning btn-wd btn-sm'
                                           name='提交' value='提交'/>
                                </div>

                                <div class="pull-left">
                                    <input type='button' class='btn btn-previous btn-fill btn-default btn-wd btn-sm'
                                           name='上一步' value='上一步'/>
                                </div>
                                <div class="clearfix"></div>
                            </div>
                        </form>
                    </div>
                </div>
            </div>
        </div>
    </div>
    <div style="height: 30px"></div>
</div>

</body>

<script src="assets/js/jquery-2.2.4.min.js" type="text/javascript"></script>
<script src="assets/js/bootstrap.min.js" type="text/javascript"></script>
<script src="assets/js/jquery.bootstrap.wizard.js" type="text/javascript"></script>
<script src="assets/js/gsdk-bootstrap-wizard.js"></script>

<script src="assets/js/jquery.validate.min.js"></script>
</html>
