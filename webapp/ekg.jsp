
<!DOCTYPE html>
<html lang="pl">
<head>
</head>
<body>
<form action="addecg" method="post" enctype="multipart/form-data">
		<input type="text" name="description" /> 
		<input type="file" name="file" onClick="submit"/> 
		<input type="submit" />
			<center>
			<%
   			String sAction = (String) request.getAttribute("result");
   			if ( sAction != null && (sAction).equals("done")) { %>
			<img src="img/ekg.png" height="700" width="700">			<% } 
   			if ( sAction != null && (sAction).equals("error")) { %>
   			<img src="img/image.png" height="700" width="700">
			<% } 
			%>
			</center>
			<br>
			<br>
			<button type="button" onClick="window.location='\start.jsp'"> Wroc do startu </button>
			<br>
			<button type="button" onClick="window.location='\selectPacjentWindow.jsp'"> Zmien pacjenta </button>
			<%
   			String iAction = (String) request.getAttribute("message");
   			if ( iAction != null && (iAction).equals("error")) { %>
   			<script> alert("Nie wybrano pliku");</script>
   			<%}
   			%>
			</form>
</body>
</html>
