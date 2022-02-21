<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form"%>
<%@ taglib prefix="t" tagdir="/WEB-INF/tags" %>
<t:partial>
<div class="container">
<h4>Update missing information about ${pet.petName}: </h4>
	<form:form action="/missing/update/${oldmissingPet.id}" method="post" modelAttribute="editedPet">
	     <!-- Hidden Input for missingPetID -->
	      <form:input type="hidden" value="${oldmissingPet.id}" path="id"/>
	    <div class="form-group mb-2">
	        <form:label path="lastseen">Last Seen:</form:label>
	        <form:errors class="text-danger" path="lastseen"/>
	        <form:input class="form-control" type="date" value="${lastseen}" path="lastseen"/>
	    </div>
		<div class="form-group">
		      <form:label path="city">City:</form:label>
		      <form:errors class="text-danger" path="city"/>
		      <form:input class="form-control" path="city" value="${oldmissingPet.city}"/>
		  </div>
		  <div class="form-group">
		      <form:label path="state">State:</form:label>
		      <form:errors class="text-danger" path="state"/>
		      <form:select path="state" class="form-control">
		      <c:forEach items="${states}" var="state">
		      <c:choose>
		        		<c:when test="${state.equals(oldmissingPet.state)}">
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
		        <form:input class="form-control" path="phone" value="${oldmissingPet.phone}"/>
		    </div>
	
	   
	      <!-- Hidden Input for userId -->
	      <form:input type="hidden" value="${userId}" path="parent"/>
	   	  <!-- Hidden Input for pet id -->
	   		<form:input type="hidden" value="${petId}" path="pet"/>
	    <input type="submit" class="btn btn-primary mt-2" value="Submit"/>
	</form:form> 
</div>
</t:partial>