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
<title>Сlient <c:out value="${client.id}" /></title>
</head>
<body>
    
    <div >
    	<table>
    		<tr>
    			<td>Client ID : </td>
    			<td><c:out value="${client.id}" /></td>
    		</tr>
    		<tr>
    			<td>First Name : </td>
    			<td><c:out value="${client.first_name}" /></td>
    		</tr>
    		<tr>
    			<td>Middle Name : </td>
    			<td>
    				<c:out value="${client.middle_name}" /> 
    			</td>
    		</tr>
    		<tr>
    			<td>Last Name : </td>
    			<td>
    				<c:out value="${client.last_name}" /> 
            	</td>
    		</tr>
    		<tr>
    			<td>Birthday date : </td>
    			<td>
    				<fmt:formatDate pattern="MM/dd/yyyy" value="${client.birthday_date}" /> 
    			</td>
    		</tr>
    		<tr>
    			<td>Gender : </td>
    			<td><c:out value="${client.gender}" /></td>
    		</tr>
    		<tr>
    			<td>Passport series : </td>
    			<td>
    				<c:out value="${client.passport_series}" />  
    			</td>
    		</tr>
    		<tr>
    			<td>Passport number : </td>
    			<td>
    				<c:out value="${client.passport_number}" />
    			</td>
    		</tr>
    		<tr>
    			<td>Passport authority : </td>
    			<td>
    				<c:out value="${client.passport_authority}" />
    			</td>
    		</tr>
    		
    		<tr>
    			<td>Passport issue date : </td>
    			<td>
    				<fmt:formatDate pattern="MM/dd/yyyy" value="${client.passport_issue_date}" />
    			</td>
    		</tr>
    		<tr>
    			<td>Passport No : </td>
    			<td>
    				<c:out value="${client.passport_identification_number}" />
    			</td>
    		</tr>
    		<tr>
    			<td>Birthday place : </td>
    			<td>
    				<c:out value="${client.birthday_place}" />
    			</td>
    		</tr>
    		<tr>
    			<td>Actual residential city : </td>
    			<td><c:out value="${client.actual_residential_city}" /></td>
    		</tr>
    		
    		<tr>
    			<td>Actual address : </td>
    			<td>
    				<c:out value="${client.actual_address}" />
    			</td>
    		</tr>
    		
    		<tr>
    			<td>Home phone number : </td>
    			<td>
    				<c:out value="${client.home_phone_number}" />
    			</td>
    		</tr>
    		
    		<tr>
    			<td>Cellular phone number : </td>
    			<td>
    				<c:out value="${client.cellular_phone_number}" />
    			</td>
    		</tr>
    		
    		<tr>
    			<td>Email : </td>
    			<td>
    				<c:out value="${client.email}" />
    			</td>
    		</tr>
    		
    		<tr>
    			<td>Place of work : </td>
    			<td>
    				<c:out value="${client.place_of_work}" />
    			</td>
    		</tr>
    		
    		<tr>
    			<td>Job title : </td>
    			<td>
    				<c:out value="${client.job_title}" />
    			</td>
    		</tr>
    		
    		<tr>
    			<td>Residential city : </td>
    			<td><c:out value="${client.resirential_city}" /></td> 
    		</tr>
    		
    		<tr>
    			<td>Residential address : </td>
    			<td>
    				<c:out value="${client.residential_address}" />
    			</td>
    		</tr>
    		
    		<tr>
    			<td>Martial status : </td>
    			<td><c:out value="${client.martial_status}" /></td>
    		</tr>
    		
    		<tr>
    			<td>Nationality : </td>
    			<td><c:out value="${client.nationality}" /></td>
    		</tr>
    		
    		<tr>
    			<td>Disabilities : </td>
    			<td><c:out value="${client.disability}" /></td>
    		</tr>
    		
    		<tr>
    			<td>Retired : </td>
    			<td>
    				<input disabled type="checkbox" name="is_retired" <c:if test="${client.is_retired}">checked</c:if> /> <br />  
    			</td>
    		</tr>
    		
    		<tr>
    			<td>Residential address : </td>
    			<td>
    				<c:out value="${client.monthly_income}" />
    			</td>
    		</tr>
    		
    		<tr>
    			<td>Reservist : </td>
    			<td>
    				<input disabled type="checkbox" name="is_reservist" <c:if test="${client.is_reservist}">checked</c:if> /> <br />  
    			</td>
    		</tr>
    		
    	</table>		 
        
        </div>
</body>
</html>