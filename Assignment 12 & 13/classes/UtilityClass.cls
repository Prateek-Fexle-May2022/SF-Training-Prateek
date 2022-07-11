/**
* Description   - This class is being created to implement utility class concept
*
* Created by    - Prateek Bhadoria
*
* Created Date  - 11/07/2022
* Revision log  -  V_1.0 - Created  - Prateek Bhadoria - Date-11/07/2022
*                  
*
**/
public class UtilityClass {

    /**   Description :   Creating a method
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
    public static void createTestRecords(Integer numAccts, Integer numContactsPerAcct) {
        List<Account> accts = new List<Account>();

        for(Integer i=0;i<numAccts;i++) {
            Account a = new Account(Name='TestAccount' + i);
            accts.add(a);
    	}
        insert accts;
        List<Contact> cons = new List<Contact>();

        for (Integer j=0;j<numAccts;j++) {
            Account acct = accts[j];

            for (Integer k=numContactsPerAcct*j;k<numContactsPerAcct*(j+1);k++) {
                cons.add(new Contact(firstname='Test'+k,
                lastname='Test'+k,
                AccountId=acct.Id));
  			}
    	}
        
    insert cons;
    }
}