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
			System.out.println("드라이브 로드 성공");
			con = DriverManager.getConnection("jdbc:oracle:thin:@localhost:1521:xe", "id","pwd");
		} catch (Exception e) {
			e.printStackTrace();
		}
	}
	public ArrayList<MemberDTO> getMemberList() {
		System.out.println("getMemberLiSst 호출 되었습니다");
		String sql = "select * from jsp_member"; //모든값 가져오기
		ArrayList<MemberDTO> list = new ArrayList<MemberDTO>();
		try {
			ps = con.prepareStatement(sql);  //전송 가능한 전송객체 만들기
			rs = ps.executeQuery();  //select는 executeQuery사용, 해당 명령어 실행
			while(rs.next()) {
				MemberDTO dto = new MemberDTO();
				dto.setId(rs.getString("id"));        
				dto.setPwd(rs.getString("pwd"));
				dto.setName(rs.getString("name"));
				dto.setAddr(rs.getString("addr"));
				list.add(dto);     //결과값을 list에 저장한다.
			}
		} catch (Exception e) {
			e.printStackTrace();
		}
		return list;   //그 결과값을 리턴으로 돌려준다.
	}
	public int register(MemberDTO dto) {
		System.out.println("id : " + dto.getId());
		System.out.println("pwd : " + dto.getPwd());
		System.out.println("name: " + dto.getName());
		System.out.println("addr : " + dto.getAddr());
		String sql = "insert into jsp_member(id, pwd, name, addr) values(?,?,?,?)";
		int result = 0;
		try {
			ps = con.prepareStatement(sql); //실행객체 얻어오기
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
		public MemberDTO getMember(String userId) { //한명값이라 list아닌 memberDTO로 받기
			System.out.println("id : " + userId);
			String sql = "select * from jsp_member where id='"+userId+"'"; //문자를 직접적으로 연결시 ''넣어준다
			System.out.println(sql);
			MemberDTO dto = null;
			
			//db로부터 데이터 가져오기
			try {
				ps= con.prepareStatement(sql);
				rs=ps.executeQuery();
				if(rs.next()) {                              //지금은 한 사람에 대한 정보라 반복문이 아닌 if로 처리하는게 낫다
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
}
