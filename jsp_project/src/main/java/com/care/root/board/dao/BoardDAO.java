package com.care.root.board.dao;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;

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
}
