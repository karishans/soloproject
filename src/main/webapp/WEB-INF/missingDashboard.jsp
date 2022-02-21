<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form"%>
<%@ taglib prefix="t" tagdir="/WEB-INF/tags" %>
<t:partial>
<div class="container">
<h3>Pets Reported Missing</h3>
	<h4>Find Missing Pets in your State:</h4>
	<p>Help missing pets in your state find their families again</p>
	<form method="get" action="/missing/state">
        	<div class="form-group">
           	 	<label for="state">State</label>
            	<select class="form-control" id="state" name="state">
            	<option value=""  selected disabled hidden>Choose a State to Search</option>
            	<c:forEach items="${states}" var="state">
		        	<option value="${state}">${state}</option>
		        </c:forEach>
		        </select>
        	</div>
        	<input class="btn btn-primary mt-2 mb-2" type="submit" value="Search"/>
    	</form>   
	<c:forEach items="${missingPets}" var="missingpet">
				<div>
				<img src="${missingpet.pet.petUrl}" alt="pet picture" style="width: 180px" class="img-thumbnail" >
				</div>
				<ul>
					<li>Pet Name: <c:out value="${missingpet.pet.petName}" /></li>
					<li>Last Seen: <c:out value="${missingpet.getDateFormatted()}" /></li>
					<li>Where: <c:out value="${missingpet.city}, ${missingpet.state} " /></li>
					<li>Contact Information: <c:out value="${missingpet.phone}" /></li>
				</ul>
			<c:if test="${missingpet.parent.id==userId}">
		
			<a href="/missing/delete/${missingpet.id}" class="btn btn-danger">Delete from Missing Pets</a>
			
			<a href="/missing/edit/${missingpet.id}" class="btn btn-primary">Edit</a>
		</c:if>
			<h5>Go to Pet's Profile to make a comment</h5>
			<a href="/pets/${missingpet.pet.id}" class="btn btn-primary"><c:out value="${missingpet.pet.petName}'s Public Profile"/></a>
		</c:forEach>
</div>
</t:partial>