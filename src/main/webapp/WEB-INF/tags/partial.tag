<%@ tag language="java" pageEncoding="ISO-8859-1"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form"%>

<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<link href="/css/main.css" rel="stylesheet">   
<link
	href="https://cdn.jsdelivr.net/npm/bootstrap@5.1.0/dist/css/bootstrap.min.css"
	rel="stylesheet" integrity="sha384-KyZXEAg3QhqLMpG8r+8fhAXLRk2vvoC2f3B09zVXn8CA5QIVfZOJ3BCsw2P0p/We" crossorigin="anonymous">
<title>Pet Locater</title>
</head>
<nav class="navbar navbar-expand-lg navbar-dark bg-dark p-2">
  <a class="navbar-brand m-2" href="/">
    	<img src="/imgs/logo.jpg" width = "40" height = "30" class="d-inline-block align-top" alt="">
  Pet Locater</a>
  <button class="navbar-toggler" type="button" data-toggle="collapse" data-target="#navbarText" aria-controls="navbarText" aria-expanded="false" aria-label="Toggle navigation">
    <span class="navbar-toggler-icon"></span>
  </button>
  <div class="collapse navbar-collapse" id="navbarText">
    <ul class="navbar-nav mr-auto">
      <li class="nav-item active">
        <a class="nav-link" href="/">Home </a>
      </li>
      <li class="nav-item">
        <a class="nav-link mr-2" href="/missing/pets">Missing Pets</a>
      </li>
       <li class="nav-item">
       <c:if test="${userId!=null}">
        <a class="nav-link" href="/dashboard">Your Dashboard</a>
        </c:if>
        </li>
        <li class="nav-item">
      <c:if test="${userName == null}">
        <a class="btn btn-secondary mr-2" href="/login">Login</a>
      </c:if>
      </li>
   		<li class="nav-item ">
      <c:if test="${userName == null}">
        <a class="btn btn-secondary" href="/register">Register</a>
      </c:if>
      </li>
        <li class="nav-item">
       <c:if test="${userId!=null}">
       <a class="btn btn-secondary" href="/logout" role="button">Logout</a>
        </c:if>
      </li>
    </ul>
    </div>
</nav>
<body>
<!-- <div class="container mt-3">
	 -->
	
	<jsp:doBody/>
	
	
	

 <script type="text/javascript" src="/js/script.js"></script>
</body> 

</html>