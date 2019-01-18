
<!DOCTYPE html>
<html lang="pl">
<head>
	<title>Login V19</title>
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
<body>

	<div class="limiter">
		<div class="container-login100">
			<div class="wrap-login100 p-l-55 p-r-55 p-t-65 p-b-50">
				<form action = "addpac" method = "post">
					<span class="login100-form-title p-b-33">
						Dodawanie pacjenta
					</span>

					<div class="wrap-input100">
						<input class="input100" type="text" name="nazwisko" placeholder="Nazwisko">
						<span class="focus-input100-1"></span>
						<span class="focus-input100-2"></span>
					</div>

					<div class="wrap-input100">
						<input class="input100" type="text" name="imie" placeholder="Imie">
						<span class="focus-input100-1"></span>
						<span class="focus-input100-2"></span>
					</div>
					
					<div class="wrap-input100">
						<input class="input100" type="text" name="pesel" placeholder="PESEL">
						<span class="focus-input100-1"></span>
						<span class="focus-input100-2"></span>
					</div>
					
					<div class="container-login100-form-btn m-t-20">
						<button class="login100-form-btn">
							OK
						</button>
					</div>
					
					<div class="container-login100-form-btn m-t-20">
						<button type="button" class="login100-form-btn" onClick="window.location='\start.jsp'"> Wroc </button>
        				<%
   						String sAction = (String) request.getAttribute("message");
   						if ( sAction != null && (sAction).equals("nazwisko")) { %>
   						<script> alert("Bledne imie i/lub nazwisko. Popraw dane aby dodac pacjenta");</script>
						<% } 
   						if ( sAction != null && (sAction).equals("pesel")) { %>
   						<script> alert("Bledny PESEL. Popraw dane aby dodac pacjenta");</script>
						<% } 
						%>
					</div>
					<button type="button" onClick="window.location='\selectPacjentWindow.jsp'"> Wyszukaj pacjenta </button>
					
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