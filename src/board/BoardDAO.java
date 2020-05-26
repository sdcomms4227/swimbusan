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

	Connection con;
	PreparedStatement pstmt;
	ResultSet rs;

	private Connection getConnection() throws Exception {
		Context init = new InitialContext();

		// 커넥션풀 얻기
		DataSource ds = (DataSource) init.lookup("java:comp/env/jdbc/jspbeginner");

		// 커넥션풀에 존재하는 커넥션 얻기
		Connection con = ds.getConnection();

		// 커넥션 반환
		return con;
	}

	private void freeResource() {
		try {
			if (con != null)
				con.close();
			if (pstmt != null)
				pstmt.close();
			if (rs != null)
				rs.close();
		} catch (SQLException e) {
			e.printStackTrace();
		}
	}

	// 게시판 board 테이블에 새 글 정보를 추가 시키는 메소드
	public void insertBoard(BoardBean boardbean) {
		String sql = "";
		int num = 0; // 새 글 추가시 글 번호를 만들어서 저장할 변수

		try {

			// DB 연결
			con = getConnection();

			// 새 글 추가시 글 번호 구해오기
			// board테이블에 글이 없는 경우 : 글 번호 1
			// board테이블에 글이 존재하는 경우 : 최근 글번호 + 1

			// SQL문 만들기
			// 가장 큰 글번호 검색
			sql = "select max(num) from board";
			pstmt = con.prepareStatement(sql);
			// 검색 후 값 얻기
			rs = pstmt.executeQuery();

			// 가장 큰 글 번호가 검색 되면
			if (rs.next()) {

				// 가장 큰 글 번호에 + 1 한 글 번호를? 새 글의 글 번호로 사용하기 위해 저장
				num = rs.getInt(1) + 1;
			} else {

				// board 테이블에 글이 저장되어 있지 않다면 새 글 추가시 글 번호를? 1을 사용하기 위함.
				num = 1;
			}

			// insert SQL문 만들기
			sql = "insert into board(num,name,passwd,subject,content,re_ref,re_lev,re_seq,readcount,date,ip,id)"
					+ "values(?,?,?,?,?,?,?,?,?,now(),?,?)";

			pstmt = con.prepareStatement(sql);
			pstmt.setInt(1, num); // 새 글의 번호
			pstmt.setString(2, boardbean.getName());
			pstmt.setString(3, boardbean.getPasswd());
			pstmt.setString(4, boardbean.getSubject());
			pstmt.setString(5, boardbean.getContent());
			pstmt.setInt(6, num); // 주 글(새 글)의 글 번호를 그룹번호로 지정
			pstmt.setInt(7, 0); // 주 글(새 글)의 들여쓰기 정도값 0
			pstmt.setInt(8, 0); // 주 글 순
			pstmt.setInt(9, 0); // 주 글(새 글)을 추가시 조회수 0
			pstmt.setString(10, boardbean.getIp());
			pstmt.setString(11, boardbean.getId());

			pstmt.executeUpdate(); // insert실행

		} catch (Exception e) {
			System.out.println("insertBoard메소드 내부에서 예외발생 : " + e.toString());
		} finally {
			freeResource();
		}
	}// insertBoard

	// board테이블에 저장되어 있는 전체글 수를 검색해서 반환하는 메소드
	public int getBoardCount() {

		String sql = "";
		int count = 0; // 검색한 전체글 수를 저장할 용도

		try {

			// DB연결
			con = getConnection();

			// SQL문 : 전체글 개수 검색해서 가져오기
			sql = "select count(*) from board";
			pstmt = con.prepareStatement(sql);
			rs = pstmt.executeQuery();

			if (rs.next()) {
				count = rs.getInt(1);
			}

		} catch (Exception e) {
			System.out.println("getBoardCount메소드에서 예외발생 : " + e.toString());
		} finally {
			freeResource();
		}

		// 검색한 전체글 수를 notice.jsp로 반환
		return count;
	}// getBoardCount

	// 글목록 검색 메소드
	// notice.jsp에서 호출하는 메소드로
	// getBoardList(각 페이지마다 맨위에 첫번째로 보여질 시작글 번호, 한 페이지당 보여지는 글 개수)를 전달받아..
	// 검색한 글 정보(BoardBean)하나하나를? ArrayList에 담아.. 반환함.
	public List<BoardBean> getBoardList(int startRow, int pageSize, String search) {
		String sql = "";
		List<BoardBean> boardList = new ArrayList<BoardBean>();

		try {

			// DB연결
			con = getConnection();

			// SQL문 만들기
			// 정렬 re_ref 내림차순 정렬하여 검색한 후 re_seq 오름차순 정렬하여 검색해 오는데
			// limit 각 페이지마다 제일 위에 첫번째로 보여질 시작글 번호, 한 페이지당 보여줄 글 개수
			sql = "select * from board where subject like ? order by re_ref desc, re_seq asc limit ?, ?";

			pstmt = con.prepareStatement(sql);
			pstmt.setString(1, "%" + search + "%");
			pstmt.setInt(2, startRow);
			pstmt.setInt(3, pageSize);

			// 검색 후 결과 데이터 받아 오기
			rs = pstmt.executeQuery();

			while (rs.next()) {
				BoardBean boardbean = new BoardBean();

				// rs => BoardBean에 저장
				boardbean.setContent(rs.getString("content"));
				boardbean.setDate(rs.getTimestamp("date"));
				boardbean.setFile(rs.getString("file"));
				boardbean.setId(rs.getString("id"));
				boardbean.setIp(rs.getString("ip"));
				boardbean.setName(rs.getString("name"));
				boardbean.setNum(rs.getInt("num"));
				boardbean.setPasswd(rs.getString("passwd"));
				boardbean.setRe_lev(rs.getInt("re_lev"));
				boardbean.setRe_ref(rs.getInt("re_ref"));
				boardbean.setRe_seq(rs.getInt("re_seq"));
				boardbean.setReadcount(rs.getInt("readcount"));
				boardbean.setSubject(rs.getString("subject"));

				// BoardBean => ArrayList에 추가
				boardList.add(boardbean);
			}

		} catch (Exception e) {
			System.out.println("getBoardList()메소드 내부에서 예외발생 : " + e.toString());
		} finally {
			freeResource();
		}

		// ArrayList를 notice.jsp로 리턴
		return boardList;
	}// getBoardList

	public void updateReadCount(int num) {
		String sql = "";

		try {
			con = getConnection();
			sql = "update board set readcount = readcount + 1 where num = ?";
			pstmt = con.prepareStatement(sql);
			pstmt.setInt(1, num);
			pstmt.executeUpdate();
		} catch (Exception e) {
			System.out.println("updateReadCount()메소드 내부에서 예외발생 : " + e.toString());
		} finally {
			freeResource();
		}
	}// updateReadCount

	public BoardBean getBoard(int num) {
		String sql = "";

		BoardBean boardbean = new BoardBean();

		try {
			con = getConnection();
			sql = "select * from board where num = ?";
			pstmt = con.prepareStatement(sql);
			pstmt.setInt(1, num);
			rs = pstmt.executeQuery();
			while (rs.next()) {
				boardbean.setContent(rs.getString("content"));
				boardbean.setDate(rs.getTimestamp("date"));
				boardbean.setId(rs.getString("id"));
				boardbean.setIp(rs.getString("ip"));
				boardbean.setName(rs.getString("name"));
				boardbean.setNum(rs.getInt("num"));
				boardbean.setPasswd(rs.getString("passwd"));
				boardbean.setRe_lev(rs.getInt("re_lev"));
				boardbean.setRe_ref(rs.getInt("re_ref"));
				boardbean.setRe_seq(rs.getInt("re_seq"));
				boardbean.setReadcount(rs.getInt("readcount"));
				boardbean.setSubject(rs.getString("subject"));
			}
		} catch (Exception e) {
			System.out.println("getBoard()메소드 내부에서 예외발생 : " + e.toString());
		} finally {
			freeResource();
		}

		return boardbean;
	}// getBoard

	public int updateBoard(BoardBean boardbean) {
		int check = 0;
		String sql = "select passwd from board where num=?";

		try {
			con = getConnection();
			pstmt = con.prepareStatement(sql);
			pstmt.setInt(1, boardbean.getNum());
			rs = pstmt.executeQuery();
			if (rs.next()) {
				if (boardbean.getPasswd().contentEquals(rs.getString("passwd"))) {
					sql = "update board set subject=?, content=? where num=?";
					pstmt = con.prepareStatement(sql);
					pstmt.setString(1, boardbean.getSubject());
					pstmt.setString(2, boardbean.getContent());
					pstmt.setInt(3, boardbean.getNum());
					check = pstmt.executeUpdate();
				}
			}
		} catch (Exception e) {
			System.out.println("updateBoard()메소드 내부에서 예외발생 : " + e.toString());
		} finally {
			freeResource();
		}

		return check;
	}// updateBoard

	public void reInsertBoard(BoardBean boardbean) {
		String sql = "";
		int num = 0;

		try {
			// 글 번호 얻기
			con = getConnection();
			sql = "select max(num) from board";
			pstmt = con.prepareStatement(sql);
			rs = pstmt.executeQuery();
			if (rs.next()) {
				num = rs.getInt(1) + 1;
			} else {
				num = 1;
			}

			// 답글순서 재배치
			sql = "update board set re_seq=re_seq+1 where re_ref=? and re_seq>?";
			pstmt = con.prepareStatement(sql);
			pstmt.setInt(1, boardbean.getRe_ref()); // 부모글 그룹번호
			pstmt.setInt(2, boardbean.getRe_seq()); // 부모글의 글 입력 순서
			pstmt.executeUpdate();

			// 답변글 달기
			sql = "insert into board values(?,?,?,?,?,?,?,?,?,?,?,?,?)";
			pstmt = con.prepareStatement(sql);
			pstmt.setInt(1, num);
			pstmt.setString(2, boardbean.getName());
			pstmt.setString(3, boardbean.getPasswd());
			pstmt.setString(4, boardbean.getSubject());
			pstmt.setString(5, boardbean.getContent());
			pstmt.setString(6, boardbean.getFile());
			pstmt.setInt(7, boardbean.getRe_ref()); // 부모글 그룹번호
			pstmt.setInt(8, boardbean.getRe_lev() + 1); // 부모글 re_lev + 1 (들여쓰기)
			pstmt.setInt(9, boardbean.getRe_seq() + 1); // 부모글 re_seq + 1 (답글순서)
			pstmt.setInt(10, boardbean.getReadcount());
			pstmt.setTimestamp(11, boardbean.getDate());
			pstmt.setString(12, boardbean.getIp());
			pstmt.setString(13, boardbean.getId());
			pstmt.executeUpdate();
		} catch (Exception e) {
			System.out.println("reInsertBoard()메소드 내부에서 예외발생 : " + e.toString());
		} finally {
			freeResource();
		}
	}// reInsertBoard

	public int getCount(String search) {
		int count = 0;
		String sql = "";
		try {
			con = getConnection();
			sql = "select count(*) from board where subject like ?";
			pstmt = con.prepareStatement(sql);
			pstmt.setString(1, "%" + search + "%");
			rs = pstmt.executeQuery();

			if (rs.next()) {
				count = rs.getInt(1);
			}
		} catch (Exception e) {
			// TODO: handle exception
		} finally {
			freeResource();
		}
		return count;
	}
}// BoardDAO
