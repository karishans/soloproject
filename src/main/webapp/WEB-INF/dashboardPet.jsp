<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form"%>
<%@ taglib prefix="t" tagdir="/WEB-INF/tags" %>
<t:partial>
<h3>Welcome ${userName}</h3>
	<a href="/pets/new">Add a pet</a>
	<a href="/dashboard">All Pets</a>
	 <form method="get" action="/dashboard/pet">
	 	<div class="form-group">
	 	<label for="petName">Choose Pet</label>
	     <select id="petName" name="petName" class="form-control" onchange="this.form.submit()">
		        <option value="" disabled selected>My Pets</option>
		        <c:forEach items="${user.petsOwned}" var="pet">
		        	<option value="${pet.id}">${pet.petName}</option>
		        </c:forEach>
		 </select>
		 </div>
		 </form>
	
	<h4><c:out value="${pet.petName}'s Profile" /></h4>
	<img src="${pet.petUrl}" alt="pet picture" style="width: 180px" class="img-thumbnail" >
	<ul>
					
					<li><c:out value="${pet.species}" /></li>
					<li><c:out value="${pet.breed}" /></li>
					<li><c:out value="${pet.gender}" /></li>
					<li><c:out value="${pet.weight}" /></li>
					<li><c:out value="Born: ${pet.getBirthdayFormatted()}" /></li>
					<li><c:out value="Neutered: ${pet.neutered}" /></li>
				</ul>  
		<c:if test="${pet.missingpet == null}">
				<a href="/missing/create/${pet.id}" class="btn btn-danger">Report Missing</a>
		</c:if>
		<c:if test="${pet.missingpet != null}">
				<a href="/missing/edit/${pet.missingpet.id}" class="btn btn-danger">Edit Missing Details</a>
		</c:if>
					<!-- Check if event belongs to user -->
	<c:if test="${pet.owner.id==userId}">
		
			<a href="/pets/delete/${pet.id}" class="btn btn-danger" onclick="data-confirm('Are you sure you want to delete this item')"> Delete</a>
			
			<a href="/pets/edit/${pet.id}" class="btn btn-primary">Edit</a>
	</c:if>
		<a href="/pets/${pet.id}" class="btn btn-primary">Pet Public Profile</a>
		
		 <script src="<c:url value="/resources/js/script.js"/>"></script>

</t:partial>