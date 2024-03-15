public with sharing class ParentTriggerHandler {
    public static void checkDuplicateParentName(List<Parent__c> newParentList,Map<Id,Parent__c> oldParentMap, boolean isInsert){  
        System.debug('====> newParentList '+newParentList.size());
        Map<String ,Parent__c> duplicateNames=new Map<String ,Parent__c>();                   
        if(newParentList.size()>0){
            //System.debug('===> newParentList '+newParentList.size());
            List<Parent__c> parenList=[select Id,Name from Parent__c];
            for(Parent__c p:parenList){
                duplicateNames.put(p.Name,p);
            }
            System.debug('===> duplicateNames '+duplicateNames.size());
            for(Parent__c p:newParentList){
                if(isInsert){
                    if(duplicateNames.containsKey(p.Name)){
                        p.addError('Alreay Parent Name existed please different Name');
                    }  
                }else{
                    Parent__c oldParent=oldParentMap.get(p.Id);
                    if(oldParent.Name !=p.Name){
                        if(duplicateNames.containsKey(p.Name)){
                            p.addError('Alreay Parent Name existed please different Name');
                        }    
                    }
                }                
            }
        }        
    }
}