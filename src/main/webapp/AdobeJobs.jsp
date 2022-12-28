<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Adobe Jobs</title>
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

#jobs {
	font-family: Arial, Helvetica, sans-serif;
	border-collapse: collapse;
	width: 100%;
}

#jobs td, #jobs th {
	border: 1px solid #ddd;
	padding: 8px;
}

#jobs
					tr.experienced {
	background-color: #92a92d;
}

#jobs
					tr.unexperienced {
	background-color: #c5eb1d;
}

#jobs tr:hover {
	background-color: #ddd;
}

#jobs th {
	padding-top: 12px;
	padding-bottom: 12px;
	text-align: left;
	background-color: #aa0404;
	color: white;
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
		<a  href="JobList.jsp">Home</a> <a href="AddJob.jsp">Add Job</a> <a class="active" href="AdobeJobs.jsp">Adobe Jobs</a>
		<div class="search-container">
			<form action="SearchByTitle.jsp">
				<input type="text" placeholder="Search position title" name="search" />
				<button type="submit">Submit</button>
			</form>
		</div>
	</div>
	<table id="jobs">
		<tr>
			<th>Title</th>
			<th>Description</th>
			<th>Skills</th>
			<th>Education fields</th>
			<th>Experience</th>
			<th>Date</th>

		</tr>
	</table>
	<script>
    var rawFile = new XMLHttpRequest();
    rawFile.onreadystatechange = function ()
    {
        if(rawFile.readyState === 4)
        {
            if(rawFile.status === 200 || rawFile.status == 0)
            {
            }
        }
    }

    rawFile.open("GET", "jobs.xml", false);
    rawFile.send();
    var adobe = "Adobe";
    let path = "./jobs/node()[companies/company = '" + adobe + "']";
    let xml = new DOMParser().parseFromString(rawFile.responseText,"text/xml");
    let nodes = xml.evaluate(path, xml, null, XPathResult.ANY_TYPE, null);
    let result = nodes.iterateNext();
    var index = 0;
    var table = document.getElementById("jobs");
    while (result) {
    	if(result instanceof Element) {
    		 var position = index + 1;
    		 const row = document.createElement("tr");
		
    		for(let i = 0; i < result.childNodes.length; i++) {
    			switch (result.childNodes[i].nodeName) {
    			case "title":
    				var td = document.createElement("td");
    				td.appendChild(document.createTextNode(result.childNodes[i].childNodes[0].nodeValue));
    				row.appendChild(td);
    				break;
    			case "description":
    				td = document.createElement("td");
    				td.appendChild(document.createTextNode(result.childNodes[i].childNodes[0].nodeValue));
    				row.appendChild(td);
    				break;
    			case "experience":
    				td = document.createElement("td");
    				td.appendChild(document.createTextNode(result.childNodes[i].childNodes[0].nodeValue));
    				row.appendChild(td);
    				row.style.backgroundColor = (result.childNodes[i].childNodes[0].nodeValue) <= 2 ? "#FFFF00" : "#089000"
    				break;
    			case "skills":
    				var skills = "";
    				var node = result.childNodes[i]
    				td = document.createElement("td");
    				if (node instanceof Element) {
    					for(let j = 0; j < node.childNodes.length; j++) {
    						//skills += node.childNodes[j].childNodes[0].nodeValue;
    						switch (node.childNodes[j].nodeName) {
    						case "skill":
    							skills += node.childNodes[j].childNodes[0].nodeValue;
    							break;
    						}
    						skills += " "
    					}
    				}
    			
    				td.appendChild(document.createTextNode(skills));
    				row.appendChild(td);
    				break;	
    			case "educationFields":
    				var education = "";
    				node = result.childNodes[i]
    				td = document.createElement("td");
    				if (node instanceof Element) {
    					for(let j = 0; j < node.childNodes.length; j++) {
    						//skills += node.childNodes[j].childNodes[0].nodeValue;
    						switch (node.childNodes[j].nodeName) {
    						case "educationField":
    							education += node.childNodes[j].childNodes[0].nodeValue;
    							break;
    						}
    						education += " "
    					}
    				}
    			
    				td.appendChild(document.createTextNode(education));
    				row.appendChild(td);
    				break;	
    				
    			case "add_date":
    				var education = "";
    				node = result.childNodes[i]
    				td = document.createElement("td");
    				if (node instanceof Element) {
    					for(let j = 0; j < node.childNodes.length; j++) {
    						//skills += node.childNodes[j].childNodes[0].nodeValue;
    						switch (node.childNodes[j].nodeName) {
    						case "day": case "month": case "year":
    							education += node.childNodes[j].childNodes[0].nodeValue;
    							break;
    						}
    						education += "/"
    					}
    				}
    			
    				td.appendChild(document.createTextNode(education));
    				row.appendChild(td);
    				break;	
    			}
    			
    			
    			
    		}
    		 table.appendChild(row)
    	}
        result = nodes.iterateNext();
    }
        </script>
</body>
</html>