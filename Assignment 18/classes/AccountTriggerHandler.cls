/**
* Description   - This trigger helper class is used to create account and send email notification to the customer after account creation.   
* Created by    - Prateek Bhadoria
* Created Date  - 27/07/2022
* Revision log  -  V_1.0 - Created  - Prateek Bhadoria - 27/07/2022
**/
public class AccountTriggerHandler {
    /**   Description :   Create account number as per the account type.
    *     Created By  :   Prateek Bhadoria
    *     Arguments   :   
    *     Return      :   void
    *     Revision log:   V_1.0 - Created  - Prateek Bhadoria - 27/07/2022
    *                      
    **/
    public static void accountNumberType(List<Account> newAccountList, Map<Id,Account> oldAccountMap) {
        // Iterating Loop to create account number as per the account type
        for(Account account : newAccountList){
            if(account.AccountNumber == null){
                Integer accNumber=Integer.valueOf(100000000*Math.random());
                account.AccountNumber = String.valueof(accNumber);
            }
            if(oldAccountMap == null || account.Type != oldAccountMap.get(account.Id).Type){
                if(account.Type == 'Savings Account'){
                    if(account.AccountNumber.contains('FD-')){
                        account.AccountNumber = account.AccountNumber.remove('FD-');
                        
                    }
                    account.AccountNumber = 'SA-'+account.AccountNumber;
                    
                }
                else if(account.Type == 'Fixed Deposit Account'){
                    if(account.AccountNumber.contains('SA-')){
                        account.AccountNumber = account.AccountNumber.remove('SA-');
                    }
                    account.AccountNumber = 'FD-'+account.AccountNumber;
                }
                else {
                    if(account.AccountNumber.contains('FD-')){
                        account.AccountNumber = account.AccountNumber.remove('FD-');
                    }
                    if(account.AccountNumber.contains('SA-')){
                        account.AccountNumber = account.AccountNumber.remove('SA-');
                    }
                }
            }
        }
    }
    /**   Description :   Send Email Notification to the customer after account creation.
    *     Created By  :   Prateek Bhadoria
    *     Arguments   :   
    *     Return      :   void
    *     Revision log:   V_1.0 - Created  - Prateek Bhadoria - 27/07/2022
    *                      
    **/
    public static void sendEmailNotification(List<Account> accList){
        
        // Creating Email body to sent mail to the customer after account creation
        List<Messaging.SingleEmailMessage> emailMsgList = New List<Messaging.SingleEmailMessage>();
        for(Account acc : accList){
            if(acc.Email__c != null){
                Messaging.SingleEmailMessage emailMsg = New Messaging.SingleEmailMessage();
                String[] toAddress = New String[] {acc.Email__c}; // To get Email ID of customer
                    emailMsg.setToAddresses(toAddress);
                String emailSubject = 'Hi '  + acc.Name + ', Welcome to AxisBank'; // subject body of Email
                emailMsg.setSubject(emailSubject);
                String displayName = 'AxisBank Team'; // Display sender name
                emailMsg.setSenderDisplayName(displayName);
                
                // Add content in the Email
                String content =  'Dear ' +acc.Name+ ',<br/>'+ 
                    'Welcome to the axis family. <br/>'+
                    'Your account has been created/updated. <br/>'+
                    'Your account details are as follows-<br/><br/>'+
                    'Account Holder Name -> '+ acc.Name + '<br/>'+
                    'Account Type -> ' + acc.Type + '<br/>' +
                    'Account Number ->  ' + acc.AccountNumber + '<br/><br/>'+
                    'Thank you for having buisness with Axis Bank. <br/>'+
                    'You have a great day ahead.';
                
                emailMsg.setHtmlBody(content);
                emailMsgList.add(emailMsg);
            }
        }
        Messaging.sendEmail(emailMsgList);    
    }
}