package domain;

import java.math.BigDecimal;
import java.sql.Timestamp;

public class CMT {
	BigDecimal cmt_nbr;
	BigDecimal wrt_nbr_for_cmt;
	BigDecimal cmt_ath;
	String cmt_cnt;
	private java.sql.Timestamp cmt_time;
	String cmt_id;
	
	
	
	public CMT(BigDecimal wrt_nbr_for_cmt, BigDecimal cmt_ath, String cmt_cnt) {
		super();
		this.wrt_nbr_for_cmt = wrt_nbr_for_cmt;
		this.cmt_ath = cmt_ath;
		this.cmt_cnt = cmt_cnt;
	}
	
	
	
	
	
	public CMT(BigDecimal cmt_nbr, BigDecimal wrt_nbr_for_cmt, BigDecimal cmt_ath, String cmt_cnt, Timestamp cmt_time) {
		super();
		this.cmt_nbr = cmt_nbr;
		this.wrt_nbr_for_cmt = wrt_nbr_for_cmt;
		this.cmt_ath = cmt_ath;
		this.cmt_cnt = cmt_cnt;
		this.cmt_time = cmt_time;
	}

	



	public CMT(BigDecimal cmt_nbr, BigDecimal wrt_nbr_for_cmt, BigDecimal cmt_ath, String cmt_cnt, Timestamp cmt_time,
			String cmt_id) {
		super();
		this.cmt_nbr = cmt_nbr;
		this.wrt_nbr_for_cmt = wrt_nbr_for_cmt;
		this.cmt_ath = cmt_ath;
		this.cmt_cnt = cmt_cnt;
		this.cmt_time = cmt_time;
		this.cmt_id = cmt_id;
	}





	public BigDecimal getCmt_nbr() {
		return cmt_nbr;
	}

	public void setCmt_nbr(BigDecimal cmt_nbr) {
		this.cmt_nbr = cmt_nbr;
	}

	public BigDecimal getWrt_nbr_for_cmt() {
		return wrt_nbr_for_cmt;
	}

	public void setWrt_nbr_for_cmt(BigDecimal wrt_nbr_for_cmt) {
		this.wrt_nbr_for_cmt = wrt_nbr_for_cmt;
	}

	public BigDecimal getCmt_ath() {
		return cmt_ath;
	}

	public void setCmt_ath(BigDecimal cmt_ath) {
		this.cmt_ath = cmt_ath;
	}

	public String getCmt_cnt() {
		return cmt_cnt;
	}

	public void setCmt_cnt(String cmt_cnt) {
		this.cmt_cnt = cmt_cnt;
	}
	
	public java.sql.Timestamp getCmt_time() {
		return cmt_time;
	}

	public void setCmt_time(java.sql.Timestamp cmt_time) {
		this.cmt_time = cmt_time;
	}





	public String getCmt_id() {
		return cmt_id;
	}





	public void setCmt_id(String cmt_id) {
		this.cmt_id = cmt_id;
	}

	
	
}
