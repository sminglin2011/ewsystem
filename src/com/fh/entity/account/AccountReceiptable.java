package com.fh.entity.account;

import java.io.Serializable;
import java.util.ArrayList;
import java.util.List;

import com.fasterxml.jackson.annotation.JsonIgnoreProperties;

import lombok.Data;

public class AccountReceiptable implements Serializable{

	/**
	 * 
	 */
	private static final long serialVersionUID = -3950029925051829912L;
	
	private String accountreceiptable_ID;
	private String ar_number;
	private String customer_id;	
	private String customer_name;	
	private String debitor;	
	private String date;	
	private String terms;
	private String gl_status;
	private List<AccountReceiptableMx> mx;
	
	
	public String getAr_number() {
		return ar_number;
	}
	public void setAr_number(String ar_number) {
		this.ar_number = ar_number;
	}
	public String getCustomer_id() {
		return customer_id;
	}
	public void setCustomer_id(String customer_id) {
		this.customer_id = customer_id;
	}
	public String getCustomer_name() {
		return customer_name;
	}
	public void setCustomer_name(String customer_name) {
		this.customer_name = customer_name;
	}
	public String getDebitor() {
		return debitor;
	}
	public void setDebitor(String debitor) {
		this.debitor = debitor;
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
	public String getGl_status() {
		return gl_status;
	}
	public void setGl_status(String gl_status) {
		this.gl_status = gl_status;
	}
	public static long getSerialversionuid() {
		return serialVersionUID;
	}
	public List<AccountReceiptableMx> getMx() {
		return mx;
	}
	public void setMx(List<AccountReceiptableMx> mx) {
		this.mx = mx;
	}
	public String getAccountreceiptable_ID() {
		return accountreceiptable_ID;
	}
	public void setAccountreceiptable_ID(String accountreceiptable_ID) {
		this.accountreceiptable_ID = accountreceiptable_ID;
	}
	
	

}
