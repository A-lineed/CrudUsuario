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
		Connection con = null;

		try {
			Class.forName("com.mysql.jdbc.Driver");
			con = DriverManager.getConnection("jdbc:mysql://localhost:3306/crudtestepitang", "root", "");
		} catch (Exception e) {
			System.out.println(e);

		}
		return con;
	}

	public static Usuario getRegistroById(int id) {
		Usuario usuario = null;

		try {
			Connection con = getConnection();
			PreparedStatement ps = (PreparedStatement) con.prepareStatement("SELECT * FROM usuario WHERE id=?");
			ps.setInt(1, id);
			ResultSet rs = ps.executeQuery();

			while (rs.next()) {
				usuario = new Usuario();
				usuario.setId(rs.getInt("id"));
				usuario.setNome(rs.getString("nome"));
				usuario.setEmail(rs.getString("email"));
				usuario.setSenha(rs.getString("senha"));
				usuario.setDdd(rs.getInt("ddd"));
				usuario.setNumero(rs.getInt("numero"));
				usuario.setTipo(rs.getString("tipo"));
			}

		} catch (Exception e) {
			System.out.println(e);
		}
		return usuario;
	}

	public static List<Usuario> getAllUsuarios() {
		List<Usuario> list = new ArrayList<Usuario>();

		try {
			Connection con = getConnection();
			PreparedStatement ps = (PreparedStatement) con.prepareStatement("SELECT * FROM usuario");
			ResultSet rs = ps.executeQuery();

			while (rs.next()) {
				Usuario usuario = new Usuario();
				usuario.setId(rs.getInt("id"));
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

	public static int updateUsuario(Usuario u) {
		int status = 0;

		try {
			Connection con = getConnection();
			PreparedStatement ps = (PreparedStatement) con.prepareStatement("UPDATE usuario SET nome=?, email=?, senha=?, ddd=?, numero=?, tipo=? WHERE id=? ");

			ps.setString(1, u.getNome());
			ps.setString(2, u.getEmail());
			ps.setString(3, u.getSenha());
			ps.setInt(4, u.getDdd());
			ps.setInt(5, u.getNumero());
			ps.setString(6, u.getTipo());
			ps.setInt(7, u.getId());;
			status = ps.executeUpdate();

		} catch (Exception e) {
			System.out.println(e);
		}
		return status;
	}

}
