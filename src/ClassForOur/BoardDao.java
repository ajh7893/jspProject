package ClassForOur;

import java.io.PrintWriter;
import java.sql.*;
import java.util.ArrayList;
import java.util.List;

import org.apache.jasper.tagplugins.jstl.core.Out;

import com.mysql.fabric.Response;

public class BoardDao {
	private static BoardDao instance;
	private Connection conn = null;

	private BoardDao() {
		
		try {
			
//			Class.forName("com.mysql.jdbc.Driver");
			conn = DriverManager.getConnection("jdbc:mysql://localhost:3306/bbs", "root", "1234");
			System.out.println("DB connect ok ");
			
			try {
				//트라이 케치문을 통해서 데이터 생성을 한다. 생성이 되어있다면 이미 만들어졌다고 알려준다.
				String makingTable ="create table bbs.board(id int not null auto_increment primary key," + 
						"goodsName varchar(30)," + 
						"goodsCate varchar(30)," + 
						"goodsPrice varchar(30)," + 
						"goodsContents varchar(500)," + 
						"goodsFile varchar(100)," + 
						"hit int," + 
						"time date," + 
						"userId varchar(20)) ";
				Statement stmt = null;
				
				stmt = conn.createStatement();
				//스테이트먼트 실행 --> 쿼리문날려(executeUpdate)
				stmt.executeUpdate(makingTable);
				System.out.println("테이블을 생성하였습니다.");
			} catch (SQLException e) {
			System.out.println("이미 만들어져있습니다.");
			}
			
			
		} catch (SQLException e) {
			System.out.println("DB connect Error;");
		}
	}

	public static BoardDao getInstance() {
		if (instance == null)
			instance = new BoardDao();
		return instance;
	}

	
	// 데이터 집어 넣기
	// 파라미터에 클래스 타입, 변수명을 넣어준다.
	public void insert(AddGoods goods) {
		PreparedStatement pstmt = null;
		try {
			pstmt = conn.prepareStatement("insert into board values(null,?,?,?,?,?,0,now(),?)");
//			pstmt.setString(1,goods.getId());
			//이말인 즉은 
			pstmt.setString(1, goods.getGoodsName());
			pstmt.setString(2, goods.getGoodsCate());
			pstmt.setString(3, goods.getGoodsPrice());
			pstmt.setString(4, goods.getGoodsContents());
			pstmt.setString(5, goods.getGoodsFile1());
			pstmt.setString(6, goods.getUserId());
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
	public void update(AddGoods goods) {

		PreparedStatement pstmt = null;

		try {
			pstmt = conn.prepareStatement("update board set goodsName = ?, goodsCate = ?, goodsContents = ?, goodsPrice = ?, goodsFile = ?,hit = ? where id = ?");
					
			//id
			pstmt.setString(7, goods.getId());
			pstmt.setString(1, goods.getGoodsName());
			pstmt.setString(2, goods.getGoodsCate());
			pstmt.setString(3, goods.getGoodsContents());
			pstmt.setString(4, goods.getGoodsPrice());
			pstmt.setString(5, goods.getGoodsFile1());
			pstmt.setInt(6, goods.getHit());
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
			pstmt = conn.prepareStatement("delete from board where id = ?");
			pstmt.setString(1, id);
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

	public AddGoods selectOne(String id) {
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		AddGoods boardadd = new AddGoods();
		try {
			pstmt = conn.prepareStatement("select * from board where id = ?");
			pstmt.setString(1, id);
			rs = pstmt.executeQuery();
			if (rs.next())
			{
				boardadd.setId(rs.getString("id"));
				boardadd.setGoodsName(rs.getString("goodsName"));
				boardadd.setGoodsCate(rs.getString("goodsCate"));
				boardadd.setGoodsPrice(rs.getString("goodsPrice"));
				boardadd.setGoodsContents(rs.getString("goodsContents"));
				boardadd.setGoodsFile1(rs.getString("goodsFile"));
				boardadd.setHit(rs.getInt("hit"));
				boardadd.setGoodsdate(rs.getString("time"));
				boardadd.setUserId(rs.getString("userId"));
			}
		} catch (SQLException e) {
			System.out.println("데이터 호출 실패");
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
		return boardadd;
	}

	// 해당 table에 있는 모든 데이터 호출 지금은 <Board>가 테이블명임
	
	
	public List<AddGoods> selectAll() {
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		List<AddGoods> list = new ArrayList<AddGoods>();
		try {
			pstmt = conn.prepareStatement("select * from board order by id desc");
			rs = pstmt.executeQuery();
			while (rs.next())
			{
				AddGoods boardadd = new AddGoods();
				boardadd.setId(rs.getString("id"));
				boardadd.setGoodsName(rs.getString("goodsName"));
				boardadd.setGoodsCate(rs.getString("goodsCate"));
				boardadd.setUserId(rs.getString("userId"));
				boardadd.setGoodsPrice(rs.getString("goodsPrice"));
				boardadd.setGoodsContents(rs.getString("goodsContents"));
				list.add(boardadd);
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
	public void search(String search) {

	      PreparedStatement pstmt = null;

	      try {
	         pstmt = conn.prepareStatement("select * from board where goodsName = ?");
	         pstmt.setString(1, search);
	         pstmt.executeUpdate();
	      } catch (SQLException e) {
	         System.out.println("검색된 상품이 없습니다.");
	      } finally {
	         if (pstmt != null)
	            try {
	               pstmt.close();
	            } catch (SQLException e) {
	               e.printStackTrace();
	            }
	      }
	   }

}