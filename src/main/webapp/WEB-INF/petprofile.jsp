<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form"%>
<%@ taglib prefix="t" tagdir="/WEB-INF/tags" %>
<t:partial>
	<h4 class="text-info"><c:out value="${pet.petName}s Profile" /></h4>
	<p>Breed/Mix: <c:out value="${pet.breed}"/>
	<p>Birthday: <c:out value="${pet.getBirthdayFormatted()}" /></p>
	<p>Owner Name: <c:out value="${pet.owner.firstName} ${pet.owner.lastName}"/></p>
	<p>Owner Location: <c:out value="${pet.owner.city}, ${pet.owner.state}" /></p>
	<p>Owner Contact: <c:out value="${pet.owner.phone}"/></p>
	<p>Description: <c:out value="${pet.description}"/></p>
		<c:if test="${pet.missingpet != null}">
			<h5 class="text-danger">${pet.petName} Was Reported Missing in ${pet.missingpet.city}, ${pet.missingpet.state}</h5>
		</c:if>
		
		
	<h5>Comments</h5>
		
		<c:forEach items="${pet.messages}" var="message">	
			<c:if test="${message.author.id == userId}">
				<p><c:out value="You said: ${message.message}" /></p>
			</c:if>
			<c:if test="${message.author.id != userId}">
				<p><c:out value="${message.author.firstName} said: ${message.message}" /></p>	
			</c:if>			
		</c:forEach>
	
	<!-- Check if user is logged in to make comment -->
	<c:if test="${userId != null}">
	 <form action="/pets/${pet.id}/comment" method="post">
		 	<div class="form=group>">
		 		<label for="message"> Add Comment: </label>
		 		<span class=text-danger> ${error}</span>
		 		<textarea name="message" id="message" class="form-control"></textarea>
		 		<button class="btn btn-primary mt-2">Submit</button>
		 	</div>
		 </form>	
	</c:if>

</t:partial>