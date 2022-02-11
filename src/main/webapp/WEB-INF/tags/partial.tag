<%@ tag language="java" pageEncoding="ISO-8859-1"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form"%>

<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<link
	href="https://cdn.jsdelivr.net/npm/bootstrap@5.1.0/dist/css/bootstrap.min.css"
	rel="stylesheet" integrity="sha384-KyZXEAg3QhqLMpG8r+8fhAXLRk2vvoC2f3B09zVXn8CA5QIVfZOJ3BCsw2P0p/We" crossorigin="anonymous">
<title>Insert title here</title>
</head>
<body>
<div class="container mt-3">
	<h3>
		Welcome
		<c:out value="${userName}"/>
	</h3>
	<a href="/">Home</a>
	
	<a href="/login">Login</a>
	<a href="/missing/pets">Missing Pets</a>
	<c:if test="${userId!=null}">
		<a href="/dashboard">Your Dashboard</a>
	</c:if>
	<hr>
	<jsp:doBody/>
	
	
	<hr>
	<a class="btn btn-secondary" href="/logout" role="button">Logout</a>
	
</div>
</body>
</html>