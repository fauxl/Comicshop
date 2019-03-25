<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%
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
<title><%=oggetto.getname()%> - ComicShop.it</title>
<meta name="description" content="Nome oggetto">
<meta name="robots" content="index,follow,noodp" />
<%@ include file="head.jsp"%>
</head>
<body>
	<div class="container">
		<%@ include file="navbar.jsp"%>

		<div id="sopra">
	
		</div>
				
			<%  if (oggetto.getavailability()>0){ 
						prova = true;
			} else if (oggetto.getavailability()<=0){ 
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
				<li><a href="gadget">Gadget</a></li>
				<li class="active"><%=oggetto.getname()%></li>
				</ul>
			<h1><%=oggetto.getname()%></h1>
			<hr>
			<div id="table">
				<div id="row">
					<div id="oggettog">
						<p>
							<img src=<%=oggetto.getimage()%> width="350" height="350">
					</div>

					<div id="descrizione2">
						<span>Descrizione:</span>
						<p><%=oggetto.getdescription()%></p>
						<hr>


						<div id="tabledes">
							<div id="rowdes">
								<div id="specs2">
									<span>Tipo:</span>
									<%=oggetto.gettype()%>
								<p>
										<span>Publisher:</span>
										<%=oggetto.getpublisher()%>
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
										<span>Peso:</span>
										<%=oggetto.getweight()%>
								</p>
								<p>	
										<span>Dimensioni:</span>
										<%=oggetto.getdimension()%>
									</p>
								<p>	
										<span>Prezzo:</span>
										<%=oggetto.getprice()%>
										&#8364;
									</p>
								</div>
								<div id="add">
									
							<%if (prova == true){ %>
								<form action="carrello?action=read&id=<%=oggetto.getcode()%>" method="post">
									<input id="addcart" type="image" src="immagini/carrello2.png"
									title="Aggiungi al carrello" onclick="updatecart()">
										</form>
							<%} else { %>
										<input id="addcart" type="image" src="immagini/carrello2.png"
									title="Aggiungi al carrello" onclick="nope()">
									<%} %>
						
								<form action="wishlist?action=read&id=<%=oggetto.getcode()%>" method="post">
									<p>
										<input id="aggiungi" type="image" src="immagini/wishes.png"
											title="Aggiung alla lista dei desideri"  onclick="updatewishes()">
									</p>
									</form>
									<form action="compare?action=read&id=<%=oggetto.getcode()%>" method="post">
									<p>
										<input id="aggiungi" type="image" src="immagini/shuffle.svg"
											title="Confronta con un altro prodotto"  onclick="updateconfront()">
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
						<h3>Consigliati</h3>
						<hr>
						<div id="newg">
							<%
								int i = 0;
								if (oggetti != null && oggetti.size() != 0) {
									Iterator<?> it = oggetti.iterator();
									while (it.hasNext() && i < 7) {
										i++;
										GadgetBean bean = (GadgetBean) it.next();
							%>
							<p>
								<a href="oggetto?action=read&id=<%=bean.getcode()%>"> <img
									src=<%=bean.getimage()%> width="160.5" height="160.5"> <br>
									<%=bean.gettype()%> <br> <%=bean.getname()%>
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