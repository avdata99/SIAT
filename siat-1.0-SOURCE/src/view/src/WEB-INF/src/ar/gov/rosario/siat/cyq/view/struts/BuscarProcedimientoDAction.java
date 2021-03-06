//Copyright (c) 2011 Municipalidad de Rosario and Coop. de Trabajo Tecso Ltda.
//This file is part of SIAT. SIAT is licensed under the terms
//of the GNU General Public License, version 3.
//See terms in COPYING file or <http://www.gnu.org/licenses/gpl.txt>

package ar.gov.rosario.siat.cyq.view.struts;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.apache.commons.logging.Log;
import org.apache.commons.logging.LogFactory;
import org.apache.struts.action.ActionForm;
import org.apache.struts.action.ActionForward;
import org.apache.struts.action.ActionMapping;

import ar.gov.rosario.siat.base.view.struts.BaseDispatchAction;
import ar.gov.rosario.siat.base.view.util.BaseConstants;
import ar.gov.rosario.siat.base.view.util.UserSession;
import ar.gov.rosario.siat.cyq.iface.model.ProcedimientoSearchPage;
import ar.gov.rosario.siat.cyq.iface.service.CyqServiceLocator;
import ar.gov.rosario.siat.cyq.iface.util.CyqSecurityConstants;
import ar.gov.rosario.siat.cyq.view.util.CyqConstants;
import coop.tecso.demoda.iface.helper.DemodaUtil;

public final class BuscarProcedimientoDAction extends BaseDispatchAction {

	private Log log = LogFactory.getLog(BuscarProcedimientoDAction.class);
		
	public ActionForward inicializar(ActionMapping mapping, ActionForm form,
		HttpServletRequest request, HttpServletResponse response)
		throws Exception {

		String funcName = DemodaUtil.currentMethodName();
		String act = getCurrentAct(request);
		if (log.isDebugEnabled()) log.debug(funcName + ": enter");

		UserSession userSession = canAccess(request, mapping, CyqSecurityConstants.ABM_PROCEDIMIENTO_CyQ_AREAS, act); 
		if (userSession==null) return forwardErrorSession(request);
		
		try {
			
			ProcedimientoSearchPage procedimientoSearchPageVO = CyqServiceLocator.getConcursoyQuiebraService().getProcedimientoSearchPageInit(userSession);
			
			// Tiene errores recuperables
			if (procedimientoSearchPageVO.hasErrorRecoverable()) {
				log.error("recoverable error en: "  + funcName + ": " + procedimientoSearchPageVO.infoString()); 
				saveDemodaErrors(request, procedimientoSearchPageVO);
				return forwardErrorRecoverable(mapping, request, userSession, ProcedimientoSearchPage.NAME, procedimientoSearchPageVO);
			} 

			// Tiene errores no recuperables
			if (procedimientoSearchPageVO.hasErrorNonRecoverable()) {
				log.error("error en: "  + funcName + ": " + procedimientoSearchPageVO.errorString()); 
				return forwardErrorNonRecoverable(mapping, request, funcName, ProcedimientoSearchPage.NAME, procedimientoSearchPageVO);
			}
			
			// Si no tiene error
			baseInicializarSearchPage(mapping, request, userSession , ProcedimientoSearchPage.NAME, procedimientoSearchPageVO);
			
			return mapping.findForward(CyqConstants.FWD_PROCEDIMIENTO_SEARCHPAGE);
			
		} catch (Exception exception) {
			return baseException(mapping, request, funcName, exception, ProcedimientoSearchPage.NAME);
		}
	}

	public ActionForward limpiar(ActionMapping mapping, ActionForm form,
		HttpServletRequest request, HttpServletResponse response)
		throws Exception {

		String funcName = DemodaUtil.currentMethodName();
		return this.baseRefill(mapping, form, request, response, funcName, ProcedimientoSearchPage.NAME);
		
	}
	
	public ActionForward buscar(ActionMapping mapping, ActionForm form,
		HttpServletRequest request, HttpServletResponse response)
		throws Exception {

		String funcName = DemodaUtil.currentMethodName();
		if (log.isDebugEnabled()) log.debug(funcName + ": enter");		
		UserSession userSession = getCurrentUserSession(request, mapping); 
		if (userSession == null) return forwardErrorSession(request);
		
		try {
			
			// Bajo el searchPage del userSession
			ProcedimientoSearchPage procedimientoSearchPageVO = (ProcedimientoSearchPage) userSession.get(ProcedimientoSearchPage.NAME);
			
			// Si es nulo no se puede continuar
			if (procedimientoSearchPageVO == null) {
				log.error("error en: "  + funcName + ": " + ProcedimientoSearchPage.NAME + " IS NULL. No se pudo obtener de la sesion");
				return forwardErrorSessionNullObject(mapping, request, funcName, ProcedimientoSearchPage.NAME); 
			}
			
			// si el buscar diparado desde la pagina de busqueda
			if (((String)userSession.get("reqAttIsSubmittedForm")).equals("true")) {
				// Recuperamos datos del form en el vo
				DemodaUtil.populateVO(procedimientoSearchPageVO, request);
				// Setea el PageNumber del PageModel				
				procedimientoSearchPageVO.setPageNumber(new Long((String)userSession.get("reqAttPageNumber")));
			}
			
            // Tiene errores recuperables
			if (procedimientoSearchPageVO.hasErrorRecoverable()) {
				log.error("recoverable error en: "  + funcName + ": " + procedimientoSearchPageVO.infoString()); 
				saveDemodaErrors(request, procedimientoSearchPageVO);
				return forwardErrorRecoverable(mapping, request, userSession, ProcedimientoSearchPage.NAME, procedimientoSearchPageVO);
			}
				
			// Llamada al servicio	
			procedimientoSearchPageVO = CyqServiceLocator.getConcursoyQuiebraService().getProcedimientoSearchPageResult(userSession, procedimientoSearchPageVO);			

			// Tiene errores recuperables
			if (procedimientoSearchPageVO.hasErrorRecoverable()) {
				log.error("recoverable error en: "  + funcName + ": " + procedimientoSearchPageVO.infoString()); 
				saveDemodaErrors(request, procedimientoSearchPageVO);
				return forwardErrorRecoverable(mapping, request, userSession, ProcedimientoSearchPage.NAME, procedimientoSearchPageVO);
			}
			
			// Tiene errores no recuperables
			if (procedimientoSearchPageVO.hasErrorNonRecoverable()) {
				log.error("error en: "  + funcName + ": " + procedimientoSearchPageVO.errorString());
				return forwardErrorNonRecoverable(mapping, request, funcName, ProcedimientoSearchPage.NAME, procedimientoSearchPageVO);
			}
		
			// Envio el VO al request
			request.setAttribute(ProcedimientoSearchPage.NAME, procedimientoSearchPageVO);
			// Nuleo el list result
			//procedimientoSearchPageVO.setListResult(new ArrayList()); TODO ver como solucionar esto
			// Subo en el el searchPage al userSession
			userSession.put(ProcedimientoSearchPage.NAME, procedimientoSearchPageVO);
			
			return mapping.findForward(CyqConstants.FWD_PROCEDIMIENTO_SEARCHPAGE);
			
		} catch (Exception exception) {
			return baseException(mapping, request, funcName, exception, ProcedimientoSearchPage.NAME);
		}
	}

	public ActionForward paramJuzgado (ActionMapping mapping, ActionForm form,
			HttpServletRequest request, HttpServletResponse response)
			throws Exception {
				
		String funcName = DemodaUtil.currentMethodName();
		if (log.isDebugEnabled()) log.debug("entrando en " + funcName);
		
		UserSession userSession = getCurrentUserSession(request, mapping); 
		if (userSession==null) return forwardErrorSession(request);
		
		try {
			// Bajo el adapter del userSession
			ProcedimientoSearchPage procedimientoSearchPageVO = (ProcedimientoSearchPage) userSession.get(ProcedimientoSearchPage.NAME);
			
			// Si es nulo no se puede continuar
			if (procedimientoSearchPageVO == null) {
				log.error("error en: "  + funcName + ": " + ProcedimientoSearchPage.NAME + " IS NULL. No se pudo obtener de la sesion");
				return forwardErrorSessionNullObject(mapping, request, funcName, ProcedimientoSearchPage.NAME); 
			}
			
			DemodaUtil.populateVO(procedimientoSearchPageVO, request);

			// llamada al servicio
			procedimientoSearchPageVO = CyqServiceLocator.getConcursoyQuiebraService().getProcedimientoSearchPageParamJuzgado(userSession, procedimientoSearchPageVO);
			
            // Tiene errores recuperables
			if (procedimientoSearchPageVO.hasErrorRecoverable()) {
				log.error("recoverable error en: "  + funcName + ": " + procedimientoSearchPageVO.infoString()); 
				saveDemodaErrors(request, procedimientoSearchPageVO);
				return forwardErrorRecoverable
					(mapping, request, userSession, ProcedimientoSearchPage.NAME, procedimientoSearchPageVO);
			}
			
			// Tiene errores no recuperables
			if (procedimientoSearchPageVO.hasErrorNonRecoverable()) {
				log.error("error en: "  + funcName + ": " + procedimientoSearchPageVO.errorString()); 
				return forwardErrorNonRecoverable
					(mapping, request, funcName, ProcedimientoSearchPage.NAME, procedimientoSearchPageVO);
			}

			procedimientoSearchPageVO.setPageNumber(0L);
			
			// Envio el VO al request
			request.setAttribute(ProcedimientoSearchPage.NAME, procedimientoSearchPageVO);
			// Subo el apdater al userSession
			userSession.put(ProcedimientoSearchPage.NAME, procedimientoSearchPageVO);
			
			return mapping.findForward(CyqConstants.FWD_PROCEDIMIENTO_SEARCHPAGE);
		
		} catch (Exception exception) {
			return baseException(mapping, request, funcName, exception, ProcedimientoSearchPage.NAME);
		}
	}
	
	public ActionForward ver(ActionMapping mapping, ActionForm form,
		HttpServletRequest request, HttpServletResponse response)
		throws Exception {

		String funcName = DemodaUtil.currentMethodName();
		return forwardVerSearchPage(mapping, request, funcName, CyqConstants.ACTION_ADMINISTRAR_PROCEDIMIENTO);

	}

	public ActionForward agregar(ActionMapping mapping, ActionForm form,
		HttpServletRequest request, HttpServletResponse response)
		throws Exception {

		String funcName = DemodaUtil.currentMethodName();
		
		return forwardAgregarSearchPage(mapping, request, funcName, CyqConstants.ACTION_ADMINISTRAR_ENC_PROCEDIMIENTO);
	}

	public ActionForward modificar(ActionMapping mapping, ActionForm form,
		HttpServletRequest request, HttpServletResponse response)
		throws Exception {

		String funcName = DemodaUtil.currentMethodName();
		return forwardModificarSearchPage(mapping, request, funcName, CyqConstants.ACTION_ADMINISTRAR_PROCEDIMIENTO);

	}

	public ActionForward eliminar(ActionMapping mapping, ActionForm form,
		HttpServletRequest request, HttpServletResponse response)
		throws Exception {

		String funcName = DemodaUtil.currentMethodName();
		return forwardEliminarSearchPage(mapping, request, funcName, CyqConstants.ACTION_ADMINISTRAR_PROCEDIMIENTO);

	}
	
	public ActionForward seleccionar(ActionMapping mapping, ActionForm form,
		HttpServletRequest request, HttpServletResponse response)
		throws Exception {

		String funcName = DemodaUtil.currentMethodName();
		return baseSeleccionar(mapping, request, response, funcName, ProcedimientoSearchPage.NAME);
		
	}

	public ActionForward volver(ActionMapping mapping, ActionForm form,
		HttpServletRequest request, HttpServletResponse response)
		throws Exception {
		
		return baseVolver(mapping, form, request, response, ProcedimientoSearchPage.NAME);
		
	}
		
	public ActionForward cambiarEstado(ActionMapping mapping, ActionForm form,
		HttpServletRequest request, HttpServletResponse response)
		throws Exception {

		String funcName = DemodaUtil.currentMethodName();
		
		return baseForward(mapping, request, funcName, BaseConstants.ACT_BUSCAR, 
				CyqConstants.ACTION_ADMINISTRAR_CAMBIOESTADO_PROCEDIMIENTO, 
				CyqConstants.METOD_CAMBIAR_ESTADO);
			
	}
	
	public ActionForward refill(ActionMapping mapping, ActionForm form,
			HttpServletRequest request, HttpServletResponse response)
			throws Exception {

		String funcName = DemodaUtil.currentMethodName();		
		return baseRefill(mapping, form, request, response, funcName, ProcedimientoSearchPage.NAME);
		
	}
}
