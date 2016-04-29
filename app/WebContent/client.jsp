<%@ page language="java" contentType="text/html; charset=cp1251"
	pageEncoding="cp1251"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>

<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">

<html>

<head>
<meta http-equiv="Content-Type" content="text/html; charset=cp1251">
<link type="text/css" href="css/jquery-ui.css" rel="stylesheet" />
<link type="text/css" href="css/tables.css" rel="stylesheet" />

<script type="text/javascript" src="js/jquery-1.7.1.js"></script>
<script type="text/javascript" src="js/jquery-ui.js"></script>

<script type="text/javascript" src="js/jquery.maskedinput.js"></script>

<title>Add new client</title>
</head>
<body>
    <script>
        $(function() {
            $('input[name=birthday_date]').datepicker();
            $('input[name=passport_issue_date]').datepicker();
            $('input[name=birthday_date]').mask("99/99/9999");
            $('input[name=passport_issue_date]').mask("99/99/9999");
            
            $('input[name=passport_number]').mask("aa9999999",{placeholder:"LLDDDDDDD"});
            
            $("input[name=home_phone_number]").mask("+999 99 9999999");
            $("input[name=cellular_phone_number]").mask("+999 99 9999999");
            
            
            $("input[name=monthly_income]").mask("+999 99 9999999");
        });
    </script>
   

    <form method="POST" action='.' name="addClient">
    <div >
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
    				<input required type="text" name="first_name" value="<c:out value="${client.first_name}" />" /> <br /> 
    			</td>
    		</tr>
    		<tr>
    			<td>Middle Name : </td>
    			<td>
    				<input required type="text" name="middle_name" value="<c:out value="${client.middle_name}" />" /> <br /> 
    			</td>
    		</tr>
    		<tr>
    			<td>Last Name : </td>
    			<td>
    				<input required type="text" name="last_name" value="<c:out value="${client.last_name}" />" /> <br /> 
            	</td>
    		</tr>
    		<tr>
    			<td>Birthday date : </td>
    			<td>
    				<input required type="text" id="birthday_date" name="birthday_date" value="<fmt:formatDate pattern="MM/dd/yyyy" value="${client.birthday_date}" />" /> <br /> 
    			</td>
    		</tr>
    		<tr>
    			<td>Gender : </td>
    			<td>
    			<div>
    				<label for="male">Male</label>
  					<input type="radio" name="gender" id="male" value="male" ${'male' == client.gender ? 'checked' : ''}><br>
  					<label for="female">Female</label>
  					<input type="radio" name="gender" id="female" value="female" ${'female' == client.gender ? 'checked' : ''}><br>
  					<label for="other">Other</label>
  					<input type="radio" name="gender" id="other" value="other" ${(('male' != client.gender) && ('female' != client.gender)) ? 'checked' : ''}  ><br><br>
    			</div>
    			</td>
    		</tr>
    		<tr>
    			<td>Passport series : </td>
    			<td>
    				<input required type="text" name="passport_series" value="<c:out value="${client.passport_series}" />" /> <br />  
    			</td>
    		</tr>
    		<tr>
    			<td>Passport number : </td>
    			<td>
    				<input required type="text" name="passport_number" value="<c:out value="${client.passport_number}" />" /> <br />  
    			</td>
    		</tr>
    		<tr>
    			<td>Passport authority : </td>
    			<td>
    				<input required type="text" name="passport_authority" value="<c:out value="${client.passport_authority}" />" /> <br />  
    			</td>
    		</tr>
    		
    		<tr>
    			<td>Passport issue date : </td>
    			<td>
    				<input required type="text" name="passport_issue_date" value="<fmt:formatDate pattern="MM/dd/yyyy" value="${client.passport_issue_date}" />" /> <br />  
    			</td>
    		</tr>
    		<tr>
    			<td>Passport No : </td>
    			<td>
    				<input required type="text" name="passport_identification_number" value="<c:out value="${client.passport_identification_number}" />" /> <br />  
    			</td>
    		</tr>
    		<tr>
    			<td>Birthday place : </td>
    			<td>
    				<input required type="text" name="birthday_place" value="<c:out value="${client.birthday_place}" />" /> <br />  
    			</td>
    		</tr>
    		<tr>
    			<td>Actual residential city : </td>
    			<td>
    			<select name="actual_residential_city_id">
    				<c:forEach items="${cities}" var="city">
    					<option value="${city.id}" ${city.id == client.actual_residential_city_id ? 'selected="selected"' : ''}> <c:out value="${city.name}" /> </option>
    				</c:forEach>
				</select>  
    			</td>
    		</tr>
    		
    		<tr>
    			<td>Actual address : </td>
    			<td>
    				<input required type="text" name="actual_address" value="<c:out value="${client.actual_address}" />" /> <br />  
    			</td>
    		</tr>
    		
    		<tr>
    			<td>Home phone number : </td>
    			<td>
    				<input type="text" name="home_phone_number" value="<c:out value="${client.home_phone_number}" />" /> <br />  
    			</td>
    		</tr>
    		
    		<tr>
    			<td>Cellular phone number : </td>
    			<td>
    				<input type="text" name="cellular_phone_number" value="<c:out value="${client.cellular_phone_number}" />" /> <br />  
    			</td>
    		</tr>
    		
    		<tr>
    			<td>Email : </td>
    			<td>
    				<input type="text" type="email" name="email" value="<c:out value="${client.email}" />" /> <br />  
    			</td>
    		</tr>
    		
    		<tr>
    			<td>Place of work : </td>
    			<td>
    				<input type="text" name="place_of_work" value="<c:out value="${client.place_of_work}" />" /> <br />  
    			</td>
    		</tr>
    		
    		<tr>
    			<td>Job title : </td>
    			<td>
    				<input type="text" name="job_title" value="<c:out value="${client.job_title}" />" /> <br />  
    			</td>
    		</tr>
    		
    		<tr>
    			<td>Residential city : </td>
    			<td>
    			<select name="resirential_city_id">
    				<c:forEach items="${cities}" var="city">
    					<option value="${city.id}" ${city.id == client.resirential_city_id ? 'selected="selected"' : ''} > <c:out value="${city.name}" /> </option>
    				</c:forEach>
				</select>  
    			</td>
    		</tr>
    		
    		<tr>
    			<td>Residential address : </td>
    			<td>
    				<input required type="text" name="residential_address" value="<c:out value="${client.residential_address}" />" /> <br />  
    			</td>
    		</tr>
    		
    		<tr>
    			<td>Martial status : </td>
    			<td>
    			<select name="martial_status_id">
    				<c:forEach items="${marital_status}" var="item">
    					<option value="${item.id}" ${item.id == client.martial_status_id ? 'selected="selected"' : ''} > <c:out value="${item.name}" /> </option>
    				</c:forEach>
				</select>  
    			</td>
    		</tr>
    		
    		<tr>
    			<td>Nationality : </td>
    			<td>
    			<select name="nationality_id">
    				<c:forEach items="${nationalities}" var="item">
    					<option value="${item.id}" ${item.id == client.nationality_id ? 'selected="selected"' : ''} > <c:out value="${item.name}" /> </option>
    				</c:forEach>
				</select>  
    			</td>
    		</tr>
    		
    		<tr>
    			<td>Disabilities : </td>
    			<td>
    			<select name="disability_id">
    				<c:forEach items="${disabilities}" var="item">
    					<option value="${item.id}" ${item.id == client.disability_id ? 'selected="selected"' : ''} > <c:out value="${item.name}" /> </option>
    				</c:forEach>
				</select>  
    			</td>
    		</tr>
    		
    		<tr>
    			<td>Retired : </td>
    			<td>
    				<input type="checkbox" name="is_retired" <c:if test="${client.is_retired}">checked</c:if> /> <br />  
    			</td>
    		</tr>
    		
    		<tr>
    			<td>Monthly income : </td>
    			<td>
    				<input required type="text" name="monthly_income" value="<c:out value="${client.monthly_income}" />" /> <br />  
    			</td>
    		</tr>
    		
    		<tr>
    			<td>Reservist : </td>
    			<td>
    				<input type="checkbox" name="is_reservist" <c:if test="${client.is_reservist}">checked</c:if> /> <br />  
    			</td>
    		</tr>
    		
    	</table>		 
        
        </div>
        <input type="submit" value="Submit" />
    </form>
   
    
</body>
</html>