<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">
<head>
<meta charset="UTF-8">
<title>Add job</title>
<style>
ul {
	list-style-type: none;
	margin: 0;
	padding: 0;
	overflow: hidden;
	background-color: #333;
}

li {
	float: left;
}

li a {
	display: block;
	color: white;
	text-align: center;
	padding: 14px 16px;
	text-decoration: none;
}

li a:hover:not(.active) {
	background-color: #111;
}

.active {
	background-color: #04AA6D;
}

* {
	box-sizing: border-box;
}

input[type=text], select, textarea {
	width: 100%;
	padding: 12px;
	border: 1px solid #ccc;
	border-radius: 4px;
	resize: vertical;
}

label {
	padding: 12px 12px 12px 0;
	display: inline-block;
}

submit {
	background-color: #04AA6D;
	color: white;
	padding: 12px 20px;
	border: none;
	border-radius: 4px;
	cursor: pointer;
	float: right;
}

.button {
	background-color: #4CAF50;
	border: none;
	color: white;
	padding: 15px 32px;
	text-align: center;
	text-decoration: none;
	width: 100%;
	display: inline-block;
	font-size: 16px;
	margin: 4px 2px;
	cursor: pointer;
	border-radius: 8px;
}

.col-25 {
	float: left;
	width: 25%;
	margin-top: 6px;
}

.col-75 {
	float: left;
	width: 75%;
	margin-top: 6px;
}

/* Clear floats after the columns */
.row:after {
	content: "";
	display: table;
	clear: both;
}

/* Responsive layout - when the screen is less than 600px wide, make the two columns stack on top of each other instead of next to each other */
@media screen and (max-width: 600px) {
	.col-25, .col-75, input[type=submit] {
		width: 100%;
		margin-top: 0;
	}
}
</style>
<style>
* {
	box-sizing: border-box;
}

body {
	margin: 0;
	font-family: Arial, Helvetica, sans-serif;
}

.topnav {
	overflow: hidden;
	background-color: #333;
}

.topnav a {
	float: left;
	display: block;
	color: white;
	text-align: center;
	padding: 14px 16px;
	text-decoration: none;
	font-size: 17px;
}

.topnav a:hover {
	background-color: #ddd;
	color: black;
}

.topnav a.active {
	background-color: #2196F3;
	color: white;
}

.topnav .search-container {
	float: right;
}

.topnav input[type=text] {
	padding: 6px;
	margin-top: 8px;
	font-size: 17px;
	border: none;
}

.topnav .search-container button {
	float: right;
	padding: 6px;
	margin-top: 8px;
	margin-right: 16px;
	background: #ddd;
	font-size: 17px;
	border: none;
	cursor: pointer;
}

.topnav .search-container button:hover {
	background: #ccc;
}

@media screen and (max-width: 600px) {
	.topnav .search-container {
		float: none;
	}
	.topnav a, .topnav input[type=text], .topnav
					.search-container button {
		float: none;
		display: block;
		text-align: left;
		width: 100%;
		margin: 0;
		padding: 14px;
	}
	.topnav input[type=text] {
		border: 1px solid #ccc;
	}
}
</style>
</head>
<body>
	<div class="topnav">
		<a href="JobList.jsp">Home</a> <a class="active" href="AddJob.jsp">Add
			Job</a> <a href="AdobeJobs.jsp">Adobe Jobs</a>
	</div>
	<br>
	<br>
	<form method="POST" action="${pageContext.request.contextPath}/addJob" align="center" class="form" id="form">
	<div class="container">
		<div class="row">
			<div class="col-25">
				<label for="title">Title</label>
			</div>
			<div class="col-75">
				<input type="text" id="title" name="title"
					placeholder="Title of the position">
			</div>
		</div>

		<div class="row">
			<div class="col-25">
				<label for="description">Description</label>
			</div>
			<div class="col-75">
				<textarea type="text" id="description" name="description"
					placeholder="Description of the position"></textarea>
			</div>
		</div>

		<div class="row">
			<div class="col-25">
				<label for="skills">Skills</label>
			</div>
			<div class="col-75">
				<textarea id="skills" name="skills" placeholder="Necessary skills"
					style="height: 200px"></textarea>
			</div>

		</div>
		<div class="row">
			<div class="col-25">
				<label for="education">Education Fields</label>
			</div>
			<div class="col-75">
				<textarea id="education" name="education"
					placeholder="Necessary education" style="height: 200px"></textarea>
			</div>
		</div>

		<div class="row">
			<div class="col-25">
				<label for="experience">Experience</label>
			</div>
			<div class="col-75">
				<input type="experience" id="experience" name="experience"
					placeholder="Years of experience">
			</div>
		</div>

		<div class="row">
			<div class="col-25">
				<label for="date">Add Date</label>
			</div>
			<div class="col-75">
				<input type="date" id="date" name="date">
			</div>
		</div>

		<div class="row">
			<div class="col-25">
				<label for="companies">Companies</label>
			</div>
			<div class="col-75">
				<textarea id="companies" name="companies"
					placeholder="Companies that have this position available"
					style="height: 200px"></textarea>
			</div>
		</div>

		<div class="row">
			<div class="col-75"></div>
			<div class="col-25">
				<button class="button" id="submit" onclick="submitPressed()">Add
					Job</button>
			</div>
		
			<br>
		</div>
		</form>
		<script>

		function submitPressed(){
			var title = document.getElementById("title").value;
			var description = document.getElementById("description").value;
			var skills = document.getElementById("skills").value;
			var education = document.getElementById("education").value;
			var companies = document.getElementById("companies").value;
			var experience = document.getElementById("experience").value;
			var submit = document.getElementById("submit");

			if (title == "" || description == "" || skills == "" || education == "" || companies == "" || experience == ""){
    			alert("Please fill out all fields");
			}
		}

</script>
</body>
</html>