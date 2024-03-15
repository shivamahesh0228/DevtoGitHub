trigger TimesheetTrigger on Timesheet__c (before insert,after insert,after update,before update) {
    System.debug('Trigger.new Size  '+Trigger.new.size());
    if(Trigger.isBefore && (Trigger.isInsert || Trigger.isUpdate)){
        for(Timesheet__c ts:Trigger.new){
            System.debug('Trigger.new Before Name 5 '+ts.Name);
        }
    }else if(Trigger.isAfter && (Trigger.isInsert || Trigger.isUpdate)){
        for(Timesheet__c ts:Trigger.new){
            System.debug('Trigger.new After Name 9  '+ts.Name);
        }
    }        
}