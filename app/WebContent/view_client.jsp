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
<title>���ݬڬ֬߬� <c:out value="${client.id}" /></title>
</head>
<body>
   <div style="text-align: center">   
    <div id="wrapper">
    
    	<h1>���ݬڬ֬߬� <c:out value="${client.id}" /></h1>
    
    	<table id="keywords" cellspacing="0" cellpadding="0">
    	<tbody>
    		<tr>
    			<td >ID : </td>
    			<td><c:out value="${client.id}" /></td>
    		</tr>
    		<tr>
    			<td>���Ѭެڬݬڬ� : </td>
    			<td>
    				<c:out value="${client.last_name}" /> 
            	</td>
    		</tr>
    		<tr>
    			<td>���ެ� : </td>
    			<td><c:out value="${client.first_name}" /></td>
    		</tr>
    		<tr>
    			<td>�����֬��Ӭ� : </td>
    			<td>
    				<c:out value="${client.middle_name}" /> 
    			</td>
    		</tr>
    		
    		<tr>
    			<td>���Ѭ�� ���جլ֬߬ڬ� : </td>
    			<td>
    				<fmt:formatDate pattern="MM/dd/yyyy" value="${client.birthday_date}" /> 
    			</td>
    		</tr>
    		<tr>
    			<td>���֬�ڬ� ��Ѭ������ : </td>
    			<td>
    				<c:out value="${client.passport_series}" />  
    			</td>
    		</tr>
    		<tr>
    			<td>����ެ֬� ��Ѭ������ : </td>
    			<td>
    				<c:out value="${client.passport_number}" />
    			</td>
    		</tr>
    		<tr>
    			<td>���֬� �Ӭ�լѬ� : </td>
    			<td>
    				<c:out value="${client.passport_authority}" />
    			</td>
    		</tr>
    		
    		<tr>
    			<td>���Ѭ�� �Ӭ�լѬ�� : </td>
    			<td>
    				<fmt:formatDate pattern="MM/dd/yyyy" value="${client.passport_issue_date}" />
    			</td>
    		</tr>
    		<tr>
    			<td>���լ֬߬�ڬ�ڬܬѬ�ڬ�߬߬�� �߬�ެ֬� : </td>
    			<td>
    				<c:out value="${client.passport_identification_number}" />
    			</td>
    		</tr>
    		<tr>
    			<td>���֬��� ���جլ֬߬ڬ� : </td>
    			<td>
    				<c:out value="${client.birthday_place}" />
    			</td>
    		</tr>
    		<tr>
    			<td>������� ��Ѭܬ�. ����جڬӬѬ߬ڬ� : </td>
    			<td><c:out value="${client.actual_residential_city}" /></td>
    		</tr>
    		
    		<tr>
    			<td>���լ�֬� ��Ѭܬ�. ����جڬӬѬ߬ڬ� : </td>
    			<td>
    				<c:out value="${client.actual_address}" />
    			</td>
    		</tr>
    		
    		<tr>
    			<td>���֬ݬ֬��� �լ�� : </td>
    			<td>
    				<c:out value="${client.home_phone_number}" />
    			</td>
    		</tr>
    		
    		<tr>
    			<td>���֬ݬ֬��� �ެ�� : </td>
    			<td>
    				<c:out value="${client.cellular_phone_number}" />
    			</td>
    		</tr>
    		
    		<tr>
    			<td>E-mail : </td>
    			<td>
    				<c:out value="${client.email}" />
    			</td>
    		</tr>
    		
    		<tr>
    			<td>���֬��� ��ѬҬ��� : </td>
    			<td>
    				<c:out value="${client.place_of_work}" />
    			</td>
    		</tr>
    		
    		<tr>
    			<td>����ݬج߬���� : </td>
    			<td>
    				<c:out value="${client.job_title}" />
    			</td>
    		</tr>
    		
    		<tr>
    			<td>������� �����ڬ�ܬ� : </td>
    			<td>
    				<c:out value="${client.residential_address}" />
    			</td>
    		</tr>
    		
    		<tr>
    			<td>���֬ެ֬۬߬�� ���Ѭ��� : </td>
    			<td><c:out value="${client.martial_status}" /></td>
    		</tr>
    		
    		<tr>
    			<td>���Ѭ�ڬ�߬Ѭݬ�߬���� : </td>
    			<td><c:out value="${client.nationality}" /></td>
    		</tr>
    		
    		<tr>
    			<td>���߬ӬѬݬڬլ߬���� : </td>
    			<td><c:out value="${client.disability}" /></td>
    		</tr>
    		
    		<tr>
    			<td>���֬߬�ڬ�߬֬� : </td>
    			<td>
    				<input disabled type="checkbox" name="is_retired" <c:if test="${client.is_retired}">checked</c:if> /> <br />  
    			</td>
    		</tr>
    		
    		<tr>
    			<td>���ج֬ެ֬���߬�� �լ���� : </td>
    			<td>
    				<c:out value="${client.monthly_income}" />
    			</td>
    		</tr>
    		</tbody>
    	</table>
    			 
        <button type="button" name="back" onclick="history.back()">���Ѭ٬Ѭ�</button>
        </div>
        </div>
</body>
</html>