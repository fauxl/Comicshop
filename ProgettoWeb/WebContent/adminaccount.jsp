<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>

<% Boolean adminRoles = (Boolean) session.getAttribute("adminRoles");
if ((adminRoles == null) || (!adminRoles.booleanValue()))
{	
    response.sendRedirect("./myaccount");
    return;
}
%>

<!DOCTYPE html>

<html lang="it-IT">
<head>
<meta charset="utf-8" />
<title>Area Amministratore - ComicShop.it</title>
<meta name="description" content="Questa è l'area amministratore.">
<meta name="robots" content="noodp" />
<%@ include file="head.jsp"%>
</head>
<body>
	
		<%@ include file="navbar.jsp"%>
	<div class="container">

		<div id="sopra">
			
		
		</div>

		<div id="main">
		<ul class="breadcrumb">
				<li><a href="home">Home</a></li>
				<li class="active">Admin area</li>
			</ul>	
		<h1>Admin Area</h1>
		<hr>
				
			<div class="area">
				<br> <br>
				
				<h2>Inserisci prodotto</h2>
				<hr>
				<a href="aggiungiprodotto">Qui puoi inserire nuovi prodotti da vendere</a> <br> <br>
				<br>
				<h2>Elimina e modifica prodotto</h2>
				<hr>
				<a href="deleteproduct">In quest'area è possibile eliminare o modificare i prodotti in vendita </a> <br> <br>
				<br> 
				<h2>Banna Utente</h2>
				<hr>
				<a href="banned">In quest'area è possibile bannare gli utenti</a> <br> <br>
				<br> 
				<h2>I miei ordini</h2>
				<hr>
				<a href="order">Qui troverai tutti gli ordini effettuati dall'admin
					nei dettagli.</a> <br> <br> <br>
				<h2>La mia lista desideri</h2>
				<hr>
				<a href="wishes">Lista desideri personale dell'admin</a> <br> <br> <br>
				<h2>Logout</h2>
				<hr>
				
				<a href="Logout">Qui puoi uscire dalla tua area e abbandonare la
					sessione.</a>
			</div>
			<br>
			<br>
		</div>
			<%@ include file="footer.jsp"%>
		
		</div>
</body>
</html>