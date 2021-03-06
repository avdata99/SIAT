<%@ taglib uri="/tags/struts-bean" prefix="bean" %>
<%@ taglib uri="/tags/struts-html" prefix="html" %>
<%@ taglib uri="/tags/struts-logic" prefix="logic" %>

	<!-- Tabla que contiene todos los formularios -->
	<html:form styleId="filter" action="/def/AdministrarTipObjImpAreO.do">

		<!-- Mensajes y/o Advertencias -->
		<%@ include file="/base/warning.jsp" %>
		<!-- Errors  -->
		<html:errors bundle="base"/>
		
		<h1><bean:message bundle="def" key="def.tipObjImpAreOAdapter.title"/></h1>	
		<table class="tablabotones" width="100%">
			<tr>			
				<td align="right">
	    			<html:button property="btnVolver"  styleClass="boton" onclick="submitForm('volver', '');">
						<bean:message bundle="base" key="abm.button.volver"/>
					</html:button>
				</td>
			</tr>
		</table>
		
		<!-- TipObjImpAreO -->
		<fieldset>
			<legend><bean:message bundle="def" key="def.tipObjImpAreO.title"/></legend>
			<table class="tabladatos">
				<tr>
					<td><label><bean:message bundle="def" key="def.tipObjImp.codTipObjImp.ref"/>: </label></td>
					<td class="normal"><bean:write name="tipObjImpAreOAdapterVO" property="tipObjImpAreO.tipObjImp.codTipObjImp"/></td>
					<td><label><bean:message bundle="def" key="def.tipObjImp.desTipObjImp.ref"/>: </label></td>
					<td class="normal"><bean:write name="tipObjImpAreOAdapterVO" property="tipObjImpAreO.tipObjImp.desTipObjImp" /></td>
				</tr>
				<tr>
					<td><label><bean:message bundle="def" key="def.area.label"/>: </label></td>
					<td class="normal">	<bean:write name="tipObjImpAreOAdapterVO" property="tipObjImpAreO.areaOrigen.desArea" /> </td>
					<td><label><bean:message bundle="def" key="def.tipObjImpAreO.estado.label"/>: </label></td>
					<td class="normal"><bean:write name="tipObjImpAreOAdapterVO" property="tipObjImpAreO.estado.value"/></td>
				</tr>
			</table>
		</fieldset>	
		<!-- TipObjImpAreO -->

		<table class="tablabotones" width="100%">
	    	<tr>
  	    		<td align="left" width="50%">
		   	    	<html:button property="btnVolver"  styleClass="boton" onclick="submitForm('volver', '');">
						<bean:message bundle="base" key="abm.button.volver"/>
					</html:button>	   	    			
	   	    	</td>
  	    		<td align="right" width="50%">	   	    	
					<logic:equal name="tipObjImpAreOAdapterVO" property="act" value="eliminar">
						<html:button property="btnAceptar"  styleClass="boton" onclick="submitForm('eliminar', '');">
							<bean:message bundle="base" key="abm.button.eliminar"/>
						</html:button>
					</logic:equal>
					<logic:equal name="tipObjImpAreOAdapterVO" property="act" value="desactivar">
						<html:button property="btnAceptar"  styleClass="boton" onclick="submitForm('desactivar', '');">
							<bean:message bundle="base" key="abm.button.desactivar"/>
						</html:button>
					</logic:equal>
					<logic:equal name="tipObjImpAreOAdapterVO" property="act" value="activar">
						<html:button property="btnAceptar"  styleClass="boton" onclick="submitForm('activar', '');">
							<bean:message bundle="base" key="abm.button.activar"/>
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
		
	</html:form>
	<!-- Fin Tabla que contiene todos los formularios -->
