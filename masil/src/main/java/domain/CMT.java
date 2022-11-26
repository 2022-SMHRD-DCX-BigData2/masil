package domain;

import java.math.BigDecimal;

public class CMT {
	BigDecimal cmt_nbr;
	BigDecimal wrt_nbr_for_cmt;
	BigDecimal cmt_ath;
	String cmt_cnt;
	
	public CMT(BigDecimal wrt_nbr_for_cmt, BigDecimal cmt_ath, String cmt_cnt) {
		super();
		this.wrt_nbr_for_cmt = wrt_nbr_for_cmt;
		this.cmt_ath = cmt_ath;
		this.cmt_cnt = cmt_cnt;
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
	
	

}
