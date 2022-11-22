package domain;

import java.math.BigDecimal;
import java.sql.Date;

public class WRT {
	
	private BigDecimal wrt_nbr;
	private String wrt_ttl;
	private String wrt_cnt;
	private BigDecimal wrt_ath; 
	private BigDecimal wrt_type;
	private BigDecimal nbr_for_wrt_type;
	private java.sql.Timestamp wrt_time;
	//wrt_time은 시간이 어떤 형식으로 들어가는지 몰라서 보류
	
	//게시판 생성. 시간 제외.

	public WRT(BigDecimal wrt_nbr, String wrt_ttl, BigDecimal wrt_ath,java.sql.Timestamp  wrt_time) {
		super();
		this.wrt_nbr = wrt_nbr;
		this.wrt_ttl = wrt_ttl;
		this.wrt_ath = wrt_ath;
		this.wrt_time = wrt_time;
	}


	public WRT(String wrt_ttl, String wrt_cnt, BigDecimal wrt_ath, BigDecimal wrt_type, BigDecimal nbr_for_wrt_type) {
		super();
		this.wrt_ttl = wrt_ttl;
		this.wrt_cnt = wrt_cnt;
		this.wrt_ath = wrt_ath;
		this.wrt_type = wrt_type;
		this.nbr_for_wrt_type = nbr_for_wrt_type;
	}
	
	
	


	public java.sql.Timestamp  getWrt_time() {
		return wrt_time;
	}


	public void setWrt_time(java.sql.Timestamp  wrt_time) {
		this.wrt_time = wrt_time;
	}


	public WRT(BigDecimal wrt_nbr, String wrt_ttl, String wrt_cnt, BigDecimal wrt_ath, BigDecimal wrt_type,
			BigDecimal nbr_for_wrt_type, java.sql.Timestamp  wrt_time) {
		super();
		this.wrt_nbr = wrt_nbr;
		this.wrt_ttl = wrt_ttl;
		this.wrt_cnt = wrt_cnt;
		this.wrt_ath = wrt_ath;
		this.wrt_type = wrt_type;
		this.nbr_for_wrt_type = nbr_for_wrt_type;
		this.wrt_time = wrt_time;
	}


	public BigDecimal getWrt_nbr() {
		return wrt_nbr;
	}


	public void setWrt_nbr(BigDecimal wrt_nbr) {
		this.wrt_nbr = wrt_nbr;
	}


	public String getWrt_ttl() {
		return wrt_ttl;
	}



	public void setWrt_ttl(String wrt_ttl) {
		this.wrt_ttl = wrt_ttl;
	}

	public String getWrt_cnt() {
		return wrt_cnt;
	}

	public void setWrt_cnt(String wrt_cnt) {
		this.wrt_cnt = wrt_cnt;
	}

	public BigDecimal getWrt_ath() {
		return wrt_ath;
	}

	public void setWrt_ath(BigDecimal wrt_ath) {
		this.wrt_ath = wrt_ath;
	}

	public BigDecimal getWrt_type() {
		return wrt_type;
	}

	public void setWrt_type(BigDecimal wrt_type) {
		this.wrt_type = wrt_type;
	}


	public BigDecimal getNbr_for_wrt_type() {
		return nbr_for_wrt_type;
	}


	public void setNbr_for_wrt_type(BigDecimal nbr_for_wrt_type) {
		this.nbr_for_wrt_type = nbr_for_wrt_type;
	}


	
	
}
