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

<title>Clients</title>
</head>
<body>
<div>
	<table>
		<thead>
			<tr>
				<th>Id</th>
				<th>First Name</th>
				<th>Last Name</th>
				<th>Birthday date</th>
								
				<th>Email</th>
				<th colspan=3>Action</th>
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
					
					<%--  <td><c:out value="${client.gender}" /></td>
					<td><c:out value="${client.passport_series}" /></td>
					<td><c:out value="${client.passport_number}" /></td>
					<td><c:out value="${client.passport_authority}" /></td>
					<td><fmt:formatDate pattern="yyyy-MMM-dd" value="${client.passport_issue_date}" /></td>
					<td><c:out value="${client.passport_identification_number}" /></td>
					<td><c:out value="${client.birthday_place}" /></td>
					<td><c:out value="${client.actual_residential_city}" /></td>
					<td><c:out value="${client.actual_address}" /></td>
					<td><c:out value="${client.home_phone_number}" /></td>
					<td><c:out value="${client.cellular_phone_number}" /></td>
					<td><c:out value="${client.email}" /></td>
					<td><c:out value="${client.place_of_work}" /></td>
					<td><c:out value="${client.job_title}" /></td>
					<td><c:out value="${client.resirential_city_id}" /></td>
					<td><c:out value="${client.residential_address}" /></td>
					<td><c:out value="${client.martial_status_id}" /></td>
					<td><c:out value="${client.nationality_id}" /></td>
					<td><c:out value="${client.disability_id}" /></td>
					<td><c:out value="${client.is_retired}" /></td>
					<td><c:out value="${client.monthly_income}" /></td>
					<td><c:out value="${client.is_reservist}" /></td> --%>
					
					<td><a
						href="ClientsController?action=view&clientId=<c:out value="${client.id}" />">View</a></td>
					<td><a
						href="ClientsController?action=edit&clientId=<c:out value="${client.id}" />">Update</a></td>
					<td><a
						href="ClientsController?action=delete&clientId=<c:out value="${client.id}" />">Delete</a></td>
				</tr>
			</c:forEach>
		</tbody>
	</table>
	</div>
	<p>
		<a href="ClientsController?action=insert">Add User</a>
	</p>
</body>
</html>