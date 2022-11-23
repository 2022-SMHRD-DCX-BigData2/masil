package domain;

import java.math.BigDecimal;
import java.sql.Timestamp;

public class WLK_LOG {
	BigDecimal wlk_nbr_for_wlk_log;
	BigDecimal wlk_rt_nbr_for_wlk_log;
	java.sql.Timestamp wlk_time;
	String wlk_dog_list;
	
	
	
	
	public WLK_LOG(BigDecimal wlk_nbr_for_wlk_log, BigDecimal wlk_rt_nbr_for_wlk_log, String wlk_dog_list) {
		super();
		this.wlk_nbr_for_wlk_log = wlk_nbr_for_wlk_log;
		this.wlk_rt_nbr_for_wlk_log = wlk_rt_nbr_for_wlk_log;
		this.wlk_dog_list = wlk_dog_list;
	}

	public WLK_LOG(BigDecimal wlk_nbr_for_wlk_log, BigDecimal wlk_rt_nbr_for_wlk_log, Timestamp wlk_time,
			String wlk_dog_list) {
		super();
		this.wlk_nbr_for_wlk_log = wlk_nbr_for_wlk_log;
		this.wlk_rt_nbr_for_wlk_log = wlk_rt_nbr_for_wlk_log;
		this.wlk_time = wlk_time;
		this.wlk_dog_list = wlk_dog_list;
	}

	public BigDecimal getWlk_nbr_for_wlk_log() {
		return wlk_nbr_for_wlk_log;
	}

	public void setWlk_nbr_for_wlk_log(BigDecimal wlk_nbr_for_wlk_log) {
		this.wlk_nbr_for_wlk_log = wlk_nbr_for_wlk_log;
	}

	public BigDecimal getWlk_rt_nbr_for_wlk_log() {
		return wlk_rt_nbr_for_wlk_log;
	}

	public void setWlk_rt_nbr_for_wlk_log(BigDecimal wlk_rt_nbr_for_wlk_log) {
		this.wlk_rt_nbr_for_wlk_log = wlk_rt_nbr_for_wlk_log;
	}

	public java.sql.Timestamp getWlk_time() {
		return wlk_time;
	}

	public void setWlk_time(java.sql.Timestamp wlk_time) {
		this.wlk_time = wlk_time;
	}

	public String getWlk_dog_list() {
		return wlk_dog_list;
	}

	public void setWlk_dog_list(String wlk_dog_list) {
		this.wlk_dog_list = wlk_dog_list;
	}
	
	
	
}
