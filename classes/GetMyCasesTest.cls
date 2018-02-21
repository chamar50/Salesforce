@isTest
private class GetMyCasesTest {

	private static testMethod void test() {
        case cs = new case(status = 'New', Origin = 'Phone');
        insert cs;
        
        RestRequest request = new RestRequest();
        String sub1 = String.valueOf(URL.getCurrentRequestUrl()).substringAfter('=');
        List<String> listString = sub1.split('/');
        system.debug(listString);
       
        request.requestURI = listString[0]+'//'+listString[1]+listString[2]+'/services/apexrest/MyCases/GetMyCases/'+ cs.id;
        system.debug(':::: Request URI:'+listString[0]+'//'+listString[1]+listString[2]+'/services/apexrest/MyCases/GetMyCases/'+ cs.id);
        request.httpMethod = 'GET';
        RestContext.request = request;
       Map<String, GetMyCases.Result> listStringVal = GetMyCases.GetMyCasesMethod();
	}
}