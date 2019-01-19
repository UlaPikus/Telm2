package main;

import java.io.IOException;
import java.io.PrintWriter;
import java.sql.Connection;
import java.sql.SQLException;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

/**
 * Servlet implementation class selectPacjentServlet
 */
public class selectPacjentServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public selectPacjentServlet() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		response.getWriter().append("Served at: ").append(request.getContextPath());
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		String out[] = new String[4];
		doGet(request, response);
		String pesel = request.getParameter("pesel");
		String imie = new String();
		String nazwisko = new String();
		int p1 = new method.peselCheck().check(pesel);
		if (p1 == 0) {
			request.setAttribute("message", "pesel");
			request.getRequestDispatcher("selectPacjentWindow.jsp").forward(request, response);
		}else {
			Connection connect = new method.DataBase().connection();
		try {
			out = new method.DataBase().selectByPesel(pesel);
			imie = out[3];
			nazwisko = out[2];
			request.setAttribute("imie", imie);
			request.setAttribute("nazwisko", nazwisko);
			request.setAttribute("pesel", pesel);
			request.getRequestDispatcher("ekg.jsp").forward(request, response);
		} catch (SQLException e) {
			System.out.println(e);
			request.setAttribute("message", "error");
			request.getRequestDispatcher("selectPacjentWindow.jsp").forward(request, response);
		}
	}
	}
}