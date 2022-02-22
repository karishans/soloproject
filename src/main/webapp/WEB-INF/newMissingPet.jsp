<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form"%>
<%@ taglib prefix="t" tagdir="/WEB-INF/tags" %>
<t:partial>
<div class="container pt-3">
<div class=" d-flex justify-content-center mt-4">
	<div class="row border border-secondary p-4 rounded mb-4">
	<div class="col">
	<h4 class="mb-4">Add information about your missing pet ${pet.petName}: </h4>
	<form:form action="/missing/create" method="post" modelAttribute="newMissingPet">
	    <div class="row mt-2">
	    <div class="form-group mb-2 col-md-5">
	        <form:label path="lastseen">Date Last Seen:</form:label>
	        <form:errors class="text-danger" path="lastseen"/>
	        <form:input class="form-control" type="date" value="${now}" path="lastseen"/>
	    </div>
	    </div>
	     <div class="row mt-2">
		<div class="form-group mb-2 col-md-7">
		      <form:label path="city">City:</form:label>
		      <form:errors class="text-danger" path="city"/>
		      <form:input class="form-control" placeholder="City where pet was lost" path="city"/>
		  </div>
		  <div class="form-group mb-2 col-md-4">
		      <form:label path="state">State:</form:label>
		      <form:errors class="text-danger" path="state"/>
		      <form:select path="state" class="form-control">
		      <option value=""  selected disabled hidden>-----State-----</option>
		      <c:forEach items="${states}" var="state">
		        <option value="${state}">${state}</option>
		      </c:forEach>
		      </form:select>
		    </div>
		    </div>
		   
		   	<div class="row mt-2 mb-2">
		     <div class="form-group">
		        <form:label path="phone">Contact Phone Number:</form:label>
		        <form:errors class="text-danger" path="phone"/>
		        <form:input class="form-control" placeholder="555-555-5555" path="phone"/>
		    </div>
		    </div>
	
	   
	      <!-- Hidden Input for userId -->
	      <form:input type="hidden" value="${userId}" path="parent"/>
	   	  <!-- Hidden Input for pet id -->
	   		<form:input type="hidden" value="${petId}" path="pet"/>
	    <input type="submit" class="btn btn-primary mt-2" value="Submit"/>
	</form:form> 
	</div>
	</div>
	</div>
</div>
</t:partial>