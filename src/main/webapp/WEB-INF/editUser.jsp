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
	    <h1>Update Your User Information</h1>
	    <form:form method="post" action="/user/update/${oldUser.id}" modelAttribute="editedUser">
	     <!-- Hidden Input for userId -->
	      <form:input type="hidden" value="${oldUser.id}" path="id"/>
	      <div class="form-group">
		        <form:label path="firstName">First Name:</form:label>
		        <form:errors class="text-danger" path="firstName"/>
		        <form:input class="form-control" path="firstName" value="${oldUser.firstName}"/>
		    </div>
		    <div class="form-group">
		        <form:label path="lastName">Last Name:</form:label>
		        <form:errors class="text-danger" path="lastName"/>
		         <form:input class="form-control" path="lastName" value="${oldUser.lastName}"/>
		    
		    </div>
		    <div class="form-group">
		        <form:label path="email">Email:</form:label>
		        <form:errors class="text-danger" path="email"/>
		        <form:input class="form-control" path="email" value="${oldUser.email}"/>
		    </div>
		     <div class="form-group">
		        <form:label path="address">Address:</form:label>
		        <form:errors class="text-danger" path="address"/>
		        <form:input class="form-control" path="address" value="${oldUser.address}"/>
		    </div>
		     <div class="form-group">
		        <form:label path="city">City:</form:label>
		        <form:errors class="text-danger" path="city"/>
		        <form:input class="form-control" path="city" value="${oldUser.city}"/>
		    </div>
		     <div class="form-group">
		        <form:label path="state">State:</form:label>
		        <form:errors class="text-danger" path="state"/> 
		        <form:select path="state" class="form-control">
		        <c:forEach items="${states}" var="state">
		        	 <c:choose>
		        		<c:when test="${state.equals(oldUser.state)}">
		        			<option selected value="${state}">${state}</option>
		        		</c:when>
		        		<c:otherwise>
		        			<option value="${state}">${state}</option>
		        		</c:otherwise>
		        	</c:choose>
		        </c:forEach>
		        </form:select>
		    </div>
		     <div class="form-group">
		        <form:label path="phone">Phone Number:</form:label>
		        <form:errors class="text-danger" path="phone"/>
		        <form:input class="form-control" path="phone" value="${oldUser.phone}"/>
		        
	       <%--  <form:input type="hidden" path="password"/> --%>
	        <input class="btn btn-primary" type="submit" value="Update"/>
	        
	    </form:form>
	    </div>
	 </div>
	 </div>
</div>
</t:partial>