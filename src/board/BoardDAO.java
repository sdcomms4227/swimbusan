package board;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

import javax.naming.Context;
import javax.naming.InitialContext;
import javax.sql.DataSource;

public class BoardDAO {

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

	public int insertBoard(BoardBean boardBean) {
		String sql = "";
		int num = 0;
				
		if(boardBean.getBoardSubject()==null || boardBean.getBoardSubject().equals("")) {
			return -1;
		}else if(boardBean.getBoardContent()==null || boardBean.getBoardContent().equals("")) {
			return -2;
		}else if(boardBean.getBoardPw()==null || boardBean.getBoardPw().equals("")) {
			return -3;
		}else {
			try {
				conn = getConnection();
				sql = "select max(boardNum) from board";
				pstmt = conn.prepareStatement(sql);
				rs = pstmt.executeQuery();
	
				if (rs.next()) {
					num = rs.getInt(1) + 1;
				} else {
					num = 1;
				}
	
				sql = "insert into board(boardNum,userId,userName,boardPw,boardSubject,boardContent,boardFile,boardRe_ref,boardRe_lev,boardRe_seq,boardCount,boardDate,boardIp)"
						+ "values(?,?,?,?,?,?,?,?,?,?,?,now(),?)";
	
				pstmt = conn.prepareStatement(sql);
				pstmt.setInt(1, num);
				pstmt.setString(2, boardBean.getUserId());
				pstmt.setString(3, boardBean.getUserName());
				pstmt.setString(4, boardBean.getBoardPw());
				pstmt.setString(5, boardBean.getBoardSubject());
				pstmt.setString(6, boardBean.getBoardContent());
				pstmt.setString(7, boardBean.getBoardFile());
				pstmt.setInt(8, num);
				pstmt.setInt(9, 0);
				pstmt.setInt(10, 0);
				pstmt.setInt(11, 0);
				pstmt.setString(12, boardBean.getBoardIp());
	
				return pstmt.executeUpdate();
	
			} catch (Exception e) {
				System.out.println("insertBoard()메소드 내부에서 예외발생 : " + e.toString());
			} finally {
				freeResource();
			}
		}
		
		return 0; 
	}// insertBoard

	public int getBoardCount(String search) {

		String sql = "";
		int count = 0;

		try {

			conn = getConnection();
			sql = "select count(*) from board where boardSubject like ?";
			pstmt = conn.prepareStatement(sql);
			pstmt.setString(1, "%" + search + "%");
			rs = pstmt.executeQuery();

			if (rs.next()) {
				count = rs.getInt(1);
			}

		} catch (Exception e) {
			System.out.println("getBoardCount()메소드 내부에서 예외발생 : " + e.toString());
		} finally {
			freeResource();
		}

		return count;
		
	}// getBoardCount

	public List<BoardBean> getBoardList(int startRow, int pageSize, String search) {
		String sql = "";
		List<BoardBean> boardList = new ArrayList<BoardBean>();

		try {

			conn = getConnection();
			sql = "select * from board where boardSubject like ? order by boardRe_ref desc, boardRe_seq asc limit ?, ?";
			pstmt = conn.prepareStatement(sql);
			pstmt.setString(1, "%" + search + "%");
			pstmt.setInt(2, startRow);
			pstmt.setInt(3, pageSize);
			rs = pstmt.executeQuery();

			while (rs.next()) {
				BoardBean boardBean = new BoardBean();

				boardBean.setBoardContent(rs.getString("boardContent"));
				boardBean.setBoardCount(rs.getInt("boardCount"));
				boardBean.setBoardDate(rs.getTimestamp("boardDate"));
				boardBean.setBoardFile(rs.getString("boardFile"));
				boardBean.setBoardIp(rs.getString("boardIp"));
				boardBean.setBoardNum(rs.getInt("boardNum"));
				boardBean.setBoardPw(rs.getString("boardPw"));
				boardBean.setBoardRe_lev(rs.getInt("boardRe_lev"));
				boardBean.setBoardRe_ref(rs.getInt("boardRe_ref"));
				boardBean.setBoardRe_seq(rs.getInt("boardRe_seq"));
				boardBean.setBoardSubject(rs.getString("boardSubject"));
				boardBean.setUserId(rs.getString("userId"));
				boardBean.setUserName(rs.getString("userName"));

				boardList.add(boardBean);
			}

		} catch (Exception e) {
			System.out.println("getBoardList()메소드 내부에서 예외발생 : " + e.toString());
		} finally {
			freeResource();
		}

		return boardList;
	}// getBoardList

	public void updateCount(int boardNum) {
		String sql = "";

		try {

			conn = getConnection();
			sql = "update board set boardCount = boardCount + 1 where boardNum = ?";
			pstmt = conn.prepareStatement(sql);
			pstmt.setInt(1, boardNum);
			pstmt.executeUpdate();

		} catch (Exception e) {
			System.out.println("updateCount()메소드 내부에서 예외발생 : " + e.toString());
		} finally {
			freeResource();
		}
	}// updateCount

	public BoardBean getBoard(int boardNum) {
		String sql = "";

		BoardBean boardBean = new BoardBean();

		try {

			conn = getConnection();
			sql = "select * from board where boardNum = ?";
			pstmt = conn.prepareStatement(sql);
			pstmt.setInt(1, boardNum);
			rs = pstmt.executeQuery();

			while (rs.next()) {
				boardBean.setBoardContent(rs.getString("boardContent"));
				boardBean.setBoardDate(rs.getTimestamp("boardDate"));
				boardBean.setBoardFile(rs.getString("boardFile"));
				boardBean.setBoardIp(rs.getString("boardIp"));
				boardBean.setBoardNum(rs.getInt("boardNum"));
				boardBean.setBoardPw(rs.getString("boardPw"));
				boardBean.setBoardRe_lev(rs.getInt("boardRe_lev"));
				boardBean.setBoardRe_ref(rs.getInt("boardRe_ref"));
				boardBean.setBoardRe_seq(rs.getInt("boardRe_seq"));
				boardBean.setBoardCount(rs.getInt("boardCount"));
				boardBean.setBoardSubject(rs.getString("boardSubject"));
				boardBean.setUserId(rs.getString("userId"));
				boardBean.setUserName(rs.getString("userName"));
			}
		} catch (Exception e) {
			System.out.println("getBoard()메소드 내부에서 예외발생 : " + e.toString());
		} finally {
			freeResource();
		}

		return boardBean;
	}// getBoard

	public int updateBoard(BoardBean boardBean) {
		String sql = "select boardPw from board where boardNum=?";

		try {
			conn = getConnection();
			pstmt = conn.prepareStatement(sql);
			pstmt.setInt(1, boardBean.getBoardNum());
			rs = pstmt.executeQuery();
			if (rs.next()) {				
				if(rs.getString("boardPw")!=null && !boardBean.getBoardPw().equals(rs.getString("boardPw"))) {
					return -1;
				}
				if(boardBean.getBoardFile()==null) {
					sql = "update board set boardSubject=?, boardContent=? where boardNum=?";					
					pstmt = conn.prepareStatement(sql);
					pstmt.setString(1, boardBean.getBoardSubject());
					pstmt.setString(2, boardBean.getBoardContent());
					pstmt.setInt(3, boardBean.getBoardNum());					
				}else {
					sql = "update board set boardSubject=?, boardContent=?, boardFile=? where boardNum=?";					
					pstmt = conn.prepareStatement(sql);
					pstmt.setString(1, boardBean.getBoardSubject());
					pstmt.setString(2, boardBean.getBoardContent());
					pstmt.setString(3, boardBean.getBoardFile());
					pstmt.setInt(4, boardBean.getBoardNum());
				}
				return pstmt.executeUpdate();
			}
		} catch (Exception e) {
			System.out.println("updateBoard()메소드 내부에서 예외발생 : " + e.toString());
		} finally {
			freeResource();
		}

		return 0;
	}// updateBoard
	
	public int deleteBoard(int boardNum, String boardPw) {
		String sql = "select boardPw from board where boardNum=?";
		
		try {
			conn = getConnection();
			pstmt = conn.prepareStatement(sql);
			pstmt.setInt(1, boardNum);
			rs = pstmt.executeQuery();
			if (rs.next()) {				
				if(boardPw.equals(rs.getString("boardPw"))) {
					sql = "delete from board where boardNum=?";
					pstmt = conn.prepareStatement(sql);
					pstmt.setInt(1, boardNum);
					return pstmt.executeUpdate();
				}else {
					return -1;
				}
			}
		} catch (Exception e) {
			System.out.println("deleteBoard()메소드 내부에서 예외발생 : " + e.toString());
		} finally {
			freeResource();
		}
		
		return 0;
	}// deleteBoard

	public int reInsertBoard(BoardBean boardBean) {
		String sql = "";
		int num = 0;

		if(boardBean.getBoardContent()==null || boardBean.getBoardContent().equals("")) {
			return -2;
		}else if(boardBean.getBoardPw()==null || boardBean.getBoardPw().equals("")) {
			return -3;
		}else {
			try {
	
				conn = getConnection();
				sql = "select max(boardNum) from board";
				pstmt = conn.prepareStatement(sql);
				rs = pstmt.executeQuery();
	
				if (rs.next()) {
					num = rs.getInt(1) + 1;
				} else {
					num = 1;
				}
	
				sql = "update board set boardRe_seq=boardRe_seq+1 where boardRe_ref=? and boardRe_seq>?";
				pstmt = conn.prepareStatement(sql);
				pstmt.setInt(1, boardBean.getBoardRe_ref());
				pstmt.setInt(2, boardBean.getBoardRe_seq());
				pstmt.executeUpdate();
	

				sql = "insert into board(boardNum,userId,userName,boardPw,boardSubject,boardContent,boardFile,boardRe_ref,boardRe_lev,boardRe_seq,boardCount,boardDate,boardIp)"
						+ "values(?,?,?,?,?,?,?,?,?,?,?,now(),?)";
	
				pstmt = conn.prepareStatement(sql);
				pstmt.setInt(1, num);
				pstmt.setString(2, boardBean.getUserId());
				pstmt.setString(3, boardBean.getUserName());
				pstmt.setString(4, boardBean.getBoardPw());
				pstmt.setString(5, boardBean.getBoardSubject());
				pstmt.setString(6, boardBean.getBoardContent());
				pstmt.setString(7, boardBean.getBoardFile());
				pstmt.setInt(8, boardBean.getBoardRe_ref());
				pstmt.setInt(9, boardBean.getBoardRe_lev() + 1);
				pstmt.setInt(10, boardBean.getBoardRe_seq() + 1);
				pstmt.setInt(11, 0);
				pstmt.setString(12, boardBean.getBoardIp());
				
				return pstmt.executeUpdate();	
			} catch (Exception e) {
				System.out.println("reInsertBoard()메소드 내부에서 예외발생 : " + e.toString());
			} finally {
				freeResource();
			}
		}
		return 0;
	}// reInsertBoard

	public int getCount(String search) {

		int count = 0;
		String sql = "";

		try {
			conn = getConnection();
			sql = "select count(*) from board where boardSubject like ?";
			pstmt = conn.prepareStatement(sql);
			pstmt.setString(1, "%" + search + "%");
			rs = pstmt.executeQuery();

			if (rs.next()) {
				count = rs.getInt(1);
			}
		} catch (Exception e) {
			System.out.println("getCount()메소드 내부에서 예외발생 : " + e.toString());
		} finally {
			freeResource();
		}
		return count;

	}
}// BoardDAO
