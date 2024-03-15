/*
 * Queueable_Example_1 queueable=new Queueable_Example_1();
   Id jobId=System.enqueueJob(queueable);

 * Queueable apex can invoke from another Queueable apex class
 * Queueable will return Job Id
 * 
 */ 
public class Queueable_Example_1 implements Queueable {
    public void execute(QueueableContext qc){
        List<Account> accList=[Select Id,Name from Account Where createdDate=THIS_WEEK];
        for(Account acc:accList){
            acc.Phone='88888888888';
        }     
        update accList;
    }
}