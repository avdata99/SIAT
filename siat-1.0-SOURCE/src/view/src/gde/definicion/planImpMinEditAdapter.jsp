<%@ taglib uri="/tags/struts-bean" prefix="bean" %>
<%@ taglib uri="/tags/struts-html" prefix="html" %>
<%@ taglib uri="/tags/struts-logic" prefix="logic" %>

<!-- Tabla que contiene todos los formularios -->
<html:form styleId="filter" action="/gde/AdministrarPlanImpMin.do">
	
	<!-- Mensajes y/o Advertencias -->
	<%@ include file="/base/warning.jsp" %>
	<!-- Errors  -->
	<html:errors bundle="base"/>				
	
	<h1><bean:message bundle="gde" key="gde.planImpMinEditAdapter.title"/></h1>
	<table class="tablabotones" width="100%">
		<tr>
			<td align="right"><html:button property="btnVolver"
				styleClass="boton" onclick="submitForm('volver', '');">
				<bean:message bundle="base" key="abm.button.volver" />
			</html:button></td>
		</tr>
	</table>
	<!-- PlanImpMin -->
	<fieldset>
		<legend><bean:message bundle="gde" key="gde.planImpMin.title"/></legend>
		<table class="tabladatos">
			<!-- desPlan -->
			<tr>
				<td><label><bean:message bundle="gde" key="gde.plan.desPlan.label"/>: </label></td>
				<td class="normal" colspan="3"><bean:write name="planImpMinAdapterVO" property="planImpMin.plan.desPlan" /></td>			
			</tr>
			<!-- recurso -->
			<tr>
				<!-- viaDeuda -->
				<td><label><bean:message bundle="def" key="def.viaDeuda.label"/>: </label></td>
				<td class="normal"><bean:write name="planImpMinAdapterVO" property="planImpMin.plan.viaDeuda.desViaDeuda"/></td>
			</tr>
			<tr>
				<!-- cantidadCuotas -->
				<td><label>(*)&nbsp;<bean:message bundle="gde" key="gde.planImpMin.cantidadCuotas.label"/>: </label></td>
				<td class="normal"><html:text name="planImpMinAdapterVO" property="planImpMin.cantidadCuotasView" size="20" maxlength="100"/></td>			
			</tr>
			<tr>
				<!-- impMinDeu -->
				<td><label>(*)&nbsp;<bean:message bundle="gde" key="gde.planImpMin.impMinDeu.label"/>: </label></td>
				<td class="normal"><html:text name="planImpMinAdapterVO" property="planImpMin.impMinDeuView" size="20" maxlength="100"/></td>			
				<!-- impMinCuo -->
				<td><label>(*)&nbsp;<bean:message bundle="gde" key="gde.planImpMin.impMinCuo.label"/>: </label></td>
				<td class="normal"><html:text name="planImpMinAdapterVO" property="planImpMin.impMinCuoView" size="20" maxlength="100"/></td>			
			</tr>
			
			<!-- fechaDesde -->
			<tr>
				<td><label>(*)&nbsp;<bean:message bundle="gde" key="gde.planImpMin.fechaDesde.label"/>: </label></td>
				<td class="normal">
					<html:text name="planImpMinAdapterVO" property="planImpMin.fechaDesdeView" styleId="fechaDesdeView" size="15" maxlength="10" styleClass="datos" />
					<a class="link_siat" onclick="return show_calendar('fechaDesdeView');" id="a_fechaDesdeView">
						<img border="0" src="<%= request.getContextPath()%>/images/calendario.gif"/></a>
				</td>
				<!-- fechaHasta -->
				<td><label>(*)&nbsp;<bean:message bundle="gde" key="gde.planImpMin.fechaHasta.label"/>: </label></td>
				<td class="normal">
					<html:text name="planImpMinAdapterVO" property="planImpMin.fechaHastaView" styleId="fechaHastaView" size="15" maxlength="10" styleClass="datos" />
					<a class="link_siat" onclick="return show_calendar('fechaHastaView');" id="a_fechaHastaView">
						<img border="0" src="<%= request.getContextPath()%>/images/calendario.gif"/></a>
				</td>
			</tr>
		</table>
	</fieldset>	
	<!-- PlanImpMin -->
	
	<table class="tablabotones" width="100%" >
	   	<tr>
  	   		<td align="left" width="50%">
	   	    	<html:button property="btnVolver" styleClass="boton" onclick="submitForm('volver', '');">
	   	    		<bean:message bundle="base" key="abm.button.volver"/>
	   	    	</html:button>
   	    	</td>
   	    	<td align="right" width="50%">
				<logic:equal name="planImpMinAdapterVO" property="act" value="modificar">
					<html:button property="btnAceptar"  styleClass="boton" onclick="submitForm('modificar', '');">
						<bean:message bundle="base" key="abm.button.modificar"/>
					</html:button>
				</logic:equal>
				<logic:equal name="planImpMinAdapterVO" property="act" value="agregar">
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
