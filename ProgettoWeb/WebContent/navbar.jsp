<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%
float pricegadget = 0;
	float price = 0;
	String strDouble2 = "";


Cart cart = (Cart) request.getAttribute("cart");
List<ComicsBean> comicscart = cart.getcomic(); 
  for(ComicsBean beancart: comicscart) {
price = price + beancart.getprice();}
  
	List<GadgetBean> gadgetscart = cart.getgadget(); 	
	   for(GadgetBean bean2cart: gadgetscart) {
	pricegadget = pricegadget + bean2cart.getprice();}
	   
		strDouble2 = String.format("%.2f", price + pricegadget);

	   
%>
<%@ page contentType="text/html; charset=UTF-8"
	import="java.util.*,progetto.*"%>
<header>
	<nav class="topnav" id="myTopnav">
	
	
		<a id="title" href="home">ComicShop</a> 
					
		<a href="comic">Fumetti</a> 
		<a href="gadget">Gadget</a>
		<div id="ricerca">
		<form action="search" method="post">
			<input name="searchbar" type="search" placeholder="Ricerca"
				required="required"> <input id="search" type="image"
				name="search" src="immagini/search.png" >	
		</form>
	</div>
		

		<!--
			Creo il check del cookie per gestire la connessione
			 Così da cambiare in "Il tuo profilo" al posto di "Accedi"
			 In caso possa servire, vecchio pezzo di codice:
			 <a href="login.jsp">Accedi</a>
		/****************************************************************/
		Idea del codice di controllo per la scritta "Accedi" o "Il mio account":
			PS: attaccare la </> e la %, non entrano attaccati nel commento
		-->
<a href="confronto">Confronto</a>
		<%
			Cookie[] cookies2 = request.getCookies();
			boolean booleanLogin = false;

			if (cookies2 != null) {
				for (Cookie cookie : cookies2) {
					if (((cookie.getName()).equals("attempt")) && ((cookie.getValue()).equals("true"))) {
						String email3 = "noemail";
						if (request.getCookies() != null) {     
						    for (int i = 0; i < request.getCookies().length; i++) {
						        if (request.getCookies()[i].getName().equals("email")) {	
						        	email3 =  request.getCookies()[i].getValue();	
						        	if (email3.equals("duckpro@libero.it")){
										out.println("<a href=" + "\"adminaccount\"" + "> Admin Account </a>");
										booleanLogin = true;
						        	}else{out.println("<a href=" + "\"myaccount\"" + "> Il mio account </a>");
									booleanLogin = true; }
						        }
						    }
						        } 
	
					}
				}
				if (!booleanLogin) {
					out.println("<a href=" + "\"login\"" + "> Accedi </a>");
				}
			}
		%>
		<!--  <a href="login.jsp">Accedi</a> -->

		<a href="cart"> <img id="carrello" src="immagini/carrello2.png"
			> <input type="text"
			value="<%=strDouble2%>€" readonly>
		</a> 
		
			<a href="javascript:void(0);" class="icon" onclick="myFunction()">MENU &#9776; </a>
			</nav>
			
			<script>
			function myFunction() {
			    var x = document.getElementById("myTopnav");
			    if (x.className == "topnav") {
			        x.className += " responsive";
			    } else {
			        x.className = "topnav";
			    }
			}
				</script>
		
		
</header>