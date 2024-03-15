public class SalesforceIntegration_Ex_1 {
     @AuraEnabled(cacheable=true)
    public static String getIMDBMovieCallout(String searchText){
        Http http=new Http();
        HttpRequest request=new HttpRequest();
        request.setEndpoint('callout:IMDB_Named_Credentials/imdb/imdbSearchByName?query='+searchText);
        request.setMethod('GET');
        //request.setHeader('authorization','apikey 3N4mVX0dBON80j5HwhZort:6MU377Pa4hCwdP93wme5QP');
        HttpResponse response=http.send(request);
        System.debug('Status Code: '+response.getStatusCode());
        System.debug('Status Code: '+response.getBody());
        if(response.getStatusCode() == 200){
            System.debug('Success');
            return response.getBody();
        }else{
            //System.debug('Error');
            return 'Error Code : '+response.getStatusCode();
        }
    }
     @AuraEnabled(cacheable=true)
    public static String getIMDBMovieDetailsCallout(String movieId){
        Http http=new Http();
        HttpRequest request=new HttpRequest();
        request.setEndpoint('callout:IMDB_Named_Credentials/imdb/imdbSearchById?movieId='+movieId);
        request.setMethod('GET');
        //request.setHeader('authorization','apikey 3N4mVX0dBON80j5HwhZort:6MU377Pa4hCwdP93wme5QP');
        HttpResponse response=http.send(request);
        System.debug('Status Code: '+response.getStatusCode());
        System.debug('Status Code: '+response.getBody());
        if(response.getStatusCode() == 200){
            System.debug('Success');
            return response.getBody();
        }else{
            //System.debug('Error');
            return 'Error Code : '+response.getStatusCode();
        }
    }
}