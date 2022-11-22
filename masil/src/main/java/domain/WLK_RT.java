package domain;

import java.math.BigDecimal;

public class WLK_RT {
	
	BigDecimal wlk_rt_nbr_for_wlk_rt;
	BigDecimal wlk_rt_path_nbr;
	BigDecimal lat_for_wlk_rt;
	BigDecimal lon_for_wlk_rt;

	
	public WLK_RT(BigDecimal wlk_rt_nbr_for_wlk_rt, BigDecimal wlk_rt_path_nbr, BigDecimal lat_for_wlk_rt,
			BigDecimal lon_for_wlk_rt) {
		super();
		this.wlk_rt_nbr_for_wlk_rt = wlk_rt_nbr_for_wlk_rt;
		this.wlk_rt_path_nbr = wlk_rt_path_nbr;
		this.lat_for_wlk_rt = lat_for_wlk_rt;
		this.lon_for_wlk_rt = lon_for_wlk_rt;
		
	}

	public BigDecimal getWlk_rt_nbr_for_wlk_rt() {
		return wlk_rt_nbr_for_wlk_rt;
	}

	public void setWlk_rt_nbr_for_wlk_rt(BigDecimal wlk_rt_nbr_for_wlk_rt) {
		this.wlk_rt_nbr_for_wlk_rt = wlk_rt_nbr_for_wlk_rt;
	}

	public BigDecimal getWlk_rt_path_nbr() {
		return wlk_rt_path_nbr;
	}

	public void setWlk_rt_path_nbr(BigDecimal wlk_rt_path_nbr) {
		this.wlk_rt_path_nbr = wlk_rt_path_nbr;
	}

	public BigDecimal getLon_for_wlk_rt() {
		return lon_for_wlk_rt;
	}

	public void setLon_for_wlk_rt(BigDecimal lon_For_wlk_rt) {
		this.lon_for_wlk_rt = lon_For_wlk_rt;
	}

	public BigDecimal getLat_for_wlk_rt() {
		return lat_for_wlk_rt;
	}

	public void setLat_for_wlk_rt(BigDecimal lat_for_wlk_rt) {
		this.lat_for_wlk_rt = lat_for_wlk_rt;
	}
	
	
	

}
