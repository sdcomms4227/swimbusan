package pool;

import java.sql.Timestamp;

public class PoolBean {

	private int poolNum;
	private String poolName;
	private int poolZipcode;
	private String poolAddress1;
	private String poolAddress2;
	private String poolTel;
	private String poolUrl;
	private String poolContent;
	private Timestamp poolDate;

	public int getPoolNum() {
		return poolNum;
	}

	public void setPoolNum(int poolNum) {
		this.poolNum = poolNum;
	}

	public String getPoolName() {
		return poolName;
	}

	public void setPoolName(String poolName) {
		this.poolName = poolName;
	}

	public int getPoolZipcode() {
		return poolZipcode;
	}

	public void setPoolZipcode(int poolZipcode) {
		this.poolZipcode = poolZipcode;
	}

	public String getPoolAddress1() {
		return poolAddress1;
	}

	public void setPoolAddress1(String poolAddress1) {
		this.poolAddress1 = poolAddress1;
	}

	public String getPoolAddress2() {
		return poolAddress2;
	}

	public void setPoolAddress2(String poolAddress2) {
		this.poolAddress2 = poolAddress2;
	}

	public String getPoolTel() {
		return poolTel;
	}

	public void setPoolTel(String poolTel) {
		this.poolTel = poolTel;
	}

	public String getPoolUrl() {
		return poolUrl;
	}

	public void setPoolUrl(String poolUrl) {
		this.poolUrl = poolUrl;
	}

	public String getPoolContent() {
		return poolContent;
	}

	public void setPoolContent(String poolContent) {
		this.poolContent = poolContent;
	}

	public Timestamp getPoolDate() {
		return poolDate;
	}

	public void setPoolDate(Timestamp poolDate) {
		this.poolDate = poolDate;
	}

}
