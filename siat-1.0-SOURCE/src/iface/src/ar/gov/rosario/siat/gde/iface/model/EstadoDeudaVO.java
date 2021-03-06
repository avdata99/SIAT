//Copyright (c) 2011 Municipalidad de Rosario and Coop. de Trabajo Tecso Ltda.
//This file is part of SIAT. SIAT is licensed under the terms
//of the GNU General Public License, version 3.
//See terms in COPYING file or <http://www.gnu.org/licenses/gpl.txt>

package ar.gov.rosario.siat.gde.iface.model;

import ar.gov.rosario.siat.base.iface.model.SiatBussImageModel;

/**
 * Value Object del EstadoDeuda
 * @author tecso
 *
 */
public class EstadoDeudaVO extends SiatBussImageModel {

	private static final long serialVersionUID = 1L;

	public static final String NAME = "estadoDeudaVO";
	
	private String desEstadoDeuda;
	
	// Buss Flags
	
	
	// View Constants
	
	
	// Constructores
	public EstadoDeudaVO() {
		super();
	}
	
	// Constructor para utilizar este VO en un combo como valor SELECCIONAR, TODOS, etc.
	public EstadoDeudaVO(int id, String desc) {
		super();
		setId(new Long(id));
		setDesEstadoDeuda(desc);
	}

	// Getters y Setters
	public String getDesEstadoDeuda() {
		return desEstadoDeuda;
	}

	public void setDesEstadoDeuda(String desEstadoDeuda) {
		this.desEstadoDeuda = desEstadoDeuda;
	}
	
}
