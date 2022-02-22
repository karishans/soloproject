<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form"%>
<%@ taglib prefix="t" tagdir="/WEB-INF/tags" %>
<t:partial>
<div class="container pt-3">
<div class=" d-flex justify-content-center mt-4">
	<div class="row p-4 mb-4">
	<h2 class="mb-4">Pets Reported Missing</h2>
	<h4>Find Missing Pets in your State:</h4>
	<p>Help missing pets in your state find their families again. Use the filter to search by state.</p>
	
	<form method="get" action="/missing/state">
	<div class="row">
        	<div class="form-group mb-2 col-md-3">
           	 	<label for="state">Choose a State to Search: </label>
            	<select class="form-control" id="state" name="state">
            	<option value=""  selected disabled hidden>---State---</option>
            	<c:forEach items="${states}" var="state">
		        	<option value="${state}">${state}</option>
		        </c:forEach>
		        </select>
		        <input class="btn btn-primary mt-2 mb-2" type="submit" value="Search"/>
        	</div>
     
        	</div>
    	</form>   
    	
	<c:forEach items="${missingPets}" var="missingpet">
		<div class="row border border-2 border-secondary rounded shadow-sm d-flex p-3 mt-3">
			<div class="row">
				<h4><c:out value="${missingpet.pet.petName} - Reported Missing on ${missingpet.getDateFormatted()} "/></h4>
				<h5><c:out value="Where: ${missingpet.city}, ${missingpet.state}"/></h5>
			</div>
			<div class="col-md-4">
				
				<img src="${missingpet.pet.petUrl}" alt="pet picture" style="width: 180px" class="img-thumbnail" >
				<c:if test="${missingpet.parent.id==userId}">
		
				<a href="/missing/delete/${missingpet.id}" class="btn btn-danger mt-2" onclick="return confirm('Are you sure you want to delete this item?');">Delete from Missing Pets</a>
			
				<a href="/missing/edit/${missingpet.id}" class="btn btn-primary mt-2">Edit Missing Details</a>
				</c:if>
				
			</div>
			<div class="col-md-5">
				
					<h6><strong>Breed: </strong><c:out value="${missingpet.pet.breed}" /></h6>
					<h6><strong>Gender: </strong><c:out value="${missingpet.pet.gender}" /></h6>
					<h6><strong>Size: </strong><c:out value="${missingpet.pet.size}" /></h6>
					<h6><strong>Birthday: </strong><c:out value="${missingpet.pet.getBirthdayFormatted()}" /></h6>
					<h6><strong>Description & Behavior: </strong><c:out value="${missingpet.pet.description}. ${missingpet.pet.behavior}"  /></h6>
					<h6><strong>Owner: </strong><c:out value="${missingpet.pet.owner.firstName} ${missingpet.pet.owner.lastName}" /></h6>
					<h5><strong>Contact Information: </strong><c:out value="${missingpet.phone}" /></h5>
				
			</div>
		
			
			<div class="col-md-3">
			<h5>If you think you have seen ${missingpet.pet.petName}, or want to make a comment. Go to ${missingpet.pet.petName}'s Profile</h5>
			<a href="/pets/${missingpet.pet.id}" class="btn btn-primary"><c:out value="${missingpet.pet.petName}'s Public Profile"/></a>
			</div>
		</div>
		</c:forEach>
</div>
</div>
</div>

</t:partial>