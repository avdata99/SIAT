<%@ taglib uri="/tags/struts-bean" prefix="bean" %>
<%@ taglib uri="/tags/struts-html" prefix="html" %>
<%@ taglib uri="/tags/struts-logic" prefix="logic" %>

<!-- Tabla que contiene todos los formularios -->
<html:form styleId="filter" action="/bal/BuscarIndet.do">

	<!-- Mensajes y/o Advertencias -->
	<%@ include file="/base/warning.jsp" %>
	<!-- Errors  -->
	<html:errors bundle="base"/>
		
	<h1><bean:message bundle="bal" key="bal.indetSearchPage.title"/></h1>	
		
	<table class="tablabotones" width="100%">
		<tr>
			<td align="left">
				<p>
					<logic:equal name="indetSearchPageVO" property="modoSeleccionar" value="true">
						<bean:message bundle="base" key="base.busquedaLegendBusqueda"/>
						<bean:message bundle="bal" key="bal.indet.label"/>
					</logic:equal>
					<logic:notEqual name="indetSearchPageVO" property="modoSeleccionar" value="true">
						<bean:message bundle="bal" key="bal.indetSearchPage.legend"/>
					</logic:notEqual>		
				</p>
			</td>				
			<td align="right">
	 			<html:button property="btnVolver"  styleClass="boton" onclick="submitForm('volver', '');">
					<bean:message bundle="base" key="abm.button.volver"/>
				</html:button>
			</td>
		</tr>
	</table>
		
	<!-- Filtro -->
	<fieldset>
	<legend><bean:message bundle="base" key="base.parametrosBusqueda"/></legend>
		<table class="tabladatos">
			<tr>
				<td><label><bean:message bundle="bal" key="bal.indet.sistema.label"/>: </label></td>
				<td class="normal"><html:text name="indetSearchPageVO" property="indet.sistema" size="10" maxlength="5" styleClass="datos" /></td>
			
				<td><label><bean:message bundle="bal" key="bal.indet.nroComprobante.label"/>: </label></td>
				<td class="normal"><html:text name="indetSearchPageVO" property="indet.nroComprobante" size="20" maxlength="100" styleClass="datos" /></td>
			</tr>
			<tr>
				<td><label><bean:message bundle="bal" key="bal.indet.codIndet.label"/>: </label></td>
				<td class="normal"><html:text name="indetSearchPageVO" property="indet.codIndetView" size="5" maxlength="20" styleClass="datos" /></td>
			
				<td><label><bean:message bundle="bal" key="bal.indet.reciboTr.label"/>: </label></td>
				<td class="normal"><html:text name="indetSearchPageVO" property="indet.reciboTr" size="15" maxlength="100" styleClass="datos" /></td>
			</tr>
			<tr>
				<td><label><bean:message bundle="bal" key="bal.indet.fechaBalance.label"/>: </label></td>
				<td class="normal">
					<html:text name="indetSearchPageVO" property="indet.fechaBalanceView" styleId="fechaBalanceView" size="10" maxlength="10" styleClass="datos" />
						<a class="link_siat" onclick="return show_calendar('fechaBalanceView');" id="a_fechaBalanceView">
							<img border="0" src="<%= request.getContextPath()%>/images/calendario.gif"/></a>
				</td>
				<td><label><bean:message bundle="bal" key="bal.indet.fechaPago.label"/>: </label></td>
				<td class="normal">
					<html:text name="indetSearchPageVO" property="indet.fechaPagoView" styleId="fechaPagoView" size="10" maxlength="10" styleClass="datos" />
						<a class="link_siat" onclick="return show_calendar('fechaPagoView');" id="a_fechaPagoView">
							<img border="0" src="<%= request.getContextPath()%>/images/calendario.gif"/></a>
				</td>
			</tr>
			<tr>
				<td><label><bean:message bundle="bal" key="bal.indet.caja.label"/>: </label></td>
				<td class="normal"><html:text name="indetSearchPageVO" property="indet.cajaView" size="5" maxlength="100" styleClass="datos" /></td>

				<td><label><bean:message bundle="bal" key="bal.indet.paquete.label"/>: </label></td>
				<td class="normal"><html:text name="indetSearchPageVO" property="indet.paqueteView" size="5" maxlength="20" styleClass="datos" /></td>
			</tr>
			<tr>
				<td><label><bean:message bundle="bal" key="bal.indet.importeCobrado.label"/>: </label></td>
				<td class="normal"><html:text name="indetSearchPageVO" property="indet.importeCobradoView" size="10" maxlength="100" styleClass="datos" /></td>
				
				<td><label><bean:message bundle="bal" key="bal.indet.tipoIngreso.label"/>: </label></td>
				<td class="normal"><html:text name="indetSearchPageVO" property="indet.tipoIngresoView" size="5" maxlength="10" styleClass="datos" /></td>
			</tr>
		</table>
			
		<p align="center">
		  	<html:button property="btnLimpiar"  styleClass="boton" onclick="submitForm('limpiar', '');">
				<bean:message bundle="base" key="abm.button.limpiar"/>
			</html:button>
			&nbsp;
		  	<html:button property="btnBuscar"  styleClass="boton" onclick="submitForm('buscar', '');">
				<bean:message bundle="base" key="abm.button.buscar"/>
			</html:button>
		</p>
	</fieldset>	
	<!-- Fin Filtro -->
		
	<!-- Resultado Filtro -->
	<div id="resultadoFiltro" style="overflow: auto;">
		<logic:equal name="indetSearchPageVO" property="viewResult" value="true">
			<logic:notEmpty  name="indetSearchPageVO" property="listResult">	
				<table class="tramonline" border="0" cellpadding="0" cellspacing="1" width="100%">
					<caption><bean:message bundle="base" key="base.resultadoBusqueda"/></caption>
	              	<tbody>
		               	<tr>
							<th width="1">&nbsp;</th> <!-- Ver/Seleccionar -->
							<logic:notEqual name="indetSearchPageVO" property="modoSeleccionar" value="true">
								<th width="1">&nbsp;</th> <!-- Modificar -->
								<th width="1">&nbsp;</th> <!-- Desgloce -->
								<th width="1">&nbsp;</th> <!-- Generar Saldo A Favor -->
							</logic:notEqual>
							<th align="left"><bean:message bundle="bal" key="bal.indet.sistema.abr"/></th>
							<th align="left"><bean:message bundle="bal" key="bal.indet.nroComprobante.label"/></th>
							<th align="left"><bean:message bundle="bal" key="bal.indet.clave.label"/></th>
							<th align="left"><bean:message bundle="bal" key="bal.indet.resto.label"/></th>
							<th align="left"><bean:message bundle="bal" key="bal.indet.importeCobrado.label"/></th>
							<th align="left"><bean:message bundle="bal" key="bal.indet.recargo.label"/></th>
							<th align="left"><bean:message bundle="bal" key="bal.indet.codIndet.abr"/></th>
							<th align="left"><bean:message bundle="bal" key="bal.indet.tipoIngreso.label"/></th>
							<th align="left"><bean:message bundle="bal" key="bal.indet.fechaPago.label"/></th>
							<th align="left"><bean:message bundle="bal" key="bal.indet.fechaBalance.label"/></th>
						</tr>
							
						<logic:iterate id="IndetVO" name="indetSearchPageVO" property="listResult">
							<tr>
									<!-- Seleccionar -->
								<logic:equal name="indetSearchPageVO" property="modoSeleccionar" value="true">
									<td>	
										<a style="cursor: pointer; cursor: hand;" onclick="submitForm('seleccionar', '<bean:write name="IndetVO" property="nroIndeterminado" bundle="base" formatKey="general.format.id"/>');">
											<img title="<bean:message bundle="base" key="abm.button.seleccionar"/>" border="0" src="<%=request.getContextPath()%>/images/iconos/selec0.gif"/>
										</a>
									</td>
								</logic:equal>									
								<logic:notEqual name="indetSearchPageVO" property="modoSeleccionar" value="true">
									<!-- Ver -->
									<td>
										<logic:equal name="indetSearchPageVO" property="verEnabled" value="enabled">									
											<a style="cursor: pointer; cursor: hand;" onclick="submitForm('ver', '<bean:write name="IndetVO" property="nroIndeterminado" bundle="base" formatKey="general.format.id"/>');">
												<img title="<bean:message bundle="base" key="abm.button.ver"/>" border="0" src="<%=request.getContextPath()%>/images/iconos/selec0.gif"/>
											</a>
										</logic:equal>
										<logic:notEqual name="IndetVO" property="verEnabled" value="enabled">
											<img border="0" src="<%=request.getContextPath()%>/images/iconos/selec1.gif"/>
										</logic:notEqual>
									</td>	
									<!-- Modificar-->								
									<td>
										<logic:equal name="indetSearchPageVO" property="modificarEnabled" value="enabled">
											<logic:equal name="IndetVO" property="modificarEnabled" value="enabled">
												<a style="cursor: pointer; cursor: hand;" onclick="submitForm('modificar', '<bean:write name="IndetVO" property="nroIndeterminado" bundle="base" formatKey="general.format.id"/>');">
													<img title="<bean:message bundle="bal" key="bal.indetSearchPage.adm.button.modifYReing"/>" border="0" src="<%=request.getContextPath()%>/images/iconos/modifYReing0.gif"/>
												</a>
											</logic:equal>
											<logic:notEqual name="IndetVO" property="modificarEnabled" value="enabled">
												<img border="0" src="<%=request.getContextPath()%>/images/iconos/modifYReing1.gif"/>
											</logic:notEqual>
										</logic:equal>
										<logic:notEqual name="indetSearchPageVO" property="modificarEnabled" value="enabled">
											<img border="0" src="<%=request.getContextPath()%>/images/iconos/modifYReing1.gif"/>
										</logic:notEqual>
									</td>
									<!-- Desgloce-->								
									<td>
										<logic:equal name="indetSearchPageVO" property="desgloceEnabled" value="enabled">
											<a style="cursor: pointer; cursor: hand;" onclick="submitForm('desgloce', '<bean:write name="IndetVO" property="nroIndeterminado" bundle="base" formatKey="general.format.id"/>');">
												<img title="<bean:message bundle="bal" key="bal.indetSearchPage.adm.button.desgloce"/>" border="0" src="<%=request.getContextPath()%>/images/iconos/desgloce0.gif"/>
											</a>
										</logic:equal>
										<logic:notEqual name="indetSearchPageVO" property="desgloceEnabled" value="enabled">
											<img border="0" src="<%=request.getContextPath()%>/images/iconos/desgloce1.gif"/>
										</logic:notEqual>
									</td>
									<!-- Generar Saldo A Favor-->								
									<td>
										<logic:equal name="indetSearchPageVO" property="generarSaldoAFavorEnabled" value="enabled">
											<a style="cursor: pointer; cursor: hand;" onclick="submitForm('generarSaldoAFavor', '<bean:write name="IndetVO" property="nroIndeterminado" bundle="base" formatKey="general.format.id"/>');">
												<img title="<bean:message bundle="bal" key="bal.indetSearchPage.adm.button.generarSaldoAFavor"/>" border="0" src="<%=request.getContextPath()%>/images/iconos/generarSaldo0.gif"/>
											</a>
										</logic:equal>
										<logic:notEqual name="indetSearchPageVO" property="generarSaldoAFavorEnabled" value="enabled">
											<img border="0" src="<%=request.getContextPath()%>/images/iconos/generarSaldo1.gif"/>
										</logic:notEqual>
									</td>
								</logic:notEqual>
								<td><bean:write name="IndetVO" property="sistema"/>&nbsp;</td>
								<td><bean:write name="IndetVO" property="nroComprobante"/>&nbsp;</td>
								<td><bean:write name="IndetVO" property="clave"/>&nbsp;</td>
								<td><bean:write name="IndetVO" property="resto"/>&nbsp;</td>
								<td><bean:write name="IndetVO" property="importeCobradoView"/>&nbsp;</td>
								<td><bean:write name="IndetVO" property="recargoView"/>&nbsp;</td>
								<td><bean:write name="IndetVO" property="codIndetView"/>&nbsp;</td>
								<td><bean:write name="IndetVO" property="tipoIngresoView"/>&nbsp;</td>
								<td><bean:write name="IndetVO" property="fechaPagoView"/>&nbsp;</td>							
								<td><bean:write name="IndetVO" property="fechaBalanceView" />&nbsp;</td>
							</tr>
						</logic:iterate>
						<tr>
						<td class="paginador" align="center" colspan="13">
							<bean:define id="pager" name="indetSearchPageVO"/>
							<%@ include file="/base/pager.jsp" %>
						</td>
					</tr>
					</tbody>
				</table>
			</logic:notEmpty>
			
			<logic:empty name="indetSearchPageVO" property="listResult">
				<table class="tramonline" border="0" cellpadding="0" cellspacing="1" width="100%">
					<caption><bean:message bundle="base" key="base.resultadoBusqueda"/></caption>
                	<tbody>
						<tr><td align="center">
							<bean:message bundle="base" key="base.resultadoVacio"/>
						</td></tr>
					</tbody>			
				</table>
			</logic:empty>
		</logic:equal>			
	</div>
	<!-- Fin Resultado Filtro -->

	<table class="tablabotones">
		<tr>				
			<td align="left">
    			<html:button property="btnVolver"  styleClass="boton" onclick="submitForm('volver', '');">
					<bean:message bundle="base" key="abm.button.volver"/>
				</html:button>
			</td>
			<logic:equal name="indetSearchPageVO" property="viewResult" value="true">
				<td align="right">
  	    			<logic:equal name="indetSearchPageVO" property="modoSeleccionar" value="false">
						<bean:define id="agregarEnabled" name="indetSearchPageVO" property="agregarEnabled"/>
						<input type="button" <%=agregarEnabled%> class="boton" 
							onClick="submitForm('agregar', '0');" 
							value="<bean:message bundle="base" key="abm.button.agregar"/>"/>
					</logic:equal>
  	    			<logic:equal name="indetSearchPageVO" property="modoSeleccionar" value="true">
  	    				<logic:equal name="indetSearchPageVO" property="agregarEnSeleccion" value="true">
							<bean:define id="agregarEnabled" name="indetSearchPageVO" property="agregarEnabled"/>
							<input type="button" <%=agregarEnabled%> class="boton" 
								onClick="submitForm('agregar', '0');" 
								value="<bean:message bundle="base" key="abm.button.agregar"/>"/>
						</logic:equal>
					</logic:equal>
				</td>				
			</logic:equal>
		</tr>
	</table>
	<input type="hidden" name="name"  value="<bean:write name='indetSearchPageVO' property='name'/>" id="name"/>
   	<input type="hidden" name="report.reportFormat" value="1" id="reportFormat"/>
		
	<input type="hidden" name="method" value=""/>
    <input type="hidden" name="anonimo" value="<bean:write name="userSession" property="isAnonimoView"/>"/>
    <input type="hidden" name="urlReComenzar" value="<bean:write name="userSession" property="urlReComenzar"/>"/>

	<input type="hidden" name="selectedId" value=""/>
	<input type="hidden" name="pageNumber" value="1" id="pageNumber">
	<input type="hidden" name="pageMethod" value="buscar" id="pageMethod">
	<input type="hidden" name="isSubmittedForm" value="true"/>

	<!-- Inclusion del Codigo Javascript del Calendar-->
	<div id="calendarDiv" style="position:absolute;visibility:hidden;background-color:white;layer-background-color:white;"></div>		
</html:form>
<!-- Fin Tabla que contiene todos los formularios -->