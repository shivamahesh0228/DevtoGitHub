public with sharing class SampleAccountApexCls {
@AuraEnabled
public static List<Account> getAccountList(){
    return [select Id,Name from Account];
}
}