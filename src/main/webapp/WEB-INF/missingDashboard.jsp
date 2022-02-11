<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form"%>
<%@ taglib prefix="t" tagdir="/WEB-INF/tags" %>
<t:partial>
<h3>Pets Reported Missing</h3>
	<h4>Find Missing Pets in your State:</h4>
	<p>Help missing pets in your state find their families again</p>
	<form method="get" action="/missing/state">
        	<div class="form-group">
           	 	<label for="state">State</label>
            	<select class="form-control" id="state" name="state">
            	<c:forEach items="${states}" var="state">
		        	<option value="${state}">${state}</option>
		        </c:forEach>
		        </select>
        	</div>
        	<input class="btn btn-primary mt-2 mb-2" type="submit" value="Search"/>
    	</form>   
	<c:forEach items="${missingPets}" var="missingpet">
				<ul>
					<li>Pet Name: <c:out value="${missingpet.pet.petName}" /></li>
					<li>Last Seen: <c:out value="${missingpet.getDateFormatted()}" /></li>
					<li>Where: <c:out value="${missingpet.city}, ${missingpet.state} " /></li>
					<li>Contact Information: <c:out value="${missingpet.phone}" /></li>
				</ul>
		</c:forEach>
</t:partial>