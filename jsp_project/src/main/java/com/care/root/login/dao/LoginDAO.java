package com.care.root.login.dao;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;

//�α��� üũ��ɸ����
public class LoginDAO {
		//db�����ϱ�
		private Connection con;
		private PreparedStatement ps;
		private ResultSet rs;
		public LoginDAO() {  //������
			try {
				Class.forName("oracle.jdbc.driver.OracleDriver");
				System.out.println("����̺� �ε� ����");
				con = DriverManager.getConnection(
						"jdbc:oracle:thin:@localhost:1521:xe",
						"dbwls", "dbwls9874");
			} catch (Exception e) {
				e.printStackTrace();
			}
		}
		
		//����ڷκ��� �Ѿ���� �� ���ϱ�
		public int loginChk(String userId, String userPwd) {
			String sql = "select * from jsp_member where id='"+userId+"'";
			int result = 0;
			try {
				ps = con.prepareStatement(sql);
				rs = ps.executeQuery();
				if(rs.next()) {//�ش� ���̵� ����
					if(userPwd.equals(rs.getString("pwd"))) {//��й�ȣ ��ġ (����ڰ� �Ѱ��� ����� db���� ������ ����� ��ġ�ϸ�)
						result = 0;
					}else {//��й�ȣ ����ġ
						result = 1;
					}
				}else {//�ش� ���̵� ���� ��� ����
					result = -1;
				}
			} catch (Exception e) {
				e.printStackTrace();
			}
			return result;
		}
		}