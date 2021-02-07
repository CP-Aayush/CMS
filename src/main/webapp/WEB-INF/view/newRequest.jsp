<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form"%>
<%@ taglib prefix="security"
	uri="http://www.springframework.org/security/tags"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>New Request</title>
<link rel="stylesheet"
	href="https://stackpath.bootstrapcdn.com/bootstrap/4.5.0/css/bootstrap.min.css">
</head>
<body class="mx-5 my-2">
	<div class="mainbox col-md-4 col-md-offset-2 col-sm-6 col-sm-offset-2">
		<h3>New Request</h3>

		<br>

		<c:set var="username">
					<security:authentication property="principal.username" />
				</c:set>
				<h3>${username}</h3>

		<form method="get" action="save" >
			<div class="form-group col-xs-15">
				

				<div class="form-group">
					<input class="form-control" type="hidden" id="requestBy" name="requestBy"	value="${username}"/>
				</div>
				
				<div class="form-group">
						<label for="sel1">Department</label>
						 <select id="department" name="department"
							class="form-control">
							<option>Administration</option>
							<option>IT Support</option>
							<option>Others</option>
						</select>
					</div>
					 <div class="form-group">
						<label for="sel1">Priority</label>
						 <select id="priority" name="priority"
							class="form-control">
							<option>High</option>
							<option>Medium</option>
							<option>Low</option>
						</select>
					</div>
					<div class="form-group">
						<label for="comment">Description</label>
						<textarea class="form-control" id="description" name="description" rows="3"></textarea>
					</div>
					<div class="form-group">
						<label for="usr">Attachment</label>
						 <input id="attachment" name="attachment"
 							type="text" class="form-control">
					</div>
					<div style="margin-top: 10px" class="form-group">
						<div class=" float-right controls">
							<button type="submit" class="btn btn-primary">Submit</button>
						</div>
					</div>
			</div>

		</form>
	</div>
</body>
</html>