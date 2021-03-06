<%@ taglib uri="/tags/struts-bean" prefix="bean" %>
<%@ taglib uri="/tags/struts-html" prefix="html" %>
<%@ taglib uri="/tags/struts-logic" prefix="logic" %>

<script type="text/javascript" language="javascript">			   
   	    <%@include file="/base/submitForm.js"%>	 
</script>

<script type="text/javascript" language="javascript">		
	function changeFecha(){
		submitForm('paramFechaBalance', '');
	}
</script>

	<!-- Tabla que contiene todos los formularios -->
	<html:form styleId="filter" action="/bal/AdministrarAseDel.do">

		<!-- Mensajes y/o Advertencias -->
		<%@ include file="/base/warning.jsp" %>
		<!-- Errors  -->
		<html:errors bundle="base"/>
		
		<h1><bean:message bundle="bal" key="bal.aseDelAdapter.title"/></h1>		
		<table class="tablabotones" width="100%">
		<tr>			
			<td align="right">
    			<html:button property="btnVolver"  styleClass="boton" onclick="submitForm('volver', '');">
					<bean:message bundle="base" key="abm.button.volver"/>
				</html:button>
			</td>
		</tr>
		</table>		
		<!-- AseDel -->
		<fieldset>
			<legend><bean:message bundle="bal" key="bal.aseDel.title"/></legend>
			
			<table class="tabladatos">
				<!-- Servicio Banco -->		
				<tr>
					<td><label>(*)&nbsp;<bean:message bundle="def" key="def.servicioBanco.label"/>: </label></td>
					<td class="normal">	
						<logic:equal name="aseDelAdapterVO" property="act" value="agregar">
							<html:select name="aseDelAdapterVO" property="aseDel.servicioBanco.id" styleClass="select" disabled="false">
								<html:optionsCollection name="aseDelAdapterVO" property="listServicioBanco" label="desServicioBanco" value="id" />
							</html:select>
						</logic:equal>
						<logic:equal name="aseDelAdapterVO" property="act" value="modificar">
							<html:text name="aseDelAdapterVO" property="aseDel.servicioBanco.desServicioBanco" size="15" disabled="true"/>
						</logic:equal>
					</td>
				</tr>	
				<!-- Fecha Balance -->
				<tr>
					<td><label>(*)&nbsp;<bean:message bundle="bal" key="bal.aseDel.fechaBalance.label"/>: </label></td>
					<td class="normal">
						<html:text name="aseDelAdapterVO" property="aseDel.fechaBalanceView" styleId="fechaBalanceView" size="10" maxlength="10" styleClass="datos" onchange="changeFecha();"/>
						<a class="link_siat" onclick="return show_calendar_change('fechaBalanceView');" id="a_fechaBalanceView">
							<img border="0" src="<%= request.getContextPath()%>/images/calendario.gif"/></a>
					</td>
				</tr>		
				<tr>
					<!-- Ejercicio -->
					<td><label>&nbsp;<bean:message bundle="bal" key="bal.ejercicio.label"/>: </label></td>
					<td class="normal">
						<html:text name="aseDelAdapterVO" property="aseDel.ejercicio.desEjercicio" size="10" maxlength="100" disabled="true"/>
					</td>
					<!-- Estado Ejercicio -->
					<td><label>&nbsp;<bean:message bundle="bal" key="bal.estEjercicio.label"/>: </label></td>
					<td  class="normal">
						<html:text name="aseDelAdapterVO" property="aseDel.ejercicio.estEjercicio.desEjeBal" size="10" maxlength="100" disabled="true"/>
					</td>
				</tr>		
				<!-- Mensaje que depende del estado del ejercicio -->
				<tr>
				<logic:equal name="aseDelAdapterVO" property="paramEstadoEjercicio" value="CERRADO">
				<td class="normal" colspan="4" align="center"><label>&nbsp;<bean:message bundle="bal" key="bal.aseDel.ejercicioCerrado.label"/></label></td>
				</logic:equal>
				<logic:equal name="aseDelAdapterVO" property="paramEstadoEjercicio" value="ABIERTO">
				<td class="normal" colspan="4" align="center"><label>&nbsp;<bean:message bundle="bal" key="bal.aseDel.ejercicioAbierto.label"/></label></td>
				</logic:equal>
				</tr>
				<!-- Observacion-->		
				<tr>
					<td><label>&nbsp;<bean:message bundle="bal" key="bal.aseDel.observacion.label"/>: </label></td>
					<td colspan="3" class="normal"><html:textarea name="aseDelAdapterVO" property="aseDel.observacion" cols="75" rows="15"/></td>					
				</tr>
				<!-- Inclucion de Caso -->
				<tr>
					<td><label><bean:message bundle="cas" key="cas.caso.label"/>: </label></td>
					<td colspan="3">
						<bean:define id="IncludedVO" name="aseDelAdapterVO" property="aseDel"/>
						<bean:define id="voName" value="aseDel" />
						<%@ include file="/cas/caso/includeCaso.jsp" %>
					</td>
				</tr>
				<!-- Fin Inclucion de Caso -->	
			</table>
		</fieldset>
		
		<table class="tablabotones" width="100%">
			<tr>				
				<td align="left">
	    			<html:button property="btnVolver"  styleClass="boton" onclick="submitForm('volver', '');">
						<bean:message bundle="base" key="abm.button.volver"/>
					</html:button>
				</td>
				<td align="right">
					<logic:equal name="aseDelAdapterVO" property="act" value="modificar">
						<html:button property="btnAceptar"  styleClass="boton" onclick="submitForm('modificar', '');">
							<bean:message bundle="base" key="abm.button.modificar"/>
						</html:button>
					</logic:equal>
					<logic:equal name="aseDelAdapterVO" property="act" value="agregar">
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
		