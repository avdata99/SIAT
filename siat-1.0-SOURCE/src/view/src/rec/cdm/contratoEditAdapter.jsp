<%@ taglib uri="/tags/struts-bean" prefix="bean" %>
<%@ taglib uri="/tags/struts-html" prefix="html" %>
<%@ taglib uri="/tags/struts-logic" prefix="logic" %>

<!-- Tabla que contiene todos los formularios -->
<html:form styleId="filter" action="/rec/AdministrarContrato.do">
	
	<!-- Mensajes y/o Advertencias -->
	<%@ include file="/base/warning.jsp" %>
	<!-- Errors  -->
	<html:errors bundle="base"/>				
	
	<h1><bean:message bundle="rec" key="rec.contratoEditAdapter.title"/></h1>

	<table class="tablabotones" width="100%">
		<tr>			
			<td align="right">
    			<html:button property="btnVolver"  styleClass="boton" onclick="submitForm('volver', '');">
					<bean:message bundle="base" key="abm.button.volver"/>
				</html:button>
			</td>
		</tr>
	</table>	
	
	<!-- Contrato -->
	<fieldset>
		<legend><bean:message bundle="rec" key="rec.contrato.title"/></legend>
		
		<table class="tabladatos">
			<tr>
				<td><label>(*)&nbsp;<bean:message bundle="def" key="def.recurso.label"/>: </label></td>
				<td class="normal" colspan="3">
					<html:select name="contratoAdapterVO" property="contrato.recurso.id" styleClass="select" >
						<bean:define id="includeRecursoList" name="contratoAdapterVO" property="listRecurso"/>
						<bean:define id="includeIdRecursoSelected" name="contratoAdapterVO" property="contrato.idRecurso"/>
						<%@ include file="/def/gravamen/includeRecurso.jsp" %>
					</html:select>
				</td>				
			</tr>
			
			<!-- TipoContrato -->
			<tr>	
				<td><label>(*)&nbsp;<bean:message bundle="rec" key="rec.tipoContrato.label"/>: </label></td>
				<td class="normal">
					<html:select name="contratoAdapterVO" property="contrato.tipoContrato.id" styleClass="select">
						<html:optionsCollection name="contratoAdapterVO" property="listTipoContrato" label="descripcion" value="id" />
					</html:select>
				</td>					
			</tr>
			<tr>
				<td><label>(*)&nbsp;<bean:message bundle="rec" key="rec.contrato.numero.label"/>: </label></td>
				<td class="normal"><html:text name="contratoAdapterVO" property="contrato.numero" size="8" maxlength="100"/></td>			

				<td><label><bean:message bundle="rec" key="rec.contrato.importe.label"/>: </label></td>
				<td class="normal"><html:text name="contratoAdapterVO" property="contrato.importeView" size="10" maxlength="10"/></td>			
			</tr>
			<tr>
				<td><label><bean:message bundle="rec" key="rec.contrato.descripcion.label"/>: </label></td>
				<td class="normal"><html:text name="contratoAdapterVO" property="contrato.descripcion" size="20" maxlength="255"/></td>			
			</tr>

			<logic:equal name="contratoAdapterVO" property="act" value="modificar">
				<!-- Estado -->
				<tr>
					<td><label><bean:message bundle="base" key="base.estado.label"/>: </label></td>
					<td class="normal"><bean:write name="contratoAdapterVO" property="contrato.estado.value"/></td>
				</tr>
			</logic:equal>

		</table>
	</fieldset>	
	<!-- Contrato -->
	
	<table class="tablabotones" width="100%" >
	   	<tr>
  	   		<td align="left" width="50%">
	   	    	<html:button property="btnVolver" styleClass="boton" onclick="submitForm('volver', '');">
	   	    		<bean:message bundle="base" key="abm.button.volver"/>
	   	    	</html:button>
   	    	</td>
   	    	<td align="right" width="50%">
				<logic:equal name="contratoAdapterVO" property="act" value="modificar">
					<html:button property="btnAceptar"  styleClass="boton" onclick="submitForm('modificar', '');">
						<bean:message bundle="base" key="abm.button.modificar"/>
					</html:button>
				</logic:equal>
				<logic:equal name="contratoAdapterVO" property="act" value="agregar">
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