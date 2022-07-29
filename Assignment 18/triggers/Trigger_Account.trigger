/**
* Description   - This trigger is used to create account and send email notification to the customer after account creation.   
* Created by    - Prateek Bhadoria
* Created Date  - 27/07/2022
* Revision log  -  V_1.0 - Created  - Prateek Bhadoria - 27/07/2022
**/
trigger Trigger_Account on Account (before insert, before update, before delete, after insert, after update, after delete, after undelete) {
    
    if(Trigger.isBefore){
        system.debug('Checking in Before Trigger Operations');
        
        if(Trigger.isInsert || Trigger.isUpdate){
            system.debug('Check Insert List ::: Trigger.New ' + Trigger.New);
            system.debug('Check Insert List ::: Trigger.old ' + Trigger.old);
            AccountTriggerHandler.accountNumberType(Trigger.New, Trigger.oldMap);
        }
        if(Trigger.isDelete){
            system.debug('Check Delete List ::: Trigger.New ' + Trigger.New);
            system.debug('Check Delete List ::: Trigger.old ' + Trigger.old);
        }
    }
    
    if(Trigger.isAfter){
        system.debug('Checking in After Trigger Operations');
        AccountTriggerHandler.sendEmailNotification(Trigger.New);
    }
    if(Trigger.isUpdate){
        system.debug('Check Update List ::: Trigger.New ' + Trigger.New);
        system.debug('Check Update List ::: Trigger.old ' + Trigger.old);
        AccountTriggerHandler.sendEmailNotification(Trigger.New);
    }
}