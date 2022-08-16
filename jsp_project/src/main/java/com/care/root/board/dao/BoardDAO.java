package com.care.root.board.dao;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;

import com.care.root.board.dto.BoardDTO;

public class BoardDAO {
	Connection con;
	PreparedStatement ps;
	ResultSet rs;
	public BoardDAO() {
		try {
			Class.forName("oracle.jdbc.driver.OracleDriver");
			System.out.println("드라이브 로드 성공");
			con = DriverManager.getConnection(
					"jdbc:oracle:thin:@localhost:1521:xe", "id", "pwd");
		} catch (Exception e) {
			e.printStackTrace();
		}
	}
	//list메소드 작성
	public ArrayList<BoardDTO> list(){
		String sql = "select * from test_board";
		ArrayList<BoardDTO> list = new ArrayList<BoardDTO>();
		try { //db접근 위해 예외처리 후 , 객체를 만들어서 각각의 값들 실행하기
			ps = con.prepareStatement(sql);
			rs=ps.executeQuery();
			while(rs.next()) {         //데이터 얻어오기 코드
				BoardDTO dto = new BoardDTO();
				dto.setId(rs.getInt("id"));
				dto.setName(rs.getString("name"));
				dto.setTitle(rs.getString("title"));
				dto.setContent(rs.getString("content"));

				dto.setSavedate(rs.getTimestamp("savedate"));
				dto.setHit(rs.getInt("hit"));
				dto.setIdgroup(rs.getInt("idgroup"));
				dto.setStep(rs.getInt("step"));
				dto.setIndent(rs.getInt("indent"));

				list.add(dto);

			}
		} catch ( Exception e) {
			e.printStackTrace();
		}
		return list;
	}

	public void writeSave(String name, String title, String content) { //name, title, content 값을 넘겨받는다
		String sql="insert into test_board(id, name, title, content, idgroup,step, indent)"
				+"values(test_board_seq.nextval,?,?,?, test_board_seq.currval,0,0)";   //test_board_seq가 0이었다가 nextval을 만나면서 1씩 증가한다. 가상의 넘버링.        
		//test_board_seq.currval은 현재값을 의미하는데 id가 1이면 idgroup도 1이어야해서(같은값이어야 한다) 현재값으로 가져오는것
		try {
			ps=con.prepareStatement(sql);
			ps.setString(1, name);          //ps를 이용해 ?자리에 채워넣는다
			ps.setString(2, title);
			ps.setString(3, content);

			ps.executeUpdate();    //실행하기
		} catch (Exception e) {
			e.printStackTrace();
		}
	}

	//조회수 증가시키기
	public void upHit(String num) {
		String sql = "update test_board set hit= hit+1 where id = "+num;
		try {
			ps = con.prepareStatement(sql);
			ps.executeUpdate();//select를 제외한 나머지는 update로 처리한다.
		} catch (Exception e) {
			e.printStackTrace();
		}
	}
	public BoardDTO contentView(String num) {

		upHit(num);

		String sql= "select * from test_board where id=" +num; //num은 숫자형태로 만들었기 때문에 ' '가 필요없다
		BoardDTO dto= new BoardDTO();
		try {
			ps = con.prepareStatement(sql);
			rs= ps.executeQuery();   //db로부터 데이터베이스 가져오고
			while(rs.next()) {//그 데이터가 있다면   (if, while 둘 중에 아무거나 써도된다)
				dto.setId(rs.getInt("id"));//dto에 저장한다
				dto.setName(rs.getString("name"));
				dto.setTitle(rs.getString("title"));
				dto.setContent(rs.getString("content"));

				dto.setSavedate(rs.getTimestamp("savedate"));
				dto.setHit(rs.getInt("hit"));
				dto.setIdgroup(rs.getInt("idgroup"));
				dto.setStep(rs.getInt("step"));
				dto.setIndent(rs.getInt("indent"));
			}
		} catch ( Exception e) {
			e.printStackTrace();
		}
		return dto;
	}
	
	//수정하기
	public void modify(String id, String name, String title, String content) {
		String sql = "update test_board set name=?, title=?, content=? where id=?";
		try {
			ps=con.prepareStatement(sql);
			ps.setString(1, name);
			ps.setString(2, title);
			ps.setString(3, content);
			ps.setString(4, id);
			ps.executeUpdate();
		} catch (Exception e) {
			e.printStackTrace();
		}
	}
	public int delete(String id) {
		String sql = "delete from test_board where id="+id;
		int result=0;
		try {
			ps = con.prepareStatement(sql);
			result=ps.executeUpdate();
		} catch (Exception e) {
			e.printStackTrace();
		}
		return result;
	}
}