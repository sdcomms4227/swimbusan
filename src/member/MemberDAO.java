package member;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;

import javax.naming.Context;
import javax.naming.InitialContext;
import javax.sql.DataSource;

public class MemberDAO {

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
			System.out.println("freeResource메소드 내부에서 예외발생 : " + e.toString());
		}		
		
	}//freeResource

	public int insertMember(MemberBean memberBean) {

		String sql = "";

		try {
			
			conn = getConnection();
			sql = "insert into member values(?,?,?,?,?,?,?,?,now())";
			pstmt = conn.prepareStatement(sql);
			pstmt.setString(1, memberBean.getUserId());
			pstmt.setString(2, memberBean.getUserPw());
			pstmt.setString(3, memberBean.getUserName());
			pstmt.setString(4, memberBean.getUserEmail());
			pstmt.setInt(5, memberBean.getUserZipcode());
			pstmt.setString(6, memberBean.getUserAddress1());
			pstmt.setString(7, memberBean.getUserAddress2());
			pstmt.setString(8, memberBean.getUserPhone());

			return pstmt.executeUpdate();
			
		} catch (Exception e) {
			System.out.println("insertMember메소드 내부에서 예외발생 : " + e.toString());
		} finally {
			freeResource();
		}
		
		return 0;

	}//insertMember

	public int idCheck(String userId) {

		String sql = "";

		try {
			
			conn = getConnection();
			sql = "select * from member where userId = ?";
			pstmt = conn.prepareStatement(sql);
			pstmt.setString(1, userId);
			rs = pstmt.executeQuery();

			if (rs.next()) {
				return 1;
			}
			
		} catch (Exception e) {
			System.out.println("idCheck메소드 내부에서 예외발생 : " + e.toString());
		} finally {
			freeResource();
		}

		return 0;
		
	}//idCheck()

	public int userCheck(String userId, String userPw) {
		
		String sql = "select * from member where userId = ?";
		
		try {
			
			conn = getConnection();
			pstmt = conn.prepareStatement(sql);
			pstmt.setString(1, userId);
			rs = pstmt.executeQuery();

			if (rs.next()) {
				if (userPw.equals(rs.getString("userPw"))) {
					return 1;
				} else {
					return -1;
				}
			}else {
				return -2;
			}
		} catch (Exception e) {
			System.out.println("userCheck메소드 내부에서 예외발생 : " + e.toString());
		} finally {
			freeResource();
		}

		return 0;
		
	}//userCheck()

	public MemberBean getMember(String userId) {
		
		String sql = "";
		
		MemberBean memberBean = new MemberBean();
		
		try {
			
			conn = getConnection();
			sql = "select * from member where userId = ?";
			pstmt = conn.prepareStatement(sql);
			pstmt.setString(1, userId);
			rs = pstmt.executeQuery();
			
			while(rs.next()) {
				memberBean.setUserId(rs.getString("userId"));
				memberBean.setUserPw(rs.getString("userPw"));
				memberBean.setUserName(rs.getString("userName"));
				memberBean.setUserEmail(rs.getString("userEmail"));
				memberBean.setUserZipcode(rs.getInt("userZipcode"));
				memberBean.setUserAddress1(rs.getString("userAddress1"));
				memberBean.setUserAddress2(rs.getString("userAddress2"));
				memberBean.setUserPhone(rs.getString("userPhone"));
				memberBean.setUserRegdate(rs.getTimestamp("userRegdate"));
			}
			
		}catch(Exception e) {
			System.out.println("getMember()메소드 내부에서 예외발생 : " + e.toString());
		} finally {
			freeResource();			
		}
		
		return memberBean;
		
	}//getMember()

	public int updateMember(MemberBean memberBean) {
		
		String sql = "select * from member where userId = ?";
		
		try {
			
			conn = getConnection();
			pstmt = conn.prepareStatement(sql);
			pstmt.setString(1, memberBean.getUserId());
			rs = pstmt.executeQuery();

			if (rs.next()) {
				if (memberBean.getUserPw().equals(rs.getString("userPw"))) {

					sql = "update member set userName=?, userEmail=?, userZipcode=?, userAddress1=?, userAddress2=?, userPhone=? where userId=?";
					pstmt = conn.prepareStatement(sql);
					pstmt.setString(1, memberBean.getUserName());
					pstmt.setString(2, memberBean.getUserEmail());
					pstmt.setInt(3, memberBean.getUserZipcode());
					pstmt.setString(4, memberBean.getUserAddress1());
					pstmt.setString(5, memberBean.getUserAddress2());
					pstmt.setString(6, memberBean.getUserPhone());
					pstmt.setString(7, memberBean.getUserId());
					
					return pstmt.executeUpdate(); 
				}else {
					return -1;
				}
			}

		} catch (Exception e) {
			System.out.println("updateMember메소드 내부에서 예외발생 : " + e.toString());
		} finally {
			freeResource();
		}
		
		return 0;

	}//updateMember
	
	public int updatePassword(String userId, String userPw, String newPw) {
		
		String sql = "select * from member where userId = ?";
		
		try {
			
			conn = getConnection();
			pstmt = conn.prepareStatement(sql);
			pstmt.setString(1, userId);
			rs = pstmt.executeQuery();
			
			if (rs.next()) {
				if (userPw.equals(rs.getString("userPw"))) {
					
					sql = "update member set userPw=? where userId=?";
					pstmt = conn.prepareStatement(sql);
					pstmt.setString(1, newPw);
					pstmt.setString(2, userId);
					
					return pstmt.executeUpdate(); 
				}else {
					return -1;
				}
			}
			
		} catch (Exception e) {
			System.out.println("updatePassword메소드 내부에서 예외발생 : " + e.toString());
		} finally {
			freeResource();
		}
		
		return 0;
		
	}//updatePassword
	
	public int deleteMember(String userId, String userPw) {
		
		String sql = "select * from member where userId = ?";
				
		try {
			
			conn = getConnection();
			pstmt = conn.prepareStatement(sql);
			pstmt.setString(1, userId);
			rs = pstmt.executeQuery();
			
			if (rs.next()) {
				if (userPw.equals(rs.getString("userPw"))) {
					
					sql = "delete from member where userId=?";
					pstmt = conn.prepareStatement(sql);
					pstmt.setString(1, userId);
					
					return pstmt.executeUpdate(); 
				}else {
					return -1;
				}
			}
			
		} catch (Exception e) {
			System.out.println("deleteMember메소드 내부에서 예외발생 : " + e.toString());
		} finally {
			freeResource();
		}
		
		return 0;
		
	}//deleteMember
	
}//MemberDAO
