<%@ page import="com.cassius0924.hellospringboot.model.Todo" %><%--
  Created by IntelliJ IDEA.
  User: hochihchou
  Date: 2023/7/1
  Time: 10:57
  To change this template use File | Settings | File Templates.
--%>
<%@ page isELIgnored="false" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ page language="java" import="java.util.*" pageEncoding="gb2312" %>

<html lang="en">
<head>
    <meta charset="UTF-8">
    <title>�����嵥</title>
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <script src="../js/todo_list.js" type="text/javascript"></script>
    <link rel="shortcut icon" href="./assets/Icon/user-fill.png" type="image/x-icon">
    <link href="https://cdn.jsdelivr.net/npm/remixicon@2.5.0/fonts/remixicon.css" rel="stylesheet">
    <link rel="stylesheet" href="../../asset/css/base.css" type="text/css">
    <link rel="stylesheet" href="../../asset/css/todo_list.css" type="text/css">
</head>
<body>
<div class="contentDiv">
    <div class="cardModeDiv todoList">
        <div class="title">
            �����嵥
        </div>
        <ul class="cardList">
            <c:forEach var="todo" items="${todos}">
                <li>
                    <div class="cardListItemLeft">
                        <input class="todoCheckBox" type="checkbox"
                               onclick="window.location.href='/todo/check/${todo.getId()}'" ${todo.isChecked() ? 'checked' : ''}>
                    </div>
                    <div class="cardListItemContent">
                        <span class="todo-span">${todo.getTitle()}
                            <c:if test="${todo.getUrl() != ''}">
                                <a href="${todo.getUrl()}" target="_blank">
                                    <i class="ri-external-link-line"></i>
                                </a>
                            </c:if>
                        </span>
                        <span>${todo.getTime()}</span>
                        <div>${todo.getDetail()}
                        </div>
                    </div>
                    <div class="cardListItemMore">
                            <%--                        edit--%>
                        <button onclick="edit_todo(${todo.getId()})">
                            <i class="ri-edit-line"></i>
                        </button>
                            <%--                        remove--%>
                        <button onclick="window.location.href='/todo/remove/${todo.getId()}'">
                            <i class="ri-delete-bin-line"></i>
                        </button>
                    </div>
                </li>
            </c:forEach>
        </ul>

        <div class="hoverSidebar">
            <label>
                ������������
                <button onclick="">
                    <i class="ri-search-line"></i>
                </button>
            </label>
            <label>
                ��ʾδ��ɴ�������
                <button onclick="window.location.href='/todo/find/check/0'">
                    <i class="ri-list-check-2"></i>
                </button>
            </label>
            <label>
                ��ʾ����ɴ�������
                <button onclick="window.location.href='/todo/find/check/1'">
                    <i class="ri-check-line"></i>
                </button>
            </label>
            <label>
                ��ʾ���еĴ�������
                <button onclick="window.location.href='/todo'">
                    <i class="ri-list-check"></i>
                </button>
            </label>
            <label>
                ��Ӵ�������
                <button onclick="popAddCard()">
                    <i class="ri-add-line"></i>
                </button>
            </label>
        </div>


        <div style="display: none">
            <form class="edit-table" action="/todo/edit" method="post">
                <input type="hidden" name="id">
                <input type="text" name="title" placeholder="Title">
                <input type="text" name="detail" placeholder="Detail">
                <input type="date" name="date" placeholder="Date">
                <input type="time" name="time" placeholder="Time">
                <input type="text" name="url" placeholder="URL">
                <input type="reset" value="����">
                <input type="submit" value="ȷ���޸�">
            </form>
        </div>
    </div>

    <div class="cardModeDiv addCard">
        <div class="closeDiv" onclick="closeAddCard()">
            <i class="ri-close-line"></i>
        </div>
        <div class="title addTitle">
            ��Ӵ�������
        </div>
        <form class="loginForm" action="/todo/add" method="post">
            <div class="inputMergeDiv">
                <div class="inputShrinkDiv">
                    <input placeholder=" " name="title">
                    <label>����</label>
                </div>
                <div class="inputShrinkDiv">
                    <input placeholder=" " name="detail">
                    <label>����</label>
                </div>
            </div>
            <div class="inputMergeDiv">
                <div class="inputShrinkDiv">
                    <input placeholder=" " name="url">
                    <label>����</label>
                </div>
                <div class="inputShrinkDiv">
                    <input type="date" placeholder=" " name="date">
                    <label>����</label>
                </div>
                <div class="inputShrinkDiv">
                    <input type="time" placeholder=" " name="time">
                    <label>ʱ��</label>
                </div>
            </div>
            <div class="buttonMergeDiv">
                <button class="buttonI01 buttonWarning buttonIconSpin" type="reset">
                    ����
                    <i class="ri-restart-line"></i>
                </button>
                <button class="buttonI01 buttonSafe buttonIconObliqueMove" type="submit">
                    ���
                    <i class="ri-arrow-right-up-line"></i>
                </button>
            </div>
        </form>
        <%--                <input type="text" name="title" placeholder="Title">--%>
        <%--                <input type="text" name="detail" placeholder="Detail">--%>
        <%--                <input type="date" name="date" placeholder="Date">--%>
        <%--                <input type="time" name="time" placeholder="Time">--%>
        <%--                <input type="text" name="url" placeholder="URL">--%>
        <%--                <input type="reset" value="Reset">--%>
        <%--                <input type="submit" value="Add">--%>
    </div>

</div>
</body>
<script>
    var todos = [];
    <c:forEach var="todo" items="${todos}">
    var todo = {
        id: ${todo.id},
        title: '${todo.title}',
        detail: '${todo.detail}',
        checked: ${todo.checked},
        time: '${todo.time}',
        createdTime: '${todo.createdTime}',
        url: '${todo.url}'
    };
    todos.push(todo);
    </c:forEach>

    function edit_todo(id) {
        // ��edit-table�������
        let todo = get_todo_by_id(id);
        let dateTimeParts = todo.time.split(" ");
        document.querySelector('.edit-table input[name="id"]').value = todo.id;
        document.querySelector('.edit-table input[name="title"]').value = todo.title;
        document.querySelector('.edit-table input[name="detail"]').value = todo.detail;
        document.querySelector('.edit-table input[name="date"]').value = dateTimeParts[0];
        document.querySelector('.edit-table input[name="time"]').value = dateTimeParts[1];
        document.querySelector('.edit-table input[name="url"]').value = todo.url;
    }

    function get_todo_by_id(id) {
        for (var i = 0; i < todos.length; i++) {
            if (todos[i].id == id) {
                return todos[i];
            }
        }
    }

    function popAddCard() {
        document.querySelector('.addCard').style.bottom = "0px"
    }

    function closeAddCard() {
        document.querySelector('.addCard').style.bottom = "-400px"
    }

</script>
</html>
