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
    <link rel="shortcut icon" href="./assets/Icon/user-fill.png" type="image/x-icon">
    <link href="https://cdn.jsdelivr.net/npm/remixicon@2.5.0/fonts/remixicon.css" rel="stylesheet">
    <link rel="stylesheet" href="/asset/css/base.css" type="text/css">
    <link rel="stylesheet" href="/asset/css/todo_list.css" type="text/css">
</head>
<body>
<div class="contentDiv">
    <div class="todoListDiv">
        <div class="cardModeDiv todoList">
            <div class="title">
                �����嵥
            </div>
            <ul class="cardList">
                <c:if test="${todos == null || todos.size() == 0}">
                    <h2>���޴�������</h2>
                </c:if>
                <c:if test="${todos != null && todos.size() > 0}">
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
<%--                        ��ʽ��timeΪ 07-02 21:50 --%>
                                <span class="todoTime">${todo.getTime().toString().substring(5, 16)}</span>
                                <div>${todo.getDetail()}</div>
                            </div>
                            <div class="cardListItemMore">
                                <button onclick="popEditCard();edit_todo(${todo.getId()})">
                                    <i class="ri-edit-line"></i>
                                </button>
                                <button onclick="window.location.href='/todo/remove/${todo.getId()}'">
                                    <i class="ri-delete-bin-line"></i>
                                </button>
                            </div>
                        </li>
                    </c:forEach>
                </c:if>
            </ul>
        </div>

        <div class="hoverSidebar">
            <label>
                ${username}
                <button onclick="popUserCard()" style="font-size: 25px; font-weight: normal">
                    ${username.substring(0, 1)}
                </button>
            </label>
            <label>
                ������������
                <button onclick="popSearchCard()">
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
    </div>

    <div class="cardModeDiv popCard searchCard">
        <div class="closeDiv" onclick="closeSearchCard()">
            <i class="ri-close-line"></i>
        </div>
        <div class="title popTitle searchTitle">
            ������������
        </div>
        <div>
            <div class="searchDiv">
                <i class="ri-search-line"
                   onclick="window.location.href='/todo/find/title/'+document.querySelector('.searchCard .searchDiv input').value"></i>
                <input placeholder="������������">
                <i class="ri-close-line"></i>
            </div>
        </div>
    </div>

    <div class="cardModeDiv popCard addCard">
        <div class="closeDiv" onclick="closeAddCard()">
            <i class="ri-close-line"></i>
        </div>
        <div class="title popTitle">
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
    </div>

    <div class="cardModeDiv popCard editCard">
        <div class="closeDiv" onclick="closeEditCard()">
            <i class="ri-close-line"></i>
        </div>
        <div class="title popTitle">
            �޸Ĵ�������
        </div>
        <form class="loginForm editForm" action="/todo/edit" method="post">
            <input placeholder=" " name="id" type="hidden">
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
                    ȷ���޸�
                    <i class="ri-arrow-right-up-line"></i>
                </button>
            </div>
        </form>
    </div>

    <div class="cardModeDiv popCard userCard">
        <div class="closeDiv" onclick="closeUserCard()">
            <i class="ri-close-line"></i>
        </div>
        <div class="title popTitle">
            �޸��û���Ϣ
        </div>
        <form class="loginForm editForm" action="/user/edit" method="post">
            <div class="inputShrinkDiv">
                <input placeholder=" " name="username" readonly value="${username}">
                <label>�û���</label>
            </div>
            <div class="inputShrinkDiv">
                <input placeholder=" " name="password">
                <label>����</label>
            </div>
            <div class="inputShrinkDiv">
                <input placeholder=" " name="confirm_password">
                <label>ȷ������</label>
            </div>
            <div class="buttonMergeDiv">
                <button class="buttonI01 buttonDangerous buttonIconObliqueMove" onclick="logout()" type="button">
                    �˳���¼
                    <i class="ri-login-box-line"></i>
                </button>
                <button class="buttonI01 buttonSafe buttonIconObliqueMove" type="submit">
                    ȷ���޸�
                    <i class="ri-arrow-right-up-line"></i>
                </button>
            </div>
        </form>
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
        let todo = get_todo_by_id(id);
        let dateTimeParts = todo.time.split(" ");
        document.querySelector('.editForm input[name="id"]').value = todo.id;
        document.querySelector('.editForm input[name="title"]').value = todo.title;
        document.querySelector('.editForm input[name="detail"]').value = todo.detail;
        document.querySelector('.editForm input[name="date"]').value = dateTimeParts[0];
        document.querySelector('.editForm input[name="time"]').value = dateTimeParts[1];
        document.querySelector('.editForm input[name="url"]').value = todo.url;
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

    function popEditCard() {
        document.querySelector('.editCard').style.bottom = "0px"
    }

    function closeEditCard() {
        document.querySelector('.editCard').style.bottom = "-400px"
    }

    function popSearchCard() {
        document.querySelector('.searchCard').style.top = "0px"
    }

    function closeSearchCard() {
        document.querySelector('.searchCard').style.top = "-400px"
    }

    function popUserCard() {
        document.querySelector('.userCard').style.bottom = "calc(50% - 180px)"
    }

    function closeUserCard() {
        document.querySelector('.userCard').style.bottom = "-400px"
    }

    function logout() {
        window.location.href = "/";
    }

</script>
</html>
