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
	<html:form styleId="filter" action="/bal/AdministrarOtrIngTes.do">

		<!-- Mensajes y/o Advertencias -->
		<%@ include file="/base/warning.jsp" %>
		<!-- Errors  -->
		<html:errors bundle="base"/>
		
		<h1><bean:message bundle="bal" key="bal.otrIngTesAdapter.title"/></h1>		
		<table class="tablabotones" width="100%">
			<tr>			
				<td align="right">
	    			<html:button property="btnVolver"  styleClass="boton" onclick="submitForm('volver', '');">
						<bean:message bundle="base" key="abm.button.volver"/>
					</html:button>
				</td>
			</tr>
		</table>
				
		<!-- OtrIngTes -->
		<fieldset>
			<legend><bean:message bundle="bal" key="bal.otrIngTes.title"/></legend>
			
			<table class="tabladatos">
				<!-- Recurso -->		
				<tr>
					<td><label>(*)&nbsp;<bean:message bundle="def" key="def.recurso.label"/>: </label></td>
					<td class="normal">
					<logic:equal name="otrIngTesAdapterVO" property="act" value="agregar">		
						<html:select name="otrIngTesAdapterVO" property="otrIngTes.recurso.id" styleClass="select" onchange="submitForm('paramRecurso', '');" >
							<bean:define id="includeRecursoList" name="otrIngTesAdapterVO" property="listRecurso"/>
							<bean:define id="includeIdRecursoSelected" name="otrIngTesAdapterVO" property="otrIngTes.recurso.id"/>
							<%@ include file="/def/gravamen/includeRecurso.jsp" %>
						</html:select>
		  			</logic:equal>
					<logic:equal name="otrIngTesAdapterVO" property="act" value="modificar">		
						<bean:write name="otrIngTesAdapterVO" property="otrIngTes.recurso.desRecurso"/>
					</logic:equal>
					</td>
				</tr>
				<tr>
					<!-- Area -->		
					<td><label>(*)&nbsp;<bean:message bundle="def" key="def.area.label"/>: </label></td>
					<td  colspan="4" class="normal">	
						<html:select name="otrIngTesAdapterVO" property="otrIngTes.areaOrigen.id" styleClass="select">
							<html:optionsCollection name="otrIngTesAdapterVO" property="listAreaOrigen" label="desArea" value="id" />
						</html:select>
					</td>
				</tr>
				<tr>
					<!-- CuentaBanco Origen -->		
					<td><label>&nbsp;<bean:message bundle="bal" key="bal.otrIngTes.cueBanOrigen.label"/>: </label></td>
					<td class="normal">	
						<html:select name="otrIngTesAdapterVO" property="otrIngTes.cueBanOrigen.id" styleClass="select">
							<html:optionsCollection name="otrIngTesAdapterVO" property="listCuentaBanco" label="nroCuenta" value="id" />
						</html:select>
					</td>
				</tr>	
				<tr>
					<!-- Fecha -->		
					<td><label>(*)&nbsp;<bean:message bundle="bal" key="bal.otrIngTes.fechaOtrIngTes.label"/>: </label></td>
					<td class="normal">
						<html:text name="otrIngTesAdapterVO" property="otrIngTes.fechaOtrIngTesView" styleId="fechaOtrIngTesView" size="10" maxlength="10" styleClass="datos" />
						<a class="link_siat" onclick="return show_calendar('fechaOtrIngTesView');" id="a_fechaOtrIngTesView">
							<img border="0" src="<%= request.getContextPath()%>/images/calendario.gif"/></a>
					</td>
				</tr>
				<!-- Importe -->	
				<tr>
					<td><label>(*)&nbsp;<bean:message bundle="bal" key="bal.otrIngTes.importe.label"/>: </label></td>
					<td class="normal"><html:text name="otrIngTesAdapterVO" property="otrIngTes.importeView" size="20" maxlength="255" onchange="calcularValor(this);"/></td>
				</tr>	
				<!-- Descripcion -->		
				<tr>
					<td><label>(*)&nbsp;<bean:message bundle="bal" key="bal.otrIngTes.descripcion.label"/>: </label></td>
					<td colspan="4" class="normal"><html:text name="otrIngTesAdapterVO" property="otrIngTes.descripcion" size="35" maxlength="50" styleClass="datos"/></td>					
				</tr>
				<!-- Observacion-->		
				<tr>
					<td><label>&nbsp;<bean:message bundle="bal" key="bal.otrIngTes.observacion.label"/>: </label></td>
					<td colspan="3" class="normal"><html:textarea name="otrIngTesAdapterVO" property="otrIngTes.observaciones" cols="75" rows="15"/></td>					
				</tr>
			</table>
		</fieldset>
		
		<logic:equal name="otrIngTesAdapterVO" property="paramUnicoConcepto" value="false">
		<!-- Lista de conceptos del OtrIngTes (OtrIngTesRecCon)-->
		<fieldset>
			<legend><bean:message bundle="bal" key="bal.otrIngTesRecCon.title"/></legend>
			<table class="tabladatos">
			<!-- lista de conceptos -->
			<tr>
				<td>&nbsp;</td>				
				<td>				
					<logic:equal name="otrIngTesAdapterVO" property="paramRecurso" value="true">
						<table class="tramonline" border="0" cellpadding="0" cellspacing="1">
							<caption>Conceptos</caption>
              				<tbody>
								<logic:notEmpty name="otrIngTesAdapterVO" property="otrIngTes.listOtrIngTesRecCon">
									<logic:iterate id="OtrIngTesRecConVO" name="otrIngTesAdapterVO" property="otrIngTes.listOtrIngTesRecCon">
										<tr>
										<td><bean:write name="OtrIngTesRecConVO" property="recCon.desRecCon"/></td>
										<td>
											<input type="text" onchange="calcularValor(this);" size="20" maxlength="255" name="importe<bean:write name="OtrIngTesRecConVO" property="idView"/>"
												value="<bean:write name="OtrIngTesRecConVO" property="importeView"/>"/>
										</td>
	  									</tr>	
									</logic:iterate>
								</logic:notEmpty>
								<logic:empty name="otrIngTesAdapterVO" property="otrIngTes.listOtrIngTesRecCon">								
									<tr><td colspan="2"><bean:message bundle="bal" key="bal.otrIngTesAdapter.listOtrIngTesRecCon.vacia"/></td></tr>
								</logic:empty>			
							</tbody>
							</table>	
					</logic:equal>
				</td>
				<td>&nbsp;</td>				
			</tr>			
			</table>
		</fieldset>
		<!-- Fin Lista de conceptos del OtrIngTes (OtrIngTesRecCon)-->
		</logic:equal>
		
		<table class="tablabotones" width="100%">
			<tr>				
				<td align="left">
	    			<html:button property="btnVolver"  styleClass="boton" onclick="submitForm('volver', '');">
						<bean:message bundle="base" key="abm.button.volver"/>
					</html:button>
				</td>
				<td align="right">
					<logic:equal name="otrIngTesAdapterVO" property="act" value="modificar">
						<html:button property="btnAceptar"  styleClass="boton" onclick="submitForm('modificar', '');">
							<bean:message bundle="base" key="abm.button.modificar"/>
						</html:button>
					</logic:equal>
					<logic:equal name="otrIngTesAdapterVO" property="act" value="agregar">
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
		