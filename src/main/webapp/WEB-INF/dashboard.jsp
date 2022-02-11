<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form"%>
<%@ taglib prefix="t" tagdir="/WEB-INF/tags" %>
<t:partial>
<h3>Welcome ${userName}</h3>
	<a href="pets/new">Add a pet</a>
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

	<c:forEach items="${user.petsOwned}" var="pet">
			<div class="card" style="width: 18rem;">
  			<img class="card-img-top" src="/imgs/rocky.jpg" alt="Card image cap">
  			<div class="card-body">
   				 <h5 class="card-title"><c:out value="${pet.petName}" /></h5>
    				
   				 <a href="#" class="btn btn-primary">Go somewhere</a>
  			</div>
  			</div>
				<ul>
					<li>About <a href="/pets/${pet.id}"> <c:out
								value="${pet.petName}" />
					</a></li>
					<li><c:out value="${pet.species}" /></li>
					<li><c:out value="${pet.breed}" /></li>
					<li><c:out value="${pet.gender}" /></li>
					<li><c:out value="${pet.weight}" /></li>
					<li><c:out value="Born: ${pet.getBirthdayFormatted()}" /></li>
					<li><c:out value="Neutered: ${pet.neutered}" /></li>
				</ul>
				<a href="/missing/create/${pet.id}" class="btn btn-danger">Report Missing</a>
		</c:forEach>
		
		<div class="card" style="width: 18rem;">
  			<img class="card-img-top" src="..." alt="Card image cap">
  			<div class="card-body">
   				 <h5 class="card-title"><c:out value="${pet.petName}" /></h5>
    				
   				 <a href="#" class="btn btn-primary">Go somewhere</a>
  		</div>
</div>
</t:partial>