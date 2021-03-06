//Copyright (c) 2011 Municipalidad de Rosario and Coop. de Trabajo Tecso Ltda.
//This file is part of SIAT. SIAT is licensed under the terms
//of the GNU General Public License, version 3.
//See terms in COPYING file or <http://www.gnu.org/licenses/gpl.txt>

package ar.gov.rosario.siat.bal.iface.model;

import java.util.Date;

import ar.gov.rosario.siat.base.iface.model.SiatBussImageModel;

public class TransaccionVO extends SiatBussImageModel {

	private static final long serialVersionUID = 1L;

	private Long sistema;
	private Long nroComprobante;
	private Long anioComprobante;
	private Long periodo;
	private Long resto;
	private Long codPago;
	private Long caja;
	private Long codTr;
	private Date fechaPago;
	private Double importe;
	private Double recargo;
	private String filler;
	private Long paquete;
	private Long marcaTr;
	private Long reciboTr;
	private Date fechaBalance;
	private AsentamientoVO asentamiento = new AsentamientoVO();
	
	
	private String sistemaView = "";
	private String nroComprobanteView = "";
	private String anioComprobanteView = "";
	private String periodoView = "";
	private String restoView = "";
	private String codPagoView = "";
	private String cajaView = "";
	private String codTrView = "";
	private String fechaPagoView = "";
	private String importeView = "";
	private String recargoView = "";
	private String paqueteView = "";
	private String marcaTrView = "";
	private String reciboTrView = "";
	private String fechaBalanceView = "";
	
	//Constructores 
	public TransaccionVO(){
		super();
	}

	// Getters y Setters
	public Long getAnioComprobante() {
		return anioComprobante;
	}
	public void setAnioComprobante(Long anioComprobante) {
		this.anioComprobante = anioComprobante;
	}
	public String getAnioComprobanteView() {
		return anioComprobanteView;
	}
	public void setAnioComprobanteView(String anioComprobanteView) {
		this.anioComprobanteView = anioComprobanteView;
	}
	public AsentamientoVO getAsentamiento() {
		return asentamiento;
	}
	public void setAsentamiento(AsentamientoVO asentamiento) {
		this.asentamiento = asentamiento;
	}
	public Long getCaja() {
		return caja;
	}
	public void setCaja(Long caja) {
		this.caja = caja;
	}
	public String getCajaView() {
		return cajaView;
	}
	public void setCajaView(String cajaView) {
		this.cajaView = cajaView;
	}
	public Long getCodPago() {
		return codPago;
	}
	public void setCodPago(Long codPago) {
		this.codPago = codPago;
	}
	public String getCodPagoView() {
		return codPagoView;
	}
	public void setCodPagoView(String codPagoView) {
		this.codPagoView = codPagoView;
	}
	public Long getCodTr() {
		return codTr;
	}
	public void setCodTr(Long codTr) {
		this.codTr = codTr;
	}
	public String getCodTrView() {
		return codTrView;
	}
	public void setCodTrView(String codTrView) {
		this.codTrView = codTrView;
	}
	public Date getFechaBalance() {
		return fechaBalance;
	}
	public void setFechaBalance(Date fechaBalance) {
		this.fechaBalance = fechaBalance;
	}
	public String getFechaBalanceView() {
		return fechaBalanceView;
	}
	public void setFechaBalanceView(String fechaBalanceView) {
		this.fechaBalanceView = fechaBalanceView;
	}
	public Date getFechaPago() {
		return fechaPago;
	}
	public void setFechaPago(Date fechaPago) {
		this.fechaPago = fechaPago;
	}
	public String getFechaPagoView() {
		return fechaPagoView;
	}	
	public void setFechaPagoView(String fechaPagoView) {
		this.fechaPagoView = fechaPagoView;
	}
	public String getFiller() {
		return filler;
	}
	public void setFiller(String filler) {
		this.filler = filler;
	}
	public Double getImporte() {
		return importe;
	}
	public void setImporte(Double importe) {
		this.importe = importe;
	}
	public String getImporteView() {
		return importeView;
	}
	public void setImporteView(String importeView) {
		this.importeView = importeView;
	}
	public Long getMarcaTr() {
		return marcaTr;
	}
	public void setMarcaTr(Long marcaTr) {
		this.marcaTr = marcaTr;
	}
	public String getMarcaTrView() {
		return marcaTrView;
	}
	public void setMarcaTrView(String marcaTrView) {
		this.marcaTrView = marcaTrView;
	}
	public Long getNroComprobante() {
		return nroComprobante;
	}
	public void setNroComprobante(Long nroComprobante) {
		this.nroComprobante = nroComprobante;
	}
	public String getNroComprobanteView() {
		return nroComprobanteView;
	}
	public void setNroComprobanteView(String nroComprobanteView) {
		this.nroComprobanteView = nroComprobanteView;
	}
	public Long getPaquete() {
		return paquete;
	}
	public void setPaquete(Long paquete) {
		this.paquete = paquete;
	}
	public String getPaqueteView() {
		return paqueteView;
	}
	public void setPaqueteView(String paqueteView) {
		this.paqueteView = paqueteView;
	}
	public Long getPeriodo() {
		return periodo;
	}
	public void setPeriodo(Long periodo) {
		this.periodo = periodo;
	}
	public String getPeriodoView() {
		return periodoView;
	}
	public void setPeriodoView(String periodoView) {
		this.periodoView = periodoView;
	}
	public Double getRecargo() {
		return recargo;
	}
	public void setRecargo(Double recargo) {
		this.recargo = recargo;
	}
	public String getRecargoView() {
		return recargoView;
	}
	public void setRecargoView(String recargoView) {
		this.recargoView = recargoView;
	}
	public Long getReciboTr() {
		return reciboTr;
	}
	public void setReciboTr(Long reciboTr) {
		this.reciboTr = reciboTr;
	}
	public String getReciboTrView() {
		return reciboTrView;
	}
	public void setReciboTrView(String reciboTrView) {
		this.reciboTrView = reciboTrView;
	}
	public Long getResto() {
		return resto;
	}
	public void setResto(Long resto) {
		this.resto = resto;
	}
	public String getRestoView() {
		return restoView;
	}
	public void setRestoView(String restoView) {
		this.restoView = restoView;
	}
	public Long getSistema() {
		return sistema;
	}
	public void setSistema(Long sistema) {
		this.sistema = sistema;
	}
	public String getSistemaView() {
		return sistemaView;
	}
	public void setSistemaView(String sistemaView) {
		this.sistemaView = sistemaView;
	}
	
}
