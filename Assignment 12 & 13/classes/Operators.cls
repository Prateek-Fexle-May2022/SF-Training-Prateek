/**   Description :   Purpose to create this class is to implement Operators.
*
*     Created By  :   Prateek Bhadoria
*
*     Arguments   :   None
*
*     Return      :   void
*
*     Revision log:   V_1.0 - Created  - Prateek Bhadoria - Date-10/07/2022
*                     
* 
**/
public with sharing class Operators {
    /**   Description :   This method is used to perform navigation
    *
    *     Created By  :   Prateek Bhadoria
    *
    *     Arguments   :   none
    *
    *     Return      :   void
    *
    *     Revision log:   V_1.0 - Created  - Prateek Bhadoria -Date-10/07/2022
    *                     
    * 
    **/
    public static void safeOperator(){
        String a=NULL;
        String b='abc';
        System.debug(a==null? b:a);
        Account acc =new Account();
        acc.Name='test';
        insert acc;
        System.debug([SELECT ID , Name FROM Account where ID=:acc.ID]?.NAME);  
    }

    /**   Description :   This method is used to perform navigation
    *
    *     Created By  :   Prateek Bhadoria
    *
    *     Arguments   :   none
    *
    *     Return      :   void
    *
    *     Revision log:   V_1.0 - Created  - Prateek Bhadoria -Date-10/07/2022
    *                     
    * 
    **/
    public static void safeOperator2(){
        List<String> filteredAccountSites = new List<String>();

        List<Account> collectedAccounts = [SELECT Id, Name, Site FROM Account LIMIT 5];

        Map<Id, Account> accountsMap = new Map<Id, Account>([SELECT Id, Name, Site FROM Account]);

        for(Account a : collectedAccounts){	
            Account localAccount = accountsMap.get(a.Id);
            if(localAccount != null){
                if(localAccount.site != null){
                    filteredAccountSites.add(localAccount.Site.substring(6));
                }
            }

        }

        System.debug('  ' +filteredAccountSites);
    }

    /**   Description :   This method is used to perform navigation
    *
    *     Created By  :   Prateek Bhadoria
    *
    *     Arguments   :   none
    *
    *     Return      :   void
    *
    *     Revision log:   V_1.0 - Created  - Prateek Bhadoria -Date-10/07/2022
    *                     
    * 
    **/
    public static void safeOperator3(){
   		List<String> filteredAccountSites = new List<String>();

        List<Account> collectedAccounts = [SELECT Id, Name, Site FROM Account LIMIT 5];

        Map<Id, Account> accountsMap = new Map<Id, Account>([SELECT Id, Name, Site FROM Account]);

        for(Account a : collectedAccounts){

            filteredAccountSites.add(accountsMap.get(a.Id)?.Site?.Substring(6));

        }

        System.debug('  ' +filteredAccountSites);       
    }      
}