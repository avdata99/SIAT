//Copyright (c) 2011 Municipalidad de Rosario and Coop. de Trabajo Tecso Ltda.
//This file is part of SIAT. SIAT is licensed under the terms
//of the GNU General Public License, version 3.
//See terms in COPYING file or <http://www.gnu.org/licenses/gpl.txt>

package ar.gov.rosario.siat.bal.buss.bean;

import javax.persistence.DiscriminatorValue;
import javax.persistence.Entity;

/**
 * Bean correspondiente a la Extension de la Transaccion para el Servicio Banco 81 correspondiente a TGI
 * 
 * @author tecso
 */
@Entity
@DiscriminatorValue("81")
public class TransaccionTGI extends Transaccion {

	private static final long serialVersionUID = 1L;


}
