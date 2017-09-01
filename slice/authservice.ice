#include "authmodel.ice"
[["java:package:service"]]
module authservice{
	
	dictionary<string,string> Map;
	
	interface IAuthCrudService{	
		model::List getDataList(string type,Map map) throws model::CustomException;
		model::BaseModel getData(string type,string id) throws model::CustomException;
		void save(model::BaseModel model) throws model::CustomException;
		void remove(string type,string id) throws model::CustomException;
		authmodel::UserVo findUserByAccount(string account) throws model::CustomException;
	};
	
	interface ILoginOutService{
		authmodel::LoginUserVo uuLogin(string account,string password) throws model::CustomException;
		void uuLogout(string account) throws model::CustomException;
	};
	
	interface IAuthenticateService{
		authmodel::AuthDetailsVo authenticate(string token) throws model::CustomException;
	};
};