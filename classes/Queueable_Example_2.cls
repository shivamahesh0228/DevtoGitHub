public class Queueable_Example_2 implements Queueable {
    List<Account> accountList=new List<Account>();
    public Queueable_Example_2(List<Account> accList){
        this.accountList=accList;
    }
    public void execute(QueueableContext qc){
        for(Account acc:accountList){
            acc.Type='Prospect';
        }
        update accountList;
    }
}