public class contactTrigger {
    public static void enforcedAccountContactList(List<Contact> contactList){
        Set<Id> accIds=new Set<Id>();
        for(Contact con:contactList){
            accIds.add(con.AccountId);
        }
        Map<Id,Account> accountMap=new Map<Id,Account>([select Id,Name,(Select Id from contacts) from Account Where Id IN:(accIds)]);
        for(Contact con:contactList){
            if(accountMap.get(con.AccountId)?.contacts.Size() >5){
                con.AddError('Already 5 contacts created');
            }
        }
    }
}