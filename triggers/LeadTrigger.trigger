trigger LeadTrigger on Lead (before insert,before update) {
    Switch ON Trigger.OperationType{
        WHEN BEFORE_INSERT,BEFORE_UPDATE{
            for(Lead l:Trigger.New){
                if(l.LeadSource =='Web'){
                    l.Rating='Cold';
                }else{
                    l.Rating='Hot';
                }
            }
        }
    }
}