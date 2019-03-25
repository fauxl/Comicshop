


<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>

<%
	Collection<?> comics = (Collection<?>) request.getAttribute("comics");
	ComicsBean comic = (ComicsBean) request.getAttribute("comic");

	Collection<?> gadgets = (Collection<?>) request.getAttribute("gadgets");
	GadgetBean gadget = (GadgetBean) request.getAttribute("gadget");
	
%>

<!DOCTYPE html>

<%@ page contentType="text/html; charset=UTF-8"
	import="java.util.*,progetto.*"%>


<html lang="it-IT">
<head>
<meta charset="utf-8" />
<title>ComicShop.it: Compra Fumetti e Gadget da casa tua</title>
<meta name="description"
	content="ComicShop è il posto giusto dove comprare fumetti e gadget comodamente da casa">
<meta name="robots" content="index,follow,noodp" />
<%@ include file="head.jsp"%>

</head>

<body>
	<%@ include file="navbar.jsp"%>
	<div id="centro">
		<img class="mySlides" src="immagini/prova7.jpg" width=100%> <img
			class="mySlides" src="immagini/prova6.jpg" width=100%> <img
			class="mySlides" src="immagini/prova5.jpg" width=100%>
	</div>

	<script>
var myIndex = 0;
carousel();

function carousel() {
    var i;
    var x = document.getElementsByClassName("mySlides");
    for (i = 0; i < x.length; i++) {
       x[i].style.display = "none";  
    }
    myIndex++;
    if (myIndex > x.length) {myIndex = 1}    
    x[myIndex-1].style.display = "block";  
    setTimeout(carousel, 10000); // Change image every 5 seconds
}
</script>

	<div id="goods">
	<br>
		<h2>Novità Fumetti </h2>
		<hr>
		<div id="new">
			<%
					int i = 0;
					if (comics != null && comics.size() != 0) {
						Iterator<?> it = comics.iterator();
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
	
		<br>
		<h2>Novità Gadget </h2>
		<hr>
		<div id="newg">

			<%
					i = 0;
					if (gadgets != null && gadgets.size() != 0) {
						Iterator<?> it = gadgets.iterator();
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
	<%@ include file="footer.jsp"%>
</body>
</html>