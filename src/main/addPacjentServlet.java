package main;

import java.io.IOException;
import java.io.PrintWriter;
import java.net.URLEncoder;
import java.sql.Connection;
import java.sql.SQLException;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.ServletRequest;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

public class addPacjentServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;

	public addPacjentServlet() {
		super();
		// TODO Auto-generated constructor stub
	}

	protected void doGet(HttpServletRequest request, HttpServletResponse response) {

	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		String nazwisko = request.getParameter("nazwisko");
		String imie = request.getParameter("imie");
		String pesel = request.getParameter("pesel");
		int n1 = new method.stringCheck().check(nazwisko);
		int i1 = new method.stringCheck().check(imie);
		int p1 = new method.peselCheck().check(pesel);
		if (n1 == 0 || i1 == 0) {
			
			request.setAttribute("message", "nazwisko");
			request.getRequestDispatcher("addPacjentWindow.jsp").forward(request, response);
		} else if (p1 == 0) {
			request.setAttribute("message", "pesel");
			request.getRequestDispatcher("addPacjentWindow.jsp").forward(request, response);
		} else {
			Connection connect = new method.DataBase().connection();
			try {
				int status = new method.DataBase().addPacjnet(nazwisko, imie, pesel);
				response.sendRedirect("ekg.jsp");
			} catch (SQLException e) {
				System.out.println(e);
				request.setAttribute("message", "error");
				request.getRequestDispatcher("addPacjentWindow.jsp").forward(request, response);
			}
		}
	}
}

