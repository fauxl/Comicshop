<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
	<%
	
	Boolean adminRoles = (Boolean) session.getAttribute("adminRoles");
	if ((adminRoles == null) || (!adminRoles.booleanValue()))
	{	
	    response.sendRedirect("./myaccount");
	    return;
	}



	String prova = (String) request.getAttribute("verifica");

%>
	
<!DOCTYPE html>

<%@ page contentType="text/html; charset=UTF-8"
	import="java.util.*,progetto.*"%>

<html lang="it-IT">
<head>
<meta charset="utf-8" />
<title>Inserisci Prodotto - ComicShop.it</title>
<meta name="description"
	content="Questo è il tuo profilo utente su ComicShop.it">
<meta name="robots" content="index,follow,noodp" />
<%@ include file="head.jsp"%>
</head>
<body>
	<div class="container">
			<%@ include file="navbar.jsp"%>
	
			<script>
						function registrazione(){
						alert("Inserimento prodotto riuscito");
						}
						</script>

		<div id="sopra">
			
		</div>

		<div id="main">
		<ul class="breadcrumb">
				<li><a href="home">Home</a></li>
				<li><a href="adminaccount">Admin area</a></li>
				<li class="active">Inserimento Prodotto</li>
			</ul>
			<h1>Inserimento Prodotto</h1>
			<hr>
			<br><br>

			
					<h2>Inserimento Fumetto</h2>
			<hr>
			<form action="aggiungiprodotto" method="post" enctype="multipart/form-data">
					<input type="hidden" name="action" value="insertc">
			
				<div id="table">
					<div id="row">

						<div id="dati1">
						<p>Codice:</p>
						<input name="code" type="text" maxlength="30" >
				
				
							<p>Titolo:</p>
							<input name="title" type="text" maxlength="30" required >
							
							
							<p>Genere:</p>
							<input name="gender" type="text" maxlength="30" required>
							
								<p>Disponibilita:</p>
							<input name="availability" type="text" maxlength="30" required>
							
						</div>
						
						<div id="dati2">
							<p>Costo:</p>
							<input name="price" type="text" maxlength="30" required >

							<p>Scrittore:</p>
							<input name="writer" type="text" maxlength="30" required >

							<p>Disegantore:</p>
							<input name="drawer" type="text" maxlength="30" required>
							
							<p>Tipo:</p>
							<input name="type" type="text" maxlength="30" required >
							
						</div>

						<div id="dati3">
							
							<p>Publisher:</p>
							<input name="publisher" type="text" maxlength="30" required > <br>
							
						<p>Immagine:</p>
							<label class="fileContainer">
							<span id="scritta">Clicca qui per caricare l'immagine</span>
					<input type="file" name="filename" accept="image/jpeg, image/png" required>
							</label><br><br>
						</div>

						<div id="dati4">
						
							<p>Numero:</p>
							<input name="number" type="text" maxlength="30" required>
						
						<p>Trama:</p>
							<textarea name="plot" rows="6" cols="19" required></textarea>
							
	
						</div>
					</div>	
				</div>
						
				<div id="privacy2">
					<p id="send2">
						<input type="submit"  name="submit" value="Conferma inserimento" onclick="registrazione()">
					</p>
				</div>
					</form>
					
		<h2>Inserimento Gadget</h2>
			<hr>
			<form action="aggiungiprodotto" method="post" enctype="multipart/form-data">
				<input type="hidden" name="action" value="insertg">
		
	
				<div id="table">
					<div id="row">

						<div id="dati1">
						<p>Codice:</p>
						<input name="codeg" type="text" maxlength="30" >
				
				
							<p>Nome:</p>
							<input name="name" type="text" maxlength="30" required >
							
							
							<p>Tipo:</p>
							<input name="typeg" type="text" maxlength="30" required>
						
						</div>
						
					

						<div id="dati2">
							<p>Peso:</p>
							<input name="weight" type="text" maxlength="30" required >

							<p>Dimensioni:</p>
							<input name="dimension" type="text" maxlength="30" required >
							
							<p>Costo:</p>
							<input name="priceg" type="text" maxlength="30" required>

					
						</div>

						<div id="dati3">
							
							<p>Publisher:</p>
							<input name="publisherg" type="text" maxlength="30" required > <br>
							
							
								<p>Immagine:</p>
						<label class="fileContainer">
							<span id="scritta">Clicca qui per caricare l'immagine</span>
					<input type="file" name="filename" accept="image/jpeg, image/png" required>
							</label><br><br>
							
						</div>
						<div id="dati4">
						
							<p>Disponibilita:</p>
							<input name="availabilityg" type="text" maxlength="30" required>
							<p>Descrizione:</p>
						<textarea name="description" rows="6" cols="19" required></textarea>
						
						</div>
					</div>	
				</div>
								
				<div id="privacy2">
					<p id="send2">
						<input type="submit"  name="submit" value="Conferma inserimento" onclick="registrazione()">
					</p>
				</div>
			</form>
		</div>
			<%@ include file="footer.jsp"%>
		
	</div>
</body>
</html>
