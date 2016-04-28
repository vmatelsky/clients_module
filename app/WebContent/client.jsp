<%@ page language="java" contentType="text/html; charset=EUC-KR"
	pageEncoding="EUC-KR"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">

<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=EUC-KR">
<link type="text/css" href="css/jquery-ui.css" rel="stylesheet" />
<link type="text/css" href="css/tables.css" rel="stylesheet" />
<script type="text/javascript" src="js/jquery-1.7.1.js"></script>
<script type="text/javascript" src="js/jquery-ui.js"></script>
<title>Add new client</title>
</head>
<body>
    <script>
        $(function() {
            $('input[name=birthday_date]').datepicker();
            $('input[name=passport_issue_date]').datepicker();
        });
    </script>

    <form method="POST" action='ClientsController' name="addClient">
    <div  >
    	<table>
    		<tr>
    			<td>Client ID : </td>
    			<td>
    				<input type="text" readonly="readonly" name="id" value="<c:out value="${client.id}" />" /> <br />
    			</td>
    		</tr>
    		<tr>
    			<td>First Name : </td>
    			<td>
    				<input type="text" name="first_name" value="<c:out value="${client.first_name}" />" /> <br /> 
    			</td>
    		</tr>
    		<tr>
    			<td>Last Name : </td>
    			<td>
    				<input type="text" name="last_name" value="<c:out value="${client.last_name}" />" /> <br /> 
            	</td>
    		</tr>
    		<tr>
    			<td>Birthday date : </td>
    			<td>
    				<input type="text" name="birthday_date" value="<fmt:formatDate pattern="MM/dd/yyyy" value="${client.birthday_date}" />" /> <br /> 
    			</td>
    		</tr>
    		<tr>
    			<td>Gender : </td>
    			<td>
    			<div>
    				<label for="male">Male</label>
  					<input type="radio" name="gender" id="male" value="male"><br>
  					<label for="female">Female</label>
  					<input type="radio" name="gender" id="female" value="female"><br>
  					<label for="other">Other</label>
  					<input type="radio" name="gender" id="other" value="other"><br><br>
    			</div>
    			</td>
    		</tr>
    		<tr>
    			<td>Passport series : </td>
    			<td>
    				<input type="text" name="passport_series" value="<c:out value="${client.passport_series}" />" /> <br />  
    			</td>
    		</tr>
    		<tr>
    			<td>Passport number : </td>
    			<td>
    				<input type="text" name="passport_number" value="<c:out value="${client.passport_number}" />" /> <br />  
    			</td>
    		</tr>
    		<tr>
    			<td>Passport authority : </td>
    			<td>
    				<input type="text" name="passport_authority" value="<c:out value="${client.passport_authority}" />" /> <br />  
    			</td>
    		</tr>
    		
    		<tr>
    			<td>Passport issue date : </td>
    			<td>
    				<input type="text" name="passport_issue_date" value="<fmt:formatDate pattern="MM/dd/yyyy" value="${client.passport_issue_date}" />" /> <br />  
    			</td>
    		</tr>
    		<tr>
    			<td>Passport No : </td>
    			<td>
    				<input type="text" name="passport_identification_number" value="<c:out value="${client.passport_identification_number}" />" /> <br />  
    			</td>
    		</tr>
    		<tr>
    			<td>Birthday place : </td>
    			<td>
    				<input type="text" name="birthday_place" value="<c:out value="${client.birthday_place}" />" /> <br />  
    			</td>
    		</tr>
    		
    		<tr>
    			<td>Email : </td>
    			<td>
    				<input type="text" name="email" />" /> <br />
    			</td>
    		</tr>
    	</table>		 
        
        </div>
        <input type="submit" value="Submit" />
    </form>
</body>
</html>