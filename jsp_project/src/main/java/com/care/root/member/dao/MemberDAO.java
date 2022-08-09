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
			System.out.println("드라이브 로드 성공");
		} catch (ClassNotFoundException e) {
			e.printStackTrace();
		}
	}
	public int getMemberList() {
		System.out.println("getMemberLiSst 호출 되었습니다");
		return 12345;
	}
}
