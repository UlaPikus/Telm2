package method;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.SQLException;

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
	
	public static int selectByPesel(String pesel) throws IOException, SQLException {
		int pacjentStatus = 0;
		String p = pesel;
		String query = "SELECT * FROM pacjent.dane VALUES (NULL, '" + n + "', '" + i + "', '"+p+"');";
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
}
