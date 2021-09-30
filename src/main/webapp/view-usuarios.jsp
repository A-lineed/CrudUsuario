<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Visualização de Usuários</title>
</head>
<body>
	<%@ page import="com.crud.teste.pitang.dao.UsuarioDao , com.crud.teste.pitang.domain.* , java.util.*"%>
	<%@  taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>

	<h1>Listagem de Usuários</h1>

	<%
	List<Usuario> list = UsuarioDao.getAllUsuarios();
	request.setAttribute("list", list);
	%>

	<table border="1">
		<tr>
			<th>Id</th>
			<th>Nome</th>
			<th>Email</th>
			<th>Senha</th>
			<th>DDD</th>
			<th>Numero</th>
			<th>Tipo</th>
			<th>Editar</th>
			<th>Excluir</th>
		</tr>

		<c:forEach items="${list}" var="usuario">
			<tr>
				<td>${usuario.getId()}</td>
				<td>${usuario.getNome()}</td>
				<td>${usuario.getEmail()}</td>
				<td>${usuario.getSenha()}</td>
				<td>${usuario.getDdd()}</td>
				<td>${usuario.getNumero()}</td>
				<td>${usuario.getTipo()}</td>
				<td><a href="editar-form.jsp?id=${usuario.getId()}"> Editar</a></td>
				<td><a href="delete-usuario.jsp?id=${usuario.getId()}">Excluir</a></td>
			</tr>
		</c:forEach>
	</table>
	<br>
	<a href="add-usuario-form.jsp">Adicionar novo usuário</a>
</body>
</html>