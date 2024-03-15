/*
 * Database.Stateless ---> By Default interface One execute to another execute data won't transfer.
 * Database.Stateful ---> Interface One execute to another execute data is transfer but only non static variable can transfer data not static variables.
 * Database.AllowsCallouts --> This is used for calls Webservice 
 * If Start methof fails entire operation filed
 * If any execute fiales other execute will success
 * If finish fail Start and execute will success
*/
global class Batch_Example_2 implements Database.Batchable<sObject>,Database.Stateful,Database.AllowsCallouts {
    global integer count=0;
    global static integer size=0; // static variable not transfer one execute to another execute
    global Database.QueryLocator start(Database.BatchableContext bc){
        String soqlQuery='Select Id,Name,Rating from Account';
        return Database.getQueryLocator(soqlQuery);
    }
    global void execute(Database.BatchableContext bc, List<Account> scope){
        for(Account acc: scope){
            acc.Rating='Hot';
            count=count+1;
            size=size+1;
        }
        update scope;        
    }
    global void finish(Database.BatchableContext bc){
        AsyncApexJob jobId=[Select Id,Status, JobType from AsyncApexJob Where Id=:bc.getJobId()];
        System.debug('===>jobId '+jobId.status);
        System.debug('===>count '+count);
        System.debug('===>size '+size);
    }
}