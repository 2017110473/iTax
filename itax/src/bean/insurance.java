/*
 * ���ܣ���װinsurance�е����ݣ�Ϊ���ݿ�����ӷ���
 *
 *������������ܲ���
 **/
package bean;

public class insurance {
	private String region; // ����
	private String pension; // ����
	private String Lpension; //���ϻ�������
	private String Upension; //���ϻ������� 
	private String med;  //ҽ��
	private String Lmed;  //ҽ�Ʊ��ջ�������
	private String Umed;  //ҽ�Ʊ��ջ�������
	private String unemp; //ʧҵ
	private String Lunemp;  //ʧҵ���ջ�������
	private String Uunemp;  // ʧҵ���ջ�������
	private String house; //ס��
	private String Lhouse; //ס���������������
	private String Uhouse; //ס���������������
	
	public String getRegion() {
		return region;
	}

	public void setRegion(String region) {
		this.region = region;
	}

	public String getPension() {
		return pension;
	}

	public void setPension(String pension) {
		this.pension = pension;
	}

	public String getUpension() {
		return Upension;
	}

	public void setUpension(String upension) {
		Upension = upension;
	}

	public String getLpension() {
		return Lpension;
	}

	public void setLpension(String lpension) {
		Lpension = lpension;
	}

	public String getMed() {
		return med;
	}

	public void setMed(String med) {
		this.med = med;
	}

	public String getLmed() {
		return Lmed;
	}

	public void setLmed(String lmed) {
		Lmed = lmed;
	}

	public String getUmed() {
		return Umed;
	}

	public void setUmed(String umed) {
		Umed = umed;
	}

	public String getUnemp() {
		return unemp;
	}

	public void setUnemp(String unemp) {
		this.unemp = unemp;
	}

	public String getLunemp() {
		return Lunemp;
	}

	public void setLunemp(String lunemp) {
		Lunemp = lunemp;
	}

	public String getUunemp() {
		return Uunemp;
	}

	public void setUunemp(String uunemp) {
		Uunemp = uunemp;
	}

	public String getHouse() {
		return house;
	}

	public void setHouse(String house) {
		this.house = house;
	}

	public String getLhouse() {
		return Lhouse;
	}

	public void setLhouse(String lhouse) {
		Lhouse = lhouse;
	}

	public String getUhouse() {
		return Uhouse;
	}

	public void setUhouse(String uhouse) {
		Uhouse = uhouse;
	}
	
	public insurance(String region, String pension, String Lpension, String Upension, String med, String Lmed, String Umed, String unemp, String Lunemp, String Uunemp, String house, String Lhouse, String Uhouse) {
		this.region = region;
		this.house = house;
		this.Lhouse = Lhouse;
		this.Uhouse = Uhouse;
		this.med = med;
		this.Lmed = Lmed;
		this.Umed = Umed;
		this.pension = pension;
		this.Lpension = Lpension;
		this.Upension = Upension;
		this.unemp = unemp;
		this.Lunemp = Lunemp;
		this.Uunemp = Uunemp;
	}
	public insurance() {
		
	}
	
}
