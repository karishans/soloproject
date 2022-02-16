<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form"%>
<%@ taglib prefix="t" tagdir="/WEB-INF/tags" %>
<t:partial>
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
</t:partial>