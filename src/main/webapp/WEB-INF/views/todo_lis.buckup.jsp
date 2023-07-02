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
    <title>待办清单</title>
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <script src="../js/todo_list.js" type="text/javascript"></script>
    <link rel="shortcut icon" href="./assets/Icon/user-fill.png" type="image/x-icon">
    <link href="https://cdn.jsdelivr.net/npm/remixicon@2.5.0/fonts/remixicon.css" rel="stylesheet">
    <link rel="stylesheet" href="../../asset/css/base.css" type="text/css">
    <link rel="stylesheet" href="../../asset/css/index.css" type="text/css">
</head>
<body>
<div class="contentDiv">
    <div class="cardModeDiv">
        <h1>Todo List</h1>
        <table>
            <tr>
                <th>ID</th>
                <th>Title</th>
                <th>Detail</th>
                <th>Checked</th>
                <th>Time</th>
                <th>Created Time</th>
                <th>URL</th>
            </tr>
            <c:forEach var="todo" items="${todos}">
                <tr>
                    <td>${todo.getId()}</td>
                    <td>${todo.getTitle()}</td>
                    <td>${todo.getDetail()}</td>
                    <td><a href="/todo/check/${todo.getId()}">${todo.isChecked()}</a></td>
                    <td>${todo.getTime()}</td>
                    <td>${todo.getCreatedTime()}</td>
                    <td><a href="${todo.getUrl()}">Link</a></td>
                    <td><a href="/todo/remove/${todo.getId()}">Delete</a></td>
                    <td>
                        <button onclick="edit_todo(${todo.getId()})">Edit</button>
                    </td>
                    <td>
                </tr>
            </c:forEach>

        </table>
        <form action="/todo/add" method="post">
            <input type="text" name="title" placeholder="Title">
            <input type="text" name="detail" placeholder="Detail">
            <input type="date" name="date" placeholder="Date">
            <input type="time" name="time" placeholder="Time">
            <input type="text" name="url" placeholder="URL">
            <input type="reset" value="Reset">
            <input type="submit" value="Add">
        </form>

        <%--修改--%>
        <form class="edit-table" action="/todo/edit" method="post">
            <input type="hidden" name="id">
            <input type="text" name="title" placeholder="Title">
            <input type="text" name="detail" placeholder="Detail">
            <input type="date" name="date" placeholder="Date">
            <input type="time" name="time" placeholder="Time">
            <input type="text" name="url" placeholder="URL">
            <input type="reset" value="重置">
            <input type="submit" value="确认修改">
        </form>

        <button onclick="window.location.href='/todo/find/check/0'">显示未完成事项</button>
        <button onclick="window.location.href='/todo/find/check/1'">显示已完成事项</button>
        <button onclick="window.location.href='/todo'">显示所有事项</button>
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
        // 将edit-table内容填充
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
</script>
</html>
