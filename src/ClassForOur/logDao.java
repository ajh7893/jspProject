package ClassForOur;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;

public class logDao {

	private static logDao instance;
	private Connection conn = null;

	private logDao() {

		try {

//         Class.forName("com.mysql.jdbc.Driver");
			conn = DriverManager.getConnection("jdbc:mysql://localhost:3306/bbs", "root", "1234");
			System.out.println("DB connect ok ");

			try {
				// Ʈ���� ��ġ���� ���ؼ� ������ ������ �Ѵ�. ������ �Ǿ��ִٸ� �̹� ��������ٰ� �˷��ش�.
				String makingTable = "create table bbs.login ( id int not null auto_increment primary key,"
						+ "userId varchar(50) unique," + "pw varchar(50)," + "name varchar(100)," + "sex varchar(50),"
						+ "bir varchar(100)," + "email varchar(100)," + "phone varchar(100)," + "adrress varchar(100))";

				Statement stmt = null;
				stmt = conn.createStatement();
				// ������Ʈ��Ʈ ���� --> ����������(executeUpdate)
				stmt.executeUpdate(makingTable);
				System.out.println("���̺��� �����Ͽ����ϴ�.");
			} catch (SQLException e) {
				System.out.println("�̹� ��������ֽ��ϴ�.");
			}

		} catch (SQLException e) {
			System.out.println("DB connect Error;");
		}
	}

	public static logDao getInstance() {
		if (instance == null)
			instance = new logDao();
		return instance;
	}

	// ������ ���� �ֱ�
	// �Ķ���Ϳ� Ŭ���� Ÿ��, �������� �־��ش�.
	public void insert(logtest userInfo) {
		PreparedStatement pstmt = null;
		try {
			pstmt = conn.prepareStatement("insert into login values(null,?,?,?,?,?,?,?,?)");
//         pstmt.setString(1,goods.getId());
			// �̸��� ����
			pstmt.setString(1, userInfo.getUserid());
			pstmt.setString(2, userInfo.getPw());
			pstmt.setString(3, userInfo.getName());
			pstmt.setString(4, userInfo.getSex());
			pstmt.setString(5, userInfo.getBir());
			pstmt.setString(6, userInfo.getEmail());
			pstmt.setString(7, userInfo.getPhone());
			pstmt.setString(8, userInfo.getAddr());

			pstmt.executeUpdate();

		} catch (SQLException e) {
			System.out.println("������ �ֱ� ����" + e);
		} finally {
			if (pstmt != null)
				try {
					pstmt.close();
				} catch (SQLException e) {
					e.printStackTrace();
				}
		}
	}

	public int loginCheck(String id, String pw) {

		PreparedStatement pstmt = null;
		ResultSet rs = null;

		String dbPW = "";
		int x = -1;

		try {
			pstmt = conn.prepareStatement("select * from bbs.login where userId =?");
			pstmt.setString(1, id);

			rs = pstmt.executeQuery();

			if (rs.next()) {// �Էµ� ���̵� �ش��ϴ� ����� ���� ���
				dbPW = rs.getString("pw");
				if (dbPW.equals(pw)) {
					x = 1;
				} else if (!dbPW.equals(pw)) {
					x = 0;
				} else {
				x = -1; // �ش� ���̵� ���� ���
			}}

		} catch (Exception e) {
			System.out.println("�α��� ���� ����.");
		}
		return x;

	}

	public int confirmId(String id) {
		int x = -1;
		PreparedStatement pstmt = null;
		ResultSet rs = null;

		try {
			pstmt = conn.prepareStatement("select * from login where userId =?");
			pstmt.setString(1, id);

			rs = pstmt.executeQuery();

			if (rs.next()) {
				x = 1;
				System.out.println("���̵� ����");
			} else {
				x = -1;
				System.out.println("���̵� ����");
			}
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			if (rs != null)
				try {
					rs.close();
				} catch (Exception e) {
				}
			if (pstmt != null)
				try {
					pstmt.close();
				} catch (Exception e) {
				}
			// if(conn!=null) try {conn.close();}catch(Exception e) {}
		}
		return x;

	}
	
	public logtest selectOne(String id) {
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		logtest log = new logtest();
		try {
			pstmt = conn.prepareStatement("select * from login where userid = ?");
			pstmt.setString(1, id);
			rs = pstmt.executeQuery();
			if (rs.next())
			{
				log.setUserid(rs.getString("userid"));
				log.setName(rs.getString("name"));
				log.setEmail(rs.getString("email"));
				log.setPhon(rs.getString("phone"));
				log.setAddr(rs.getString("adrress"));
			}
		} catch (SQLException e) {
			System.out.println("������ ȣ�� ����");
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
		return log;
	}

//getUserid
//   // ������ ���� �ϱ�
//   public void update(logtest logInfo) {
//
//      PreparedStatement pstmt = null;
//
//      try {
//         pstmt = conn.prepareStatement("update board set goodsName = ?, goodsCate = ?, goodsContents = ?, goodsPrice = ?, goodsFile = ? where id = ?");
//               
//         //id
//         pstmt.setString(6, logInfo.getId());
//         pstmt.setString(1, logInfo.getGoodsName());
//         pstmt.setString(2, logInfo.getGoodsCate());
//         pstmt.setString(3, logInfo.getGoodsContents());
//         pstmt.setString(4, logInfo.getGoodsPrice());
//         pstmt.setString(5, logInfo.getGoodsFile1());
////         pstmt.setString(7, goods.getUserId());
//         pstmt.executeUpdate();
//      } catch (SQLException e) {
//         System.out.println("������ ���� ����");
//      } finally {
//         if (pstmt != null)
//            try {
//               pstmt.close();
//            } catch (SQLException e) {
//               e.printStackTrace();
//            }
//      }
//   }
//
//   // id���� ���� ������ ����
//   public void delete(String id) {
//
//      PreparedStatement pstmt = null;
//
//      try {
//         pstmt = conn.prepareStatement("delete from board where id = ?");
//         pstmt.setString(1, id);
//         pstmt.executeUpdate();
//      } catch (SQLException e) {
//         System.out.println("�����ͻ��� ����");
//      } finally {
//         if (pstmt != null)
//            try {
//               pstmt.close();
//            } catch (SQLException e) {
//               e.printStackTrace();
//            }
//      }
//   }
	// ������ id���� ���� ������ ȣ��

//   public logtest selectOne(String id) {
//      PreparedStatement pstmt = null;
//      ResultSet rs = null;
//      logtest log = new logtest();
//      try {
//         pstmt = conn.prepareStatement("select * from board where id = ?");
//         pstmt.setString(1, id);
//         rs = pstmt.executeQuery();
//         if (rs.next())
//         {
//            log.setId(rs.getString("id"));
//            log.setGoodsName(rs.getString("goodsName"));
//            log.setGoodsCate(rs.getString("goodsCate"));
//            log.setGoodsPrice(rs.getString("goodsPrice"));
//            log.setGoodsContents(rs.getString("goodsContents"));
//            log.setGoodsFile1(rs.getString("goodsFile"));
//            log.setHit(rs.getInt("hit"));
//            String time = rs.getString("time");
//            log.setUserId(rs.getString("userId"));
//         }
//      } catch (SQLException e) {
//         System.out.println("������ ȣ�� ����");
//      }
//      finally {
//         try {
//            if (pstmt != null)
//               pstmt.close();
//            if (rs != null)
//               rs.close();
//         } catch (SQLException e) {
//            e.printStackTrace();
//         }
//      }
//      return log;
//   }
//
//   // �ش� table�� �ִ� ��� ������ ȣ�� ������ <Board>�� ���̺����
//   
//   
//   public List<AddGoods> selectAll() {
//      PreparedStatement pstmt = null;
//      ResultSet rs = null;
//      List<AddGoods> list = new ArrayList<AddGoods>();
//      try {
//         pstmt = conn.prepareStatement("select * from board order by id desc");
//         rs = pstmt.executeQuery();
//         while (rs.next())
//         {
//            AddGoods log = new AddGoods();
//            log.setId(rs.getString("id"));
//            log.setGoodsName(rs.getString("goodsName"));
//            log.setGoodsCate(rs.getString("goodsCate"));
//            log.setUserId(rs.getString("userId"));
//            log.setGoodsPrice(rs.getString("goodsPrice"));
//            log.setGoodsContents(rs.getString("goodsContents"));
//            list.add(log);
//         }
//      } catch (SQLException e) {
//         e.printStackTrace();
//      }
//      finally {
//         try {
//            if (pstmt != null)
//               pstmt.close();
//            if (rs != null)
//               rs.close();
//         } catch (SQLException e) {
//            e.printStackTrace();
//         }
//      }
//      return list;
//   }
}