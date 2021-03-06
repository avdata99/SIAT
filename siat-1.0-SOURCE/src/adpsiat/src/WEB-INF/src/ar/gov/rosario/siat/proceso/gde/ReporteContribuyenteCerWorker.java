//Copyright (c) 2011 Municipalidad de Rosario and Coop. de Trabajo Tecso Ltda.
//This file is part of SIAT. SIAT is licensed under the terms
//of the GNU General Public License, version 3.
//See terms in COPYING file or <http://www.gnu.org/licenses/gpl.txt>

package ar.gov.rosario.siat.proceso.gde;

import java.io.BufferedWriter;
import java.io.File;
import java.io.FileWriter;
import java.math.BigDecimal;
import java.util.Date;
import java.util.HashMap;
import java.util.Iterator;
import java.util.List;
import java.util.Map;
import java.util.Set;

import org.apache.log4j.Logger;
import org.hibernate.Query;
import org.hibernate.Session;
import org.hibernate.Transaction;

import ar.gov.rosario.siat.base.buss.dao.SiatHibernateUtil;
import ar.gov.rosario.siat.def.buss.bean.Recurso;
import ar.gov.rosario.siat.gde.buss.bean.AuxContribuyenteCerReport;
import ar.gov.rosario.siat.gde.buss.bean.TipoPago;
import ar.gov.rosario.siat.gde.buss.dao.DeudaDAO;
import ar.gov.rosario.siat.pad.buss.bean.ConAtrVal;
import ar.gov.rosario.siat.pad.buss.bean.Persona;
import ar.gov.rosario.siat.pro.buss.bean.Corrida;
import coop.tecso.adpcore.AdpRun;
import coop.tecso.adpcore.AdpRunDirEnum;
import coop.tecso.adpcore.AdpRunState;
import coop.tecso.adpcore.AdpWorker;
import coop.tecso.adpcore.engine.AdpParameter;
import coop.tecso.demoda.iface.DemodaServiceException;
import coop.tecso.demoda.iface.helper.DateUtil;
import coop.tecso.demoda.iface.helper.DemodaUtil;
import coop.tecso.demoda.iface.helper.NumberUtil;
import coop.tecso.demoda.iface.model.UserContext;

/**
 * Genera el Reporte de Recaudacion por Recurso en forma desconectada.
 * 
 * @author Tecso Coop. Ltda.
 */
public class ReporteContribuyenteCerWorker implements AdpWorker {

	private static Logger log = Logger.getLogger(ReporteContribuyenteCerWorker.class);

	public void cancel(AdpRun adpRun) throws Exception {
	}

	public void execute(AdpRun adpRun) throws Exception {
		// Verfica numero paso y estado en adprun,
		// Llama a cada metodo segun el numero de paso
		Long pasoActual = adpRun.getPasoActual();
		if (pasoActual.equals(1L)){ 
			this.generarReporte(adpRun);
		}else{
			// No existen otros pasos para el Proceso.
		}
	}

	public void reset(AdpRun adpRun) throws Exception {
	}

	public boolean validate(AdpRun adpRun) throws Exception {
		return false;
	}

	/**
	 *  Generar Reporte de Reacaudado NUEVO
	 * 
	 * @param adpRun
	 * @throws Exception
	 */
	public void generarReporte(AdpRun adpRun) throws Exception{
		String funcName = DemodaUtil.currentMethodName();
		UserContext userContext = new UserContext();
		Session session = null;
		Transaction tx  = null; 

		if (log.isDebugEnabled()) log.debug(funcName + ": enter");
		try {
			DemodaUtil.setCurrentUserContext(userContext);
			session = SiatHibernateUtil.currentSession();
			tx = session.beginTransaction();

			String FECHA_REPORTE_PARAM = "fechaReporte";
			String ID_RECURSO_PARAM = "idRecurso";
			String PERIODO_DESDE_PARAM = "periodoDesde";
			String PERIODO_HASTA_PARAM = "periodoHasta";
			String ANIO_DESDE_PARAM = "anioDesde";
			String ANIO_HASTA_PARAM = "anioHasta";
			String FECHA_DESDE_PARAM = "fechaDesde";
			String FECHA_HASTA_PARAM = "fechaHasta";
			String USER_NAME_PARAM = "UserName";
			String USER_ID_PARAM = "UserId";



			AdpParameter paramFechaReporte = adpRun.getAdpParameter(FECHA_REPORTE_PARAM);
			AdpParameter paramIdRecurso = adpRun.getAdpParameter(ID_RECURSO_PARAM);
			AdpParameter paramPeriodoDesde = adpRun.getAdpParameter(PERIODO_DESDE_PARAM);
			AdpParameter paramPeriodoHasta = adpRun.getAdpParameter(PERIODO_HASTA_PARAM);
			AdpParameter paramAnioDesde = adpRun.getAdpParameter(ANIO_DESDE_PARAM);
			AdpParameter paramAnioHasta = adpRun.getAdpParameter(ANIO_HASTA_PARAM);
			AdpParameter paramFechaDesde = adpRun.getAdpParameter(FECHA_DESDE_PARAM);
			AdpParameter paramFechaHasta = adpRun.getAdpParameter(FECHA_HASTA_PARAM);

			AdpParameter paramUserName = adpRun.getAdpParameter(USER_NAME_PARAM);
			AdpParameter paramUserId = adpRun.getAdpParameter(USER_ID_PARAM);


			Date fechaReporte = DateUtil.getDate(paramFechaReporte.getValue(), DateUtil.ddSMMSYYYY_MASK);
			Long idRecurso = NumberUtil.getLong(paramIdRecurso.getValue());
			Date fechaDesde= DateUtil.getDate(paramFechaDesde.getValue(), DateUtil.ddSMMSYYYY_MASK);
			Date fechaHasta= DateUtil.getDate(paramFechaHasta.getValue(), DateUtil.ddSMMSYYYY_MASK);
			Integer periodoDesde= new Integer(paramPeriodoDesde.getValue());
			Integer periodoHasta=  new Integer(paramPeriodoHasta.getValue());
			Integer anioDesde=  new Integer(paramAnioDesde.getValue());
			Integer anioHasta=  new Integer(paramAnioHasta.getValue());	
			String userName = paramUserName.getValue();			
			String userId = paramUserId.getValue();

			// Seteamos el UserName en el UserContext para que al modificarse la corrida quede grabado.
			DemodaUtil.currentUserContext().setUserName(userName);

			AuxContribuyenteCerReport auxContribuyenteCerReport = new AuxContribuyenteCerReport();

			auxContribuyenteCerReport.setFechaReporte(fechaReporte);
			if(idRecurso!=null){
				auxContribuyenteCerReport.setRecurso(Recurso.getByIdNull(idRecurso));	
			}else {
				auxContribuyenteCerReport.setRecurso(null);	
			}
			auxContribuyenteCerReport.setFechaDesde(fechaDesde);
			auxContribuyenteCerReport.setFechaHasta(fechaHasta);
			auxContribuyenteCerReport.setUserName(userName);
			auxContribuyenteCerReport.setUserId(userId);
			auxContribuyenteCerReport.setPeriodoDesde(periodoDesde);
			auxContribuyenteCerReport.setPeriodoHasta(periodoHasta);
			auxContribuyenteCerReport.setAnioDesde(anioDesde);
			auxContribuyenteCerReport.setAnioHasta(anioHasta);

			// Aqui se resuelve la busqueda y se genera el archivo resultado
			auxContribuyenteCerReport = this.generarPDF4Report(auxContribuyenteCerReport, adpRun);  

			if(auxContribuyenteCerReport.hasError()){
				adpRun.changeState(AdpRunState.FIN_ERROR, "Error al generar el reporte.", false);
				adpRun.logError("Error al generar el reporte.");
				return;
			}

			String fileName = auxContribuyenteCerReport.getReporteGenerado().getFileName();
			String nombre = "Reporte de Contribuyente Cer";
			String descripcion = "Consiste en un reporte que sumariza por recurso los pagos de los contribuyentes Cer y la cantidad de los mismos";


			// Levanto la Corrida y guardamos el archivo generado en como archivo de salida del proceso.
			Corrida corrida = Corrida.getByIdNull(adpRun.getId());
			if(corrida == null){
				adpRun.changeState(AdpRunState.FIN_ERROR, "Error al leer la corrida del proceso", false);
				adpRun.logError("Error al leer la corrida del proceso");
				return;
			}
			corrida.addOutputFile(nombre, descripcion, fileName);

			if (corrida.hasError()) {
				tx.rollback();
				if(log.isDebugEnabled()){log.debug(funcName + ": tx.rollback");}
				String error = "Error al generar PDF para el formulario";
				adpRun.changeState(AdpRunState.FIN_ERROR, error, false);
				adpRun.logError(error);
			} else {
				tx.commit();
				if(log.isDebugEnabled()){log.debug(funcName + ": tx.commit");}
				adpRun.changeState(AdpRunState.FIN_OK, "Reporte Generado Ok", true);
				String adpMessage = "Resultado de la peticion del usuario "+userName
				+" hecha el "+DateUtil.formatDate(new Date(), DateUtil.ddSMMSYYYY_HH_MM_MASK);
				adpRun.changeDesCorrida(adpMessage);
			}

			log.debug(funcName + ": exit");

		} catch (Exception e) {
			log.error("Service Error: ",  e);
			if(tx != null) tx.rollback();
			throw new DemodaServiceException(e);
		} finally {
			SiatHibernateUtil.closeSession();
		}
	}

	// ---> Reporte de Contribuyente CER
	public AuxContribuyenteCerReport generarPDF4Report(AuxContribuyenteCerReport auxContribuyenteCerReport, AdpRun adpRun) throws Exception {

		String funcName = DemodaUtil.currentMethodName();
		if (log.isDebugEnabled()) log.debug(funcName + ": enter");

		Long idContribuyente;
		HashMap<Long, Totales> listadoResultado = new HashMap<Long, Totales>();
		Totales totales = new Totales();
		// --> Resultado
		boolean resultadoVacio = true;

		List<Object[]> listResulPago = this.getPagosContribuyenteCer(auxContribuyenteCerReport, DeudaDAO.TABLA_DEUDA_ADMIN);
		listResulPago.addAll(this.getPagosContribuyenteCer(auxContribuyenteCerReport, DeudaDAO.TABLA_DEUDA_ANULADA));
		listResulPago.addAll(this.getPagosContribuyenteCer(auxContribuyenteCerReport, DeudaDAO.TABLA_DEUDA_CANCELADA));
		listResulPago.addAll(this.getPagosContribuyenteCer(auxContribuyenteCerReport, DeudaDAO.TABLA_DEUDA_JUDICIAL));

		int indiceArchivo = 0;
		//Genero el archivo de texto

		indiceArchivo++;
		String fileName = "reporteContribuyenteCer_"+indiceArchivo+".csv";
		String fileDir  = adpRun.getProcessDir(AdpRunDirEnum.SALIDA)+File.separator;;
		auxContribuyenteCerReport.getReporteGenerado().setFileName(fileDir+"/"+fileName);
	
		BufferedWriter buffer = new BufferedWriter(new FileWriter(fileDir+"/"+fileName, false));
 
		// --> Filtros ingresados
		buffer.write("Reporte contribuyentes CER");
		buffer.newLine();
		buffer.write(", Fecha Reporte:"); 
		buffer.write(", "+auxContribuyenteCerReport.getFechaReporteView()); 
		buffer.write(", Recurso:"); 
		if(auxContribuyenteCerReport.getRecurso()!=null) {
			buffer.write(", "+auxContribuyenteCerReport.getRecurso().getDesRecurso()); 
		}else {
			buffer.write(", TODOS"); 
		}
		buffer.newLine();
		buffer.write(", Periodo Desde:"); 
		buffer.write(", "+auxContribuyenteCerReport.getPeriodoDesdeView()+"/"+auxContribuyenteCerReport.getAnioDesdeView()); 
		buffer.write(", Periodo Hasta:"); 
		buffer.write(", "+auxContribuyenteCerReport.getPeriodoHastaView()+"/"+auxContribuyenteCerReport.getAnioHastaView()); 
		buffer.newLine();
		buffer.write(", Fecha Pago Desde:"); 
		buffer.write(", "+auxContribuyenteCerReport.getFechaDesdeView()); 
		buffer.write(", Fecha Pago Hasta:"); 
		buffer.write(", "+auxContribuyenteCerReport.getFechaHastaView()); 
		buffer.newLine();
		// --> Creacion del Encabezado del Resultado
		buffer.newLine();
		buffer.write(", CONTRIBUYENTE");
		buffer.write(", PAGO CONTRIBUYENTE"); 
		buffer.write(", PARTICIPACION CER");
		buffer.newLine();
		// <-- Fin Creacion del Encabezado del Resultado

		buffer.newLine();

		for (Object[] obj : listResulPago){

			idContribuyente = new Long((Integer) obj[0]);
			
			BigDecimal participacionPago = (BigDecimal) obj[2];
			BigDecimal pesosPago = (BigDecimal) obj[2];
			if(!listadoResultado.isEmpty()){
				if (listadoResultado.containsKey(idContribuyente)){
					totales = listadoResultado.get(idContribuyente);
				} else {
					totales = new Totales();
				}
			}
			totales.participacion += participacionPago.doubleValue();
			totales.total += pesosPago.doubleValue();

			listadoResultado.put(idContribuyente, totales);
		}

		Set set = listadoResultado.entrySet();
		Iterator iter = set.iterator();
		Iterator itera = set.iterator();
		Double total = 0D;
		Double participacion = 0D;
		Double participacionTotal= 0D;
		while (iter.hasNext()) {
			resultadoVacio = false;
			Map.Entry entry = (Map.Entry) iter.next();
			totales =(Totales)entry.getValue();
		    total+=totales.getTotal();
			
		}
	
		while (itera.hasNext()) {
			resultadoVacio = false;
			Map.Entry entry = (Map.Entry) itera.next();
			totales =(Totales)entry.getValue();
			idContribuyente =  (Long) entry.getKey();
			participacion=(totales.getParticipacion()*100)/total;
			totales.setParticipacion(participacion);
			participacionTotal+= participacion;
			// CONTRIBUYENTE
			Persona persona=Persona.getByIdNull(idContribuyente);
			if(persona==null ){
		 	// Sin resultados
			buffer.write("No se encontro la descripci�n del contribuyente: "+idContribuyente);

			}else{
			// CONTRIBUYENTE
			buffer.write(", " + persona.getRepresent());
			}
			// PAGO CONTRIBUYENTE
			buffer.write(", " +  totales.getTotal());
			// PARTICIPACION CER
			buffer.write(", " +  participacion+"%");

			buffer.newLine();
		}
		
	
		// TOTALES
		buffer.newLine();
		buffer.write(", TOTALES");
		buffer.write(", " +  total);
		buffer.write(", " +  participacionTotal+"%");
		buffer.newLine();

		// --> Resultado vacio
		if(resultadoVacio ){
			// Sin resultados
			buffer.write("No existen registros de Contribuyentes CER");
		}		 
		// <-- Fin Resultado vacio

		if(log.isDebugEnabled()) log.debug("Archivo generado: " + fileName + " ctdResultados: " + listadoResultado.size());

		buffer.close();

		return auxContribuyenteCerReport;
	}


	public List<Object[]> getPagosContribuyenteCer(AuxContribuyenteCerReport auxContribuyenteCerReport,String nombreTabla) throws Exception {

		String funcName = DemodaUtil.currentMethodName();
		if (log.isDebugEnabled()) log.debug(funcName + ": enter");

		Session session = SiatHibernateUtil.currentSession();

		String strQuery = "SELECT conatrval.idContribuyente, COUNT(DISTINCT conatrval.idContribuyente), SUM(pagoDeuda.importe + pagoDeuda.actualizacion) ";
		strQuery +=	 "FROM pad_conAtrVal as conAtrVal, pad_Cuenta as cuenta, pad_CuentaTitular as cuentaTitular, " +nombreTabla+ " as deuda, ";
		strQuery += "gde_pagodeuda as pagoDeuda WHERE conAtrVal.idconAtr = " + ConAtrVal.CONTRIBUYENTE_CER.toString();
		strQuery +=  " AND conAtrVal.valor='1' ";
		strQuery +=  "AND cuentaTitular.idcontribuyente=conatrval.idcontribuyente and cuentaTitular.idcuenta=cuenta.id "; 
		strQuery +=  "AND conAtrVal.fechaDesde <= TO_DATE('"+DateUtil.formatDate(auxContribuyenteCerReport.getFechaReporte(), DateUtil.ddSMMSYYYY_MASK) + "','%d/%m/%Y') ";
		strQuery +=  "AND (conAtrVal.fechaHasta  >= TO_DATE('"+DateUtil.formatDate(auxContribuyenteCerReport.getFechaReporte(), DateUtil.ddSMMSYYYY_MASK) + "','%d/%m/%Y') ";
		strQuery +=	"OR conAtrVal.fechaHasta IS NULL) "; 
		strQuery +=	"AND cuenta.id=deuda.idCuenta AND deuda.id=pagoDeuda.iddeuda"; 

		if(auxContribuyenteCerReport.getAnioDesde()!=auxContribuyenteCerReport.getAnioHasta()){
			strQuery +=  " AND ((deuda.anio  > "+ auxContribuyenteCerReport.getAnioDesde();
			strQuery +=  " AND deuda.anio  < "+ auxContribuyenteCerReport.getAnioHasta()+") OR ";
			strQuery +=  "(deuda.anio= "+ auxContribuyenteCerReport.getAnioDesde() +" AND "+ "deuda.periodo >= " + auxContribuyenteCerReport.getPeriodoDesde();
			strQuery +=  ") OR (deuda.anio= "+ auxContribuyenteCerReport.getAnioHasta() +" AND "+ "deuda.periodo <= " + auxContribuyenteCerReport.getPeriodoHasta();
			strQuery +=  ")) "; 
		} else {
			strQuery +=  " AND (deuda.anio= "+ auxContribuyenteCerReport.getAnioDesde()+ " AND deuda.periodo >= ";
			strQuery +=   auxContribuyenteCerReport.getPeriodoDesde()+" AND deuda.periodo <= "+ auxContribuyenteCerReport.getPeriodoHasta() +") ";
		}

		strQuery +=  "AND deuda.fechaPago  >= TO_DATE('"+DateUtil.formatDate(auxContribuyenteCerReport.getFechaDesde(), DateUtil.ddSMMSYYYY_MASK) + "','%d/%m/%Y') ";
		strQuery +=  "AND deuda.fechaPago  <= TO_DATE('"+DateUtil.formatDate(auxContribuyenteCerReport.getFechaHasta(), DateUtil.ddSMMSYYYY_MASK) + "','%d/%m/%Y') ";
		strQuery +=	 "AND deuda.fechaPago IS NOT NULL "; 
		strQuery +=	 "AND pagoDeuda.idtipopago not in ("+TipoPago.ID_PAGO_BUENO+","+TipoPago.ID_PAGO_A_CUENTA+","+TipoPago.ID_RECIBO_CUOTA+","+TipoPago.ID_RECIBO_RECONFECCION_CUOTA+") " ; 

		if(auxContribuyenteCerReport.getRecurso()!=null){
			strQuery +=" AND cuenta.idRecurso="+auxContribuyenteCerReport.getRecurso().getId().toString();
		}

		strQuery +=	 " GROUP BY conatrval.idContribuyente";	

		Query query = session.createSQLQuery(strQuery);

		List<Object[]> listReturn = query.list();

		return listReturn;
	}

	public class Totales {
		public  Double participacion = 0D;
		public  Double total = 0D;

		
		public Double getTotal() {
			return total;
		}
		public Double getParticipacion() {
			return participacion;
		}
		public void setParticipacion(Double participacion) {
			this.participacion = participacion;
		}
		public void setTotal(Double total) {
			this.total = total;
		}

	}
}