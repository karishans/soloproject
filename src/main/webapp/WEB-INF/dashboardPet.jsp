<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form"%>
<%@ taglib prefix="t" tagdir="/WEB-INF/tags" %>
<t:partial>
<div class="profile">
<div class="container pt-4">
<nav class="navbar navbar-expand-lg navbar-light bg-light">
  <button class="navbar-toggler" type="button" data-toggle="collapse" data-target="#navbarNav" aria-controls="navbarNav" aria-expanded="false" aria-label="Toggle navigation">
    <span class="navbar-toggler-icon"></span>
  </button>
  <div class="collapse navbar-collapse" id="navbarNav">
    <ul class="navbar-nav">
      <li class="nav-item active">
        <a class="nav-link" href="/pets/new">Add Pet</a>
      </li>
      <li class="nav-item">
        <a class="nav-link" href="/dashboard">Show All Pets</a>
      </li>
       <li class="nav-item">
        <form method="get" action="/dashboard/pet">
	 	<div class="form-group">
	 <!-- 	<label for="petName"></label> -->
	     <select id="petName" name="petName" class="form-control" onchange="this.form.submit()">
		        <option value="" selected disabled hidden>My Pets</option>
		        <c:forEach items="${user.petsOwned}" var="pet">
		        	<option value="${pet.id}">${pet.petName}</option>
		        </c:forEach>
		 </select>
		 </div>
		 </form>
      </li>
    </ul>
  </div>
  </nav>
	

		
		<hr/>
		<div class="row border-2 border secondary rounded d-flex p-3 mt-3">
			<div class="row">
				<h2 class="mt-3 mb-3"><c:out value="${pet.petName}'s Profile" /></h2>
			</div>
			<div class="col-md-4 mb-3">
				<div>
					<img src="${pet.petUrl}" alt="pet picture" style="width: 250px" class="img-thumbnail" >
				</div>
			</div>
			<div id="info" class="col-md-5 border border-2 rounded p-3">
					<h5><strong>About ${pet.petName}</strong></h5>
					<h6><c:out value="${pet.species}" /></h6>
					<h6><c:out value="${pet.breed}" /></h6>
					<h6><c:out value="${pet.gender}" /></h6>
					<h6><c:out value="Weight: ${pet.weight} lbs"/></h6>
					<h6><c:out value="Born: ${pet.getBirthdayFormatted()}" /></h6>
					<h6><c:out value="Spayed/Neutered: ${pet.neutered}" /></h6>
					<h6><c:out value="Microchip: ${pet.microchip}" /></h6>
			 		<div class="mt-3">
			 		<c:if test="${pet.owner.id==userId}">
			 			<a href="/pets/edit/${pet.id}" class="btn btn-primary mb-2">Edit Details</a>
			 		</c:if>
					</div>
				</div>
			
		<div class="col-md-3 p-5">	
		<c:if test="${pet.missingpet == null}">
				<a href="/missing/create/${pet.id}" class="btn btn-danger mb-2">Report Missing</a>
		</c:if>
		<c:if test="${pet.missingpet != null}">
				<a href="/missing/edit/${pet.missingpet.id}" class="btn btn-danger mb-2">Edit Missing Pet Details</a>
		</c:if>
					<!-- Check if pet belongs to user -->
		<c:if test="${pet.owner.id==userId}">
		
			<a href="/pets/delete/${pet.id}" class="btn btn-danger mb-2" onclick="return confirm('Are you sure you want to delete this item?');"> Delete Pet Profile</a>
			

		</c:if>
		<a href="/pets/${pet.id}" class="btn btn-primary mb-2">Pet Public Profile</a>
		</div>
		</div>
	</div>
</div>
</t:partial>