#include "schedulingmodel.ice"
[["java:package:service"]]
module schedulingservice{
	dictionary<string,string> Map;
	["java:type:java.util.ArrayList"]sequence<schedulingmodel::ActivityModel> ActivityList;
	["java:type:java.util.ArrayList"]sequence<schedulingmodel::UserHistoryTaskModel> UserHistoryTaskList;
	["java:type:java.util.ArrayList"]sequence<schedulingmodel::PersonModel> PersonList;
	["java:type:java.util.ArrayList"]sequence<schedulingmodel::CarModel> CarList;
	["java:type:java.util.ArrayList"]sequence<schedulingmodel::GunModel> GunList;
	["java:type:java.util.ArrayList"]sequence<schedulingmodel::BoxModel> BoxList;
	["java:type:java.util.ArrayList"]sequence<schedulingmodel::TaskEventModel> TaskEventList;
	["java:type:java.util.ArrayList"]sequence<schedulingmodel::EscortSchedulingModel> SchedulingList;
	["java:type:java.util.ArrayList"]sequence<schedulingmodel::EscortGroup> GroupList;
	["java:type:java.util.ArrayList"]sequence<schedulingmodel::ReplacePersonModel> ReplacePersonList;
	["java:type:java.util.ArrayList"]sequence<schedulingmodel::StopPointModel> StopPointList;
	["java:type:java.util.ArrayList"]sequence<schedulingmodel::InterstopModel> InterstopList;
	["java:type:java.util.ArrayList"]sequence<InterstopList> EscortRouteList;
	["java:type:java.util.ArrayList"]sequence<schedulingmodel::DriverCircitModel> DriverCircitList;
	
	interface ITaskService{	
		model::QueryResult getUserToDoList(string assignerUser,string taskName,string startTime,string endTime,bool isFinish,int pageIndex, int pageSize) throws model::CustomException;
		void activateTask(string taskId) throws model::CustomException;
		ActivityList getInstanceRejectpoints(string taskId) throws model::CustomException;
		void rejectTaskTo(string taskId,string activityId) throws model::CustomException;
		void completeTask(string taskId,string userId,Map vailable)  throws model::CustomException;
		void terminationTask(string taskId)  throws model::CustomException;
		void hangUpTask(string taskId) throws model::CustomException;
	};
	interface IProcessInstanceService{
		model::QueryResult searchProcessInstance(string user,string processKey, string startTime, string endTime,int pageIndex, int pageSize)  throws model::CustomException;
		UserHistoryTaskList getProcessInstanceTaskSummary(string instanceId) throws model::CustomException;
		void startProcessInstanceByKey(string key,string userId,Map vailbale) throws model::CustomException;
		schedulingmodel::Bytes getProcessInstanceTraceImage(string processInstanceId) throws model::CustomException;
	};
	interface ISchedulingService{
		PersonList getAllEscortPersons(string id) throws model::CustomException;
		CarList getAllEscortCar(string id) throws model::CustomException;
		GunList getAllEscortGun(string id) throws model::CustomException;
		BoxList getAllEscortBox(string id) throws model::CustomException;
		TaskEventList getLastTaskEvents() throws model::CustomException;
		schedulingmodel::PersonModel getPersonDetailByPersonId(string id) throws model::CustomException;
		schedulingmodel::EscortSchedulingModel getSchedulingByInstanceId(string id) throws  model::CustomException;
		BoxList getAllOutBox(string id) throws model::CustomException;
		BoxList getAllInBox(string id) throws model::CustomException;
		BoxList getBankOutDeliveryBox(string id) throws model::CustomException;
		BoxList getBankOutReceiveBox(string id) throws model::CustomException;
		string getEscortGroupByPersonCode(string code)throws model::CustomException;
		string getCarNumberByPersonCode(string code)throws model::CustomException;
		PersonList getSchedulingHaveGunPersons(string id) throws model::CustomException;
		PersonList getSchedulingDrivers(string id) throws model::CustomException;
		GroupList getGroupsByOutletPAccount(string account) throws model::CustomException;
		void subspendSchedulingProcess(string instanceId) throws model::CustomException;
		void activateSchedulingProcess(string instanceId) throws model::CustomException;
	};
	interface ISchedulingChangeService{
		bool isSchedulingOutBase(string instanceId) throws model::CustomException;
		SchedulingList getAllSchedulingModel() throws model::CustomException;
		model::QueryResult getEscortPersonChangesByCond(Map condition,int pageIndex,int pageSize) throws model::CustomException;
		model::QueryResult getEscortCarChangesByCond(Map condition,int pageIndex, int pageSize) throws model::CustomException;
		model::QueryResult getEscortBoxChangesByCond(Map condition,int pageIndex, int pageSize) throws model::CustomException;
		model::QueryResult getFreeDrivers(int pageIndex,int pageSize) throws model::CustomException;
		model::QueryResult getFreeCars(int pageIndex,int pageSize)throws model::CustomException;
		PersonList getPersonChangeOriginalPersons(string id)throws model::CustomException;
		ReplacePersonList getPersonChangeReplacedPersons(string id)throws model::CustomException;
		PersonList getPersonChangeDriverPersons(string id)throws model::CustomException;
		CarList getCarChangeOriginaCars(string id)throws model::CustomException;
		CarList getCarChangeReplacedCars(string id)throws model::CustomException;
		schedulingmodel::EscortPersonChangeModel getPersonChangeSchedualing(string id) throws model::CustomException;
		schedulingmodel::EscortCarChangeModel getCarChangeSchedualing(string id) throws model::CustomException;
		PersonList getCarChangeOriginalPersons(string id) throws model::CustomException;
		PersonList getCarChangeDriver(string id) throws model::CustomException;
		/*****路线变更相关接口*****/
		model::QueryResult getEscortRouteChangeByCon(Map condition,int pageIndex,int pageSize) throws model::CustomException;
		EscortRouteList getEscortSchedualRoute(string schedualCode,string groupId,string taskId) throws model::CustomException;
		DriverCircitList getDriverCircuitList(EscortRouteList escortRouteList) throws model::CustomException;
		InterstopList getInterStopListById(EscortRouteList  escortRouteList,string driverCircuitId) throws model::CustomException;
		EscortRouteList saveDriverCircuitInfo(EscortRouteList  escortRouteList,schedulingmodel::DriverCircitModel driverCircitModel) throws model::CustomException;
		EscortRouteList delDriverCircuitInfo(EscortRouteList  escortRouteList,string driverCircuitId) throws model::CustomException;
		EscortRouteList addInterStop(EscortRouteList  escortRouteList,schedulingmodel::InterstopModel interstopModel) throws model::CustomException;
		EscortRouteList delInterStop(EscortRouteList  escortRouteList,schedulingmodel::InterstopModel interstopModel) throws model::CustomException;
		EscortRouteList upInterStop(EscortRouteList  escortRouteList,schedulingmodel::InterstopModel interstopModel) throws model::CustomException;
		EscortRouteList downInterStop(EscortRouteList  escortRouteList,schedulingmodel::InterstopModel interstopModel) throws model::CustomException;
		EscortRouteList getNewRouteByTaskId(string code,string taskId) throws model::CustomException;
		BoxList getBoxChangeCurrentBox(string id) throws model::CustomException;
		BoxList getBoxChangeExceptionBox(string id) throws model::CustomException;
		schedulingmodel::BoxChangeOperation getStopPointBoxChangeOperation(string code,string stoppointId,int isDelivery)throws model::CustomException;
		StopPointList getSchedulingStoppoints(string code,int isDelivery) throws model::CustomException;
		BoxList getSchedulingStopPointBoxes(string code,string stoppointId,int isDelivery)throws model::CustomException;
		model::QueryResult getFreeBoxes(string stoppointId,int isDelivery,int pageIndex,int pageSize)throws model::CustomException;
	};
};