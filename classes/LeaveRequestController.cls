public with sharing class LeaveRequestController {
    @AuraEnabled(cacheable=true)
    public static List<LeaveRequest__c> getMyLeaves(){
        try{
            List<LeaveRequest__c> myLeavesList = new List<LeaveRequest__c>();
            myLeavesList=[SELECT Id,Name,From_Date__c,To_Date__c,Reason__c,Status__c,Manager_Comment__c from LeaveRequest__c Where User__c =:UserInfo.getUserId() ORDER BY CreatedDate DESC];
            return myLeavesList;
        }catch(Exception ex){
            throw new AuraHandledException(ex.getMessage());
        }
    }
    @AuraEnabled(cacheable=true)
    public static List<LeaveRequest__c> getLeaveRequests(){
        try{
            Set<Id> userIdSet=new Set<Id>();
            List<LeaveRequest__c> myLeavesList = new List<LeaveRequest__c>();
            userIdSet.add(UserInfo.getUserId());
            myLeavesList=[SELECT Id,Name,From_Date__c,To_Date__c,Reason__c,Status__c,Manager_Comment__c,User__r.Name from LeaveRequest__c WHERE User__r.ManagerId IN:userIdSet ORDER BY CreatedDate DESC];
            return myLeavesList;
        }catch(Exception ex){
            throw new AuraHandledException(ex.getMessage());
        }
    }
}