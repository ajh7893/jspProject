package ClassForOur;

import java.sql.*;
import java.util.ArrayList;
import java.util.List;

public class ReplyDao {
	private static ReplyDao instance;
	private Connection conn = null;

	private ReplyDao() {
		try {
			Class.forName("com.mysql.jdbc.Driver");
			conn = DriverManager.getConnection("jdbc:mysql://localhost:3306/bbs", "root", "1234");
			System.out.println("DB connect ok ");
			
			
			
			try {
				//트라이 케치문을 통해서 데이터 생성을 한다. 생성이 되어있다면 이미 만들어졌다고 알려준다.
				String makingTable ="create table bbs.reply(renum int not null auto_increment primary key," + 
						"reid varchar(20)," + 
						"recontent varchar(100)," + 
						"redate date," + 
						"boardnum int)";
				
				Statement stmt = null;
				
				stmt = conn.createStatement();
				//스테이트먼트 실행 --> 쿼리문날려(executeUpdate)
				stmt.executeUpdate(makingTable);
				System.out.println("테이블을 생성하였습니다.");
			} catch (Exception e) {
				System.out.println("테이블이 이미 생성 되었습니다.");
			}
			
		} catch (Exception e) {
			System.out.println("DB connect Error;");
		}
	}

	public static ReplyDao getInstance() {
		if (instance == null)
			instance = new ReplyDao();
		return instance;
	}
	
	// 데이터 집어 넣기
	public void insert(Reply ReplyAdd) {
		PreparedStatement pstmt = null;
		try {
			pstmt = conn.prepareStatement("insert into Reply values(null,?,?,now(),?)");
//			pstmt.setInt(1,ReplyAdd.getRenum());
			pstmt.setString(1, ReplyAdd.getReid());
			pstmt.setString(2, ReplyAdd.getRecontent());
//			pstmt.setString(4, ReplyAdd.getRedate());
			pstmt.setString(3, ReplyAdd.getBoardnum());			
			pstmt.executeUpdate();
		} catch (SQLException e) {
			System.out.println("데이터 넣기 실패" +e);
		} finally {
			if (pstmt != null)
				try {
					pstmt.close();
				} catch (SQLException e) {
					e.printStackTrace();
				}
		}
	}

	// 데이터 수정 하기
	public void update(Reply ReplyAdd) {

		PreparedStatement pstmt = null;

		try {
			pstmt = conn.prepareStatement("update Reply set recontent = ?, where renum = ?");
			pstmt.setString(2,ReplyAdd.getRenum());
//			pstmt.setString(1, ReplyAdd.getReid());
			pstmt.setString(1, ReplyAdd.getRecontent());
//			pstmt.setString(4, ReplyAdd.getRedate());
//			pstmt.setInt(3, ReplyAdd.getBoardnum());
			pstmt.executeUpdate();
		} catch (SQLException e) {
			System.out.println("데이터 수정 실패");
		} finally {
			if (pstmt != null)
				try {
					pstmt.close();
				} catch (SQLException e) {
					e.printStackTrace();
				}
		}
	}

	// id값을 가진 데이터 삭제
	public void delete(String renum) {

		PreparedStatement pstmt = null;

		try {
			pstmt = conn.prepareStatement("delete from Reply where renum = ?");
			pstmt.setString(1, renum);
			pstmt.executeUpdate();
		} catch (SQLException e) {
			System.out.println("데이터삭제 실패");
		} finally {
			if (pstmt != null)
				try {
					pstmt.close();
				} catch (SQLException e) {
					e.printStackTrace();
				}
		}
	}
	// 지정한 id값을 가진 데이터 호출

	public List<Reply> selectOne(String boardnum) {
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		List<Reply> list = new ArrayList<Reply>();
		try {
			pstmt = conn.prepareStatement("select * from Reply where boardnum = ?");
			pstmt.setString(1, boardnum);
			
			rs = pstmt.executeQuery();
			while (rs.next())
			{
				Reply Replyadd = new Reply();
				Replyadd.setRenum(rs.getString("renum"));
				Replyadd.setReid(rs.getString("reid"));
				Replyadd.setRecontent(rs.getString("recontent"));
				Replyadd.setRedate(rs.getString("redate"));
				Replyadd.setBoardnum(rs.getString("boardnum"));
				list.add(Replyadd);
			}
		} catch (SQLException e) {
			e.printStackTrace();
		}
		finally {
			try {
				if (pstmt != null)
					pstmt.close();
				if (rs != null)
					rs.close();
			} catch (SQLException e) {
				e.printStackTrace();
			}
		}
		return list;
	}
	

	// 해당 table에 있는 모든 데이터 호출 지금은 <Reply>가 테이블명임
	
	public List<Reply> selectAll() {
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		List<Reply> list = new ArrayList<Reply>();
		try {
			pstmt = conn.prepareStatement("select * from Reply order by renum desc");
			rs = pstmt.executeQuery();
			while (rs.next())
			{
				Reply Replyadd = new Reply();
				Replyadd.setRenum(rs.getString("renum"));
				Replyadd.setReid(rs.getString("reid"));
				Replyadd.setRecontent(rs.getString("recontent"));
				Replyadd.setRedate(rs.getString("redate"));
				Replyadd.setBoardnum(rs.getString("boardnum"));
				list.add(Replyadd);
			}
		} catch (SQLException e) {
			e.printStackTrace();
		}
		finally {
			try {
				if (pstmt != null)
					pstmt.close();
				if (rs != null)
					rs.close();
			} catch (SQLException e) {
				e.printStackTrace();
			}
		}
		return list;
	}


}