package domain;

import java.math.BigDecimal;

public class MTH_WLK_RT_NAME {
	
	private BigDecimal wlk_rt_nbr;
	private BigDecimal wlk_nbr_for_wlk_rt;
	private String wlk_rt_name;

	
	public MTH_WLK_RT_NAME(String wlk_rt_name, BigDecimal wlk_nbr_for_wlk_rt) {
		super();
		this.wlk_rt_name = wlk_rt_name;
		this.wlk_nbr_for_wlk_rt = wlk_nbr_for_wlk_rt;
	}
	

	public MTH_WLK_RT_NAME(BigDecimal wlk_rt_nbr, BigDecimal wlk_nbr_for_wlk_rt, String wlk_rt_name) {
		super();
		this.wlk_rt_nbr = wlk_rt_nbr;
		this.wlk_nbr_for_wlk_rt = wlk_nbr_for_wlk_rt;
		this.wlk_rt_name = wlk_rt_name;
	}



	public BigDecimal getWlk_rt_nbr() {
		return wlk_rt_nbr;
	}

	public void setWlk_rt_nbr(BigDecimal wlk_rt_nbr) {
		this.wlk_rt_nbr = wlk_rt_nbr;
	}

	public String getWlk_rt_name() {
		return wlk_rt_name;
	}

	public void setWlk_rt_name(String wlk_rt_name) {
		this.wlk_rt_name = wlk_rt_name;
	}

	public BigDecimal getWlk_nbr_for_wlk_rt() {
		return wlk_nbr_for_wlk_rt;
	}

	public void setWlk_nbr_for_wlk_rt(BigDecimal wlk_nbr_for_wlk_rt) {
		this.wlk_nbr_for_wlk_rt = wlk_nbr_for_wlk_rt;
	}
	
	
	

}
