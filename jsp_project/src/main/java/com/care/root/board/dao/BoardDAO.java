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
}