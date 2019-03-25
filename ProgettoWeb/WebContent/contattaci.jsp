<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>

<html lang="it-IT">
<head>
<meta charset="utf-8" />
<title>Contattaci - ComicShop.it</title>
<meta name="description"
	content="Hai dei problemi con un ordine o col nostro sito? Contattaci e ti risponderemo il prima possibile">
<meta name="robots" content="index,follow,noodp" />
<%@ include file="head.jsp"%>
</head>
<body>

	<div class="container">
		<%@ include file="navbar.jsp"%>
		<div id="sopra">
			
		</div>
		<div id="main">
		<ul class="breadcrumb">
				<li><a href="home">Home</a></li>
				<li class="active">Contatti</li>
			</ul>
			<h1>Invia messaggio</h1>
			<hr>
			<form action="mailto:duckpro@libero.it" method="post" enctype="text/plain">
			
				<div id="table">
					<div id="row">
					
						<div id="mittente">
						
							Indirizzo e-mail: <br> <br> <input type="text"
								id="email" required="required"> <br> <br>
							Oggetto del messaggio: <br> <br> <input type="text"
								id="objectmessage" required="required">
						</div>
						<div id="messaggio">
							Messaggio: <br> <br>
							<textarea id="message" rows="10" cols="90"></textarea>
						</div>
					</div>
				</div>
				<div id="privacy">
					<input type="checkbox" id="terms" required> Dichiaro di
					aver letto e accettato i <a href="condizioni">Termini
						e le condizioni del servizio</a> e l'<a href="privacy">
						Informativa sulla privacy</a>.
					<p id="send">
						<input type="submit" value="Invia">
						</p>
						</div>
						</form>
				</div>
		</div>
			<%@ include file="footer.jsp"%>
		
	</div>
</body>
</html>