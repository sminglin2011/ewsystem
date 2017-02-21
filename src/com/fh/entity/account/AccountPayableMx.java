package com.fh.entity.account;

import lombok.Data;
@Data
public class AccountPayableMx {

	private String ap_number;	
	private String cost_type;
	private String ledger_code;
	private String description;	
	private String remarks;	
	private String quantity;	
	private String unit_price;	
	private String gst_type;	
	private String gst_rate;	
	private String discount;	
	private String amount;
	private String gst_amount;
	private String accountpayablemx_ID;
	private String accountpayable_ID;
	
	
	public String getAp_number() {
		return ap_number;
	}
	public void setAp_number(String ap_number) {
		this.ap_number = ap_number;
	}
	public String getCost_type() {
		return cost_type;
	}
	public void setCost_type(String cost_type) {
		this.cost_type = cost_type;
	}
	public String getLedger_code() {
		return ledger_code;
	}
	public void setLedger_code(String ledger_code) {
		this.ledger_code = ledger_code;
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
	public String getAccountpayablemx_ID() {
		return accountpayablemx_ID;
	}
	public void setAccountpayablemx_ID(String accountpayablemx_ID) {
		this.accountpayablemx_ID = accountpayablemx_ID;
	}
	public String getAccountpayable_ID() {
		return accountpayable_ID;
	}
	public void setAccountpayable_ID(String accountpayable_ID) {
		this.accountpayable_ID = accountpayable_ID;
	}
	public String getAmount() {
		return amount;
	}
	public void setAmount(String amount) {
		this.amount = amount;
	}
	public String getGst_amount() {
		return gst_amount;
	}
	public void setGst_amount(String gst_amount) {
		this.gst_amount = gst_amount;
	}
	
	
}
