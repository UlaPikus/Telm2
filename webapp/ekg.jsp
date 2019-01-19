<!DOCTYPE HTML>
<html>
  <head>
    <style>
      body {
        margin: 0px;
        padding: 0px;
      }
    </style>
  </head>
  <body>
  	<form action="addecg" method="post" enctype="multipart/form-data">

		Imie <input type="text" name="imie" disabled="disabled"
			value="${imie}" /> <br> Nazwisko <input type="text"
			name="nazwisko" disabled="disabled" value="${nazwisko}" /> <br>
		Pesel <input type="text" name="pesel" disabled="disabled"
			value="${pesel}" /> <br> <input type="text" name="description" />
		<input type="file" name="file" /> <input type="submit" /> <br>
		<button type="button">Zapisz</button>
		<button type="button" onClick="window.location='\start.jsp'">
			Wroc do startu</button>
		<button type="button"
			onClick="window.location='\selectPacjentWindow.jsp'">Zmien
			pacjenta</button>
	<button type="button" >Otwórz istniejace badnia</button>
	<% String sAction = (String) request.getAttribute("result");
	if ( sAction != null && (sAction).equals("done")) { %>
    <canvas id="myCanvas" width="700" height="400" style="position: absolute; top: 20%; left: 1%; border: 2px solid;"></canvas>
    <script>
      var canvas = document.getElementById('myCanvas');
      var context = canvas.getContext('2d');
      var imageObj = new Image();
      imageObj.onload = function() {
        context.drawImage(imageObj, 0, 0, canvas.width, canvas.height);
      };
      imageObj.src = 'img/ekg.png?t'+new Date().getTime();
    </script>
     R <div style="position:absolute;top:15%;left:45%;width:10px;height:10px;background:green;" id="green" onclick="getPosition(e)"></div>
    
    <% } 
		if ( sAction != null && (sAction).equals("error")) { %>
		<img src="img/image.png" height="700" width="700">
	<% }
	String iAction = (String) request.getAttribute("fileerror");
		if ( iAction != null && (iAction).equals("error")) { %>
		<script> alert("Nie wybrano pliku");</script><%}%>
    </form>
  </body>
</html>