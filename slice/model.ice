module model{
   exception CustomException{
   		string exceptionMessage;
   };
   class BaseModel{};
   ["java:type:java.util.ArrayList"]sequence<BaseModel> List;
   ["java:getset"] 
   struct QueryResult{
		List results;
	    int pageIndex;
	    int pageSize;
	    long pageCount;
	    long count;
	};
};