<%@ Page Language="C#" %>

<!DOCTYPE html>

<script runat="server">
	private Model.User _user;

	protected void Page_Load(object sender, EventArgs e) {
		_user = HttpContext.Current.Session[Model.Common.UserSessionNameValue] as Model.User;

		if (_user == null) {
			_user = new Model.User();
		}

		var submit = Request.Form["Submit"] ?? String.Empty;

		if (!String.IsNullOrWhiteSpace(submit)) {
			var strUserId = Request.Form["UserId"] ?? String.Empty;
			var userName = Request.Form["UserName"] ?? String.Empty;
			var email = Request.Form["Email"] ?? String.Empty;

			Int32 userId;
			Int32.TryParse(strUserId, out userId);
			_user.UserId = userId;
			_user.UserName = userName;
			_user.Email = email;

			if (submit.Equals("Submit with Save")) {
				HttpContext.Current.Session[Model.Common.UserSessionNameValue] = _user;
			}

			Response.Redirect(Request.RawUrl);
		}

	}

</script>

<html xmlns="http://www.w3.org/1999/xhtml">
	<head runat="server">
		<title>Test Page</title>
	</head>
	<body>
		<h1>Welcome</h1>
		<div>
			Hello <strong><%=_user.UserName %>!</strong><br/>
			Your UserId is <strong><%=_user.UserId %></strong><br/>
			Your Email is <strong><%=_user.Email %></strong>
		</div>
		<h2>Log In</h2>
		<form id="form1" runat="server">
			<div>
				User Id: <input name="UserId" type="text" value="<%=_user.UserId %>"/><br/>
				UserName: <input name="UserName" type="text" value="<%=_user.UserName %>"/><br/>
				Email: <input name="Email" type="email" value="<%=_user.Email %>"/><br/>
				<input name="Submit" type="submit" value="Submit"/>
				<input name="Submit" type="submit" value="Submit with Save"/>
			</div>
		</form>
	</body>
</html>
