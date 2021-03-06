//Copyright (c) 2011 Municipalidad de Rosario and Coop. de Trabajo Tecso Ltda.
//This file is part of SIAT. SIAT is licensed under the terms
//of the GNU General Public License, version 3.
//See terms in COPYING file or <http://www.gnu.org/licenses/gpl.txt>

package ar.gov.rosario.siat.gde.iface.model;

import java.util.ArrayList;
import java.util.List;

import ar.gov.rosario.siat.base.iface.model.SiatAdapterModel;
import ar.gov.rosario.siat.gde.iface.util.GdeSecurityConstants;
import coop.tecso.demoda.iface.model.SiNo;

/**
 * Adapter del PlanIntFin
 * 
 * @author tecso
 */
public class PlanIntFinAdapter extends SiatAdapterModel{
	
	public static final String NAME = "planIntFinAdapterVO";
	
    private PlanIntFinVO planIntFin = new PlanIntFinVO();
    
    private List<SiNo>           listSiNo = new ArrayList<SiNo>();
    
    private Boolean esEditable = true;
    
    // Constructores
    public PlanIntFinAdapter(){
    	super(GdeSecurityConstants.ABM_PLANINTFIN);
    }
    
    //  Getters y Setters
	public PlanIntFinVO getPlanIntFin() {
		return planIntFin;
	}

	public void setPlanIntFin(PlanIntFinVO planIntFinVO) {
		this.planIntFin = planIntFinVO;
	}

	public List<SiNo> getListSiNo() {
		return listSiNo;
	}

	public void setListSiNo(List<SiNo> listSiNo) {
		this.listSiNo = listSiNo;
	}

	public Boolean getEsEditable() {
		return esEditable;
	}

	public void setEsEditable(Boolean esEditable) {
		this.esEditable = esEditable;
	}
	
	// View getters
}
