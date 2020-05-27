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
			e.printStackTrace();
		}
	}

	public int insertMember(MemberBean memberbean) {

		String sql = "";

		try {
			conn = getConnection();
			sql = "insert into member values(?,?,?,?,?,?,?,?,now())";
			pstmt = conn.prepareStatement(sql);
			pstmt.setString(1, memberbean.getId());
			pstmt.setString(2, memberbean.getPw());
			pstmt.setString(3, memberbean.getName());
			pstmt.setString(4, memberbean.getEmail());
			pstmt.setInt(5, memberbean.getZipcode());
			pstmt.setString(6, memberbean.getAddress1());
			pstmt.setString(7, memberbean.getAddress2());
			pstmt.setString(8, memberbean.getPhone());

			return pstmt.executeUpdate();
		} catch (Exception e) {
			System.out.println("insertMember메소드 내부에서 예외발생 : " + e.toString());
		} finally {
			freeResource();
		}
		
		return 0;

	}// insertMember메소드

	// 회원가입을 위해 사용자가 입력한 id값을 매개변수로 전달받아..
	// DB에 사용자가 입력한 id값이 존재하는지 SELECT하여..
	// 만약 사용자가 입력한 id에 해당하는 회원레코드가 SELECT되면?
	// check변수값을 1로 저장하여 <-- 아이디 중복을 나타내게 하고,
	// 만약 사용자가 입력한 id에 해당하는 회원레코드가 없으면?
	// check변수값을 0으로 저장하여 <-- 아이디 중복 아님을 나타내게 함.
	// 결과적으로.. 아이디 중복이냐 중복이 아니냐는 check변수에 저장되어 있으므로 check변수값을 리턴함.
	public int idCheck(String id) {

		// SQL문을 생성해서 저장할 변수 선언
		String sql = "";

		// 아이디 중복이냐 아니냐 판단하는 값
		int check = 0;

		try {
			// 커넥션풀로부터 커넥션 얻기
			conn = getConnection();

			// 매개변수로 전달받은 id에 해당하는 레코드 검색 SQL문 만들기
			sql = "select * from member where id = ?";

			// SELECT구문을 실행할 PreparedStatement객체 얻기
			pstmt = conn.prepareStatement(sql);

			// ? 값 설정
			pstmt.setString(1, id);

			// SELECT문 실행후 검색한 결과를 ResultSet에 저장후 얻기
			rs = pstmt.executeQuery();

			// 검색한 데이터가 존재하면
			if (rs.next()) {

				// check변수값을 1로 저장
				check = 1;

				// 검색한 데이터가 존재하지 않으면
			} else {

				// check변수값을 0으로 저장
				check = 0;
			}

		} catch (Exception e) {
			System.out.println("idCheck메소드 내부에서 예외발생 : " + e.toString());
		} finally {
			freeResource();
		}

		return check;
	}// idCheck메소드

	public int userCheck(String id, String pw) {
		Connection conn = null;
		PreparedStatement pstmt = null;
		String sql = "";
		ResultSet rs = null;

		int check = -1; // 1 -> 아이디, 비밀번호 맞음
						// 0 -> 아이디 맞음, 비밀번호 틀림
						// -1 -> 아이디 틀림

		try {
			conn = getConnection();
			sql = "select * from member where id = ?";
			pstmt = conn.prepareStatement(sql);
			pstmt.setString(1, id);
			rs = pstmt.executeQuery();

			// 아이디가 존재함
			if (rs.next()) {

				// 비밀번호 존재함
				if (pw.equals(rs.getString("pw"))) {

					// 아이디 맞음, 비밀번호 맞음
					check = 1;

					// 비밀번호가 존재하지 않음
				} else {

					// 아이디 맞음, 비밀번호 틀림
					check = 0;
				}

				// 아이디가 존재하지 않음
			} else {

				// 아이디 틀림
				check = -1;
			}

		} catch (Exception e) {
			System.out.println("userCheck메소드 내부에서 예외발생 : " + e.toString());
		} finally {
			freeResource();
		}

		// loginPro.jsp로 반환
		return check;
	}// userCheck메소드

	public MemberBean getMember(String id) {
		String sql = "";
		
		MemberBean memberbean = new MemberBean();
		
		try {
			conn = getConnection();
			sql = "select * from member where id = ?";
			pstmt = conn.prepareStatement(sql);
			pstmt.setString(1, id);
			rs = pstmt.executeQuery();
			while(rs.next()) {
				memberbean.setId(rs.getString("id"));
				memberbean.setPw(rs.getString("pw"));
				memberbean.setName(rs.getString("name"));
				memberbean.setEmail(rs.getString("email"));
				memberbean.setZipcode(rs.getInt("zipcode"));
				memberbean.setAddress1(rs.getString("address1"));
				memberbean.setAddress2(rs.getString("address2"));
				memberbean.setPhone(rs.getString("phone"));
				memberbean.setRegdate(rs.getTimestamp("regdate"));
			}
		}catch(Exception e) {
			System.out.println("getMember()메소드 내부에서 예외발생 : " + e.toString());
		} finally {
			freeResource();			
		}
		
		return memberbean;
	}// getMember

}// MemberDAO 클래스
