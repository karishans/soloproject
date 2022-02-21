<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form"%>
<%@ taglib prefix="t" tagdir="/WEB-INF/tags" %>
<t:partial>
<div class="dashboard">
<div class="container pt-3">
<div class="text-success text-center">
 		<h6><c:out value="${message}"/></h6>
 		
		</div>
<div class="text-danger text-center">
		<h6><c:out value="${deletemessage}"/></h6>
		</div>
<h3>Welcome ${userName}</h3>
<!-- 	<a href="user/edit" class="btn btn-primary">Edit User Profile</a> -->
	<h3 class="mt-3">All Your Pets</h3>
		<a href="pets/new" class="btn btn-primary mb-3 mt-2">Add a pet</a>

<div class="container d-flex flex-wrap align-items-center">
	<div class="row">
	<c:forEach items="${user.petsOwned}" var="pet">
			<div class="col-sm-6">
			<div class="card text-center border-secondary bg-light mb-3 p-2" style="width: 18rem;">
  			<img class="card-img-top" src="${pet.petUrl}" alt="pet picture">
  			<div class="card-body">
   				 <h5 class="card-title"><c:out value="${pet.petName}" /></h5>
    			<form method="get" action="/dashboard/pet">
   				<input type="hidden" id="petName" name="petName" value="${pet.id}"/>
   				 <input class="btn btn-outline-primary" type="submit" value="View Profile"/>
   				 	<c:if test="${pet.missingpet == null}">
   				 	<a href="/missing/create/${pet.id}" class="btn btn-outline-danger mt-2">Report Missing</a>
   				 	</c:if>
   				 </form>
   				
  				</div>
  				</div>
			</div>
		</c:forEach>
		</div>
	</div>
</div>
</div>


</t:partial>