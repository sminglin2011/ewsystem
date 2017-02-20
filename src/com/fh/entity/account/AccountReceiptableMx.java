package com.fh.entity.account;

import lombok.Data;

public class AccountReceiptableMx {

	private String sales_type;
	private String description;	
	private String remarks;	
	private String quantity;	
	private String unit_price;	
	private String gst_type;	
	private String gst_rate;	
	private String discount;	
	private String ledger_code;	
	private String accountreceiptablemx_ID;
	private String accountreceiptable_ID;
	public String getSales_type() {
		return sales_type;
	}
	public void setSales_type(String sales_type) {
		this.sales_type = sales_type;
	}
	public String getDescription() {
		return description;
	}
	public void setDescription(String description) {
		this.description = description;
	}
	public String getRemarks() {
		return remarks;
	}
	public void setRemarks(String remarks) {
		this.remarks = remarks;
	}
	public String getQuantity() {
		return quantity;
	}
	public void setQuantity(String quantity) {
		this.quantity = quantity;
	}
	public String getUnit_price() {
		return unit_price;
	}
	public void setUnit_price(String unit_price) {
		this.unit_price = unit_price;
	}
	public String getGst_type() {
		return gst_type;
	}
	public void setGst_type(String gst_type) {
		this.gst_type = gst_type;
	}
	public String getGst_rate() {
		return gst_rate;
	}
	public void setGst_rate(String gst_rate) {
		this.gst_rate = gst_rate;
	}
	public String getDiscount() {
		return discount;
	}
	public void setDiscount(String discount) {
		this.discount = discount;
	}
	public String getLedger_code() {
		return ledger_code;
	}
	public void setLedger_code(String ledger_code) {
		this.ledger_code = ledger_code;
	}
	public String getAccountreceiptablemx_ID() {
		return accountreceiptablemx_ID;
	}
	public void setAccountreceiptablemx_ID(String accountreceiptablemx_ID) {
		this.accountreceiptablemx_ID = accountreceiptablemx_ID;
	}
	public String getAccountreceiptable_ID() {
		return accountreceiptable_ID;
	}
	public void setAccountreceiptable_ID(String accountreceiptable_ID) {
		this.accountreceiptable_ID = accountreceiptable_ID;
	}
	
}
