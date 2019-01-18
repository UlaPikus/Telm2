
<!DOCTYPE html>
<html lang="pl">
<head>
</head>
<body>
<form action="addecg" method="post" enctype="multipart/form-data">

Imie <input type="text" name="imie" disabled="disabled" value="${imie}" />
<br>
Nazwisko <input type="text" name="nazwisko" disabled="disabled" value="${nazwisko}" />
<br>
Pesel <input type="text" name="pesel" disabled="disabled" value="${pesel}" />
<br>	
<input type="text" name="description" /> 
		<input type="file" name="file"/> 
		<input type="submit" />
		<br>
		<button type="button" > Otwórz istniejace badnia </button>
					<button type = "button"> Zapisz</button>
		
		<br>
			<br>
			<button type="button" onClick="window.location='\start.jsp'"> Wroc do startu </button>
			<br>
			<button type="button" onClick="window.location='\selectPacjentWindow.jsp'"> Zmien pacjenta </button>
			<center>
			<%
   			String sAction = (String) request.getAttribute("result");
   			if ( sAction != null && (sAction).equals("done")) { %>
			 <table><tr><td width="200" rowspan="1"><img src="img/ekg.png" width="600" height="600"></td></tr></table> 		
						<% } 
   			if ( sAction != null && (sAction).equals("error")) { %>
   			<img src="img/image.png" height="700" width="700">
			<% } 
			%>
			</center>
					<%
   			String iAction = (String) request.getAttribute("fileerror");
   			if ( iAction != null && (iAction).equals("error")) { %>
   			<script> alert("Nie wybrano pliku");</script>
   			<%}
   			%>
			</form>
</body>
</html>
