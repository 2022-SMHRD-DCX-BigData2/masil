package domain;

//import java.math.BigDecimal;

public class AREA {
	
	//private BigDecimal area_nbr;
	private String b_cls;
	private String s_cls;
	

	public AREA(String b_cls, String s_cls) {
		super();
		this.b_cls = b_cls;
		this.s_cls = s_cls;
	}
	

	public String getB_cls() {
		return b_cls;
	}

	public void setB_cls(String b_cls) {
		this.b_cls = b_cls;
	}

	public String getS_cls() {
		return s_cls;
	}

	public void setS_cls(String s_cls) {
		this.s_cls = s_cls;
	}
	
	
	

}
