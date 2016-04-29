<%@ page language="java" contentType="text/html; charset=cp1251"
	pageEncoding="cp1251"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">

<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=cp1251">
<link type="text/css" href="css/tables.css" rel="stylesheet" />
<script type="text/javascript" src="js/jquery-1.7.1.js"></script>
<script type="text/javascript" src="js/jquery-ui.js"></script>


<title>Клиенты</title>
</head>
<body>
<div style="text-align: center">   
	<div id="wrapper">

	<h1>Список клиентов</h1>

	<table id="keywords" cellspacing="0" cellpadding="0">
		<thead>
			<tr>
				<th><span>ID</span></th>
				<th><span>Имя</span></th>
				<th><span>Фамилия</span></th>
				<th><span>Дата рождения</span></th>
								
				<th><span>E-mail</span></th>
				<th colspan=3><span>Действия</span></th>
			</tr>
		</thead>
		<tbody>
			<c:forEach items="${clients}" var="client">
				<tr>
					<td><c:out value="${client.id}" /></td>
					<td><c:out value="${client.first_name}" /></td>
					<td><c:out value="${client.last_name}" /></td>
					<td><fmt:formatDate pattern="yyyy-MMM-dd" value="${client.birthday_date}" /></td>
					<td><c:out value="${client.email}" /></td>

					<td><a
						href="ClientsController?action=view&clientId=<c:out value="${client.id}" />">Просмотреть</a></td>
					<td><a
						href="ClientsController?action=edit&clientId=<c:out value="${client.id}" />">Обновить</a></td>
					<td><a
						href="ClientsController?action=delete&clientId=<c:out value="${client.id}" />">Удалить</a></td>
				</tr>
			</c:forEach>
		</tbody>
	</table>
	
	
	<span><a href="ClientsController?action=insert" style="font-size: 1.2em">Добавить клиента</a></span>
	
	</div>
	</div>
	
</body>
</html>