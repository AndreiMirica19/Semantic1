package jobs;


import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.xml.parsers.DocumentBuilder;
import javax.xml.parsers.DocumentBuilderFactory;
import javax.xml.transform.Transformer;
import javax.xml.transform.TransformerFactory;
import javax.xml.transform.dom.DOMSource;
import javax.xml.transform.stream.StreamResult;
import javax.xml.transform.stream.StreamSource;

import org.w3c.dom.Document;
import org.w3c.dom.Element;
import org.w3c.dom.NodeList;

/**
 * Servlet implementation class AddJob
 */
@WebServlet("/addJob")
public class AddJob extends HttpServlet {
	private static final long serialVersionUID = 1L;

	/**
	 * @see HttpServlet#HttpServlet()
	 */
	public AddJob() {
		super();
		// TODO Auto-generated constructor stub
	}

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		String title = request.getParameter("title");
		String description = request.getParameter("description");
		String experience = request.getParameter("experience");
		String[] skills = request.getParameter("skills").split("\n");
		String [] education = request.getParameter("education").split("\n");
		String [] date = request.getParameter("date").split("-");
		String [] companies = request.getParameter("companies").split("\n");
		if (title.isEmpty() || description.isEmpty() || skills.length == 0 || education.length == 0 || date.length == 0 || companies.length == 0) {
			System.out.print("Erorr");
			response.sendRedirect(request.getContextPath() + "/JobList.jsp");
			return;
		}
		try {
			DocumentBuilderFactory documentBuilderFactory = DocumentBuilderFactory.newInstance();
			DocumentBuilder documentBuilder = documentBuilderFactory.newDocumentBuilder();
			Document document = documentBuilder.parse(getServletContext().getRealPath("/") + "/jobs.xml");
			Element root = document.getDocumentElement();

			Element job = document.createElement("job");
			NodeList jobs = root.getElementsByTagName("job");

			Element titleNode = document.createElement("title");
			titleNode.appendChild(document.createTextNode(title));
			job.appendChild(titleNode);

			Element descriptionNode = document.createElement("description");
			descriptionNode.appendChild(document.createTextNode(description));
			job.appendChild(descriptionNode);

			Element skillsNode= document.createElement("skills");

			for (String skillValue : skills) {
				System.out.println(skillValue);
				Element skillElement = document.createElement("skill");
				skillElement.appendChild(document.createTextNode(skillValue.trim()));
				skillsNode.appendChild(skillElement);
			}
			job.appendChild(skillsNode);

			Element experienceNode = document.createElement("experience");
			experienceNode.appendChild(document.createTextNode(experience));
			job.appendChild(experienceNode);

			Element educationNode = document.createElement("educationFields");

			for (String educationValue : education) {
				Element educationElement = document.createElement("educationField");
				educationElement.appendChild(document.createTextNode(educationValue.trim()));
				educationNode.appendChild(educationElement);
			}
			job.appendChild(educationNode);
			
			Element companyNode = document.createElement("companies");

			for (String companyValue : companies) {
				Element companyElement = document.createElement("company");
				companyElement.appendChild(document.createTextNode(companyValue.trim()));
				companyNode.appendChild(companyElement);
			}
			job.appendChild(companyNode);
			
			Element dateNode = document.createElement("add_date");
			 Element day = document.createElement("day");
			 System.out.println(date[0]);
	          day.appendChild(document.createTextNode(date[0]));
	          dateNode.appendChild(day);

	           Element month = document.createElement("month");
	           month.appendChild(document.createTextNode(date[1]));
	           dateNode.appendChild(month);

	            Element year = document.createElement("year");
	            year.appendChild(document.createTextNode(date[2]));
	            dateNode.appendChild(year);
	            job.appendChild(dateNode);
	            root.appendChild(job);
	          
	            DOMSource source = new DOMSource(document);
	            TransformerFactory transformerFactory = TransformerFactory.newInstance();
	            Transformer transformer = transformerFactory.newTransformer(new StreamSource(getServletContext().getRealPath("/") + "/strip-space.xsl"));
	            StreamResult result = new StreamResult(getServletContext().getRealPath("/") + "/jobs.xml");
	            transformer.transform(source, result);
	            StreamResult localResult = new StreamResult("/Users/andreimirica/eclipse-workspace/SemanticWebDevoir1/src/main/webapp/jobs.xml");
	            transformer.transform(source, localResult);
		}catch (Exception e) {
			throw new RuntimeException(e);
		}
		response.sendRedirect(request.getContextPath() + "/JobList.jsp");


	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		doGet(request, response);
	}

}
