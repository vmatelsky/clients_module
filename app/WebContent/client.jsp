<%@ page language="java" contentType="text/html; charset=EUC-KR" pageEncoding="EUC-KR"%>
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
            $('input[name=dob]').datepicker();
        });
    </script>

    <form method="POST" action='ClientsController' name="addClient">
    <div  >
    	<table>
    		<tr>
    			<td>User ID : </td>
    			<td>
    				<input type="text" readonly="readonly" name="userid" />" /> <br />
    			</td>
    		</tr>
    		<tr>
    			<td>First Name : </td>
    			<td>
    				<input type="text" name="firstName" />" /> <br /> 
    			</td>
    		</tr>
    		<tr>
    			<td>Last Name : </td>
    			<td>
    				<input type="text" name="lastName" />" /> <br /> 
            	</td>
    		</tr>
    		<tr>
    			<td>DOB : </td>
    			<td>
    				<input type="text" name="dob" />" /> <br /> 
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