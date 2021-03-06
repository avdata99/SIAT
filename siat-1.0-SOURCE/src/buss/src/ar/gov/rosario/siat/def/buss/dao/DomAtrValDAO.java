//Copyright (c) 2011 Municipalidad de Rosario and Coop. de Trabajo Tecso Ltda.
//This file is part of SIAT. SIAT is licensed under the terms
//of the GNU General Public License, version 3.
//See terms in COPYING file or <http://www.gnu.org/licenses/gpl.txt>

package ar.gov.rosario.siat.def.buss.dao;

import java.util.List;

import org.apache.commons.logging.Log;
import org.apache.commons.logging.LogFactory;
import org.hibernate.Query;
import org.hibernate.classic.Session;

import ar.gov.rosario.siat.base.buss.dao.GenericDAO;
import ar.gov.rosario.siat.base.buss.dao.SiatHibernateUtil;
import ar.gov.rosario.siat.def.buss.bean.DomAtr;
import ar.gov.rosario.siat.def.buss.bean.DomAtrVal;
import ar.gov.rosario.siat.pad.buss.bean.ConAtrValSec;

public class DomAtrValDAO extends GenericDAO {

	private Log log = LogFactory.getLog(DomAtrValDAO.class);	
	
	public DomAtrValDAO() {
		super(DomAtrVal.class);
	}
	
	 public List<DomAtrVal> getListByActividad(ConAtrValSec conAtrValSec){

	    	Session session = SiatHibernateUtil.currentSession();

	    	String sQuery = "SELECT d FROM DomAtrVal d WHERE ";
	    	sQuery +=  "d.domAtr.id = "+ DomAtr.ID_DOMATR_ACTIVIDAD; 
	    	sQuery +=  " AND d.strValor * 1 >= " + conAtrValSec.getValorDesde();
	    	sQuery +=  " AND d.strValor * 1 <= " + conAtrValSec.getValorHasta() ;
	        Query query = session.createQuery(sQuery);
			
	    	return (List<DomAtrVal>) query.list();
		}
	   
	
}
