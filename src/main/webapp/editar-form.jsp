<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Edição do Usuário</title>
</head>
<body>

	<%@page
		import="com.crud.teste.pitang.domain.Usuario, com.crud.teste.pitang.dao.UsuarioDao"%>

	<%
	String id = request.getParameter("id");
	Usuario usuario = UsuarioDao.getRegistroById(Integer.parseInt(id));
	%>

	<h1>Edição do usuário</h1>

	<form action="editar-usuario.jsp" method="post">
		<input type="hidden" name="id" value="<%=usuario.getId()%>" />
		<table>
			<tr>
				<td>Nome:</td>
				<td><input type="text" name="nome"
					value="<%=usuario.getNome()%>" /></td>
			</tr>
			<tr>
				<td>E-mail:</td>
				<td><input type="email" name="email"
					value="<%=usuario.getEmail()%>" /></td>
			</tr>
			<tr>
				<td>Senha:</td>
				<td><input type="password" name="senha"
					value="<%=usuario.getSenha()%>" /></td>
			</tr>
			<tr>
				<td>DDD:</td>
				<td><select name="ddd">
						<option>65</option>
						<option>66</option>
						<option>67</option>
						<option>68</option>
						<option>81</option>
						<option>Outro</option>
				</select></td>
			</tr>
			<tr>
				<td>Numero:</td>
				<td><input type="number" name="numero"
					value="<%=usuario.getNumero()%>" /></td>
			</tr>
			<tr>
				<td>Tipo</td>
				<td><select name="tipo">
						<option>Oi</option>
						<option>Tim</option>
						<option>Claro</option>
						<option>Vivo</option>
						<option>Outro</option>
				</select></td>
			</tr>
			<tr>
				<td colspan="2"><input type="submit" value="Editar usuário"></input></td>
			</tr>
		</table>
		<button>
			<a ahref="view-usuarios.jsp">Voltar para tela inicial</a>
		</button>
	</form>


</body>
</html>