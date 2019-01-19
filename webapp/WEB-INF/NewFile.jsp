
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
			<canvas id="viewport" width="700" height="300" style= "border : 1px solid #d3d3d3;"></canvas>
			<% String sAction = (String) request.getAttribute("result");
			if ( sAction != null && (sAction).equals("done")) { %>
			<img id = "ekg" src="img/ekg.png" height="700" width="700">
			<script>
			window.onload = function(){
				var c = document.getElementById("viewport");
				var ctx = c.getContent("2d");
				var img = document.getElementById("ekg");
				ctx.drawImage(img);}
			</script>
			<%} 
   			if ( sAction != null && (sAction).equals("error")) { %>
   			<img src="img/image.png" height="700" width="700">
			<% }
			String iAction = (String) request.getAttribute("fileerror");
   			if ( iAction != null && (iAction).equals("error")) { %>
   			<script> alert("Nie wybrano pliku");</script><%}%>
			</form>
</body>
</html>
