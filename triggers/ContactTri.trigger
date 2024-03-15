trigger ContactTri on Contact (after insert,after update,after delete,after undelete) {
    if(Trigger.isAfter && (Trigger.isInsert || Trigger.isUpdate || Trigger.isUndelete)){
        contactTrigger.enforcedAccountContactList(Trigger.New);
    }
}