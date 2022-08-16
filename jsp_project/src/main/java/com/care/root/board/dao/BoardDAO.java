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
			System.out.println("����̺� �ε� ����");
			con = DriverManager.getConnection(
					"jdbc:oracle:thin:@localhost:1521:xe", "id", "pwd");
		} catch (Exception e) {
			e.printStackTrace();
		}
	}
	//list�޼ҵ� �ۼ�
	public ArrayList<BoardDTO> list(){
		String sql = "select * from test_board";
		ArrayList<BoardDTO> list = new ArrayList<BoardDTO>();
		try { //db���� ���� ����ó�� �� , ��ü�� ���� ������ ���� �����ϱ�
			ps = con.prepareStatement(sql);
			rs=ps.executeQuery();
			while(rs.next()) {         //������ ������ �ڵ�
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

	public void writeSave(String name, String title, String content) { //name, title, content ���� �Ѱܹ޴´�
		String sql="insert into test_board(id, name, title, content, idgroup,step, indent)"
				+"values(test_board_seq.nextval,?,?,?, test_board_seq.currval,0,0)";   //test_board_seq�� 0�̾��ٰ� nextval�� �����鼭 1�� �����Ѵ�. ������ �ѹ���.        
		//test_board_seq.currval�� ���簪�� �ǹ��ϴµ� id�� 1�̸� idgroup�� 1�̾���ؼ�(�������̾�� �Ѵ�) ���簪���� �������°�
		try {
			ps=con.prepareStatement(sql);
			ps.setString(1, name);          //ps�� �̿��� ?�ڸ��� ä���ִ´�
			ps.setString(2, title);
			ps.setString(3, content);

			ps.executeUpdate();    //�����ϱ�
		} catch (Exception e) {
			e.printStackTrace();
		}
	}

	//��ȸ�� ������Ű��
	public void upHit(String num) {
		String sql = "update test_board set hit= hit+1 where id = "+num;
		try {
			ps = con.prepareStatement(sql);
			ps.executeUpdate();//select�� ������ �������� update�� ó���Ѵ�.
		} catch (Exception e) {
			e.printStackTrace();
		}
	}
	public BoardDTO contentView(String num) {

		upHit(num);

		String sql= "select * from test_board where id=" +num; //num�� �������·� ������� ������ ' '�� �ʿ����
		BoardDTO dto= new BoardDTO();
		try {
			ps = con.prepareStatement(sql);
			rs= ps.executeQuery();   //db�κ��� �����ͺ��̽� ��������
			while(rs.next()) {//�� �����Ͱ� �ִٸ�   (if, while �� �߿� �ƹ��ų� �ᵵ�ȴ�)
				dto.setId(rs.getInt("id"));//dto�� �����Ѵ�
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
	
	//�����ϱ�
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