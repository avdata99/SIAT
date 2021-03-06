<%@ taglib uri="/tags/struts-bean" prefix="bean" %>
<%@ taglib uri="/tags/struts-html" prefix="html" %>
<%@ taglib uri="/tags/struts-logic" prefix="logic" %>

<script type="text/javascript" language="javascript">			   
   	    <%@include file="/base/submitForm.js"%>	 
</script>

<script type="text/javascript">

function calcularValor(campo) {
	campo.value = eval(campo.value); 
	if(!isNumber(campo.value)){
		campo.value = 0;
	}
}

function isNumber( value )
{
return isFinite( (value * 1.0) );
} 

</script>

	<!-- Tabla que contiene todos los formularios -->
	<html:form styleId="filter" action="/bal/AdministrarFolDiaCob.do">

		<!-- Mensajes y/o Advertencias -->
		<%@ include file="/base/warning.jsp" %>
		<!-- Errors  -->
		<html:errors bundle="base"/>
		
		<h1><bean:message bundle="bal" key="bal.folioAdapter.title"/></h1>		
		<table class="tablabotones" width="100%">
			<tr>			
				<td align="right">
	    			<html:button property="btnVolver"  styleClass="boton" onclick="submitForm('volver', '');">
						<bean:message bundle="base" key="abm.button.volver"/>
					</html:button>
				</td>
			</tr>
		</table>

		<!-- FolDiaCob -->
		<fieldset>
			<legend><bean:message bundle="bal" key="bal.folDiaCob.title"/></legend>			
			<table class="tabladatos">
				<!-- Fecha -->
				<tr>
					<td><label>&nbsp;<bean:message bundle="bal" key="bal.folDiaCob.fechaCob.label"/>: </label></td>
					<td class="normal">
						<html:text name="folDiaCobAdapterVO" property="folDiaCob.fechaCobView" styleId="fechaCobView" size="10" maxlength="10" styleClass="datos" />
						<a class="link_siat" onclick="return show_calendar_change('fechaCobView');" id="a_fechaCobView">
							<img border="0" src="<%= request.getContextPath()%>/images/calendario.gif"/></a>
					</td>
				</tr>	
				<tr>
					<!-- Descripcion -->		
					<td><label>&nbsp;<bean:message bundle="bal" key="bal.folDiaCob.descripcion.label"/>: </label></td>
					<td class="normal"><html:text name="folDiaCobAdapterVO" property="folDiaCob.descripcion" size="15" maxlength="15" /></td>
				</tr>
				<logic:notEmpty  name="folDiaCobAdapterVO" property="folDiaCob.listFolDiaCobCol">	    	
						<logic:iterate id="FolDiaCobColVO" name="folDiaCobAdapterVO" property="folDiaCob.listFolDiaCobCol">				
							<tr>
								<!-- Importe FolDiaCobCol-->		
								<td><label>(*)&nbsp;<bean:write name="FolDiaCobColVO" property="tipoCob.descripcion"/>: </label></td>
								<td class="normal">
								<input type="text" onchange="calcularValor(this);" size="20" maxlength="255" name="importe<bean:write name="FolDiaCobColVO" property="tipoCob.idView"/>"
											value="<bean:write name="FolDiaCobColVO" property="importeView"/>"/>
								</td>
							</tr>	
						</logic:iterate>
				</logic:notEmpty>
				<logic:empty  name="folDiaCobAdapterVO" property="folDiaCob.listFolDiaCobCol">
					<td><bean:message bundle="bal" key="bal.tipoCob.noExistenColumnas.label"/></td>
				</logic:empty>	
			</table>
		</fieldset>
		<!-- Fin FolDiaCob -->
		
		<table class="tablabotones" width="100%">
			<tr>				
				<td align="left">
	    			<html:button property="btnVolver"  styleClass="boton" onclick="submitForm('volver', '');">
						<bean:message bundle="base" key="abm.button.volver"/>
					</html:button>
				</td>
				<td align="right">
					<logic:equal name="folDiaCobAdapterVO" property="act" value="modificar">
						<html:button property="btnAceptar"  styleClass="boton" onclick="submitForm('modificar', '');">
							<bean:message bundle="base" key="abm.button.modificar"/>
						</html:button>
					</logic:equal>
					<logic:equal name="folDiaCobAdapterVO" property="act" value="agregar">
						<html:button property="btnAceptar"  styleClass="boton" onclick="submitForm('agregar', '');">
							<bean:message bundle="base" key="abm.button.agregar"/>
						</html:button>
					</logic:equal>				
				</td>
 			</tr>
		</table>
	   	
		<input type="hidden" name="method" value=""/>
		<input type="hidden" name="anonimo" value="<bean:write name="userSession" property="isAnonimoView"/>"/>
		<input type="hidden" name="urlReComenzar" value="<bean:write name="userSession" property="urlReComenzar"/>"/>

		<input type="hidden" name="selectedId" value=""/>
		<input type="hidden" name="isSubmittedForm" value="true"/>
		
	<!-- Inclusion del Codigo Javascript del Calendar-->
	<div id="calendarDiv" style="position:absolute;visibility:hidden;background-color:white;layer-background-color:white;"></div>
		
	</html:form>
	<!-- Fin Tabla que contiene todos los formularios -->