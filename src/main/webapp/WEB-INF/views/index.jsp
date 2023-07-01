<%@ page isELIgnored="false" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ page language="java" import="java.util.*" pageEncoding="gb2312" %>
<html lang="en">

<head>
    <meta charset="UTF-8">
    <title>�û���¼</title>
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <link rel="shortcut icon" href="./assets/Icon/user-fill.png" type="image/x-icon">
    <link href="https://cdn.jsdelivr.net/npm/remixicon@2.5.0/fonts/remixicon.css" rel="stylesheet">
    <link rel="stylesheet" href="../../asset/css/base.css" type="text/css">
    <link rel="stylesheet" href="../../asset/css/index.css" type="text/css">
</head>

<body>
<div class="contentDiv">
    <div class="cardModeDiv">
<%--        <h1>����SpringBoot��MyBatis<br>�Ĵ����嵥ϵͳ</h1>--%>
        <div class="title">
            ��¼
        </div>
        <form class="loginForm" action="login" method="post">
            <div class="inputShrinkDiv">
                <input placeholder=" " name="username">
                <label>�˺�</label>
            </div>
            <div class="inputShrinkDiv">
                <input placeholder=" " name="password">
                <label>����</label>
            </div>
            <div class="toSignUp">
                ��û���˺ţ�<a href="/register">���ע��</a>
            </div>
            <div class="buttonMergeDiv">
                <button class="buttonI01 buttonWarning buttonIconSpin" type="reset">
                    ����
                    <i class="ri-restart-line"></i>
                </button>
                <button class="buttonI01 buttonSafe buttonIconObliqueMove" type="submit">
                    ��¼
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
