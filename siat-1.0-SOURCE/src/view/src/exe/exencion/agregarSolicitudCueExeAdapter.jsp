<%@ taglib uri="/tags/struts-bean" prefix="bean" %>
<%@ taglib uri="/tags/struts-html" prefix="html" %>
<%@ taglib uri="/tags/struts-logic" prefix="logic" %>

<!-- Tabla que contiene todos los formularios -->
<html:form styleId="filter" action="/exe/AdministrarCambioEstadoCueExe.do">

	<!-- Mensajes y/o Advertencias -->
	<%@ include file="/base/warning.jsp" %>
	<!-- Errors  -->
	<html:errors bundle="base"/>				
	
	<h1><bean:message bundle="exe" key="exe.cueExeEditAdapter.title"/></h1>	
	
	<table class="tablabotones" width="100%">
		<tr>			
			<td align="right">
	   			<html:button property="btnVolver"  styleClass="boton" onclick="submitForm('volver', '');">
					<bean:message bundle="base" key="abm.button.volver"/>
				</html:button>
			</td>
		</tr>
	</table>

	<!-- datos del Objeto Imponible -->
	<logic:greaterThan name="cambioEstadoCueExeAdapterVO" property="cueExe.cuenta.id" value="0">
		<fieldset>
			<legend><bean:message bundle="exe" key="exe.objImp.title"/></legend>		
				<table class="tabladatos">
					<tr>
						<td><label><bean:write name="cambioEstadoCueExeAdapterVO" property="cueExe.cuenta.objImp.desClave"/>:</label></td>
						<td class="normal">
							&nbsp;<bean:write name="cambioEstadoCueExeAdapterVO" property="cueExe.cuenta.objImp.clave"/>
						</td>
					</tr>
					<tr>
						<td><label><bean:write name="cambioEstadoCueExeAdapterVO" property="cueExe.cuenta.objImp.desClaveFuncional"/>:</label></td>
						<td class="normal">
							&nbsp;<bean:write name="cambioEstadoCueExeAdapterVO" property="cueExe.cuenta.objImp.claveFuncional"/>
						</td>
					</tr>
				</table>				
		</fieldset>
	</logic:greaterThan>
	
	<!-- CueExe -->
	<fieldset>
		<legend><bean:message bundle="exe" key="exe.cueExe.title"/></legend>
		
		<table class="tabladatos">
			
			<!-- Fecha Solicitud -->
			<tr>
				<td><label><bean:message bundle="exe" key="exe.cueExe.fechaSolicitud.label"/>: </label></td>
				<td class="normal" colspan="3">
					<bean:write name="cambioEstadoCueExeAdapterVO" property="cueExe.fechaSolicitudView"/>
				</td>	
			</tr>
			
			<!-- Recurso -->
			<tr>
				<td><label><bean:message bundle="def" key="def.recurso.label"/>: </label></td>
				<td class="normal" colspan="3">
					<bean:write name="cambioEstadoCueExeAdapterVO" property="cueExe.recurso.desRecurso"/>
				</td>	
			</tr>
			
			<!-- Exencion -->
			<tr>
				<td><label><bean:message bundle="exe" key="exe.exencion.label"/>: </label></td>
				<td class="normal" colspan="3">
					<bean:write name="cambioEstadoCueExeAdapterVO" property="cueExe.exencion.desExencion"/>
				</td>
			</tr>
			
			<!-- Cuenta -->
			<tr>
				<td><label><bean:message bundle="pad" key="pad.cuenta.numeroCuenta.ref"/>: </label></td>
				<td class="normal" colspan="3">
					<bean:write name="cambioEstadoCueExeAdapterVO" property="cueExe.cuenta.numeroCuenta"/>
				</td>
			</tr>
			
			<!-- Tipo Sujeto Solicitante -->
			<tr>
				<td><label><bean:message bundle="exe" key="exe.tipoSujeto.label"/>: </label></td>
				<td class="normal" colspan="3">
					<bean:write name="cambioEstadoCueExeAdapterVO" property="cueExe.tipoSujeto.desTipoSujeto"/>
				</td>	
			</tr>
			
			<!-- Fecha Desde / Hasta  -->
			<tr>

				<td><label><bean:message bundle="exe" key="exe.cueExe.fechaDesde.label"/>: </label></td>
				<td class="normal"><bean:write name="cambioEstadoCueExeAdapterVO" property="cueExe.fechaDesdeView" /></td>
				
				<td><label><bean:message bundle="exe" key="exe.cueExe.fechaHasta.label"/>: </label></td>
				<td class="normal"><bean:write name="cambioEstadoCueExeAdapterVO" property="cueExe.fechaHastaView" /></td>
			</tr>
		
			<!-- Solicitante -->
			<tr>
				<td><label><bean:message bundle="exe" key="exe.cueExe.solicitante.label"/>: </label></td>
				<td class="normal" colspan="3">
					<bean:write name="cambioEstadoCueExeAdapterVO" property="cueExe.solicitante.view"/>
				</td>	
			</tr>
			
			<!-- Descripcion Solicitante -->
			<tr>
				<td><label><bean:message bundle="exe" key="exe.cueExe.solicDescripcion.label"/>: </label></td>
				<td class="normal" colspan="3"><bean:write name="cambioEstadoCueExeAdapterVO" property="cueExe.solicDescripcion"/></td>			
			</tr>
			
			<!-- Fecha Resolucion -->
			<tr>
				<td><label><bean:message bundle="exe" key="exe.cueExe.fechaResolucion.label"/>: </label></td>
				<td class="normal" colspan="3">
					<bean:write name="cambioEstadoCueExeAdapterVO" property="cueExe.fechaResolucionView"/>
				</td>	
			</tr>
			
			<!-- Fecha Ultima Inspeccion -->
			<tr>
				<td><label><bean:message bundle="exe" key="exe.cueExe.fechaUltIns.label"/>: </label></td>
				<td class="normal" colspan="3">
					<bean:write name="cambioEstadoCueExeAdapterVO" property="cueExe.fechaUltInsView"/>
				</td>
			</tr>
			
			<!-- Fecha Presentacion -->
			<tr>
				<td><label><bean:message bundle="exe" key="exe.cueExe.fechaPresent.label"/>: </label></td>
				<td class="normal" colspan="3">
					<bean:write name="cambioEstadoCueExeAdapterVO" property="cueExe.fechaPresentView"/>
				</td>
			</tr>
			
			<!-- Documentacion -->
			<tr>
				<td><label><bean:message bundle="exe" key="exe.cueExe.documentacion.label"/>: </label></td>
				<td class="normal" colspan="3">
					<bean:write name="cambioEstadoCueExeAdapterVO" property="cueExe.documentacion"/>
				</td>
			</tr>

			<!-- Fecha Desde / Hasta  -->
			<logic:equal name="cambioEstadoCueExeAdapterVO" property="act" value="modificar">
				<tr>
					<td><label><bean:message bundle="exe" key="exe.cueExe.solicFechaDesde.label"/>: </label></td>
					<td class="normal">
						<bean:write name="cambioEstadoCueExeAdapterVO" property="cueExe.solicFechaDesdeView"/>
					</td>
					
					<td><label><bean:message bundle="exe" key="exe.cueExe.solicFechaHasta.label"/>: </label></td>
					<td class="normal">
						<bean:write name="cambioEstadoCueExeAdapterVO" property="cueExe.solicFechaHastaView"/>					
					</td>
				</tr>
			</logic:equal>
			
			<!-- Ordenanza / Articulo -->
			<tr>
				<td><label><bean:message bundle="exe" key="exe.cueExe.ordenanza.label"/>: </label></td>
				<td class="normal"><bean:write name="cambioEstadoCueExeAdapterVO" property="cueExe.ordenanza"/></td>			
				<td><label><bean:message bundle="exe" key="exe.cueExe.articulo.label"/>: </label></td>
				<td class="normal"><bean:write name="cambioEstadoCueExeAdapterVO" property="cueExe.articulo"/></td>			
			</tr>

			<!-- Inciso -->
			<tr>
				<td><label><bean:message bundle="exe" key="exe.cueExe.inciso.label"/>: </label></td>
				<td class="normal" colspan="3"><bean:write name="cambioEstadoCueExeAdapterVO" property="cueExe.inciso"/></td>
			</tr>
			
						
			<!-- Observaciones -->
			<tr>
				<td><label><bean:message bundle="exe" key="exe.cueExe.observaciones.label"/>: </label></td>
				<td class="normal" colspan="3">
					<bean:write name="cambioEstadoCueExeAdapterVO" property="cueExe.observaciones"/>
				</td>
			</tr>
			
			<!-- Caso -->
			<!-- Inclucion de CasoView -->
			<tr>
				<td><label><bean:message bundle="cas" key="cas.caso.label"/>: </label></td>
				<td colspan="3">
					<bean:define id="IncludedVO" name="cambioEstadoCueExeAdapterVO" property="cueExe"/>
					<%@ include file="/cas/caso/includeCasoView.jsp" %>				
				</td>
			</tr>
			<!-- Fin Inclucion de CasoView -->
			
						<!-- solic Fecha Desde / solic Hasta  -->
			<logic:equal name="cambioEstadoCueExeAdapterVO" property="poseeSolicFechas" value="true">
				<tr>
					<td><bean:message bundle="exe" key="exe.cueExe.solicFechaMigracion.msg"/>: </td>
					<td class="normal" colspan="3">
						<bean:message bundle="exe" key="exe.cueExe.solicFechaDesde.label"/>: &nbsp;
						<bean:write name="cambioEstadoCueExeAdapterVO" property="cueExe.solicFechaDesdeView"/>
						&nbsp; -
						<bean:message bundle="exe" key="exe.cueExe.solicFechaHasta.label"/>: &nbsp;
						<bean:write name="cambioEstadoCueExeAdapterVO" property="cueExe.solicFechaHastaView"/>					
					</td>
				</tr>
			</logic:equal>
			
		</table>
	</fieldset>

<logic:equal name="cambioEstadoCueExeAdapterVO" property="esExencionJubilado" value="true">
	<fieldset>
		<legend><bean:message bundle="exe" key="exe.cueExeAdapter.datosExtraJubilado"/></legend>
		<table class="tabladatos">		
			
			<!--  Nro Beneficiario / Caja -->
			<tr>
				<td><label><bean:message bundle="exe" key="exe.cueExe.nroBeneficiario.label"/>: </label></td>
				<td class="normal"><bean:write name="cambioEstadoCueExeAdapterVO" property="cueExe.nroBeneficiario" /></td>			
				<td><label><bean:message bundle="exe" key="exe.cueExe.caja.label"/>: </label></td>
				<td class="normal"><bean:write name="cambioEstadoCueExeAdapterVO" property="cueExe.caja"/></td>			
			</tr>
			
			<!-- Clase -->
			<tr>
				<td><label><bean:message bundle="exe" key="exe.cueExe.clase.label"/>: </label></td>
				<td class="normal"><bean:write name="cambioEstadoCueExeAdapterVO" property="cueExe.claseView"/></td>			
			</tr>
			
			<!-- Fecha Vencimiento Contrato inquilino  -->
			<tr>
				<td><label><bean:message bundle="exe" key="exe.cueExe.fechaVencContInq.label"/>: </label></td>
				<td class="normal">
					<bean:write name="cambioEstadoCueExeAdapterVO" property="cueExe.fechaVencContInqView"/>
				</td>
			</tr>
			
		</table>
	</fieldset>		
</logic:equal>			
		
		<!-- Historio Estados -->		
		<table class="tramonline" border="0" cellpadding="0" cellspacing="1" width="100%">            
			<caption><bean:message bundle="exe" key="exe.cueExe.listHisEstCueExe.label"/></caption>
	    	<tbody>
				<logic:notEmpty  name="cambioEstadoCueExeAdapterVO" property="cueExe.listHisEstCueExe">	    	
			    	<tr>
						<th align="left"><bean:message bundle="exe" key="exe.hisEstCueExe.fecha.label"/></th>
						<th align="left"><bean:message bundle="base" key="base.estado.label"/></th>
						<th align="left"><bean:message bundle="exe" key="exe.hisEstCueExe.observaciones.label"/></th>
						<th align="left"><bean:message bundle="exe" key="exe.hisEstCueExe.logCambios.label"/></th>
					</tr>
					<logic:iterate id="HisEstCueExeVO" name="cambioEstadoCueExeAdapterVO" property="cueExe.listHisEstCueExe">
			
						<tr>
							<td><bean:write name="HisEstCueExeVO" property="fechaView"/>&nbsp;</td>
							<td><bean:write name="HisEstCueExeVO" property="estadoCueExe.desEstadoCueExe"/>&nbsp;</td>
							<td><bean:write name="HisEstCueExeVO" property="observaciones"/>&nbsp;</td>
							<td><bean:write name="HisEstCueExeVO" property="logCambios"/>&nbsp;</td>
						</tr>
					</logic:iterate>
				</logic:notEmpty>
				<logic:empty  name="cambioEstadoCueExeAdapterVO" property="cueExe.listHisEstCueExe">
					<tr><td align="center">
					<bean:message bundle="base" key="base.noExistenRegitros"/>
					</td></tr>
				</logic:empty>
			</tbody>
		</table>
		<!-- Historio Estados -->

	<!-- Estado -->
	<fieldset>
		<legend><bean:message bundle="exe" key="exe.cueExeAdapter.estado.title"/></legend>
	
		<table width="100%" class="tabladatos">
			<!-- Estado -->
			<tr>
				<td width="50%"><label><bean:message bundle="base" key="base.estado.label"/>: </label></td>
				<td width="50%" class="normal">
					<bean:write name="cambioEstadoCueExeAdapterVO" property="cueExe.estadoCueExe.desEstadoCueExe"/>
				</td>	
			</tr>
		</table>		
	</fieldset>
	
	
	<fieldset>
		<legend><bean:message bundle="exe" key="exe.cueExeAdapter.solicitud.title"/></legend>
	
		<table width="100%" class="tabladatos">
			<!-- Estado -->
			<tr>
				<td width="50%"><label>(*)&nbsp;<bean:message bundle="exe" key="exe.cueExeAdapter.solicitud.title"/>: </label></td>
				<td width="50%" class="normal">
					<html:select name="cambioEstadoCueExeAdapterVO" property="cueExe.estadoCueExe.id" styleClass="select">
						<html:optionsCollection name="cambioEstadoCueExeAdapterVO" property="listEstadoCueExe" label="desEstadoCueExe" value="id" />
					</html:select>
				</td>	
			</tr>

		</table>		
	</fieldset>

	<!-- CueExe -->
	
	<table class="tablabotones" width="100%" >
	   	<tr>
  	   		<td align="left" width="50%">
	   	    	<html:button property="btnVolver" styleClass="boton" onclick="submitForm('volver', '');">
	   	    		<bean:message bundle="base" key="abm.button.volver"/>
	   	    	</html:button>
   	    	</td>
   	    	<td align="right" width="50%">
				<html:button property="btnAceptar"  styleClass="boton" onclick="submitForm('agregarSolicitud', '');">
					<bean:message bundle="exe" key="exe.cueExeAdapter.button.agregarSolicitud"/>
				</html:button>
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
