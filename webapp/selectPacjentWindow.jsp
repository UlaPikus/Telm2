<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Szukaj pacjenta</title>

</head>
<body>
Wyszukiwanie pacjenta
<form method="POST" action="selectpac">
		Nazwisko  
        <input type="text" name="nazwisko" />
        <br>
        Imie 
        <input type="text" name="imie" />
        <br>
        ID
        <input type="number", name="id"/>
        <br>
        <input type="submit" name = "OK" />
        <button type="button" onClick="window.location='\start.jsp'"> Wroc </button>

</form>
</body>
</html>