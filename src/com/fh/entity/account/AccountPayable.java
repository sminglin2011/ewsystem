package com.fh.entity.account;

import java.io.Serializable;
import java.util.ArrayList;
import java.util.List;

import com.fasterxml.jackson.annotation.JsonIgnoreProperties;

import lombok.Data;

public class AccountPayable implements Serializable{

	/**
	 * 
	 */
	private static final long serialVersionUID = -3950029925051829912L;
	
	private String ap_nomber;
	private String  supplier_id;	
	private String  supplier_name;	
	private String  creditor;	
	private String  date;	
	private String  terms;	
	private String  vender_invoice;
	private String  accountpayable_ID;
	
	private List<AccountPayableMx> mx = new ArrayList<>();

	public String getAp_nomber() {
		return ap_nomber;
	}

	public void setAp_nomber(String ap_nomber) {
		this.ap_nomber = ap_nomber;
	}

	public String getSupplier_id() {
		return supplier_id;
	}

	public void setSupplier_id(String supplier_id) {
		this.supplier_id = supplier_id;
	}

	public String getSupplier_name() {
		return supplier_name;
	}

	public void setSupplier_name(String supplier_name) {
		this.supplier_name = supplier_name;
	}

	public String getCreditor() {
		return creditor;
	}

	public void setCreditor(String creditor) {
		this.creditor = creditor;
	}

	public String getDate() {
		return date;
	}

	public void setDate(String date) {
		this.date = date;
	}

	public String getTerms() {
		return terms;
	}

	public void setTerms(String terms) {
		this.terms = terms;
	}

	public String getVender_invoice() {
		return vender_invoice;
	}

	public void setVender_invoice(String vender_invoice) {
		this.vender_invoice = vender_invoice;
	}

	public String getAccountpayable_ID() {
		return accountpayable_ID;
	}

	public void setAccountpayable_ID(String accountpayable_ID) {
		this.accountpayable_ID = accountpayable_ID;
	}


	public static long getSerialversionuid() {
		return serialVersionUID;
	}

	public List<AccountPayableMx> getMx() {
		return mx;
	}

	public void setMx(List<AccountPayableMx> mx) {
		this.mx = mx;
	}


}
