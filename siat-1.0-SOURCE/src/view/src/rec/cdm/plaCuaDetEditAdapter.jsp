<%@ taglib uri="/tags/struts-bean" prefix="bean" %>
<%@ taglib uri="/tags/struts-html" prefix="html" %>
<%@ taglib uri="/tags/struts-logic" prefix="logic" %>

<!-- Tabla que contiene todos los formularios -->
<html:form styleId="filter" action="/rec/AdministrarPlaCuaDet.do">
	
	<!-- Mensajes y/o Advertencias -->
	<%@ include file="/base/warning.jsp" %>
	<!-- Errors  -->
	<html:errors bundle="base"/>				
	
	<h1><bean:message bundle="rec" key="rec.plaCuaDetEditAdapter.title"/></h1>

	<table class="tablabotones" width="100%">
		<tr>			
			<td align="right">
    			<html:button property="btnVolver"  styleClass="boton" onclick="submitForm('volver', '');">
					<bean:message bundle="base" key="abm.button.volver"/>
				</html:button>
			</td>
		</tr>
	</table>
	
	<!-- PlanillaCuadra -->
	<fieldset>
		<legend><bean:message bundle="rec" key="rec.planillaCuadra.title"/></legend>
		<table class="tabladatos">
			<!-- Nro planilla -->			
			<tr>
				<td><label><bean:message bundle="rec" key="rec.planillaCuadra.numeroPlanilla.label"/>: </label></td>
				<td class="normal"><bean:write name="plaCuaDetAdapterVO" property="plaCuaDet.planillaCuadra.idView"/></td>
			</tr>
			<!-- Recurso -->
			<tr>
				<td><label><bean:message bundle="def" key="def.recurso.label"/>: </label></td>
				<td class="normal"><bean:write name="plaCuaDetAdapterVO" property="plaCuaDet.planillaCuadra.recurso.desRecurso"/></td>
			</tr>
			<!-- Contrato -->
			<tr>	
				<td><label><bean:message bundle="rec" key="rec.contrato.label"/>: </label></td>
				<td class="normal"><bean:write name="plaCuaDetAdapterVO" property="plaCuaDet.planillaCuadra.contrato.descripcion"/></td>				
			</tr>
			<!-- TipoObra -->
			<tr>	
				<td><label><bean:message bundle="rec" key="rec.tipoObra.label"/>: </label></td>
				<td class="normal"><bean:write name="plaCuaDetAdapterVO" property="plaCuaDet.planillaCuadra.tipoObra.desTipoObra"/></td>				
			</tr>
			<tr>
				<!-- Fecha -->
				<td><label><bean:message bundle="rec" key="rec.planillaCuadra.fechaCarga.label"/>: </label></td>
				<td class="normal"><bean:write name="plaCuaDetAdapterVO" property="plaCuaDet.planillaCuadra.fechaCargaView"/></td>				
			</tr>
			<tr>
				<!-- Descripcion -->
				<td><label><bean:message bundle="rec" key="rec.planillaCuadra.descripcion.label"/>: </label></td>
				<td class="normal"><bean:write name="plaCuaDetAdapterVO" property="plaCuaDet.planillaCuadra.descripcion"/></td>				
			</tr>
			<tr>
				<!-- costo cuadra -->
				<td><label><bean:message bundle="rec" key="rec.planillaCuadra.costoCuadra.label"/>: </label></td>
				<td class="normal"><bean:write name="plaCuaDetAdapterVO" property="plaCuaDet.planillaCuadra.costoCuadraView"/></td>				
			</tr>

			<tr>
				<!-- Calle Principal -->
				<td><label><bean:message bundle="rec" key="rec.planillaCuadra.callePpal.label"/>: </label></td>
				<td class="normal"><bean:write name="plaCuaDetAdapterVO" property="plaCuaDet.planillaCuadra.callePpal.nombreCalle"/></td>
			</tr>
			<tr>
				<!-- Calle Desde -->
				<td><label><bean:message bundle="rec" key="rec.planillaCuadra.calleDesde.label"/>: </label></td>
				<td class="normal"><bean:write name="plaCuaDetAdapterVO" property="plaCuaDet.planillaCuadra.calleDesde.nombreCalle"/></td>				
			</tr>
			<tr>
				<!-- Calle Hasta -->
				<td><label><bean:message bundle="rec" key="rec.planillaCuadra.calleHasta.label"/>: </label></td>
				<td class="normal"><bean:write name="plaCuaDetAdapterVO" property="plaCuaDet.planillaCuadra.calleHasta.nombreCalle"/></td>				
			</tr>
			<tr>
				<!-- Observacion -->
				<td><label><bean:message bundle="rec" key="rec.planillaCuadra.observacion.label"/>: </label></td>
				<td class="normal"><bean:write name="plaCuaDetAdapterVO" property="plaCuaDet.planillaCuadra.observacion"/></td>				
			</tr>
			<tr>
				<!-- Estado -->
				<td><label><bean:message bundle="rec" key="rec.estPlaCua.label" />: </label></td>
				<td class="normal"><bean:write name="plaCuaDetAdapterVO" property="plaCuaDet.planillaCuadra.estPlaCua.desEstPlaCua"/></td>
			</tr>
	</table>
	</fieldset>	
	<!-- PlanillaCuadra -->
	
	<!-- PlaCuaDet -->
	<fieldset>
		<legend><bean:message bundle="rec" key="rec.plaCuaDet.title"/></legend>
		<table class="tabladatos">
			<logic:equal name="plaCuaDetAdapterVO" property="plaCuaDet.isCarpeta" value="false">
				<tr>
					<!-- Catastral -->
					<td><label><bean:message bundle="rec" key="rec.plaCuaDet.catastral.label"/>: </label></td>
					<td class="normal"><bean:write name="plaCuaDetAdapterVO" property="plaCuaDet.cuentaTGI.objImp.claveFuncional"/></td>				
					<!-- Cuenta TGI -->
					<td><label><bean:message bundle="rec" key="rec.plaCuaDet.cuentaTGI.label"/>: </label></td>
					<td class="normal"><bean:write name="plaCuaDetAdapterVO" property="plaCuaDet.cuentaTGI.numeroCuenta"/></td>
				</tr>
				<tr>
					<!-- Valuacion -->
					<td><label><bean:message bundle="rec" key="rec.plaCuaDet.valuacionTerreno.label"/>: </label></td>
					<td class="normal"><bean:write name="plaCuaDetAdapterVO" property="plaCuaDet.valuacionTerrenoView"/></td>				

					<!-- Uso Catastro -->
					<td><label><bean:message bundle="rec" key="rec.plaCuaDet.usoCatastro.label"/>: </label></td>
					<td class="normal"><bean:write name="plaCuaDetAdapterVO" property="plaCuaDet.usoCatastroView"/></td>				
				</tr>
				<tr>
					<!-- Uso CdM -->
					<td><label><bean:message bundle="rec" key="rec.plaCuaDet.usoCdM.label"/>: </label></td>
					<td class="normal">
						<html:select name="plaCuaDetAdapterVO" property="plaCuaDet.usoCdM.id" styleClass="select">
							<html:optionsCollection name="plaCuaDetAdapterVO" property="listUsoCdM" label="desUsoCdM" value="id" />
						</html:select>
					</td>					
				</tr>
			</logic:equal>
			<logic:equal name="plaCuaDetAdapterVO" property="plaCuaDet.isCarpeta" value="true">			
				<tr>			
					<!-- agrupador/carpera -->
					<td><label><bean:message bundle="rec" key="rec.plaCuaDet.agrupador.label"/>: </label></td>
					<td class="normal"><bean:write name="plaCuaDetAdapterVO" property="plaCuaDet.agrupador"/></td>				
				</tr>
			</logic:equal>			
			<tr>
				<!-- Cantidad de metros -->
				<td><label><bean:message bundle="rec" key="rec.plaCuaDet.cantidadMetros.label"/>: </label></td>
				<td class="normal">
					<html:text name="plaCuaDetAdapterVO" property="plaCuaDet.cantidadMetrosView" size="10" maxlength="10" />
				</td>
				<!-- Unidades tributarias -->
				<td><label><bean:message bundle="rec" key="rec.plaCuaDet.cantidadUnidades.label"/>: </label></td>
				<td class="normal">
					<html:text name="plaCuaDetAdapterVO" property="plaCuaDet.cantidadUnidadesView" size="10" maxlength="10" />
				</td>
			</tr>
		</table>
		<logic:equal name="plaCuaDetAdapterVO" property="plaCuaDet.isCarpeta" value="true">	
			<!-- PlaCuaDet hijos -->
			
				<table class="tramonline" border="0" cellpadding="0" cellspacing="1" width="100%">            
					<caption><bean:message bundle="rec" key="rec.plaCuaDet.listPlaCuaDet.label"/></caption>
			    	<tbody>
						<logic:notEmpty  name="plaCuaDetAdapterVO" property="plaCuaDet.listPlaCuaDet">
					    	<tr>
								<th align="left"><bean:message bundle="rec" key="rec.plaCuaDet.catastral.label"/></th>
								<th align="left"><bean:message bundle="rec" key="rec.plaCuaDet.cuentaTGI.label"/></th>							
								<th align="left"><bean:message bundle="rec" key="rec.plaCuaDet.porcPH.label"/></th>
								<th align="left"><bean:message bundle="rec" key="rec.plaCuaDet.cantidadMetros.ref"/></th>
								<th align="left"><bean:message bundle="rec" key="rec.plaCuaDet.cantidadUnidades.ref"/></th>
								<th align="left"><bean:message bundle="rec" key="rec.plaCuaDet.valuacionTerreno.label"/></th>
								<th align="left"><bean:message bundle="rec" key="rec.plaCuaDet.usoCdM.label"/></th>								
							</tr>
							<logic:iterate id="PlaCuaDetHijoVO" name="plaCuaDetAdapterVO" property="plaCuaDet.listPlaCuaDet">
								<tr>
									<td><bean:write name="PlaCuaDetHijoVO" property="cuentaTGI.objImp.claveFuncional"/>&nbsp;</td>
									<td><bean:write name="PlaCuaDetHijoVO" property="cuentaTGI.numeroCuenta"/>&nbsp;</td>
									<td><bean:write name="PlaCuaDetHijoVO" property="porcPHView"/>&nbsp;</td>	
									<td><bean:write name="PlaCuaDetHijoVO" property="cantidadMetrosView"/>&nbsp;</td>	
									<td><bean:write name="PlaCuaDetHijoVO" property="cantidadUnidadesView"/>&nbsp;</td>
									<td><bean:write name="PlaCuaDetHijoVO" property="valuacionTerrenoView"/>&nbsp;</td>	
									<!-- Uso CdM -->
									<td class="normal">
										<bean:define id="idUsoCmdSelected" name="PlaCuaDetHijoVO" property="usoCdM.id"/>
										<select name="<bean:write name="PlaCuaDetHijoVO" property="id" bundle="base" formatKey="general.format.id" />">
											<logic:iterate id="uso" name="plaCuaDetAdapterVO" property="listUsoCdM">
												<bean:define id="usoId" name="uso" property="id"/>
												<% String idUso = ""+usoId+"";%>
												<option value="<bean:write name="uso" property="id" bundle="base" formatKey="general.format.id" />"
													<logic:equal name="idUsoCmdSelected" value="<%=idUso%>">
														selected="selected"											
													</logic:equal>
												> 
													<bean:write name="uso" property="desUsoCdM"/> 
												</option>
											</logic:iterate>
										</select>
										
									</td>	
								</tr>
							</logic:iterate>
						</logic:notEmpty>
						<logic:empty  name="plaCuaDetAdapterVO" property="plaCuaDet.listPlaCuaDet">
							<tr><td align="center">
							<bean:message bundle="base" key="base.noExistenRegitros"/>
							</td></tr>
						</logic:empty>					
					</tbody>
				</table>
			<!-- PlaCuaDet hijos -->
		</logic:equal>
	</fieldset>	
	<!-- PlaCuaDet -->
	
	<table class="tablabotones" width="100%" >
	   	<tr>
  	   		<td align="left" width="50%">
	   	    	<html:button property="btnVolver" styleClass="boton" onclick="submitForm('volver', '');">
	   	    		<bean:message bundle="base" key="abm.button.volver"/>
	   	    	</html:button>
   	    	</td>
   	    	<td align="right" width="50%">
				<logic:equal name="plaCuaDetAdapterVO" property="act" value="modificar">
					<html:button property="btnAceptar"  styleClass="boton" onclick="submitForm('modificar', '');">
						<bean:message bundle="base" key="abm.button.modificar"/>
					</html:button>
				</logic:equal>
				<logic:equal name="plaCuaDetAdapterVO" property="act" value="agregar">
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