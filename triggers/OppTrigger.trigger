/* 1. SYstem.NullPointer Exception: Attempt dereference a null Object
   2. Record is Read Only
   3. Maximum Trigger Dept Exceeded
   4. sObject row was retrieved via SOQL without querying the request fiekd
   5. Too Many SOQL Queries
   6. List index out of the bound 0
   7. List as no rows for assignment to sObject
 */
trigger OppTrigger on Opportunity (before insert) {
    /*String accId=Trigger.new[0].AccountId;
    if(String.isNotBlank(accId) && accId.contains('001')){
        
    }
    List<Opportunity> oppList=new List<Opportunity>();
    for(Opportunity opp:Trigger.new){
        opp.Name='Test';
        opp.CloseDate=system.Today();
        opp.StageName='Prospecting';
        oppList.add(opp);
    }
    update oppList;
    List<Opportunity> oppList=new List<Opportunity>();
    for(Opportunity opp:[select Id,Name,CloseDate,StageName from Opportunity Where Id IN: Trigger.newMap.Keyset()]){
        opp.Name='Test';
        opp.CloseDate=system.Today();
        opp.StageName='Prospecting';
        oppList.add(opp);
    }
    if(RecursionTrigger.isRecursionTrigger){
        RecursionTrigger.isRecursionTrigger=false;
        update oppList;
    }   
    Opportunity opp=[select Id,CloseDate,StageName from Opportunity];
    String Name= opp.Name;
    for(Opportunity opp:Trigger.new){
        Opportunity oppList=[select Id,CloseDate,StageName from Opportunity];
    }*/
    
}