<%@ page language="java" contentType="text/html; charset=EUC-KR"
	pageEncoding="EUC-KR"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">

<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=EUC-KR">
<title>Clients</title>
</head>
<body>
	<table border=1>
		<thead>
			<tr>
				<th>Id</th>
				<th>First Name</th>
				<th>Last Name</th>
				<th>Middle Name</th>
				<th>Birthday date</th>
				<th>Email</th>
				<th colspan=2>Action</th>
			</tr>
		</thead>
		<tbody>
			<c:forEach items="${clients}" var="client">
				<tr>
					<td><c:out value="${client.id}" /></td>
					<td><c:out value="${client.first_name}" /></td>
					<td><c:out value="${client.last_name}" /></td>
					<td><c:out value="${client.middle_name}" /></td>
					<td><fmt:formatDate pattern="yyyy-MMM-dd" value="${client.birthday_date}" /></td>
					<td><c:out value="${client.email}" /></td>
					<td><a
						href="ClientsController?action=edit&userId="<c:out value="${client.id}"/>">Update</a></td>
					<td><a
						href="ClientsController?action=delete&userId="<c:out value="${client.id}"/>">Delete</a></td>
				</tr>
			</c:forEach>
		</tbody>
	</table>
	<p>
		<a href="ClientsController?action=insert">Add User</a>
	</p>
</body>
</html>