<!DOCTYPE HTML>
<html>
<head>
<style>
</style>
</head>
<script>
  window.onload = function()
{
	var canvas = document.getElementById('myCanvas');
	canvas.addEventListener('mousedown', drawCircle, false);
	}
function drawCircle(val){
	var canvas = document.getElementById('myCanvas');
	var ctx = canvas.getContext('2d');
	
	x = event.pageX;
	y = event.pageY;
	
	ctx.fillStyle = val;
	ctx.beginPath();
	ctx.arc(x-152,y-148,2,0,2*Math.PI);
	ctx.stroke();
	ctx.fill();
}
</script>
<body>
	<form action="addecg" method="post" enctype="multipart/form-data">

		Imie <input type="text" name="imie" readonly="readonly"
			value="${imie}" /> <br> 
		Nazwisko <input type="text"
			name="nazwisko" readonly="readonly"" value="${nazwisko}" /> <br>
		Pesel <input type="text" name="pesel" readonly="readonly"
			value="${pesel}" /> <br> <input type="text" name="description" />
		<input type="file" name="file" /> <input type="submit" /> <br>
		<button type="button" onClick="window.location='\start.jsp'">
			Wroc do startu</button>
		<button type="button"
			onClick="window.location='\selectPacjentWindow.jsp'">Zmien
			pacjenta</button>
		<button type="button">Otwórz istniejace badnia</button>
		<button type="button">Zapisz</button>

		<% String sAction = (String) request.getAttribute("result");
	if ( sAction != null && (sAction).equals("done")) { %>
		<canvas id="myCanvas" width="700" height="400"
			style="position: absolute; top: 20%; left: 10%; border: 2px solid;"></canvas>
		<script>
      var canvas = document.getElementById('myCanvas');
      var context = canvas.getContext('2d');
      var imageObj = new Image();
      imageObj.onload = function() {
        context.drawImage(imageObj, 0, 0, canvas.width, canvas.height);
      };
      imageObj.src = "http://localhost:8080/Telm2/img/ekg.png?timestamp=" + new Date().getTime();
    </script>
		<br> Q
		<button type=button
			style="position: absolute; top: 16%; left: 2%; width: 20px; height: 20px; background: green;"
			id="color" onClick="drawCircle('green')"></button>
		<br> <br> R
		<button type=button
			style="position: absolute; top: 21%; left: 2%; width: 20px; height: 20px; background: blue;"
			id="color" onClick="drawCircle('blue')"></button>
		<br> <br> S
		<button type=button
			style="position: absolute; top: 26%; left: 2%; width: 20px; height: 20px; background: red;"
			id="color" onClick="drawCircle('red')"></button>
		<br> <br> T
		<button type=button
			style="position: absolute; top: 31%; left: 2%; width: 20px; height: 20px; background: yellow;"
			id="color" onClick="drawCircle('yellow')"></button>
		<br> <br> P
		<button type=button
			style="position: absolute; top: 36%; left: 2%; width: 20px; height: 20px; background: orange;"
			id="color" onClick="drawCircle('orange')"></button>

		<% } 
		if ( sAction != null && (sAction).equals("error")) { %>
		<img src="img/image.png" height="700" width="700">
		<% }
	String iAction = (String) request.getAttribute("fileerror");
		if ( iAction != null && (iAction).equals("error")) { %>
		<script> alert("Nie wybrano pliku");</script>
		<%}%>
	</form>
</body>
</html>