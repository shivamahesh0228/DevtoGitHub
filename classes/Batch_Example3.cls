public class Batch_Example3 implements Database.Batchable<sObject> {
    public Database.QueryLocator start(Database.BatchableContext bc){
        String querySTR='Select Id,Name,Phone from Account Where Rating=\'Warm\'';
        System.debug('===:querySTR '+querySTR);
        return Database.getQueryLocator(querySTR);
    }
    public void execute(Database.BatchableContext bc, List<Account> scope){
        List<Contact> conList=new List<Contact>();
        for(Account acc:scope){
            Contact con=new Contact();
            con.LastName=acc.Name;
            con.Phone=acc.Phone;
            con.AccountId=acc.Id;
            conList.add(con);
        }
        insert conList;
    }
    public void finish(Database.BatchableContext bc){
        // Post-processing operations
        AsyncApexJob jobId=[Select Id,Status, JobType from AsyncApexJob Where Id=:bc.getJobId()];
        System.debug('===>jobId '+jobId.status);
    }
}