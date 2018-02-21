/***************************************************************************************************
@Class Name 				: 	GetMyCases
@Description 				:	This class is used to get list of all cases created by particular user. 
@Date           			: 	2/19/2018
@Author         			: 	Amar Chakka 
@Version        			: 	1.0
@Comments       			: 	Get the user Specific Cases.

@Last Modified By       	: 	Amar Chakka 
@Last Modified Date     	: 	20Dec/2017
@Last Modified Comments   	:  	Removed Hardcoding and included try catch block.
 
@Sample URL 				:   /services/apexrest/MyCases/GetMyCases/0056F000006QztFQAS
***************************************************************************************************************/

@RestResource(urlMapping='/MyCases/GetMyCases/*')

global class GetMyCases{
	
	
	@HttpGet
	global static map<String, Result> GetMyCasesMethod(){
		
		map<String, Result> MapResultOutput = new map<String, Result>();
		string userid = '';
		RestRequest Req = RestContext.request;
		list<string>param = Req.requestURI.split('/');
		userid = param[param.size()-1];
		list<case> cas = new list<case>();
		
		if(userid != null || userid != ''){
		cas = [SELECT casenumber FROM Case where owner.id =: userid];
		}
		
		MapResultOutput.put(Label.TRLabel,new Result(new cases(cas),'Success in retriving user specific Cases'));
		return MapResultOutput;

	
		}


global class Result{
	global cases cases;
	global string failure;
	
	global Result(cases cases, string failure)
	{
		this.cases=cases;
		this.failure=failure;
	}
}
	global class cases{
	global list<case> cases = new list<case>();
	global cases(list<case> cases){
	this.cases = cases;
	}
}
}