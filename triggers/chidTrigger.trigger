trigger chidTrigger on Child_Obj__c (after insert,after update) {
    SWITCH ON Trigger.OperationType{
        WHEN AFTER_INSERT{
            chidTriggerHandler.updateparentRecordNewChild(Trigger.New);
        }
    }
}