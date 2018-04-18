<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
    <%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
    <%@ taglib prefix="form" uri="http://www.springframework.org/tags/form"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>${group.name }</title>
</head>
<body>
	<h1>${group.name }</h1>
	


	<strong><p>Instructor: ${group.instructor }</p></strong>
	<strong><p>Sign Ups: ${group.signups }</p></strong>
		<table>
	
		<tr>
			<th>Name</th>
			<th>Sign Up Date:</th>
			<th>Action:</th>
		</tr>

		<c:forEach items="${group.users }" var="user">
			<tr>
				<td>${user.name }</td>
				<td>${user.location }</td>
			</tr>
		</c:forEach>

	</table>
	
</body>
</html>