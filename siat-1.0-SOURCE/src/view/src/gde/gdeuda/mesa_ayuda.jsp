<%@ taglib uri="/tags/struts-bean" prefix="bean" %>
<%@ taglib uri="/tags/struts-html" prefix="html" %>
<%@ taglib uri="/tags/struts-logic" prefix="logic" %>

<!DOCTYPE html 
    PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" 
    "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">

<html>

<head>
	<meta http-equiv="Content-Type" content="text/html; charset=iso-8859-1">
	<style type="text/css">
	@import url("/siat/styles/tramites.css");
	@import url("/siat/styles/siat.css");
	</style>
	<title>Siat Online</title>

    <script type="text/javascript" src="/siat/base/submitForm.js"></script>
    <script type="text/javascript" src="/siat/base/calendar.js"></script>

	
</head>

<body onload="init()" onunload="unload()">
	<div id="container">
		

		<div id="top">

			<a id="rosariogovar" href="#" title="Ir a www.rosario.gov.ar" onclick="javascript:window.open('http://www.rosario.gov.ar'); return false;"></a>
			<div id="iconostop">
      			<ul>
        			<li><a href="http://www.rosario.gov.ar/tramitesonline/inicio.do" class="Inicio" id="icohome" title="Inicio"></a></li>
        			<li><a href="http://www.rosario.gov.ar/tramitesonline/busqueda.do" class="Busqueda" id="icobuscar" title="Busqueda"></a></li>
        			<li><a href="http://www.rosario.gov.ar/tramitesonline/ayuda.do" class="Ayuda" id="icoayuda" title="Ayuda"></a></li>
        			<li><a href="http://www.rosario.gov.ar/tramitesonline/contacto.do" class="Contacto" id="icontacto" title="Contacto"></a></li>


					<li><a href="/siat/login/LoginSsl.do?method=webInit" title="Log-in (Web)" id="icologin"></a></li>
					<li><a href="/siat/login/LoginSsl.do?method=intranetInit" title="Log-in (Intranet)" id="icologin"></a></li>

      			</ul>
			</div>
		</div>


<script type="text/javascript">
var TxInicial = 12;
var textoHtml;
var numCol = 1;
function zoom(Factor) {
    tx = document.getElementById("container");
    TxInicial = TxInicial + Factor;
    tx.style.fontSize = TxInicial;
    if (numCol > 1) {
        tb = document.getElementById("container");
        tb.style.fontSize = TxInicial;
    }
}
</script>



<div id="menu">
	<ul>
		<li><a href="http://www.rosario.gov.ar/tramitesonline/inicio.do"><span>Inicio</span></a></li>
		<li><a href="http://www.rosario.gov.ar/tramitesonline/todos.do"><span>Todos</span></a></li>
		<li><a href="http://www.rosario.gov.ar/tramitesonline/tema.do"><span>Temas</span></a></li>

    	<li><a href="http://www.rosario.gov.ar/tramitesonline/lugar.do"><span>Lugares</span></a></li>
	</ul>
</div>



<ul>
</ul>

	<div id="contenido">	
		<%@ include file="/gde/gdeuda/includeDivButtons.jsp" %>
		<div style="clear: both;"> </div>
				
		<h1>Mesa de ayuda</h1>
		<p>Por consultas sobre el funcionamiento de este sistema o inconvenientes t&eacute;cnicos en la utilizaci&oacute;n en las herramientas
		aqu&iacute; disponibles, puede contactarse por correo electr&oacute;nico con:
		<a href="mailto:tributos@rosario.gov.ar">tributos@rosario.gov.ar</a></p>
	
	
		<h1>&nbsp;</h1>
	
	</div>
	
		<div id="pie">
		  Sitio desarrollado por la Municipalidad de Rosario. Santa Fe. Argentina. 1997 - 2008.  Todos los derechos reservados.<br/>
		  En algunas secciones es necesario tener instalado el 
		  <a href="http://www.adobe.es/products/acrobat/readstep2.html" target="_blank">Acrobat Reader</a>.
		
		</div>

	
	</div>
</body>

</html>
