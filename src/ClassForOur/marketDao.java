package ClassForOur;

import java.sql.*;
import java.util.ArrayList;
import java.util.List;

public class marketDao {
	private static marketDao instance;
	private Connection conn = null;

	private marketDao() {
		Statement stmt = null;
		
		String query_create = "create table bbs.market(" + // 테이블생성
				"id int not null auto_increment primary key, useid varchar(20)," 
				+ "item varchar(30), itemnum int);";
		try {
			Class.forName("com.mysql.jdbc.Driver");
			conn = DriverManager.getConnection("jdbc:mysql://localhost:3306/bbs", "root", "1234");
			System.out.println("DB connect ok ");

			try {
				stmt = conn.createStatement(); // 명령어보내는 statement를 생성
				stmt.executeUpdate(query_create); // 명령어 보내기
				System.out.println("table ok ");
				} catch (Exception e) {
				System.out.println("table error " + e);
			}
			
		} catch (Exception e) {
			System.out.println("DB connect Error;");
		}
	}

	public static marketDao getInstance() {
		if (instance == null)
			instance = new marketDao();
		return instance;
	}

	// 데이터 집어 넣기
	public void insert(market marketadd) {
		PreparedStatement pstmt = null;
		try {
			pstmt = conn.prepareStatement("insert into market values(null,?,?,?)");
//			pstmt.setInt(1,marketadd.getId());
			pstmt.setString(1, marketadd.getUseid());
			pstmt.setString(2, marketadd.getItem());
			pstmt.setString(3, marketadd.getItemnum());
			pstmt.executeUpdate();
		} catch (SQLException e) {
			System.out.println("데이터 넣기 실패" + e);
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
	public void update(market marketadd) {

		PreparedStatement pstmt = null;

		try {
			pstmt = conn.prepareStatement("update market set recontent = ?, where renum = ?");
			pstmt.setString(2, marketadd.getId());
//			pstmt.setString(1, marketadd.getUseid());
			pstmt.setString(1, marketadd.getItem());
//			pstmt.setString(4, marketadd.getItemnum());
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
	public void delete(String id) {

		PreparedStatement pstmt = null;

		try {
			System.out.println("data db start +++++++");
			pstmt = conn.prepareStatement("delete from market where id = ?");
			pstmt.setString(1, id);
			pstmt.executeUpdate();
			System.out.println("data db end --------");
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

	public List<market> selectOne(String useid) {
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		List<market> list = new ArrayList<market>();
		try {
			pstmt = conn.prepareStatement("select * from market where useid = ?");
			pstmt.setString(1, useid);

			rs = pstmt.executeQuery();
			while (rs.next()) {
				market marketadd = new market();
				marketadd.setId(rs.getString("id"));
				marketadd.setUseid(rs.getString("useid"));
				marketadd.setItem(rs.getString("item"));
				marketadd.setItemnum(rs.getString("itemnum"));
				list.add(marketadd);
			}
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
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

	// 해당 table에 있는 모든 데이터 호출 지금은 <market>가 테이블명임

	public List<market> selectAll() {
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		List<market> list = new ArrayList<market>();
		try {
			pstmt = conn.prepareStatement("select * from market order by renum desc");
			rs = pstmt.executeQuery();
			while (rs.next()) {
				market marketadd = new market();
				marketadd.setId(rs.getString("id"));
				marketadd.setUseid(rs.getString("useid"));
				marketadd.setItem(rs.getString("item"));
				marketadd.setItemnum(rs.getString("itemnum"));

				list.add(marketadd);
			}
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
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