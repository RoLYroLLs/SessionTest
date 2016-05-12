using System;
using System.Web;

namespace Model {

	/// <summary>
	/// Summary description for User
	/// </summary>
	public class User {
		public Int32 UserId { get; set; }
		public String UserName { get; set; }
		public String Email { get; set; }

		public User() {

		}
	}

	public static class Common {
		public const String UserSessionNameValue = "UserSessionInfo";
	}
}
