/*
 ----------   Execute Batch apex  ---------------------
 Batch_Eample_1 batch=new Batch_Eample_1();
 Id jobIdD=Database.executeBatch(batch); Default will take Batch Size is 200
 Id jobId=Database.executeBatch(batch,100); Pass as Pararmiter Batch size 100,200 etc..
 Between Batch sizes 1-2000
  */
global class Batch_Eample_1 implements Database.Batchable<sobject>,Database.AllowsCallOuts {
    global Database.QueryLocator start(Database.BatchableContext bc){
        string soqlQuery='Select Id,Name from Account';
        return Database.getQueryLocator(soqlQuery); // This can return upto 50 million records
    }
    global void execute(Database.BatchableContext bc, List<Account> scope){
        for(Account acc: scope){
            acc.Phone='9999999100';
            acc.Type='Customer - Direct';
        }
        update scope;
        System.debug('===> getChildJobId '+bc.getChildJobId());
    }
    global void finish(Database.BatchableContext bc){
        // Post - processing 
        AsyncApexJob job=[select Id,status,JobType from AsyncApexJob Where Id=:bc.getJobId()];
        System.debug('====> job '+job);
    }
}