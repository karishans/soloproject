<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form"%>
<%@ taglib prefix="t" tagdir="/WEB-INF/tags" %>
<t:partial>
<div class="profile">
<div class="container pt-3">
<h3>Welcome ${userName}</h3>
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
	
	<div class="container bcontent">
	<h4 class="mt-3"><c:out value="${pet.petName}'s Profile" /></h4>
	<hr/>
	<div class="card mb-3" style="width:500px;">
	<div class= "row no-gutters">
	<div class="col-sm-5">
		<img src="${pet.petUrl}" alt="pet picture" style="width: 180px" class="card-img m-3" >
	</div>
	<div class="col-sm-7">
		<div class="card-body">
			<h5 class=card-title><c:out value="About ${pet.petName}"/></h5>
		<ul class = "card-text">
					<li><c:out value="${pet.species}" /></li>
					<li><c:out value="${pet.breed}" /></li>
					<li><c:out value="${pet.gender}" /></li>
					<li><c:out value="Weight: ${pet.weight} lbs"/></li>
					<li><c:out value="Born: ${pet.getBirthdayFormatted()}" /></li>
					<li><c:out value="Spayed/Neutered: ${pet.neutered}" /></li>
				</ul>  
			</div>
			</div>
			</div>
		
			</div>
			
		<c:if test="${pet.missingpet == null}">
				<a href="/missing/create/${pet.id}" class="btn btn-danger">Report Missing</a>
		</c:if>
		<c:if test="${pet.missingpet != null}">
				<a href="/missing/edit/${pet.missingpet.id}" class="btn btn-danger">Edit Missing Pet Details</a>
		</c:if>
					<!-- Check if event belongs to user -->
	<c:if test="${pet.owner.id==userId}">
		
			<a href="/pets/delete/${pet.id}" class="btn btn-danger" onclick="data-confirm('Are you sure you want to delete this item')"> Delete Pet Profile</a>
			
			<a href="/pets/edit/${pet.id}" class="btn btn-primary">Edit</a>
	</c:if>
		<a href="/pets/${pet.id}" class="btn btn-primary">Pet Public Profile</a>
		
		</div>
</div>
</div>
</t:partial>