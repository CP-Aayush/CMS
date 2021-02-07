<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form"%>
<%@ taglib prefix="security"
	uri="http://www.springframework.org/security/tags"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html>
<html>
<head>
<link rel="stylesheet"
	href="https://stackpath.bootstrapcdn.com/bootstrap/4.5.0/css/bootstrap.min.css">
<meta charset="ISO-8859-1">
<title>Assign Complaint</title>
</head>
<body>
	<div class="mainbox col-md-4 col-md-offset-2 col-sm-6 col-sm-offset-2 my-3">
		<form method="get" action="assignMgr">
			<div class="form-group col-xs-15">
			
			<div class="form-group">
					<input class="form-control" type="hidden" id="requestId" name="requestId"	value="${reqId}"/>
				</div>


				<label>Assign To</label> <select id="assignedTo" name="assignedTo"
					class="form-control">
					<c:forEach var="emp" items="${mgr}">
						<option>${emp.assignedTo}</option>
					</c:forEach>
				</select>
			</div>

			<div style="margin-top: 10px" class="form-group">
				<div class=" float-right controls">
					<button type="submit" class="btn btn-primary">Submit</button>
				</div>
			</div>

		</form>
	</div>
</body>
</html>