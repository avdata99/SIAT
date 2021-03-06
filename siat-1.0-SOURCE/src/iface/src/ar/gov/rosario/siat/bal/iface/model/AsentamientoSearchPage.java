//Copyright (c) 2011 Municipalidad de Rosario and Coop. de Trabajo Tecso Ltda.
//This file is part of SIAT. SIAT is licensed under the terms
//of the GNU General Public License, version 3.
//See terms in COPYING file or <http://www.gnu.org/licenses/gpl.txt>

package ar.gov.rosario.siat.bal.iface.model;

import java.util.ArrayList;
import java.util.Date;
import java.util.List;

import ar.gov.rosario.siat.bal.iface.util.BalSecurityConstants;
import ar.gov.rosario.siat.base.iface.model.SiatBussImageModel;
import ar.gov.rosario.siat.base.iface.model.SiatPageModel;
import ar.gov.rosario.siat.def.iface.model.ServicioBancoVO;
import ar.gov.rosario.siat.pro.iface.model.EstadoCorridaVO;
import coop.tecso.demoda.iface.helper.DateUtil;
import coop.tecso.demoda.iface.helper.ModelUtil;
import coop.tecso.demoda.iface.model.ReportTableVO;
import coop.tecso.demoda.iface.model.ReportVO;

/**
 * Search Page de Asentamiento
 * @author tecso
 *
 */
public class AsentamientoSearchPage extends SiatPageModel {

	private static final long serialVersionUID = 1L;

	private AsentamientoVO asentamiento = new AsentamientoVO();
	
	public static final String NAME = "asentamientoSearchPageVO";
	
	private Date fechaBalanceDesde;
	private Date fechaBalanceHasta;	
	private String fechaBalanceDesdeView = "";
	private String fechaBalanceHastaView = "";
	private EstadoCorridaVO estadoCorrida = new EstadoCorridaVO();
	
	private List<AsentamientoVO> listAsentamiento = new ArrayList<AsentamientoVO>();
	private List<EjercicioVO> listEjercicio = new ArrayList<EjercicioVO>();
	private List<EstadoCorridaVO> listEstadoCorrida = new ArrayList<EstadoCorridaVO>();
	private List<ServicioBancoVO> listServicioBanco = new ArrayList<ServicioBancoVO>();
	
	private Boolean admProcesoBussEnabled      = true;
		
	public AsentamientoSearchPage(){
		super(BalSecurityConstants.ABM_ASENTAMIENTO);
	}

	// Getters y Setters
	public AsentamientoVO getAsentamiento() {
		return asentamiento;
	}
	public void setAsentamiento(AsentamientoVO asentamiento) {
		this.asentamiento = asentamiento;
	}
	public List<AsentamientoVO> getListAsentamiento() {
		return listAsentamiento;
	}
	public void setListAsentamiento(List<AsentamientoVO> listAsentamiento) {
		this.listAsentamiento = listAsentamiento;
	}
	public List<EjercicioVO> getListEjercicio() {
		return listEjercicio;
	}
	public void setListEjercicio(List<EjercicioVO> listEjercicio) {
		this.listEjercicio = listEjercicio;
	}
	public List<EstadoCorridaVO> getListEstadoCorrida() {
		return listEstadoCorrida;
	}
	public void setListEstadoCorrida(List<EstadoCorridaVO> listEstadoCorrida) {
		this.listEstadoCorrida = listEstadoCorrida;
	}
	public List<ServicioBancoVO> getListServicioBanco() {
		return listServicioBanco;
	}
	public void setListServicioBanco(List<ServicioBancoVO> listServicioBanco) {
		this.listServicioBanco = listServicioBanco;
	}
	
	public Date getFechaBalanceDesde() {
		return fechaBalanceDesde;
	}
	public void setFechaBalanceDesde(Date fechaBalanceDesde) {
		this.fechaBalanceDesde = fechaBalanceDesde;
		this.fechaBalanceDesdeView = DateUtil.formatDate(fechaBalanceDesde, DateUtil.ddSMMSYYYY_MASK);
	}
	public String getFechaBalanceDesdeView() {
		return fechaBalanceDesdeView;
	}
	public void setFechaBalanceDesdeView(String fechaBalanceDesdeView) {
		this.fechaBalanceDesdeView = fechaBalanceDesdeView;
	}
	public Date getFechaBalanceHasta() {
		return fechaBalanceHasta;
	}
	public void setFechaBalanceHasta(Date fechaBalanceHasta) {
		this.fechaBalanceHasta = fechaBalanceHasta;
		this.fechaBalanceHastaView = DateUtil.formatDate(fechaBalanceHasta, DateUtil.ddSMMSYYYY_MASK);
	}
	public String getFechaBalanceHastaView() {
		return fechaBalanceHastaView;
	}
	public void setFechaBalanceHastaView(String fechaBalanceHastaView) {
		this.fechaBalanceHastaView = fechaBalanceHastaView;
	}
	public EstadoCorridaVO getEstadoCorrida() {
		return estadoCorrida;
	}
	public void setEstadoCorrida(EstadoCorridaVO estadoCorrida) {
		this.estadoCorrida = estadoCorrida;
	}

	// Flags Seguridad
	public Boolean getAdmProcesoBussEnabled() {
		return admProcesoBussEnabled;
	}

	public void setAdmProcesoBussEnabled(Boolean admProcesoBussEnabled) {
		this.admProcesoBussEnabled = admProcesoBussEnabled;
	}
	
	public String getAdmProcesoEnabled() {
		return SiatBussImageModel.hasEnabledFlag(this.getAdmProcesoBussEnabled(), 
				BalSecurityConstants.ABM_ASENTAMIENTO, BalSecurityConstants.ABM_ASENTAMIENTO_ADM_PROCESO);
	}
	
	public String getName(){
		return NAME;
	}
	
	public void prepareReport(Long format) {
		 
		ReportVO report = this.getReport(); // no instanciar una nueva
		 report.setReportFormat(format);	
		 report.setReportTitle("Consulta de Asentamiento de Pagos");
		 report.setReportBeanName("Emision");
		 report.setReportFileName(this.getClass().getName());
		 
		 // carga de filtros
		 
		 // Fecha Balance Desde
		 report.addReportFiltro("Fecha Balance Desde", this.getFechaBalanceDesdeView());
		 
		 // Fecha Balance Hasta
		 report.addReportFiltro("Fecha Balance Hasta", this.getFechaBalanceHastaView());
		 
		 //  Ejercicio
		 String desEjercicio = "";
			
		 EjercicioVO ejercicioVO = (EjercicioVO) ModelUtil.getBussImageModelByIdForList(
				 this.getAsentamiento().getEjercicio().getId(),
				 this.getListEjercicio());
		 if (ejercicioVO != null){
			 desEjercicio = ejercicioVO.getDesEjercicio();
		 }
		 report.addReportFiltro("Ejercicio", desEjercicio);
		 
		 // Servicio Banco
		 String desServicioBanco = "";
			
		 ServicioBancoVO servicioBancoVO = (ServicioBancoVO) ModelUtil.getBussImageModelByIdForList(
				 this.getAsentamiento().getServicioBanco().getId(),
				 this.getListServicioBanco());
		 if (servicioBancoVO != null){
			 desServicioBanco = servicioBancoVO.getDesServicioBanco();
		 }
		 
		 report.addReportFiltro("Servicio Banco", desServicioBanco);
	     
		// Estado Corrida 
		 
		 String desEstadoCorrida = "";
			
		 EstadoCorridaVO estadoCorridaVO = (EstadoCorridaVO) ModelUtil.getBussImageModelByIdForList(
				 this.getAsentamiento().getCorrida().getEstadoCorrida().getId(),
				 this.getListEstadoCorrida());
		 if (estadoCorridaVO != null){
			 desEstadoCorrida = estadoCorridaVO.getDesEstadoCorrida();
		 }
		 
		 report.addReportFiltro("Estado Corrida", desEstadoCorrida);
	     
        		 // Order by
		 //report.setReportOrderBy("desTipoObra ASC");
	     
	     ReportTableVO rtAse = new ReportTableVO("rtAse");
	     rtAse.setTitulo("Listado de Asentamiento de Pagos");
	   
	     // carga de columnas
	     rtAse.addReportColumn("Fecha de Balance", "fechaBalance");
	     rtAse.addReportColumn("Ejercicio", "ejercicio.desEjercicio");
	     rtAse.addReportColumn("Servicio Banco", "servicioBanco.desServicioBanco");
	     rtAse.addReportColumn("Estado", "corrida.estadoCorrida.desEstadoCorrida");
	     report.getReportListTable().add(rtAse);

	    }
}
