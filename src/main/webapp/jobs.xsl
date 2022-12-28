<?xml version="1.0" encoding="UTF-8"?>
<xsl:stylesheet version="1.0"
	xmlns:xsl="http://www.w3.org/1999/XSL/Transform">
	<xsl:strip-space elements="*" />
	<xsl:output indent="yes" />
	<xsl:template match="/">
		<html>
			<head>
				<meta charset="UTF-8" />
				<meta http-equiv="X-UA-Compatible" content="IE=edge" />
				<meta name="viewport"
					content="width=device-width, initial-scale=1.0" />
				<title>Semantic Web Project</title>
				<style>
					ul {
					list-style-type: none;
					margin: 0;
					padding: 0;
					overflow:
					hidden;
					background-color: #333;
					}

					li {
					float: left;
					}

					li a {
					display:
					block;
					color: white;
					text-align: center;
					padding: 14px 16px;
					text-decoration: none;
					}

					li a:hover:not(.active) {
					background-color:
					#111;
					}

					.active {
					background-color: #04AA6D;
					}

					#jobs {
					font-family:
					Arial, Helvetica, sans-serif;
					border-collapse: collapse;
					width: 100%;
					}

					#jobs td, #jobs th {
					border: 1px solid #ddd;
					padding: 8px;
					}

					#jobs
					tr.experienced{background-color: #92a92d;}
					#jobs
					tr.unexperienced{background-color: #c5eb1d;}

					#jobs tr:hover
					{background-color: #ddd;}

					#jobs th {
					padding-top: 12px;
					padding-bottom: 12px;
					text-align: left;
					background-color: #aa0404;
					color: white;
					}
				</style>
				<style>
					* {box-sizing: border-box;}

					body {
					margin: 0;
					font-family:
					Arial, Helvetica, sans-serif;
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
					margin-top:
					8px;
					font-size: 17px;
					border: none;
					}

					.topnav .search-container button
					{
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

					@media
					screen and (max-width: 600px) {
					.topnav .search-container {
					float:
					none;
					}
					.topnav a, .topnav input[type=text], .topnav
					.search-container button {
					float: none;
					display: block;
					text-align:
					left;
					width: 100%;
					margin: 0;
					padding: 14px;
					}
					.topnav input[type=text]
					{
					border: 1px solid #ccc;
					}
					}
				</style>
			</head>
			<body>
				<div class="topnav">
					<a class="active" href="#home">Home</a>
					<a href="AddJob.jsp">Add Job</a>
					<a href="AdobeJobs.jsp">Adobe Jobs</a>
					<div class="search-container">
						<form action="SearchByTitle.jsp">
							<input type="text" placeholder="Search position title"
								name="search" />
							<button type="submit">Submit</button>
						</form>
					</div>
				</div>
				<br>
				</br>
				<div>
					<form action="SearchByCategory.jsp">
						<select id="category" name="educationFields">
							<option value="Mobile Programming">Mobile Programming</option>
							<option value="Software Engineering">Software Engineering</option>
							<option value="Math">Math</option>
							<option value="Marketing">Marketing</option>
							<option value="POO">POO</option>
						</select>
						<input type="submit" value="Filter" />
					</form>
					<div class="search-container">
						<form action="SearchByNumberOfDays.jsp">
							<input type="text" placeholder="Number of days"
								name="numberOfDays" />
							<input type="submit" value="FilterDays" />
						</form>
					</div>

				</div>
				<table id="jobs">
					<thead>
						<tr>
							<th>Title</th>
							<th>Description</th>
							<th>Experience</th>
							<th>Skills</th>
							<th>Education fields</th>
							<th>Companies</th>
							<th>Date</th>

						</tr>
					</thead>
					<tbody>
						<xsl:for-each select="jobs/job">
							<xsl:if test="experience > 2">
								<form method="GET" action="search.jsp">
									<tr style="background-color: #089000">
										<td>
											<xsl:value-of select="title" />
										</td>
										<td>
											<xsl:value-of select="description" />
										</td>
										<td>
											<xsl:value-of select="experience" />
										</td>
										<td>
											<xsl:for-each select="skills/*">
												<!-- We put the semicolon before each child's name. That way, 
													if there are no children, we don't have an extraneous semicolon after the 
													parent's name. -->
												<xsl:text>  </xsl:text>
												<xsl:value-of select="current()" />
											</xsl:for-each>
										</td>
										<td>
											<xsl:for-each select="educationFields/*">
												<!-- We put the semicolon before each child's name. That way, 
													if there are no children, we don't have an extraneous semicolon after the 
													parent's name. -->
												<xsl:text>  </xsl:text>
												<xsl:value-of select="current()" />
											</xsl:for-each>
											
											
										</td>
										<td>
											<xsl:for-each select="companies/*">
												<!-- We put the semicolon before each child's name. That way, 
													if there are no children, we don't have an extraneous semicolon after the 
													parent's name. -->
												<xsl:text>  </xsl:text>
												<xsl:value-of select="current()" />
											</xsl:for-each>
										</td>
										<td>
											<xsl:value-of select="add_date/day" />
											/
											<xsl:value-of select="add_date/month" />
											/
											<xsl:value-of select="add_date/year" />
										</td>
									</tr>
								</form>
							</xsl:if>
							<xsl:if test="experience &lt;= 2">
								<form method="GET" action="search.jsp">
									<tr style="background-color: #FFFF00">
										<td>
											<xsl:value-of select="title" />
										</td>
										<td>
											<xsl:value-of select="description" />
										</td>
										<td>
											<xsl:value-of select="experience" />
										</td>
										<td>
											<xsl:for-each select="skills/*">
												<!-- We put the semicolon before each child's name. That way, 
													if there are no children, we don't have an extraneous semicolon after the 
													parent's name. -->
												<xsl:text>  </xsl:text>
												<xsl:value-of select="current()" />
											</xsl:for-each>
										</td>
										<td>
											<xsl:for-each select="educationFields/*">
												<!-- We put the semicolon before each child's name. That way, 
													if there are no children, we don't have an extraneous semicolon after the 
													parent's name. -->
												<xsl:text>  </xsl:text>
												<xsl:value-of select="current()" />
											</xsl:for-each>
											
											
										</td>
										<td>
											<xsl:for-each select="companies/*">
												<!-- We put the semicolon before each child's name. That way, 
													if there are no children, we don't have an extraneous semicolon after the 
													parent's name. -->
												<xsl:text>  </xsl:text>
												<xsl:value-of select="current()" />
											</xsl:for-each>
										</td>
										<td>
											<xsl:value-of select="add_date/day" />
											/
											<xsl:value-of select="add_date/month" />
											/
											<xsl:value-of select="add_date/year" />
										</td>
									</tr>
								</form>
							</xsl:if>
						</xsl:for-each>
					</tbody>
				</table>
			</body>
		</html>
	</xsl:template>
</xsl:stylesheet>