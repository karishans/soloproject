<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form"%>
<%@ taglib prefix="t" tagdir="/WEB-INF/tags" %>
<t:partial>
	<div>
    <div class="row custom-class">  
	    <div class="col-md-6 p-5">
    		<h1>Login</h1>
    		<form method="post" action="/loginUser">
    			<p class="text-danger">
    			<c:out value="${error}"/>
    			</p>
        	<div class="form-group">
           	 	<label type="email" for="email">Email</label>
            	<input class="form-control"  placeholder="Your e-mail" type="text" id="email" name="email"/>
        	</div>
       		 <div class="form-group mb-2">
           	 <label for="password">Password</label>
            	<input class="form-control" placeholder="password" type="password" id="password" name="password"/>
        	</div>
        	<input class="btn btn-primary mt-2 mb-2" type="submit" value="Login!"/>
    		</form>   
    	</div> 
  		
 
    
    	<div class="col-md-6 imagefade">
    		<h1 class="text-center mt-5">Pet Pack</h1>
    			<!-- <img  src="/imgs/goldenbackground.jpg" alt="pet picture" width="700px"> -->
    	</div>
    	</div>
 	</div>
</t:partial>