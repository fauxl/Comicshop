<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%
	Collection<?> objects = (Collection<?>) request.getAttribute("objects");
	ComicsBean object = (ComicsBean) request.getAttribute("object");	
	
	Collection<?> oggetti = (Collection<?>) request.getAttribute("oggetti");
	GadgetBean oggetto = (GadgetBean) request.getAttribute("oggetto");
	
	String email = (String) request.getAttribute("email");
	boolean prova = true;
	 

%>

<!DOCTYPE html>

<%@ page contentType="text/html; charset=UTF-8"
	import="java.util.*,progetto.*"%>


<html lang="it-IT">
<head>
<meta charset="utf-8" />
<title><%=object.gettitle()%> - ComicShop.it</title>
<meta name="description" content="Nome oggetto">
<meta name="robots" content="index,follow,noodp" />
<%@ include file="head.jsp"%>
</head>
<body>
	<div class="container">
		<%@ include file="navbar.jsp"%>

		<div id="sopra">
		</div>

				
			<%  if (object.getavailability()>0){ 
						prova = true;
			} else if (object.getavailability()<=0){ 
						prova = false;
						} 		
							
			if (!(email.equals("noemail"))) { %>
			
			
				<script>
				function updatewishes()
				  {
				alert("Prodotto aggiunto alla lista dei desideri");
								  }
				
				function updatecart()
				{
				alert("Prodotto aggiunto al carrello");
				}
				function updateconfront()
				{
					alert("Prodotto aggiunto al confronto");
						}
				</script>
				
					<% 	} else { %>	
					
				<script>

				function updatewishes()
									  {
				 alert("Devi essere loggato prima di aggiungere articoli alla lista dei desideri");
									  }
					function updatecart()
			
						{
				alert("Prodotto aggiunto al carrello");
			
					
					  }
					function updateconfront()
					  {
				alert("Prodotto aggiunto al confronto");
					  }
					
				</script>
				
				<% 	}  %>	
				
				<script>
				function nope()
				  {
			alert("Il prodotto non è al momento disponibile all'acquisto");
				  }
				
			</script>

	
			<div id="main">
				<ul class="breadcrumb">
				<li><a href="home">Home</a></li>
				<li><a href="comic">Fumetti</a></li>
				<li class="active"><%=object.gettitle()%></li>
				
			</ul>
		
			<h1><%=object.gettitle()%>
				n.<%=object.getnumber()%></h1>
			<hr>


			<div id="table">
				<div id="row">
					<div id="oggetto">
						<p>
							<img src=<%=object.getimage()%> width="300" height="450">
					</div>

					<div id="descrizione">
						<span>Trama:</span>
						<p><%=object.getplot()%></p>
						<hr>

						<div id="tabledes">
							<div id="rowdes">
								<div id="specs">

									<span>Editore:</span>
									<%=object.getpublisher()%>

									<p>
										<span>Autore:</span>
										<%=object.getwriter()%>
									</p>
									<p>
										<span>Disponibilità:</span>
										<%if (prova == true){ %>
												Disponibile
										<%} else { %>
											Non Disponibile
									
									<%} %>
	
										
									</p>
									<p>
										<span>Tipo:</span>
										<%=object.gettype()%>
									</p>
									<p>
										<span>Genere:</span>
										<%=object.getgender()%>
									</p>
									
									<p>
										<span>Prezzo:</span>
										<%=object.getprice()%>
										&#8364;
									</p>
								</div>
								<div id="add">
								
							<%if (prova == true){ %>
								<form action="carrello?action=read&id=<%=object.getcode()%>" method="post">
									<input id="addcart" type="image" src="immagini/carrello2.png"
									title="Aggiungi al carrello" onclick="updatecart()">
										</form>
							<%} else { %>
										<input id="addcart" type="image" src="immagini/carrello2.png"
									title="Aggiungi al carrello" onclick="nope()">
									<%} %>
						
								<form action="wishlist?action=read&id=<%=object.getcode()%>" method="post">
										<p>		
											
									<input id="aggiungi" type="image" src="immagini/wishes.png"
											title="Aggiung alla lista dei desideri"	onclick="updatewishes()">
													
									
									</p>
								</form>
								<form action="compare?action=read&id=<%=object.getcode()%>" method="post">	
									<p>
											
										<input id="aggiungi" type="image" src="immagini/shuffle.svg"
											title="Confronta con un altro prodotto" onclick="updateconfront()">
						
									</p>
									</form>
								</div>
								<div id="add2">
									<p>Aggiungi al carrello</p>
									<p>Aggiungi alla lista dei desideri</p>	
									<p>Aggiungi al confronto</p>
								</div>
		
							</div>
						</div>
					</div>

					</div>
				</div>
			
				<div id="consigliati">
						<h2>Consigliati</h2>
						<hr>
						<div id="new">
							<%
								int i = 0;
								if (objects != null && objects.size() != 0) {
									Iterator<?> it = objects.iterator();
									while (it.hasNext() && i < 8) {
										i++;
										ComicsBean bean = (ComicsBean) it.next();
							%>

							<p>
								<a href="object?action=read&id=<%=bean.getcode()%>"> <img
									src=<%=bean.getimage()%> width="130" height="190"> <br>
									<br> <%=bean.gettitle()%> <%=bean.getnumber()%>
								</a>
							</p>
							<%
								}
								}
							%>
						</div>
			</div>
		</div>
			<%@ include file="footer.jsp"%>
		
		</div>
</body>
</html>