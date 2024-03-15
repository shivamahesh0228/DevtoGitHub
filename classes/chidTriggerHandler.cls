public class chidTriggerHandler {
    public static void updateparentRecordNewChild(List<Child_Obj__c> childList){
        Set<Id> setParentIdsSet=new Set<Id>();
        Map<Id,decimal> activeMap=new Map<Id,decimal>();
        Map<Id,decimal> inactiveMap=new Map<Id,decimal>();
        List<Parent_Obj__c> parentList=new List<Parent_Obj__c>();
        decimal countOfActive=0;
        decimal countOfInactive=0;
        for(Child_Obj__c ch:childList){
            if(ch.Parent_Obj__c!=null){
                setParentIdsSet.add(ch.Parent_Obj__c);
            }
            if(ch.Status__c=='Active'){
                countOfActive=countOfActive+1;
            }else if(ch.Status__c=='Inactive'){
                countOfInactive=countOfInactive+1;
            }
            if(activeMap.containsKey(ch.Parent_Obj__c)){
                activeMap.put(ch.Parent_Obj__c,countOfActive);
            }else{
                activeMap.put(ch.Parent_Obj__c,countOfActive);
            }
             if(inactiveMap.containsKey(ch.Parent_Obj__c)){
                inactiveMap.put(ch.Parent_Obj__c,countOfInactive);
            }else{
                inactiveMap.put(ch.Parent_Obj__c,countOfInactive);
            }
        }
        System.debug('activeMap  '+activeMap);
        System.debug('inactiveMap  '+inactiveMap);
        parentList=[Select Id,No_of_Child_Actives__c,No_of_Child_Inactives__c from Parent_Obj__c WHERE Id IN:setParentIdsSet];
        System.debug('parentList  '+parentList);
        if(parentList!=null && !parentList.isEmpty()){
            for(Parent_Obj__c par:parentList){
                if(par.No_of_Child_Actives__c!=null){
                    par.No_of_Child_Actives__c=par.No_of_Child_Actives__c+activeMap.get(par.Id);
                }else{
                    par.No_of_Child_Actives__c=activeMap.get(par.Id);
                }
                if(par.No_of_Child_Inactives__c!=null){
                    par.No_of_Child_Inactives__c=par.No_of_Child_Inactives__c+inactiveMap.get(par.Id);
                }else{
                    par.No_of_Child_Inactives__c=inactiveMap.get(par.Id);
                }                
            }
            update parentList;
        }
    }
}