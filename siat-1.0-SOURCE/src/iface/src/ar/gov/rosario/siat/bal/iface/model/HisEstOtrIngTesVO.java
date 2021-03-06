//Copyright (c) 2011 Municipalidad de Rosario and Coop. de Trabajo Tecso Ltda.
//This file is part of SIAT. SIAT is licensed under the terms
//of the GNU General Public License, version 3.
//See terms in COPYING file or <http://www.gnu.org/licenses/gpl.txt>

package ar.gov.rosario.siat.bal.iface.model;

import java.util.Date;

import ar.gov.rosario.siat.base.iface.model.SiatBussImageModel;
import coop.tecso.demoda.iface.helper.DateUtil;

public class HisEstOtrIngTesVO extends SiatBussImageModel {

	private static final long serialVersionUID = 1L;
	
	private OtrIngTesVO otrIngTes = new OtrIngTesVO();
	private EstOtrIngTesVO estOtrIngTes = new EstOtrIngTesVO();
	private Date fecha;
	private String logCambios = "";
	private String observaciones = "";

	private String fechaView = "";
	
	// Constructores 
	public HisEstOtrIngTesVO(){
		super();
	}

	// Getters Y Setters
	public EstOtrIngTesVO getEstOtrIngTes() {
		return estOtrIngTes;
	}
	public void setEstOtrIngTes(EstOtrIngTesVO estOtrIngTes) {
		this.estOtrIngTes = estOtrIngTes;
	}
	public Date getFecha() {
		return fecha;
	}
	public void setFecha(Date fecha) {
		this.fecha = fecha;
		this.fechaView = DateUtil.formatDate(fecha, DateUtil.ddSMMSYYYY_MASK);
	}
	public String getFechaView() {
		return fechaView;
	}
	public void setFechaView(String fechaView) {
		this.fechaView = fechaView;
	}
	public OtrIngTesVO getOtrIngTes() {
		return otrIngTes;
	}
	public void setOtrIngTes(OtrIngTesVO otrIngTes) {
		this.otrIngTes = otrIngTes;
	}
	public String getLogCambios() {
		return logCambios;
	}
	public void setLogCambios(String logCambios) {
		this.logCambios = logCambios;
	}
	public String getObservaciones() {
		return observaciones;
	}
	public void setObservaciones(String observaciones) {
		this.observaciones = observaciones;
	}
	
	
}
