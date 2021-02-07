<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form"%>
<%@ taglib prefix="security"
	uri="http://www.springframework.org/security/tags"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>

<html>

<head>
<title>User Dashboard</title>

<style type="text/css">
.fade:not(.show) {
    opacity: 1;
}

</style>
<link rel="stylesheet"
	href="https://stackpath.bootstrapcdn.com/bootstrap/4.5.0/css/bootstrap.min.css">
<link
	href="//netdna.bootstrapcdn.com/bootstrap/3.0.0/css/bootstrap-glyphicons.css"
	rel="stylesheet">

<script
	src="https://ajax.googleapis.com/ajax/libs/jquery/3.2.0/jquery.min.js"></script>

<script
	src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/js/bootstrap.min.js"></script>

</head>
<header>
	<div class="d-flex border">
		<img class="mr-auto p-2" alt="logo"
			src="https://www.contata.com/wp-content/uploads/2013/04/Logo1.png">
		<h2 class="p-2">
			<security:authentication property="principal.username" />
			<a href="${pageContext.request.contextPath}/logout"> <span
				class="glyphicon glyphicon-log-out"></span></a>
		</h2>
	</div>

</header>
<body class="modal-open">

	<script type="text/javascript">
		$(document).ready(function() {
			console.log("inside jquery");
			$('#dtBasicExample').DataTable({
				"paging" : "simple" // false to disable pagination (or any other option)
			});
			$('.dataTables_length').addClass('bs-select');
		});
	</script>

	<div class="mx-5 my-5">



		<security:authorize access="hasRole('ADMIN')">
		
			 <!-- Modal -->
			<!-- <div class="modal fade" id="myModal" tabindex="-1"
				role="dialog" aria-labelledby="exampleModalCenterTitle"
				aria-hidden="true">
				<div class="modal-dialog modal-dialog-centered" role="document">
					<div class="modal-content">
						<div class="modal-header">
							<h5 class="modal-title" id="exampleModalLongTitle">Modal
								title</h5>
							<button type="button" class="close" data-dismiss="modal"
								aria-label="Close">
								<span aria-hidden="true">&times;</span>
							</button>
						</div>
						<div class="modal-body">...</div>
						<div class="modal-footer">
							<button type="button" class="btn btn-secondary"
								data-dismiss="modal">Close</button>
							<button type="button" class="btn btn-primary">Save
								changes</button>
						</div>
					</div>
				</div>
			</div> -->
			
			
			<h2>Dashboard</h2>
			<table id="dtBasicExample" class="table  table-bordered  table-hover"
				cellspacing="0" width="100%">
				<tr>
					<th scope="col">Request ID</th>
					<th scope="col">Request Date</th>
					<th scope="col">Requested By</th>
					<th scope="col">Description</th>
					<th scope="col">Attachment</th>
					<th scope="col">Department</th>
					<th scope="col">Status</th>
					<th scope="col">Priority</th>
					<th scope="col">Assigned To</th>
					<th scope="col">Actions</th>
				</tr>

				<c:forEach var="emp" items="${list}">
					<tr>
						<td scope="row">${emp.requestId}</td>
						<td>${emp.requestDate}</td>
						<td>${emp.requestBy}</td>
						<td>${emp.description}</td>
						<td><a href=${emp.attachment}>Attachment</a></td>
						<td>${emp.department}</td>
						<td>${emp.status}</td>
						<td>${emp.priority}</td>
						<td>${emp.assignedTo}</td>
						<td><a href="editOpen/${emp.requestId}">Re-open</a>
						<a href="editClose/${emp.requestId}">Closed</a>
						<a href="assignManager/${emp.requestId}">Assign</a></td>
					</tr>
				</c:forEach>
			</table>
			<br />


		</security:authorize>

		<security:authorize access="hasRole('MANAGER')">

			<h2>Assigned to me</h2>

			<table id="dtBasicExample" class="table  table-bordered  table-hover"
				cellspacing="0" width="100%">
				<tr>
					<th scope="col">Request ID</th>
					<th scope="col">Request Date</th>
					<th scope="col">Requested By</th>
					<th scope="col">Description</th>
					<th scope="col">Attachment</th>
					<th scope="col">Department</th>
					<th scope="col">Status</th>
					<th scope="col">Priority</th>
					<th scope="col">Actions</th>
				</tr>

				<c:forEach var="emp" items="${assignedToMe}">
					<tr>
						<td scope="row">${emp.requestId}</td>
						<td>${emp.requestDate}</td>
						<td>${emp.requestBy}</td>
						<td>${emp.description}</td>
						<td><a href=${emp.attachment}>Attachment</a></td>
						<td>${emp.department}</td>
						<td>${emp.status}</td>
						<td>${emp.priority}</td>
						<td><a href="editOpen/${emp.requestId}">Re-open</a> <a
							href="editClose/${emp.requestId}">Closed</a></td>
					</tr>
				</c:forEach>
			</table>

		</security:authorize>

		<security:authorize access="hasRole('EMPLOYEE')">


			<h2>My Requests</h2>

			<table class="table  table-bordered  table-hover" cellspacing="0"
				width="100%">
				<tr>
					<th>Request ID</th>
					<th>Request Date</th>
					<th>Description</th>
					<th>Attachment</th>
					<th>Department</th>
					<th>Status</th>
					<th>Priority</th>
				</tr>

				<c:forEach var="emp" items="${myList}">
					<tr>
						<td>${emp.requestId}</td>
						<td>${emp.requestDate}</td>
						<td>${emp.description}</td>
						<td><a href=${emp.attachment}>Attachment</a></td>
						<td>${emp.department}</td>
						<td>${emp.status}</td>
						<td>${emp.priority}</td>
					</tr>
				</c:forEach>
			</table>


			<a href="${pageContext.request.contextPath}/newRequest">+ New
				Request</a>
		</security:authorize>
	</div>
	<script type="text/javascript"
		src="http://maxcdn.bootstrapcdn.com/bootstrap/3.3.6/js/bootstrap.min.js"></script>
</body>

</html>









