<%@ page isELIgnored="false" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ page language="java" import="java.util.*" pageEncoding="gb2312" %>
<html lang="en">

<head>
    <meta charset="UTF-8">
    <title>用户注册</title>
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <link rel="shortcut icon" href="./assets/Icon/user-fill.png" type="image/x-icon">
    <link href="https://cdn.jsdelivr.net/npm/remixicon@2.5.0/fonts/remixicon.css" rel="stylesheet">
    <link rel="stylesheet" href="../../asset/css/base.css" type="text/css">
    <link rel="stylesheet" href="../../asset/css/index.css" type="text/css">
</head>

<body>
<div class="contentDiv">
    <div class="cardModeDiv">
        <div class="title">
            注册
        </div>
        <form class="loginForm" action="register" method="post">
            <div class="inputShrinkDiv">
                <input placeholder=" " name="username">
                <label>用户名</label>
            </div>
            <div class="inputShrinkDiv">
                <input placeholder=" " name="password">
                <label>密码</label>
            </div>
            <div class="inputShrinkDiv">
                <input placeholder=" " name="confirm_password">
                <label>确认密码</label>
            </div>
            <div class="toSignUp">
                已拥有账号？<a href="/">点此登录</a>
            </div>
            <div class="buttonMergeDiv">
                <button class="buttonI01 buttonWarning buttonIconSpin" type="reset">
                    重置
                    <i class="ri-restart-line"></i>
                </button>
                <button class="buttonI01 buttonSafe buttonIconObliqueMove" type="submit">
                    注册
                    <i class="ri-arrow-right-up-line"></i>
                </button>
            </div>
        </form>
    </div>
</div>


</body>

<script type="text/javascript">
</script>

</html>
