<%@ taglib uri="/tags/struts-bean" prefix="bean" %>
<%@ taglib uri="/tags/struts-html" prefix="html" %>
<%@ taglib uri="/tags/struts-logic" prefix="logic" %>

<!-- Tabla que contiene todos los formularios -->
<html:form styleId="filter" action="/bal/BuscarAsentamiento.do">

		<!-- Mensajes y/o Advertencias -->
		<%@ include file="/base/warning.jsp" %>
		<!-- Errors  -->
		<html:errors bundle="base"/>
		
		<h1><bean:message bundle="bal" key="bal.asentamientoSearchPage.title"/></h1>	
		
		<table class="tablabotones" width="100%">
			<tr>
				<td align="left">
					<p><bean:message bundle="bal" key="bal.asentamientoSearchPage.legend"/></p>		
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
					<!-- Fecha Balance Desde/Hasta -->
					<tr>
						<td><label><bean:message bundle="bal" key="bal.asentamientoSearchPage.fechaBalanceDesde.label"/>: </label></td>
						<td class="normal">
						<html:text name="asentamientoSearchPageVO" property="fechaBalanceDesdeView" styleId="fechaBalanceDesdeView" size="10" maxlength="10" styleClass="datos" />
						<a class="link_siat" onclick="return show_calendar('fechaBalanceDesdeView');" id="a_fechaBalanceDesdeView">
							<img border="0" src="<%= request.getContextPath()%>/images/calendario.gif"/></a>
						</td>	
						<td><label><bean:message bundle="bal" key="bal.asentamientoSearchPage.fechaBalanceHasta.label"/>: </label></td>
						<td class="normal">
						<html:text name="asentamientoSearchPageVO" property="fechaBalanceHastaView" styleId="fechaBalanceHastaView" size="10" maxlength="10" styleClass="datos" />
						<a class="link_siat" onclick="return show_calendar('fechaBalanceHastaView');" id="a_fechaBalanceHastaView">
							<img border="0" src="<%= request.getContextPath()%>/images/calendario.gif"/></a>
						</td>	
				    </tr>
					<tr>
						<td><label>&nbsp;<bean:message bundle="bal" key="bal.ejercicio.label"/>: </label></td>
						<td class="normal">
						<html:select name="asentamientoSearchPageVO" property="asentamiento.ejercicio.id" styleClass="select" >
							<html:optionsCollection name="asentamientoSearchPageVO" property="listEjercicio" label="desEjercicio" value="id" />
						</html:select>
						</td>		
						<td><label>&nbsp;<bean:message bundle="def" key="def.servicioBanco.label"/>: </label></td>
						<td class="normal">
						<html:select name="asentamientoSearchPageVO" property="asentamiento.servicioBanco.id" styleClass="select" >
							<html:optionsCollection name="asentamientoSearchPageVO" property="listServicioBanco" label="desServicioBanco" value="id" />
						</html:select>
						</td>		
				    </tr>				    
					<tr>
						<td><label>&nbsp;<bean:message bundle="pro" key="pro.estadoCorrida.label"/>: </label></td>
						<td class="normal">
						<html:select name="asentamientoSearchPageVO" property="asentamiento.corrida.estadoCorrida.id" styleClass="select" >
							<html:optionsCollection name="asentamientoSearchPageVO" property="listEstadoCorrida" label="desEstadoCorrida" value="id" />
						</html:select>
						</td>		
				    </tr>				    
				</table>
			
			<p align="center">
			  	<html:button property="btnLimpiar"  styleClass="boton" onclick="submitForm('limpiar', '');">
					<bean:message bundle="base" key="abm.button.limpiar"/>
				</html:button>
				&nbsp;
				<html:button property="btnImprimir"  styleClass="boton" onclick="submitImprimir('baseImprimir', '1');">
					<bean:message bundle="base" key="abm.button.imprimir"/>
				</html:button>
				&nbsp;
		  		<html:button property="btnBuscar"  styleClass="boton" onclick="submitForm('buscar', '');">
					<bean:message bundle="base" key="abm.button.buscar"/>
				</html:button>
			</p>
		</fieldset>	
		<!-- Fin Filtro -->

	<!-- Resultado Filtro -->
	<div id="resultadoFiltro">
		<logic:equal name="asentamientoSearchPageVO" property="viewResult" value="true">		
			<logic:notEmpty  name="asentamientoSearchPageVO" property="listResult">	
				<table class="tramonline" border="0" cellbalding="0" cellspacing="1" width="100%">            
					<caption><bean:message bundle="base" key="base.resultadoBusqueda"/></caption>
                	<tbody>
	                	<tr>
							<th width="1">&nbsp;</th> <!-- Ver/Seleccionar -->
							<logic:notEqual name="asentamientoSearchPageVO" property="modoSeleccionar" value="true">
							<th width="1">&nbsp;</th> <!-- Modificar -->
							<th width="1">&nbsp;</th> <!-- Eliminar -->
							<th width="1">&nbsp;</th> <!-- Administrar Proceso -->
							</logic:notEqual>
						  	<th align="left"><bean:message bundle="bal" key="bal.asentamiento.numero.label"/></th>
						  	<th align="left"><bean:message bundle="bal" key="bal.asentamiento.fechaBalance.label"/></th>
						  	<th align="left"><bean:message bundle="bal" key="bal.ejercicio.label"/></th>
						  	<th align="left"><bean:message bundle="def" key="def.servicioBanco.label"/></th>
  							<th align="left"><bean:message bundle="bal" key="bal.asentamiento.estadoProceso.label"/></th>
						</tr>
						
						<logic:iterate id="AsentamientoVO" name="asentamientoSearchPageVO" property="listResult">
							<tr>						
								<!-- Ver/Seleccionar -->
								<td>
									<logic:notEqual name="asentamientoSearchPageVO" property="modoSeleccionar" value="true">
										<a style="cursor: pointer; cursor: hand;" onclick="submitForm('ver', '<bean:write name="AsentamientoVO" property="id" bundle="base" formatKey="general.format.id"/>');">
											<img title="<bean:message bundle="base" key="abm.button.ver"/>" border="0" src="<%=request.getContextPath()%>/images/iconos/selec0.gif"/>
										</a>
									</logic:notEqual>
									<logic:equal name="asentamientoSearchPageVO" property="modoSeleccionar" value="true">
										<a style="cursor: pointer; cursor: hand;" onclick="submitForm('seleccionar', '<bean:write name="AsentamientoVO" property="id" bundle="base" formatKey="general.format.id"/>');">
											<img title="<bean:message bundle="base" key="abm.button.seleccionar"/>" border="0" src="<%=request.getContextPath()%>/images/iconos/selec0.gif"/>
										</a>
									</logic:equal>									
								</td>


								<logic:notEqual name="asentamientoSearchPageVO" property="modoSeleccionar" value="true">								
								<td>
									<!-- Modificar-->								
									<logic:equal name="asentamientoSearchPageVO" property="modificarEnabled" value="enabled">									
										<logic:equal name="AsentamientoVO" property="modificarEnabled" value="enabled">
											<logic:equal name="AsentamientoVO" property="corrida.estadoCorrida.idView" value="1"> <!-- EstadoCorrida = En Preparacion -->
												<a style="cursor: pointer; cursor: hand;" onclick="submitForm('modificar', '<bean:write name="AsentamientoVO" property="id" bundle="base" formatKey="general.format.id"/>');">
													<img title="<bean:message bundle="base" key="abm.button.modificar"/>" border="0" src="<%=request.getContextPath()%>/images/iconos/modif0.gif"/>
												</a>
											</logic:equal>
											<logic:notEqual name="AsentamientoVO" property="corrida.estadoCorrida.idView" value="1"> <!-- EstadoCorrida <> En Preparacion -->
												<img border="0" src="<%=request.getContextPath()%>/images/iconos/modif1.gif"/>
											</logic:notEqual>
										</logic:equal>
										<logic:notEqual name="AsentamientoVO" property="modificarEnabled" value="enabled">
											<img border="0" src="<%=request.getContextPath()%>/images/iconos/modif1.gif"/>
										</logic:notEqual>
									</logic:equal>
									<logic:notEqual name="asentamientoSearchPageVO" property="modificarEnabled" value="enabled">
										<img border="0" src="<%=request.getContextPath()%>/images/iconos/modif1.gif"/>
									</logic:notEqual>
								</td>
	
								<td>
									<!-- Eliminar-->								
									<logic:equal name="asentamientoSearchPageVO" property="eliminarEnabled" value="enabled">		
										<logic:equal name="AsentamientoVO" property="eliminarEnabled" value="enabled">
											<logic:equal name="AsentamientoVO" property="corrida.estadoCorrida.idView" value="1"> <!-- EstadoCorrida = En Preparacion -->
												<a style="cursor: pointer; cursor: hand;" onclick="submitForm('eliminar', '<bean:write name="AsentamientoVO" property="id" bundle="base" formatKey="general.format.id"/>');">
													<img title="<bean:message bundle="base" key="abm.button.eliminar"/>" border="0" src="<%=request.getContextPath()%>/images/iconos/eliminar0.gif"/>
												</a>
											</logic:equal>	
											<logic:notEqual name="AsentamientoVO" property="corrida.estadoCorrida.idView" value="1"> <!-- EstadoCorrida <> En Preparacion -->
												<img border="0" src="<%=request.getContextPath()%>/images/iconos/eliminar1.gif"/>
											</logic:notEqual>
										</logic:equal>	
										<logic:notEqual name="AsentamientoVO" property="eliminarEnabled" value="enabled">
											<img border="0" src="<%=request.getContextPath()%>/images/iconos/eliminar1.gif"/>
										</logic:notEqual>									
									</logic:equal>							
									<logic:notEqual name="asentamientoSearchPageVO" property="eliminarEnabled" value="enabled">		
										<img border="0" src="<%=request.getContextPath()%>/images/iconos/eliminar1.gif"/>
									</logic:notEqual>
								</td>
									<!-- Administrar Proceso-->								
									<td>
									<logic:equal name="asentamientoSearchPageVO" property="admProcesoEnabled" value="enabled">		
										<logic:equal name="AsentamientoVO" property="admProcesoEnabled" value="enabled">
											<a style="cursor: pointer; cursor: hand;" onclick="submitForm('admProceso', '<bean:write name="AsentamientoVO" property="id" bundle="base" formatKey="general.format.id"/>');">
												<img title="<bean:message bundle="bal" key="bal.asentamientoSearchPage.adm.button.admProceso"/>" border="0" src="<%=request.getContextPath()%>/images/iconos/admProceso0.gif"/>
											</a>
										</logic:equal>	
										<logic:notEqual name="AsentamientoVO" property="admProcesoEnabled" value="enabled">
											<img border="0" src="<%=request.getContextPath()%>/images/iconos/admProceso1.gif"/>
										</logic:notEqual>									
									</logic:equal>							
									<logic:notEqual name="asentamientoSearchPageVO" property="admProcesoEnabled" value="enabled">		
										<img border="0" src="<%=request.getContextPath()%>/images/iconos/admProceso1.gif"/>
									</logic:notEqual>
									</td>
							</logic:notEqual>								
								<td><bean:write name="AsentamientoVO" property="id" bundle="base" formatKey="general.format.id"/>&nbsp;</td>
							    <td><bean:write name="AsentamientoVO" property="fechaBalanceView"/>&nbsp;</td>
						  	    <td><bean:write name="AsentamientoVO" property="ejercicio.desEjercicio"/>&nbsp;</td>
   						  	    <td><bean:write name="AsentamientoVO" property="servicioBanco.desServicioBanco"/>&nbsp;</td>
						 		<td><bean:write name="AsentamientoVO" property="corrida.estadoCorrida.desEstadoCorrida" />&nbsp;</td>
							</tr>
						</logic:iterate>
					<tr>
						<td class="paginador" align="center" colspan="11">
							<bean:define id="pager" name="asentamientoSearchPageVO"/>
							<%@ include file="/base/pager.jsp" %>
						</td>
					</tr>
				</tbody>
			</table>
		</logic:notEmpty>
		
		<logic:empty name="asentamientoSearchPageVO" property="listResult">
			<table class="tramonline" border="0" cellbalding="0" cellspacing="1" width="100%">            
        	    	<tbody>
						<caption><bean:message bundle="base" key="base.resultadoBusqueda"/></caption>
						<tr><td align="center">
								<bean:message bundle="base" key="base.resultadoVacio"/>
							</td>
						</tr>
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
			<logic:equal name="asentamientoSearchPageVO" property="viewResult" value="true">
    			<td align="right">
				<logic:equal name="asentamientoSearchPageVO" property="modoSeleccionar" value="false">
						<bean:define id="agregarEnabled" name="asentamientoSearchPageVO" property="agregarEnabled"/>
						<input type="button" <%=agregarEnabled%> class="boton" 
							onClick="submitForm('agregar', '0');" 
							value="<bean:message bundle="base" key="abm.button.agregar"/>"/>
					</logic:equal>
  	    			<logic:equal name="asentamientoSearchPageVO" property="modoSeleccionar" value="true">
  	    				<logic:equal name="asentamientoSearchPageVO" property="agregarEnSeleccion" value="true">
							<bean:define id="agregarEnabled" name="asentamientoSearchPageVO" property="agregarEnabled"/>
							<input type="button" <%=agregarEnabled%> class="boton" 
								onClick="submitForm('agregar', '0');" 
								value="<bean:message bundle="base" key="abm.button.agregar"/>"/>
						</logic:equal>
					</logic:equal>
				</td>
			</logic:equal>
		</tr>
	</table>
	<input type="hidden" name="name"  value="<bean:write name='asentamientoSearchPageVO' property='name'/>" id="name"/>
	<input type="hidden" name="report.reportFormat" value="1" id="reportFormat"/>
		
	<input type="hidden" name="method" value=""/>
	<input type="hidden" name="anonimo" value="<bean:write name="userSession" property="isAnonimoView"/>"/>
	<input type="hidden" name="urlReComenzar" value="<bean:write name="userSession" property="urlReComenzar"/>"/>

	<input type="hidden" name="selectedId" value=""/>
	<input type="hidden" name="pageNumber" value="1" id="pageNumber">
	<input type="hidden" name="pageMethod" value="buscar" id="pageMethod">
	<input type="hidden" name="isSubmittedForm" value="true"/>
	<input type="text" style="display:none"/>

	<!-- Inclusion del Codigo Javascript del Calendar-->
	<div id="calendarDiv" style="position:absolute;visibility:hidden;background-color:white;layer-background-color:white;"></div>

</html:form>
<!-- Fin Tabla que contiene todos los formularios -->		