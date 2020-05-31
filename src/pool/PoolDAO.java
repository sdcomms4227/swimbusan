package pool;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

import javax.naming.Context;
import javax.naming.InitialContext;
import javax.sql.DataSource;

import pool.PoolBean;

public class PoolDAO {

	Connection conn;
	PreparedStatement pstmt;
	ResultSet rs;

	private Connection getConnection() throws Exception {
		Context init = new InitialContext();
		DataSource ds = (DataSource) init.lookup("java:comp/env/jdbc/swimbusan");
		Connection conn = ds.getConnection();
		return conn;
	}

	private void freeResource() {
		try {
			if (conn != null)
				conn.close();
			if (pstmt != null)
				pstmt.close();
			if (rs != null)
				rs.close();
		} catch (SQLException e) {
			e.printStackTrace();
		}
	}
	
	public int insertPool(PoolBean poolBean) {
		String sql = "";
		int num = 0;
				
		if(poolBean.getPoolName()==null || poolBean.getPoolName().equals("")) {
			return -1;
		}else {
			try {
				conn = getConnection();
				sql = "select max(poolNum) from pool";
				pstmt = conn.prepareStatement(sql);
				rs = pstmt.executeQuery();
	
				if (rs.next()) {
					num = rs.getInt(1) + 1;
				} else {
					num = 1;
				}
	
				sql = "insert into pool(poolNum, poolName, poolZipcode, poolAddress1, poolAddress2, poolTel, poolUrl, poolContent, poolDate)"
						+ "values(?,?,?,?,?,?,?,?,now())";
	
				pstmt = conn.prepareStatement(sql);
				pstmt.setInt(1, num);
				pstmt.setString(2, poolBean.getPoolName());
				pstmt.setInt(3, poolBean.getPoolZipcode());
				pstmt.setString(4, poolBean.getPoolAddress1());
				pstmt.setString(5, poolBean.getPoolAddress2());
				pstmt.setString(6, poolBean.getPoolTel());
				pstmt.setString(7, poolBean.getPoolUrl());
				pstmt.setString(8, poolBean.getPoolContent());
	
				return pstmt.executeUpdate();
	
			} catch (Exception e) {
				System.out.println("insertPool()메소드 내부에서 예외발생 : " + e.toString());
			} finally {
				freeResource();
			}
		}		
		
		return 0;
	}//insertPool

	public int getPoolCount(String search) {
		
		String sql = "";
		int count = 0;

		try {

			conn = getConnection();			

			sql = "select count(*) from pool where poolName like ?";	
			pstmt = conn.prepareStatement(sql);
			pstmt.setString(1, "%" + search + "%");
			rs = pstmt.executeQuery();

			if (rs.next()) {
				count = rs.getInt(1);
			}

		} catch (Exception e) {
			System.out.println("getPoolCount()메소드 내부에서 예외발생 : " + e.toString());
		} finally {
			freeResource();
		}

		return count;
		
	}// getPoolCount

	public List<PoolBean> getPoolList(String search, int startRow, int pageSize) {
		String sql = "";
		List<PoolBean> poolList = new ArrayList<PoolBean>();
		
		try {

			conn = getConnection();
					
			sql = "select * from pool where poolName like ? order by poolName limit ?, ?";
			pstmt = conn.prepareStatement(sql);
			pstmt.setString(1, "%" + search + "%");
			pstmt.setInt(2, startRow);
			pstmt.setInt(3, pageSize);						
			rs = pstmt.executeQuery();

			while (rs.next()) {
				PoolBean poolBean = new PoolBean();

				poolBean.setPoolAddress1(rs.getString("poolAddress1"));
				poolBean.setPoolAddress2(rs.getString("poolAddress2"));
				poolBean.setPoolContent(rs.getString("poolContent"));
				poolBean.setPoolDate(rs.getTimestamp("poolDate"));
				poolBean.setPoolName(rs.getString("poolName"));
				poolBean.setPoolNum(rs.getInt("poolNum"));
				poolBean.setPoolTel(rs.getString("poolTel"));
				poolBean.setPoolUrl(rs.getString("poolUrl"));
				poolBean.setPoolZipcode(rs.getInt("poolZipcode"));

				poolList.add(poolBean);
			}

		} catch (Exception e) {
			System.out.println("getPoolList()메소드 내부에서 예외발생 : " + e.toString());
		} finally {
			freeResource();
		}

		return poolList;
	}// getPoolList

	public List<PoolBean> getPoolNameList() {
		String sql = "";
		List<PoolBean> poolList = new ArrayList<PoolBean>();
		
		try {

			conn = getConnection();
					
			sql = "select poolName from pool order by poolName";
			pstmt = conn.prepareStatement(sql);		
			rs = pstmt.executeQuery();

			while (rs.next()) {
				PoolBean poolBean = new PoolBean();
				poolBean.setPoolName(rs.getString("poolName"));
				poolList.add(poolBean);
			}

		} catch (Exception e) {
			System.out.println("getPoolNameList()메소드 내부에서 예외발생 : " + e.toString());
		} finally {
			freeResource();
		}

		return poolList;
	}// getPoolNameList

	public PoolBean getPool(int poolNum) {
		String sql = "";

		PoolBean poolBean = new PoolBean();

		try {

			conn = getConnection();
			sql = "select * from pool where poolNum = ?";
			pstmt = conn.prepareStatement(sql);
			pstmt.setInt(1, poolNum);
			rs = pstmt.executeQuery();

			while (rs.next()) {
				poolBean.setPoolAddress1(rs.getString("poolAddress1"));
				poolBean.setPoolAddress2(rs.getString("poolAddress2"));
				poolBean.setPoolContent(rs.getString("poolContent"));
				poolBean.setPoolDate(rs.getTimestamp("poolDate"));
				poolBean.setPoolName(rs.getString("poolName"));
				poolBean.setPoolNum(rs.getInt("poolNum"));
				poolBean.setPoolTel(rs.getString("poolTel"));
				poolBean.setPoolUrl(rs.getString("poolUrl"));
				poolBean.setPoolZipcode(rs.getInt("poolZipcode"));
			}
		} catch (Exception e) {
			System.out.println("getPool()메소드 내부에서 예외발생 : " + e.toString());
		} finally {
			freeResource();
		}

		return poolBean;
	}// getPool

	public int updatePool(PoolBean poolBean) {
		String sql = "";
		
		System.out.println(poolBean.getPoolName());
		System.out.println(poolBean.getPoolZipcode());
		System.out.println(poolBean.getPoolAddress1());
		System.out.println(poolBean.getPoolAddress2());
		System.out.println(poolBean.getPoolTel());
		System.out.println(poolBean.getPoolUrl());
		System.out.println(poolBean.getPoolContent());
		System.out.println(poolBean.getPoolNum());

		try {			
			conn = getConnection();
			sql = "update pool set poolName=?, poolZipcode=?, poolAddress1=?, poolAddress2=?, poolTel=?, poolUrl=?, poolContent=? where poolNum=?";					
			pstmt = conn.prepareStatement(sql);
			pstmt.setString(1, poolBean.getPoolName());
			pstmt.setInt(2, poolBean.getPoolZipcode());
			pstmt.setString(3, poolBean.getPoolAddress1());
			pstmt.setString(4, poolBean.getPoolAddress2());
			pstmt.setString(5, poolBean.getPoolTel());
			pstmt.setString(6, poolBean.getPoolUrl());
			pstmt.setString(7, poolBean.getPoolContent());
			pstmt.setInt(8, poolBean.getPoolNum());
			
			return pstmt.executeUpdate();
			
		} catch (Exception e) {
			System.out.println("updatePool()메소드 내부에서 예외발생 : " + e.toString());
		} finally {
			freeResource();
		}

		return 0;
	}// updatePool

	public int deletePool(int poolNum) {
		String sql = "";
		
		try {
			conn = getConnection();
			sql = "delete from pool where poolNum=?";
			pstmt = conn.prepareStatement(sql);
			pstmt.setInt(1, poolNum);
			return pstmt.executeUpdate();
		} catch (Exception e) {
			System.out.println("deletePool()메소드 내부에서 예외발생 : " + e.toString());
		} finally {
			freeResource();
		}
		
		return 0;
	}// deletePool
}// PoolDAO
