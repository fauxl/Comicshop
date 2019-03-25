<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"  
	session="true"
	%>
	
<% 
	 Boolean RegisteredUserRoles = (Boolean) session.getAttribute("RegisteredUserRoles");
	if ((RegisteredUserRoles == null) || (!RegisteredUserRoles.booleanValue()))
	{	
	    response.sendRedirect("./login");
	    return;
	}
	
%>
	
<!DOCTYPE html>

<html lang="it-IT">
<head>
<meta charset="utf-8" />
<title>Il mio account - ComicShop.it</title>
<meta name="description" content="Entra nel mondo di ComicShop!">
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
				<li class="active">Il mio account</li>
			</ul>	
		<h1>Il mio Account</h1>
		<hr>
				
			<div class="area">
				<br> <br>
				<h2>I miei ordini</h2>
				<hr>

				<a href="order">Qui troverai tutti gli ordini da te effettuati
					nei dettagli.</a> <br> <br> <br> <br>
				<h2>La mia lista desideri</h2>
				<hr>
				<a href="wishes">Qui vi sono tutti i prodotti da te
					desiderati.</a> <br> <br> <br> <br>
				<h2>I miei dati</h2>
				<hr>
				<a href="client">In quest'area vi è la possibiità di
					consultare e modificare i dati da te inseriti. </a> <br> <br>
				<br> <br>
				<h2>Logout</h2>
				<hr>
				
				<a href="Logout">Qui puoi uscire dalla tua area e abbandonare la
					sessione.</a>
			</div>
		</div>
			<%@ include file="footer.jsp"%>
		
		</div>
</body>
</html>