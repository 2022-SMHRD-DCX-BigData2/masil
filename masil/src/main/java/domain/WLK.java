package domain;

import java.math.BigDecimal;

public class WLK {
	
	private BigDecimal wlk_nbr;
	private String wlk_name;
	private BigDecimal lat_for_wlk;
	private BigDecimal lon_for_wlk;
	private BigDecimal area_nbr_for_wlk;
	
	
	public WLK(BigDecimal wlk_nbr, String wlk_name, BigDecimal lat_for_wlk, BigDecimal lon_for_wlk,
			BigDecimal area_nbr_for_wlk) {
		super();
		this.wlk_nbr = wlk_nbr;
		this.wlk_name = wlk_name;
		this.lat_for_wlk = lat_for_wlk;
		this.lon_for_wlk = lon_for_wlk;
		this.area_nbr_for_wlk = area_nbr_for_wlk;
	}
	public WLK(String wlk_name, BigDecimal lat_for_wlk, BigDecimal lon_for_wlk, BigDecimal area_nbr_for_wlk) {
		super();
		this.wlk_name = wlk_name;
		this.lat_for_wlk = lat_for_wlk;
		this.lon_for_wlk = lon_for_wlk;
		this.area_nbr_for_wlk = area_nbr_for_wlk;
	}
	public BigDecimal getWlk_nbr() {
		return wlk_nbr;
	}
	public void setWlk_nbr(BigDecimal wlk_nbr) {
		this.wlk_nbr = wlk_nbr;
	}
	public String getWlk_name() {
		return wlk_name;
	}
	public void setWlk_name(String wlk_name) {
		this.wlk_name = wlk_name;
	}
	public BigDecimal getLat_for_wlk() {
		return lat_for_wlk;
	}
	public void setLat_for_wlk(BigDecimal lat_for_wlk) {
		this.lat_for_wlk = lat_for_wlk;
	}
	public BigDecimal getLon_for_wlk() {
		return lon_for_wlk;
	}
	public void setLon_for_wlk(BigDecimal lon_for_wlk) {
		this.lon_for_wlk = lon_for_wlk;
	}
	public BigDecimal getArea_nbr_for_wlk() {
		return area_nbr_for_wlk;
	}
	public void setArea_nbr_for_wlk(BigDecimal area_nbr_for_wlk) {
		this.area_nbr_for_wlk = area_nbr_for_wlk;
	}
	
	

}
