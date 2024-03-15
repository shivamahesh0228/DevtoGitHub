trigger CaseTrigger on Case (before insert) {
    Switch ON Trigger.OperationType{
        WHEN BEFORE_INSERT{
            List<Case> caseList=[select Id,CaseNumber from Case Where CreatedDate=THIS_WEEK and OwnerId =:UserInfo.getuserId() With SECURITY_ENFORCED];
            for(Case c:Trigger.New){
                if(caseList.size() <7){
                    if(c.Origin =='Email'){
                        c.Status='New';
                        c.Priority='Medium';
                    } 
                }else{
                    c.AddError('You cannot add more than 7 cases in a week');
                }                
            }
        }
    }
}