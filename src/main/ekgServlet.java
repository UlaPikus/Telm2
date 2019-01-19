package main;

import java.io.IOException;
import java.io.InputStream;
import java.nio.file.Paths;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.MultipartConfig;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.Part;

@MultipartConfig
public class ekgServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;

	public ekgServlet() {
		super();
	}

	protected void doGet(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {

	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		int result;
		String description = request.getParameter("description");
		String imie = request.getParameter("imie");
		String nazwisko = request.getParameter("nazwisko");
		String pesel = request.getParameter("pesel");
		try {
			Part filePart = request.getPart("file");
			String fileName = Paths.get(filePart.getSubmittedFileName()).getFileName().toString();
			InputStream fileContent = filePart.getInputStream();
			if (fileContent != null) {
				result = new method.datFileOpen().main(fileContent);
			} else {
				result = 0;
			}
			if (result == 1) {
				request.setAttribute("imie", imie);
				request.setAttribute("nazwisko", nazwisko);
				request.setAttribute("pesel", pesel);
				request.setAttribute("result", "done");
				request.getRequestDispatcher("ekg.jsp").forward(request, response);
			} else {
				request.setAttribute("result", "error");
				request.getRequestDispatcher("ekg.jsp").forward(request, response);

			}
		}catch (Exception e) {
			request.setAttribute("fileerror", "error");
			request.getRequestDispatcher("ekg.jsp").forward(request, response);

		}
	}

}
