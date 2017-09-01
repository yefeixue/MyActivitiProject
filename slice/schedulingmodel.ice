#include "model.ice"
module schedulingmodel{
	sequence<byte> Bytes;
	["java:getset"] 
	class TaskInfoModel extends model::BaseModel{
		string taskId;
		string taskName;
		string activityId;
		string processName;
		string assignee;
		string createTime;
		string endTime;
		string statu;
		string escortGroupName;
		string code;
	};
	["java:getset"] 
	struct ActivityModel{
		string activityId;
		string taskId;
		string taskName;
	};
	["java:type:java.util.ArrayList"]sequence<ActivityModel> ActivityModelList;
	["java:getset"] 
	class ProcessInstanceModel extends model::BaseModel{
		string instanceId;
		string processName;
		string startUser;
		string startTime;
		string endTime;
		string code;
		ActivityModelList activities;
	};
	["java:getset"] 
	struct UserHistoryTaskModel{
	 	string taskName;
	 	string assignee;
	 	string createTime;
	 	string endTime;
	 	string duration;
	};
	["java:getset"] 
	class PersonModel extends model::BaseModel{
	 	string personId;
		string name;
		string positionName;
		string escortGroupName;
		string sex;
		int age;
		string isScance;
		Bytes photo;
		string nationality;
		string marriage;
		string orgName;
		string code;
		string state = "";
	};
	["java:getset"] 
	class ReplacePersonModel extends model::BaseModel{
		string escortId;
	 	string personId;
		string name;
		string oldPersonId;
		string oldPersonName;
		string positionName;
		string escortGroupName;
		string sex;
		int age;
		string isScance;
		Bytes photo;
		string nationality;
		string marriage;
		string orgName;
		string code;
		string state = "";
	};
	["java:getset"] 
	class CarModel extends model::BaseModel{
		string id;
		string carNumber;
		string color;
		string brand;
		string model;
		string parkingPortName;
		string isScance ;
		string status;
		string type;
		string remark;
		string useDistance ="";
	};
	["java:getset"] 
	struct GunModel{
		string personName;
		string gunStyle;
		string gunCode;
		int bulletNum;
		string positionName;
		string isScance ;
	};
	["java:getset"] 
	class BoxModel extends model::BaseModel{
	    string id;
	 	string code;
		string type;
		string bankName;
		/*尾箱变更用到了这个属性*/
		string status;
		string bankPersonName;
		string isScance;
		string barcode;
		string macAddress;
	};
	["java:getset"] 
	struct EscortSchedulingModel{
		string instanceId;
		string code;
		string createTime;
		string createPerson;
		string groupName;
		string escortSolutionName;
		string carNumber;
		string status;
	};
	
	["java:getset"] 
	class EscortCarChangeModel extends model::BaseModel{
		string instanceId;
		string code;
		string schedulingCode;
		string schedulingTime;
		string startUser;
		string driver;
		string carNumber;
		string schedulingCarNumber;
		string address;
		string reason;
	};
	
	["java:getset"] 
	class EscortPersonChangeModel extends model::BaseModel{
		string instanceId;
		string code;
		string schedulingCode;
		string schedulingTime;
		string startUser;
		string driver;
		string carNumber;
		string address;
		string reason;
	};
	
	["java:getset"] 
	class EscortBoxChangeModel extends model::BaseModel{
		string instanceId;
		string code;
		string schedulingCode;
		string schedulingTime;
		string startUser;
		string changeType;
		string stoppointName;
		string reason;
	};
	
	["java:getset"] 
	class ProcessEscortRouteChangeModel extends model::BaseModel{
		string instanceId;
		string code;
		string startUser;
		string routeChangeTime;
		string schedualCode;
		string status;
		string remark;
	};
	/*
	*路点信息
	*/
	["java:getset"]
	class InterstopModel extends model::BaseModel{
		string id;
		double x;
		double y;
		string name;
		string type;
		int indx;
		string drivecircuitId;
		string drivecircuitName;
		string limitSpeed;
		string remark;
	};
	/*
	*路线信息
	*/
	["java:getset"]
	class DriverCircitModel extends model::BaseModel{
		string id;
		string name;
		string startAddress;
		string endAddress;
		string speedLimit;
		string remark;
	};
	
	
	["java:getset"] 
	struct EscortGroup{
		string groupId;
		string groupName;
	};
	
	["java:getset"] 
	struct StopPointModel{
		string id;
		string name;
	};
	
	["java:getset"] 
	struct TaskEventModel{
		string time;
		string content;
	};
	["java:getset"] 
	struct EventJmsModel{
		long timestamp;
		string eventMessage;
		bool isFlush=false;
	};
	["java:getset"] 
	struct UserTaskJmsModel{
		long timestamp;
		string user;
	};
	
	["java:getset"]
	struct BoxChangeOperation{
		/*尾箱变更 获取停靠网点尾箱用到这两个属性*/
		bool canAdd;
		bool canDel;
	};
};