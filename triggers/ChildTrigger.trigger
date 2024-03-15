trigger ChildTrigger on Child__c (after insert,after update,after delete) {
    Set<Id> parentIds=new Set<Id>();
    if(Trigger.isAfter && (Trigger.isInsert || Trigger.Isupdate)){
        for(Child__c c:Trigger.New){
            parentIds.add(c.Parent__c);
        }
    }else if(Trigger.isAfter && Trigger.isDelete){
        for(Child__c c:Trigger.Old){
            parentIds.add(c.Parent__c);
        }
    }
    
    if(parentIds.size()>0){
        List<Parent__c> parentList=[Select Id,Annual_Total__c,(select Id,Annual_Amount__c from Childs__r) from Parent__c where Id IN:parentIds];
        for(Parent__c p:parentList){
            decimal totalAnnualAmount=0;
            for(Child__c c:p.Childs__r){
                if(c.Annual_Amount__c!=null){
                    totalAnnualAmount=totalAnnualAmount+c.Annual_Amount__c;
                }                
            }
            p.Annual_Total__c=totalAnnualAmount;
        }
        update parentList;
    }
}