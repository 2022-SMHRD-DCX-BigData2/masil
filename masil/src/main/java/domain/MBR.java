package domain;

import java.math.BigDecimal;

public class MBR {
	
	private BigDecimal mbr_nbr;
	private String mbr_type;
	private String mbr_id;
	private String mbr_pw;
	private BigDecimal area_nbr_for_mbr;
	private String fav_list;
	private String dog_list;
	
	

	public MBR(String mbr_id, String mbr_pw) {
		super();
		this.mbr_id = mbr_id;
		this.mbr_pw = mbr_pw;
	}


	public MBR(String mbr_id, String mbr_pw, BigDecimal area_nbr_for_mbr, String fav_list,
			String dog_list,String mbr_type) {
		super();
		this.mbr_type = mbr_type;
		this.mbr_id = mbr_id;
		this.mbr_pw = mbr_pw;
		this.area_nbr_for_mbr = area_nbr_for_mbr;
		this.fav_list = fav_list;
		this.dog_list = dog_list;
	}
	
	
	


	public MBR(BigDecimal mbr_nbr, String mbr_type, String mbr_id, String mbr_pw, BigDecimal area_nbr_for_mbr,
			String fav_list, String dog_list) {
		super();
		this.mbr_nbr = mbr_nbr;
		this.mbr_type = mbr_type;
		this.mbr_id = mbr_id;
		this.mbr_pw = mbr_pw;
		this.area_nbr_for_mbr = area_nbr_for_mbr;
		this.fav_list = fav_list;
		this.dog_list = dog_list;
	}


	public BigDecimal getMbr_nbr() {
		return mbr_nbr;
	}


	public void setMbr_nbr(BigDecimal mbr_nbr) {
		this.mbr_nbr = mbr_nbr;
	}


	public String getMbr_id() {
		return mbr_id;
	}


	public void setMbr_id(String mbr_id) {
		this.mbr_id = mbr_id;
	}


	public String getMbr_pw() {
		return mbr_pw;
	}


	public void setMbr_pw(String mbr_pw) {
		this.mbr_pw = mbr_pw;
	}


	public BigDecimal getArea_nbr_for_mbr() {
		return area_nbr_for_mbr;
	}


	public void setArea_nbr_for_mbr(BigDecimal area_nbr_for_mbr) {
		this.area_nbr_for_mbr = area_nbr_for_mbr;
	}


	public String getFav_list() {
		return fav_list;
	}


	public void setFav_list(String fav_list) {
		this.fav_list = fav_list;
	}


	public String getDog_list() {
		return dog_list;
	}


	public void setDog_list(String dog_list) {
		this.dog_list = dog_list;
	}


	public String getMbr_type() {
		return mbr_type;
	}


	public void setMbr_type(String mbr_type) {
		this.mbr_type = mbr_type;
	}
	
	
	
}
