<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form"%>
<%@ taglib prefix="t" tagdir="/WEB-INF/tags" %>
<t:partial>
<div class="dogcat">
<div class="container pt-4">
	<div class="row border-2 border secondary rounded d-flex p-3 mt-3">
		<div class="row">
			<h4 class="mt-3 mb-3"><c:out value="${pet.petName}'s Profile" /></h4>
		</div>
		<hr/>
		<div class="col-md-4 mb-3 mt-3">
			<img src="${pet.petUrl}" alt="pet picture" style="width: 250px" class="img-thumbnail" >
		</div>
		<div id="info" class="col-md-5 border border-2 rounded p-3 mt-3">
			<p>Breed/Mix: <c:out value="${pet.breed}"/>
			<p>Birthday: <c:out value="${pet.getBirthdayFormatted()}" /></p>
			<p>Owner Name: <c:out value="${pet.owner.firstName} ${pet.owner.lastName}"/></p>
			<p>Owner Location: <c:out value="${pet.owner.city}, ${pet.owner.state}" /></p>
			<p>Owner Contact: <c:out value="${pet.owner.phone}"/></p>
			<p>Description: <c:out value="${pet.description}"/></p>
			<c:if test="${pet.missingpet != null}">
				<h5 class="text-danger">${pet.petName} Was Reported Missing in ${pet.missingpet.city}, ${pet.missingpet.state}</h5>
			</c:if>
		</div>
		</div>
		<div>
		<div class="row d-flex ">
		<h5 class="mt-3 mb-3"><strong>Comments:</strong></h5>
		<div id ="clear" class="col-md-8 mb-3">
			
		<c:forEach items="${pet.messages}" var="message">	
			<c:if test="${message.author.id == userId}">
				<div class="row d-flex align-items-center">
					<div class="row">
					<p class="mt-2"><strong><c:out value="You said: " /></strong></p>
					</div>
					<div class="col-md-7">
						<p class="mt-2"><c:out value="${message.message}"/></p> 
					</div>
					<div class="col-md-2">
						<a href="/message/delete/${message.id}/${pet.id}" class="text-danger" onclick="return confirm('Are you sure you want to delete this message?');">Delete</a>
			
					</div>
				
				</div>
				<hr/>
			</c:if>
			<c:if test="${message.author.id != userId}">
				<p class="mt-2"><strong><c:out value="${message.author.firstName} said: "/></strong></p>
				<p class="mt-2"><c:out value="${message.message}"/>	
					<hr/>
			</c:if>			
		</c:forEach>
		
			</div>
		</div>
		</div>
	<!-- Check if user is logged in to make comment -->
	<div class="row d-flex ">
	<div class="col-md-6 mb-3">
	<c:if test="${userId != null}">
	 <form action="/pets/${pet.id}/comment" method="post">
		 	<div class="form-group>">
		 		<label class="mb-3" for="message"> <strong>Add Comment: </strong></label>
		 		<span class=text-danger> ${error}</span>
		 		<textarea name="message" id="message" class="form-control"></textarea>
		 		<button class="btn btn-primary mt-2 mb-3">Submit</button>
		 	</div>
		 </form>	
	</c:if>
	</div>
	</div>
</div>
</div>
</t:partial>