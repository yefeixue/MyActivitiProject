#include "model.ice"
module authmodel{
	
	["java:type:java.util.ArrayList"]sequence<string> List;

	class OrganizationVo extends model::BaseModel{
		string id;
		string name;
		string description;
		string parentId;
		bool valid = true;
		string flexType;
	};
	class UserVo extends model::BaseModel{
		string id;
		string userName;
		int gender;
		string description;
		string account;
		string password;
		int logonValidPeriod = -1;//默认永久
		string orgId;
		string isAdmin;
		bool valid = true;
		string flexType;
	};
	class RoleClassVo extends model::BaseModel{
		string id;
		string name;
		string description;
	};
	class RoleVo extends model::BaseModel{
		string id;
		string name;
		string description;
		string roleClassId;
		string parentId;
		bool valid = true;
		string flexType;
	};
	class UserRoleVo extends model::BaseModel{
		string id;
		string userId;
		string roleId;
	};
	class LoginUserVo extends model::BaseModel{
		string userId;
		string token;
		string userAccount;
		string userName;
	};
	class AuthDetailsVo extends model::BaseModel{
		/*用户ID*/
		string id;
		/*用户账号*/
		string account;
		/*用户姓名*/
		string userName;
		/*用户性别 0:male,1:female*/
		int gender;
		/*用户描述*/
		string description;
		/*用户账号密码*/
		string password;
		/*用户所属的组织ID*/
		string orgId;
		/*用户所属角色ID集合*/
		List roleIds;
		/*用户所属角色类别ID集合*/
		List roleClassIds;
		/*用户登录失效时间*/
		int logonValidPeriod;
		/*管理员标识*/
		string isAdmin;
	};
};