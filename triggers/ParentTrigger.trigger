trigger ParentTrigger on Parent__c (before insert,before update,before delete,after insert,after update,after delete,after undelete) {
    if(Trigger.isBefore){
        if(Trigger.isInsert){
            ParentTriggerHandler.checkDuplicateParentName(Trigger.New,null,true);            
        }else if(Trigger.isUpdate){
            ParentTriggerHandler.checkDuplicateParentName(Trigger.New,Trigger.oldMap,false);
        }        
    }
}