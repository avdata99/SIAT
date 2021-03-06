<%@ taglib uri="/tags/struts-bean" prefix="bean" %>
<%@ taglib uri="/tags/struts-html" prefix="html" %>
<%@ taglib uri="/tags/struts-logic" prefix="logic" %>

	<!-- Tabla que contiene todos los formularios -->
	<html:form styleId="filter" action="/def/AdministrarRubro.do">

		<!-- Mensajes y/o Advertencias -->
		<%@ include file="/base/warning.jsp" %>
		<!-- Errors  -->
		<html:errors bundle="base"/>
		
		<h1><bean:message bundle="def" key="def.rubroAdapter.title"/></h1>	
			
		<!-- Rubro -->
		<fieldset>
			<legend><bean:message bundle="def" key="def.rubro.title"/></legend>
			
			<table class="tabladatos">
				<tr>
					<td><label><bean:message bundle="def" key="def.categoria.desCategoria.ref"/>: </label></td>
					<td class="normal"><bean:write name="rubroAdapterVO" property="rubro.categoria.desCategoria"/></td>
					
					<td><label><bean:message bundle="def" key="def.rubro.desRubro.label"/>: </label></td>
					<td class="normal"><bean:write name="rubroAdapterVO" property="rubro.desRubro"/></td>
				</tr>
			</table>
	
			<table class="tramonline" border="0" cellpadding="0" cellspacing="1" width="100%">            
				<caption><bean:message bundle="def" key="def.rubro.listSubrubro.ref"/></caption>
		    	<tbody>
					<logic:notEmpty  name="rubroAdapterVO" property="rubro.listSubrubro">						
				    	<tr>
							<th width="1">&nbsp;</th> <!-- Ver -->
							<th width="1">&nbsp;</th> <!-- Eliminar -->
							<th align="left"><bean:message bundle="def" key="def.subrubro.desSubrubro.label"/></th>
						</tr>
						<logic:iterate id="SubrubroVO" name="rubroAdapterVO" property="rubro.listSubrubro">
				
							<tr>
								<!-- Ver -->
								<td>
									<logic:equal name="SubrubroVO" property="verEnabled" value="enabled">
										<a style="cursor: pointer; cursor: hand;" onclick="submitForm('verSubrubro', '<bean:write name="SubrubroVO" property="id" bundle="base" formatKey="general.format.id"/>');">
											<img title="<bean:message bundle="base" key="abm.button.ver"/>" border="0" src="<%=request.getContextPath()%>/images/iconos/selec0.gif"/>
										</a>
									</logic:equal>
									
									<logic:notEqual name="SubrubroVO" property="verEnabled" value="enabled">
										<img border="0" src="<%=request.getContextPath()%>/images/iconos/selec01.gif"/>
									</logic:notEqual>
								</td>
								<td>
									<logic:equal name="rubroAdapterVO" property="act" value="eliminar">
										<!-- Eliminar-->								
										<logic:equal name="SubrubroVO" property="eliminarEnabled" value="enabled">
											<a style="cursor: pointer; cursor: hand;" onclick="submitForm('eliminarSubrubro', '<bean:write name="SubrubroVO" property="id" bundle="base" formatKey="general.format.id"/>');">
												<img title="<bean:message bundle="base" key="abm.button.eliminar"/>" border="0" src="<%=request.getContextPath()%>/images/iconos/eliminar0.gif"/>
											</a>
										</logic:equal>	
										<logic:notEqual name="SubrubroVO" property="eliminarEnabled" value="enabled">
											<img border="0" src="<%=request.getContextPath()%>/images/iconos/eliminar1.gif"/>
										</logic:notEqual>									
									</logic:equal>										
								</td>
								<td><bean:write name="SubrubroVO" property="desSubrubro"/></td>
							</tr>
						</logic:iterate>
					</logic:notEmpty>
					<logic:empty  name="rubroAdapterVO" property="rubro.listSubrubro">
						<tr><td align="center">
						<bean:message bundle="base" key="base.noExistenRegitros"/>
						</td></tr>
					</logic:empty>					
				</tbody>
			</table>
	
			<p>
				<logic:equal name="rubroAdapterVO" property="act" value="eliminar">
					<html:button property="btnAceptar"  styleClass="boton" onclick="submitForm('borrar', '');">
						<bean:message bundle="base" key="abm.button.eliminar"/>
					</html:button>
				</logic:equal>
			</p>
		
		</fieldset>
		
		<table class="tablabotones">
			<tr>				
				<td align="left">
	    			<html:button property="btnVolver"  styleClass="boton" onclick="submitForm('volver', '');">
						<bean:message bundle="base" key="abm.button.volver"/>
					</html:button>
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