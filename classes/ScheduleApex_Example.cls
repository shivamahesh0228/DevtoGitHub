global class ScheduleApex_Example implements Schedulable {
    global void execute(SchedulableContext sc){
        Batch_Example3 batch=new Batch_Example3();
        database.executeBatch(batch);
    }
}