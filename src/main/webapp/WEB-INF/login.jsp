<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form"%>
<%@ page isErrorPage="true"%>
<!DOCTYPE html>
<html>
<head>
	<meta charset="UTF-8">
	<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.1.0/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-KyZXEAg3QhqLMpG8r+8fhAXLRk2vvoC2f3B09zVXn8CA5QIVfZOJ3BCsw2P0p/We" crossorigin="anonymous">
	<title>Login Page</title>
</head>
<body>
	<div class="container mt-3">
    <div class="row">  
	    <div class="col">
    		<h1>Login</h1>
    		<form method="post" action="/loginUser">
    			<p class="text-danger">
    			<c:out value="${error}"/>
    			</p>
        	<div class="form-group">
           	 	<label type="email" for="email">Email</label>
            	<input class="form-control"  type="text" id="email" name="email"/>
        	</div>
       		 <div class="form-group mb-2">
           	 <label for="password">Password</label>
            	<input class="form-control"  type="password" id="password" name="password"/>
        	</div>
        	<input class="btn btn-primary" type="submit" value="Login!"/>
    		</form>   
    		</div> 
    	</div>
    </div>
</body>
</html>