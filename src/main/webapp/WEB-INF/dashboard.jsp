<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form"%>
<%@ taglib prefix="t" tagdir="/WEB-INF/tags" %>
<t:partial>
<h3>Welcome ${userName}</h3>
<h4>All Your Pets</h4>
	<a href="pets/new">Add a pet</a>


	<c:forEach items="${user.petsOwned}" var="pet">
			<div class="card" style="width: 18rem;">
  			<img class="card-img-top" src="/imgs/image0.jpeg" alt="Card image cap">
  			<div class="card-body">
   				 <h5 class="card-title"><c:out value="${pet.petName}" /></h5>
    			<form method="get" action="/dashboard/pet">
   				<input type="hidden" id="petName" name="petName" value="${pet.id}"/>
   				 <input class="btn btn-primary" type="submit" value="View/Edit Profile"/>
   				 	<a href="/missing/create/${pet.id}" class="btn btn-danger">Report Missing</a>
   				 </form>
  			</div>
			</div>
		</c:forEach>
		
		

</t:partial>