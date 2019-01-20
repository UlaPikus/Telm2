
<!DOCTYPE html>
<html lang="pl">
<head>
	<title>Strona EKG</title>
	<meta charset="UTF-8">
	<meta name="viewport" content="width=device-width, initial-scale=1">
<!--===============================================================================================-->	
	<link rel="icon" type="image/png" href="images/icons/favicon.ico"/>
<!--===============================================================================================-->
	<link rel="stylesheet" type="text/css" href="vendor/bootstrap/css/bootstrap.min.css">
<!--===============================================================================================-->
	<link rel="stylesheet" type="text/css" href="fonts/font-awesome-4.7.0/css/font-awesome.min.css">
<!--===============================================================================================-->
	<link rel="stylesheet" type="text/css" href="fonts/Linearicons-Free-v1.0.0/icon-font.min.css">
<!--===============================================================================================-->
	<link rel="stylesheet" type="text/css" href="vendor/animate/animate.css">
<!--===============================================================================================-->	
	<link rel="stylesheet" type="text/css" href="vendor/css-hamburgers/hamburgers.min.css">
<!--===============================================================================================-->
	<link rel="stylesheet" type="text/css" href="vendor/animsition/css/animsition.min.css">
<!--===============================================================================================-->
	<link rel="stylesheet" type="text/css" href="vendor/select2/select2.min.css">
<!--===============================================================================================-->	
	<link rel="stylesheet" type="text/css" href="vendor/daterangepicker/daterangepicker.css">
<!--===============================================================================================-->
	<link rel="stylesheet" type="text/css" href="css/util.css">
	<link rel="stylesheet" type="text/css" href="css/main.css">
<!--===============================================================================================-->
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
	ctx.arc(x-408,y-870,2,0,2*Math.PI);
	ctx.stroke();
	ctx.fill();
}
</script>
<body>
	
	<div class="limiter">
		<div class="container-login100">
			<div class="wrap-login100 p-l-55 p-r-55 p-t-65 p-b-50">
				<form action="addecg" method="post" enctype="multipart/form-data">
					<span class="login100-form-title p-b-33">
						Plik EKG. <br><br>
						
					Dane pacjenta	
					</span>

					<div class="wrap-input100">
					Nazwisko:
						<input class="input100" type="text" name="nazwisko" readonly="readonly" value="${nazwisko}" />
						<span class="focus-input100-1"></span>
						<span class="focus-input100-2"></span>
					</div>

					<div class="wrap-input100">
					Imie:
						<input class="input100" type="text" name="imie" readonly="readonly" value="${imie}">
						<span class="focus-input100-1"></span>
						<span class="focus-input100-2"></span>
					</div>
					
					<div class="wrap-input100">
					Pesel:
						<input class="input100" type="text" name="pesel" readonly="readonly" value="${pesel}">
						<span class="focus-input100-1"></span>
						<span class="focus-input100-2"></span>
					</div>
										
					<div class="container-login100-form-btn m-t-20">
						<form action="addecg" method="POST" class="login100-form-btn m-t-20">
						<input type="file" name="file" /> <input type="submit"/>
						</form>
					</div>
					
					<!-- stara opcja od Uli: <div class="container-login100-form-btn m-t-20">
						<form action="addecg" method="POST">
						<input type="file" id="upload" name="upload" style="visibility: hidden; width: 1px; height: 1px" multiple />
						<button class="login100-form-btn" type="button" onclick="document.getElementById('upload').click(); return false">Otworz</button>
						</form>
					</div>
					
					 	 nowa opcja od Uli : <input type="file" name="file" /> <input type="submit" /> <br> -->
					
					<div class="container-login100-form-btn m-t-20">
						<button class="login100-form-btn" type="button" onClick="window.location='\start.jsp'">
						Wroc do startu
						</button>
					</div>
					
					<div class="container-login100-form-btn m-t-20">
						<button type="button" class="login100-form-btn" onClick="window.location='\selectPacjentWindow.jsp'"> Wyszukaj pacjenta </button>
        				
					</div>
					
					<div class="container-login100-form-btn m-t-20">
						<button class="login100-form-btn">
							Otworz istniejace badania
						</button>
					</div>
					
					
									
					<% String sAction = (String) request.getAttribute("result");
	if ( sAction != null && (sAction).equals("done")) { %>
		<canvas id="myCanvas" width="700" height="400"
			style="position: absolute; top: 120%; left: 27%; border: 2px solid;"></canvas>
		<script>
      var canvas = document.getElementById('myCanvas');
      var context = canvas.getContext('2d');
      var imageObj = new Image();
      imageObj.onload = function() {
        context.drawImage(imageObj, 0, 0, canvas.width, canvas.height);
      };
      imageObj.src = "http://localhost:8080/Telm2/img/ekg.png?timestamp=" + new Date().getTime();
    </script>
    <a id="downloadLnk" download="ekg.png">Pobierz</a>
    
    
    
<script>
function download() {
    var dt = canvas.toDataURL('image/png');
    this.href = dt;
};
downloadLnk.addEventListener('click', download, false);
</script>

		<button type=button
			style="position: absolute; top: 125%; left: 7%; width: 20px; height: 20px; background: green;"
			id="color" onClick="drawCircle('green')">Q</button>

		<button type=button
			style="position: absolute; top: 130%; left: 7%; width: 20px; height: 20px; background: blue;"
			id="color" onClick="drawCircle('blue')">R</button>

		<button type=button
			style="position: absolute; top: 135%; left: 7%; width: 20px; height: 20px; background: red;"
			id="color" onClick="drawCircle('red')">S</button>

		<button type=button
			style="position: absolute; top: 140%; left: 7%; width: 20px; height: 20px; background: yellow;"
			id="color" onClick="drawCircle('yellow')">T</button>

		<button type=button
			style="position: absolute; top: 145%; left: 7%; width: 20px; height: 20px; background: orange;"
			id="color" onClick="drawCircle('orange')">P</button>

		<% } 
		if ( sAction != null && (sAction).equals("error")) { %>
		<img src="img/image.png" height="700" width="700">
		<% }
	String iAction = (String) request.getAttribute("fileerror");
		if ( iAction != null && (iAction).equals("error")) { %>
		<script> alert("Nie wybrano pliku");</script>
		<%}%>
							
				</form>
			</div>
		</div>
	</div>
	

	
<!--===============================================================================================-->
	<script src="vendor/jquery/jquery-3.2.1.min.js"></script>
<!--===============================================================================================-->
	<script src="vendor/animsition/js/animsition.min.js"></script>
<!--===============================================================================================-->
	<script src="vendor/bootstrap/js/popper.js"></script>
	<script src="vendor/bootstrap/js/bootstrap.min.js"></script>
<!--===============================================================================================-->
	<script src="vendor/select2/select2.min.js"></script>
<!--===============================================================================================-->
	<script src="vendor/daterangepicker/moment.min.js"></script>
	<script src="vendor/daterangepicker/daterangepicker.js"></script>
<!--===============================================================================================-->
	<script src="vendor/countdowntime/countdowntime.js"></script>
<!--===============================================================================================-->
	<script src="js/main.js"></script>

</body>
</html>