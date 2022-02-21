<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form"%>
<%@ taglib prefix="t" tagdir="/WEB-INF/tags" %>
<t:partial>
<div class="container">
	<div class="container mt-3">
    <div class="row">
	    <div class="col">
	    <h1>Register</h1>
	    <form:form method="POST" action="/registration" modelAttribute="user">
	      <div class="row">
	      <div class="form-group col-md-4">
		        <form:label path="firstName">First Name:</form:label>
		        <form:errors class="text-danger" path="firstName"/>
		        <form:input class="form-control" path="firstName"/>
		    </div>
		    <div class="form-group col-md-4">
		        <form:label path="lastName">Last Name:</form:label>
		        <form:errors class="text-danger" path="lastName"/>
		         <form:input class="form-control" path="lastName"/>
		    
		    </div>
		    </div>
		     <div class="row">
		    <div class="form-group col-md-8">
		        <form:label path="email">Email:</form:label>
		        <form:errors class="text-danger" path="email"/>
		        <form:input class="form-control" placeholder="Email" path="email"/>
		    </div>
		    </div>
		    <div class="row">
		     <div class="form-group col-md-8">
		        <form:label path="address">Address:</form:label>
		        <form:errors class="text-danger" path="address"/>
		        <form:input class="form-control" placeholder="1234 Main St" path="address"/>
		    </div>
		    </div>
		    <div class="row">
		     <div class="form-group col-md-6">
		        <form:label path="city">City:</form:label>
		        <form:errors class="text-danger" path="city"/>
		        <form:input class="form-control" path="city"/>
		    </div>
		     <div class="form-group col-md-2">
		        <form:label path="state">State:</form:label>
		        <form:errors class="text-danger" path="state"/>
		        <form:select path="state" class="form-control">
		        <c:forEach items="${states}" var="state">
		        	<option value="${state}">${state}</option>
		        </c:forEach>
		        </form:select>
		    </div>
		    </div>
		      <div class=row>
		     <div class="form-group col-md-4">
		        <form:label path="phone">Phone Number:</form:label>
		        <form:errors class="text-danger" path="phone"/>
		        <form:input class="form-control" placeholder="555-555-5555" path="phone"/>
		    </div>
		    </div>
		    <div class=row>
	      	<div class="form-group col-md-4">
	            <form:label path="password">Password:</form:label>
	            <form:errors class="text-danger" path="password"/>
	            <form:password class="form-control" path="password"/>
	            
	        </div>
	         <div class="form-group col-md-4 mb-2">
	            <form:label path="passwordConfirmation">Password Confirmation:</form:label>
	 			<form:errors class="text-danger" path="passwordConfirmation"/>
	            <form:password class="form-control" path="passwordConfirmation"/>
	        </div>
	        </div>
	        <input class="btn btn-primary mt-2" type="submit" value="Register"/>
	        
	    </form:form>
	    </div>
	 </div>
	 </div>
</div>
</t:partial>