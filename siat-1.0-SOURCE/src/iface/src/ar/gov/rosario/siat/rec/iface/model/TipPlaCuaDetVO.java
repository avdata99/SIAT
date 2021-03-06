//Copyright (c) 2011 Municipalidad de Rosario and Coop. de Trabajo Tecso Ltda.
//This file is part of SIAT. SIAT is licensed under the terms
//of the GNU General Public License, version 3.
//See terms in COPYING file or <http://www.gnu.org/licenses/gpl.txt>

package ar.gov.rosario.siat.rec.iface.model;

import ar.gov.rosario.siat.base.iface.model.SiatBussImageModel;

/**
 * Value Object del TipPlaCuaDet
 * @author tecso
 *
 */
public class TipPlaCuaDetVO extends SiatBussImageModel {

	private static final long serialVersionUID = 1L;

	public static final String NAME = "tipPlaCuaDetVO";
	
	private String desTipPlaCuaDet;
	
	// Buss Flags
	
	
	// View Constants
	
	
	// Constructores
	public TipPlaCuaDetVO() {
		super();
	}
	
	// Constructor para utilizar este VO en un combo como valor SELECCIONAR, TODOS, etc.
	public TipPlaCuaDetVO(int id, String desc) {
		super();
		setId(new Long(id));
		setDesTipPlaCuaDet(desc);
	}

	// Getters y Setters
	public String getDesTipPlaCuaDet() {
		return desTipPlaCuaDet;
	}

	public void setDesTipPlaCuaDet(String desTipPlaCuaDet) {
		this.desTipPlaCuaDet = desTipPlaCuaDet;
	}

	// Buss flags getters y setters
	
	
	// View flags getters
	
	
	// View getters
}
