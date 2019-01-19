package method;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;

import javax.swing.JOptionPane;

import java.io.IOException;

public class DataBase {

	public static Connection connection() throws IOException {
		try {
			Class.forName("com.mysql.cj.jdbc.Driver");
		} catch (ClassNotFoundException e) {
			e.printStackTrace();
		}
		Connection connection = null;
		try {
			connection = DriverManager.getConnection(
					"jdbc:mysql://localhost:3306/?useUnicode=true&useJDBCCompliantTimezoneShift=true&useLegacyDatetimeCode=false&serverTimezone=UTC",
					"root", "admin");

		} catch (SQLException e) {
			e.printStackTrace();
		}
		return connection;
	}

	public static int addPacjnet(String nazwisko, String imie, String pesel) throws IOException, SQLException {
		int pacjentStatus = 0;
		String n = nazwisko;
		String i = imie;
		String p = pesel;
		String query = "INSERT INTO pacjent.dane VALUES (NULL, '" + n + "', '" + i + "', '"+p+"');";
		Connection connect = DataBase.connection();
		if (connect != null) {
			try {
				PreparedStatement prepStm = connect.prepareStatement(query);
				prepStm.execute();
				pacjentStatus = 1;
			} catch (SQLException e) {
				System.out.print(e);
				pacjentStatus = -1;
			}
		}
		return pacjentStatus;
	}
	
	public static String[] selectByPesel(String pesel) throws IOException, SQLException {
		String out[] = new String[4]; 
		int pacjentStatus = 0;
		String p = pesel;
		String query = "SELECT * FROM pacjent.dane WHERE pesel = '" + p + "';";
		Connection connect = DataBase.connection();
		if (connect != null) {
			try {
				Statement stmt = connect.createStatement();
				ResultSet rs = stmt.executeQuery(query);
				pacjentStatus = 1;
				out[0] = Integer.toString(pacjentStatus);
				while (rs.next())
			      {
			        int id = rs.getInt("id");
			        String nazwisko = rs.getString("nazwisko");
			        String imie = rs.getString("imie");
			        // print the results
			        out[1] = Integer.toString(id);
			        out[2] = nazwisko;
			        out[3] = imie;
			      }
			      stmt.close();
			    }
			    catch (Exception e)
			    {
			      System.err.println("Got an exception! ");
			      System.err.println(e.getMessage());
			    }
			  }
		return out;
	}
}
