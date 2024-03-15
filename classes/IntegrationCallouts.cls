public class IntegrationCallouts {
    // Callout Endpoint URLs :   https://gorest.co.in/
    // Get User
    public static void getCalloutUser(String userId){
        Http http=new Http();
        HttpRequest request=new HttpRequest();
        request.setMethod('GET');
        request.setHeader('Authorization','Bearer bf35a28bcf16bca25ab0a32df24ec63157c58c7cf53e18d031c4a8b5d2a6215d');
        request.setEndPoint('https://gorest.co.in/public/v2/users/'+userId);
        HttpResponse response=http.send(request);
        if(response.getStatusCode() == 200){
            System.debug('getStatusCode ===>'+response.getStatusCode());
            System.debug('getBody ===>'+response.getBody());
        }
    }
    // Create User
    public static void getCalloutCreateUser(){
        Http http=new Http();
        HttpRequest request=new HttpRequest();
        request.setMethod('POST');
        request.setHeader('Authorization','Bearer bf35a28bcf16bca25ab0a32df24ec63157c58c7cf53e18d031c4a8b5d2a6215d');
        request.setHeader('Content-Type','application/json');
        request.setEndPoint('https://gorest.co.in/public/v2/users');
        String reqBody='{"name":"K Shiva Mahesh 123", "gender":"male", "email":"shiva1234@gmail.com", "status":"active"}';
        request.setBody(reqBody);
        HttpResponse response=http.send(request);
        if(response.getStatusCode() == 200 || response.getStatusCode() == 201){
            System.debug('getStatusCode ===>'+response.getStatusCode());
            System.debug('getBody ===>'+response.getBody());
        }else{
             System.debug('Error getStatusCode ===>'+response.getStatusCode());
            System.debug('Error getBody ===>'+response.getBody());
        }
    }
}