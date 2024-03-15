public with sharing class SampleAccountController {
@AuraEnabled(cacheable=true)
public static List<Account> getAccountList(){
    return [select Id,Name from Account Limit 10];
}
}