public class AccountTriggerHandler {
    /*
Scenario -1
Write a trigger on Account, when an account is inserted, automatically account billing address should populate 
into the account shipping address.
*/
    public static void changeShippingAddress(List<Account> accList, Boolean isInsert){
        try{
            if(accList!=null && !accList.isEmpty()){
                for(Account acc:accList){
                    if(isInsert){
                        if(acc.BillingStreet!=null){
                            acc.ShippingStreet=acc.BillingStreet;
                        }
                        if(acc.BillingCity!=null){
                            acc.ShippingCity=acc.BillingCity;
                        }
                        if(acc.BillingState!=null){
                            acc.ShippingState=acc.BillingState;
                        }
                        if(acc.BillingPostalCode!=null){
                            acc.ShippingPostalCode=acc.BillingPostalCode;
                        }
                        if(acc.BillingCountry!=null){
                            acc.ShippingCountry=acc.BillingCountry;
                        }
                    }                
                }
            }
        }catch(Exception ex){
            system.debug('ex '+ex.getMessage());
        }       
    }
    /*
Scenario -2 
Write a trigger on the Account when the Account is updated check all opportunities related to the account. Update all Opportunities Stage to close lost if an opportunity created date is 
greater than 30 days from today and stage not equal to close won.
*/
    public static void oppoStageUpdate(List<Account> accList, Boolean isInsert){
        try{
            if(!isInsert){                            
                if(accList!=null && !accList.isEmpty()){
                    Set<Id> accIds=new Set<Id>();
                    Datetime days=System.now()-30;
                    System.debug('====> days '+days);
                    List<Opportunity> oppntyToUpdate=new List<Opportunity>();
                    for(Account acc:accList){
                        accIds.add(acc.Id);
                    }
                    if(accIds!=null){
                        List<Opportunity> oppList=[Select Id, AccountId, StageName, CreatedDate, CloseDate from Opportunity where AccountId in :accIds];
                        System.debug('===> oppList '+oppList);
                        if(oppList!=null && !oppList.isEmpty()){
                            for(Opportunity opp: oppList){
                                if(opp.CreatedDate > days && opp.StageName!='Closed Won'){
                                    opp.StageName='Closed Lost';
                                    opp.CloseDate=System.today();
                                }
                                oppntyToUpdate.add(opp);
                            }
                            Update oppntyToUpdate;
                        }
                    }
                }
            }
        }
        catch(Exception ex){
            System.debug('ex  '+ex.getMessage());
        }       
    }
    /*
Once an Account will update then that Account will update with the total amount from All its Opportunities on the Account Level. 
The account field name would be ” Total Opportunity Amount “.
*/
    public static void totalAmountofRelatedOp(List<Account> accList, Boolean isInsert){
        try{
            if(!isInsert){
                Set<Id> accIds=new Set<Id>();
                Map<Id,Double> amountMap = new Map<Id,Double>();
                if(accList!=null && !accList.isEmpty()){
                    for(Account acc:accList){
                        accIds.add(acc.Id);                        
                    }
                    List<AggregateResult> results=[select AccountId,sum(Amount)TotalAmount from opportunity where AccountId in :accIds group by AccountId];
                    if(results.size()>0){
                        for(AggregateResult a: results){
                            Id accountId = (Id)a.get('AccountId');
                            double TotalAmount = (double)a.get('TotalAmount');
                            amountMap.put(accountId,TotalAmount);
                        }
                    }
                    for(Account acc:accList){
                        acc.Total_Opportunity_Amount__c=amountMap.get(acc.Id);
                    }
                }
            }
        }catch(Exception ex){
            System.debug('ex  '+ex.getMessage());
        }
    }
    /*
The following Trigger will fires when we try to create the account with the same name i.e. Preventing the users to create Duplicate Accounts
*/
    public static void duplicateAccountName(List<Account> accList,Boolean isInsert){
        try{
            Set<String> accNameset=new Set<String>();
            if(accList!=null && !accList.isEmpty()){
                for(Account acc: accList){
                    accNameset.add(acc.Name);
                }
                List<Account> duplicateAccountList=[Select Id,Name from Account Where Name IN:accNameset];
                for(Account acc: accList){
                    if(duplicateAccountList.size() >0){
                        acc.Name.addError('You Cannot Create the Duplicate Account');
                    }
                }
            }
        }catch(Exception ex){
            System.debug('ex '+ex.getMessage());
        }
    }
    // A company wants to automate the processs of creating associated contact record when new account records created.
    public static void createContactforNewAccount(List<Account> accList){
        List<Contact> contactList=new List<Contact>();
        for(Account acc:accList){
            Contact con=new Contact();
            con.FirstName='Test';
            con.LastName=acc.Name;
            con.AccountId=acc.Id;
            contactList.add(con);
        }
        if(!contactList?.isEmpty() && contactList!=null){
            insert contactList;
        }
    }
    
    
    
    
}