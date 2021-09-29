package com.crud.teste.pitang.dao;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;
import java.util.List;

import com.crud.teste.pitang.domain.Usuario;

public class UsuarioDao {
	
	public static Connection getConnection() {
		Connection conexao = null;
		
		try {
			Class.forName("com.mysql.jdbc.Driver");	
			conexao=DriverManager.getConnection("jdbc:mysql://localhost:3306/crudtestepitang", "root", "85850219" );
			}catch (Exception e) {
				System.out.println(e);
				
			}
		return conexao;
	}
		
		public static List<Usuario> getAllUsuarios(){
			List<Usuario> list = new ArrayList<Usuario>();
			
			try {
				Connection conexao = getConnection();
				PreparedStatement ps = (PreparedStatement) conexao.prepareStatement("SELECT * FROM usuario");
						ResultSet rs = ps.executeQuery();
				
				while(rs.next()) {
					Usuario usuario = new Usuario();
					usuario.setNome(rs.getString("nome"));
					usuario.setEmail(rs.getString("email"));
					usuario.setSenha(rs.getString("senha"));
					usuario.setDdd(rs.getInt("ddd"));
					usuario.setNumero(rs.getInt("numero"));
					usuario.setTipo(rs.getString("tipo"));
					list.add(usuario);
				}
			} catch (Exception e) {
				System.out.println(e);
			}
			
			return list;
		}
	}

