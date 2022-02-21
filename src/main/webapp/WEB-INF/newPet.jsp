<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form"%>
<%@ taglib prefix="t" tagdir="/WEB-INF/tags" %>
<t:partial>
<div class="container">
<h3>Welcome ${userName}</h3>
<h4>Add a pet: </h4>
	<form:form action="/pets/create" method="post" modelAttribute="newPet" enctype="multipart/form-data">
	    <div class="form-group">
	        <form:label path="petName">Pet Name:</form:label>
	        <form:errors class="text-danger" path="petName"/>
	        <form:input class="form-control" path="petName"/>
	    </div>
	      <div class="form-group mb-2">
	        <form:label path="species">Species:</form:label>
	        <form:errors class="text-danger" path="species"/>
	         <form:select class="form-control" path="species">
	        	<option value="dog">dog</option>
	        	<option value="cat">cat</option>
	        </form:select>
	    </div>
	        <div class="form-group mb-2">
	        <form:label path="breed">Breed:</form:label>
	        <form:errors class="text-danger" path="breed"/>
	        <form:input class="form-control" path="breed"/>
	    </div>
	     <div class="form-group mb-2">
	        <form:label path="gender">Gender:</form:label>
	        <form:errors class="text-danger" path="gender"/>
	        <form:select class="form-control" path="gender">
	        	<option value="male">male</option>
	        	<option value="female">female</option>
	        </form:select>
	    </div>
	    <div class="form-group">
	    <br />
	    	<form:label path="petUrl"> Pet Image</form:label>
	    		<input type="file" name="pic" id="fileToUpload">
	    </div>
	     <div class="form-group mb-2">
	        <form:label path="weight">Weight (lbs):</form:label>
	        <form:errors class="text-danger" path="weight"/>
	        <form:input class="form-control" type="number" path="weight"/>
	    </div>
	    <div class="form-group mb-2">
	        <form:label path="birthday">Birthday:</form:label>
	        <form:errors class="text-danger" path="birthday"/>
	        <form:input class="form-control" type="date" value="${now}" path="birthday"/>
	    </div>
	      <div class="form-group mb-2">
	        <form:label path="color">Color:</form:label>
	        <form:errors class="text-danger" path="color"/>
	        <form:input class="form-control" path="color"/>
	    </div>
	     <div class="form-group mb-2">
	        <form:label path="size">Size:</form:label>
	        <form:errors class="text-danger" path="size"/>
	        <form:input class="form-control" path="size"/>
	    </div>
	    <div class="form-group mb-2">
	        <form:label path="neutered">Spayed/Neutered:</form:label>
	        <form:errors class="text-danger" path="neutered"/>
	         <form:select class="form-control" path="neutered">
	        	<option value="yes">yes</option>
	        	<option value="no">no</option>
	        	<option value=unknown>unknown</option>
	        </form:select>
	    </div>
	     <div class="form-group mb-2">
	        <form:label path="microchip">Microchip:</form:label>
	        <form:errors class="text-danger" path="microchip"/>
	        <form:input class="form-control" type="number" path="microchip"/>
	    </div>
	     <div class="form-group mb-2">
	        <form:label path="description">Description:</form:label>
	        <form:errors class="text-danger" path="description"/>
	        <form:input class="form-control" path="description"/>
	    </div>
	     <div class="form-group mb-2">
	        <form:label path="behavior">Behavior:</form:label>
	        <form:errors class="text-danger" path="behavior"/>
	        <form:input class="form-control" path="behavior"/>
	    </div>
	   
	      <!-- Hidden Input for userId -->
	      <form:input type="hidden" value="${userId}" path="owner"/>
	   
	    <input type="submit" class="btn btn-primary mt-2" value="Submit"/>
	</form:form> 
	</div>
</t:partial>