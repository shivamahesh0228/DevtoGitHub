/*
 Scenario -1
 Write a trigger on Account, when an account is inserted, automatically account billing address should populate 
 into the account shipping address.

Scenario -2 
Write a trigger on the Account when the Account is updated check all opportunities related to the account. Update all Opportunities Stage to close lost if an opportunity created date is 
greater than 30 days from today and stage not equal to close won.
 */
trigger AccountTrigger on Account (before insert,after insert,before update,after update,before delete, after delete) {
    switch on Trigger.OperationType{
        when BEFORE_INSERT{
            //System.debug('===> New version Account Data  '+Trigger.new);
            //AccountTriggerHandler.changeShippingAddress(Trigger.new,true);
            //AccountTriggerHandler.duplicateAccountName(Trigger.new,true);
            //
            //
            //
        }
        WHEN AFTER_INSERT{
            //AccountTriggerHandler.createContactforNewAccount(Trigger.New);
        }
        when AFTER_UPDATE{
            //AccountTriggerHandler.oppoStageUpdate(Trigger.new,false);
        }
        when BEFORE_UPDATE{
            //AccountTriggerHandler.totalAmountofRelatedOp(Trigger.new,false);
        }
    }
}