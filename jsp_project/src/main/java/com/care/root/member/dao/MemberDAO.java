package com.care.root.member.dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;

public class MemberDAO {
	private Connection con;
	private PreparedStatement ps;
	private ResultSet rs;
	public MemberDAO() {
		try {
			Class.forName("oracle.jdbc.driver.OracleDriver");
			System.out.println("����̺� �ε� ����");
		} catch (ClassNotFoundException e) {
			e.printStackTrace();
		}
	}
	public int getMemberList() {
		System.out.println("getMemberLiSst ȣ�� �Ǿ����ϴ�");
		return 12345;
	}
}
