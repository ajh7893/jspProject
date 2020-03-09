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
				//Ʈ���� ��ġ���� ���ؼ� ������ ������ �Ѵ�. ������ �Ǿ��ִٸ� �̹� ��������ٰ� �˷��ش�.
				String makingTable ="create table bbs.reply(renum int not null auto_increment primary key," + 
						"reid varchar(20)," + 
						"recontent varchar(100)," + 
						"redate date," + 
						"boardnum int)";
				
				Statement stmt = null;
				
				stmt = conn.createStatement();
				//������Ʈ��Ʈ ���� --> ����������(executeUpdate)
				stmt.executeUpdate(makingTable);
				System.out.println("���̺��� �����Ͽ����ϴ�.");
			} catch (Exception e) {
				System.out.println("���̺��� �̹� ���� �Ǿ����ϴ�.");
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
	
	// ������ ���� �ֱ�
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
			System.out.println("������ �ֱ� ����" +e);
		} finally {
			if (pstmt != null)
				try {
					pstmt.close();
				} catch (SQLException e) {
					e.printStackTrace();
				}
		}
	}

	// ������ ���� �ϱ�
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
			System.out.println("������ ���� ����");
		} finally {
			if (pstmt != null)
				try {
					pstmt.close();
				} catch (SQLException e) {
					e.printStackTrace();
				}
		}
	}

	// id���� ���� ������ ����
	public void delete(String renum) {

		PreparedStatement pstmt = null;

		try {
			pstmt = conn.prepareStatement("delete from Reply where renum = ?");
			pstmt.setString(1, renum);
			pstmt.executeUpdate();
		} catch (SQLException e) {
			System.out.println("�����ͻ��� ����");
		} finally {
			if (pstmt != null)
				try {
					pstmt.close();
				} catch (SQLException e) {
					e.printStackTrace();
				}
		}
	}
	// ������ id���� ���� ������ ȣ��

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
	

	// �ش� table�� �ִ� ��� ������ ȣ�� ������ <Reply>�� ���̺����
	
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