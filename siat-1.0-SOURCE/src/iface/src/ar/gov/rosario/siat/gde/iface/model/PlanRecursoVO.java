//Copyright (c) 2011 Municipalidad de Rosario and Coop. de Trabajo Tecso Ltda.
//This file is part of SIAT. SIAT is licensed under the terms
//of the GNU General Public License, version 3.
//See terms in COPYING file or <http://www.gnu.org/licenses/gpl.txt>

package ar.gov.rosario.siat.gde.iface.model;

import java.util.Date;

import ar.gov.rosario.siat.base.iface.model.SiatBussImageModel;
import ar.gov.rosario.siat.def.iface.model.RecursoVO;
import coop.tecso.demoda.iface.helper.DateUtil;

/**
 * Value Object del PlanRecurso
 * @author tecso
 *
 */
public class PlanRecursoVO extends SiatBussImageModel {

	private static final long serialVersionUID = 1L;

	public static final String NAME = "planRecursoVO";
	
	private PlanVO plan = new PlanVO();
	private RecursoVO recurso = new RecursoVO();
	
	private Date fechaDesde;
	private Date fechaHasta;
	
	
	private String fechaDesdeView = "";
	private String fechaHastaView = "";
	

	// Constructores
	public PlanRecursoVO() {
		super();
	}


	// Getters y Setters


	public Date getFechaDesde() {
		return fechaDesde;
	}
	public void setFechaDesde(Date fechaDesde) {
		this.fechaDesde = fechaDesde;
		this.fechaDesdeView = DateUtil.formatDate(fechaDesde, DateUtil.ddSMMSYYYY_MASK);
	}

	public Date getFechaHasta() {
		return fechaHasta;
	}
	public void setFechaHasta(Date fechaHasta) {
		this.fechaHasta = fechaHasta;
		this.fechaHastaView = DateUtil.formatDate(fechaHasta, DateUtil.ddSMMSYYYY_MASK);
	}

	public PlanVO getPlan() {
		return plan;
	}
	public void setPlan(PlanVO plan) {
		this.plan = plan;
	}

	
	public RecursoVO getRecurso() {
		return recurso;
	}


	public void setRecurso(RecursoVO recurso) {
		this.recurso = recurso;
	}
	


	// View getters


	public void setFechaDesdeView(String fechaDesdeView) {
		this.fechaDesdeView = fechaDesdeView;
	}
	public String getFechaDesdeView() {
		return fechaDesdeView;
	}

	public void setFechaHastaView(String fechaHastaView) {
		this.fechaHastaView = fechaHastaView;
	}
	public String getFechaHastaView() {
		return fechaHastaView;
	}



}
