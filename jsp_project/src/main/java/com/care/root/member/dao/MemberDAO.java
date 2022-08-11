package com.care.root.member.dao;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;

import com.care.root.member.dto.MemberDTO;

public class MemberDAO {
	private Connection con;
	private PreparedStatement ps;
	private ResultSet rs;
	public MemberDAO() {
		try {
			Class.forName("oracle.jdbc.driver.OracleDriver");
			System.out.println("����̺� �ε� ����");
			con = DriverManager.getConnection("jdbc:oracle:thin:@localhost:1521:xe", "id","pwd");
		} catch (Exception e) {
			e.printStackTrace();
		}
	}
	public ArrayList<MemberDTO> getMemberList() {
		System.out.println("getMemberLiSst ȣ�� �Ǿ����ϴ�");
		String sql = "select * from jsp_member"; //��簪 ��������
		ArrayList<MemberDTO> list = new ArrayList<MemberDTO>();
		try {
			ps = con.prepareStatement(sql);  //���� ������ ���۰�ü �����
			rs = ps.executeQuery();  //select�� executeQuery���, �ش� ��ɾ� ����
			while(rs.next()) {
				MemberDTO dto = new MemberDTO();
				dto.setId(rs.getString("id"));        
				dto.setPwd(rs.getString("pwd"));
				dto.setName(rs.getString("name"));
				dto.setAddr(rs.getString("addr"));
				list.add(dto);     //������� list�� �����Ѵ�.
			}
		} catch (Exception e) {
			e.printStackTrace();
		}
		return list;   //�� ������� �������� �����ش�.
	}
	public int register(MemberDTO dto) {
		System.out.println("id : " + dto.getId());
		System.out.println("pwd : " + dto.getPwd());
		System.out.println("name: " + dto.getName());
		System.out.println("addr : " + dto.getAddr());
		String sql = "insert into jsp_member(id, pwd, name, addr) values(?,?,?,?)";
		int result = 0;
		try {
			ps = con.prepareStatement(sql); //���ఴü ������
			ps.setString(1, dto.getId());
			ps.setString(2, dto.getPwd());
			ps.setString(3, dto.getName());
			ps.setString(4, dto.getAddr());
			result = ps.executeUpdate();
		} catch (Exception e) {
			e.printStackTrace();
		}
		return result;
	}
		public MemberDTO getMember(String userId) { //�Ѹ��̶� list�ƴ� memberDTO�� �ޱ�
			System.out.println("id : " + userId);
			String sql = "select * from jsp_member where id='"+userId+"'"; //���ڸ� ���������� ����� ''�־��ش�
			System.out.println(sql);
			MemberDTO dto = null;
			
			//db�κ��� ������ ��������
			try {
				ps= con.prepareStatement(sql);
				rs=ps.executeQuery();
				if(rs.next()) {                              //������ �� ����� ���� ������ �ݺ����� �ƴ� if�� ó���ϴ°� ����
					dto= new MemberDTO();
					dto.setId(rs.getString("id"));
					dto.setPwd(rs.getString("pwd"));
					dto.setName(rs.getString("name"));
					dto.setAddr(rs.getString("addr"));   
				}
			} catch (Exception e) {
				e.printStackTrace();
			}

			
			return dto;
		}
		public int modifySave(MemberDTO dto) {
			int result = 0;
//			System.out.println(dto.getId());
//			System.out.println(dto.getPwd());
//			System.out.println(dto.getName());
//			System.out.println(dto.getAddr());
			
			//���������� db�����ǰ��ϱ�
			String sql = 
					"update jsp_member set pwd=?, name=?,addr=? where id=?";   //������ �� ��� �־��ش�. �ش��ϴ� ���� ��� �����Ѵ�
				try {
					ps = con.prepareStatement(sql);
					ps.setString(1, dto.getPwd());     //������ ���� ���� �����
					ps.setString(2, dto.getName());
					ps.setString(3, dto.getAddr());
					ps.setString(4, dto.getId());
					result = ps.executeUpdate();   //�׸��� ����. ���������� �����ߴٸ� result�� 1�� ����Ű�, ���н� 0�̶�� ���� ����
				} catch (Exception e) {
					e.printStackTrace();      //�����ϴµ� �����ϸ� �����߻�
				}
				return result;

		}
}
