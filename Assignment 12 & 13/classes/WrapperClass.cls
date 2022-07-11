/**
* Description   - This class is being created to implement the concept of wrapper class
*
* Created by    - Prateek Bhadoria
*
* Created Date  - 11/07/2022
*
* Revision log  -  V_1.0 - Created  - Prateek Bhadoria - Date-11/07/2022
*                  
*
**/
public class WrapperClass{
    public List<wrapAccount> wrapAccountList {get; set;}
    public List<Account> selectedAccounts{get;set;}

    /**   Description :   Creating a Constructor
    *
    *     Created By  :   Prateek Bhadoria
    *
    *     Arguments   :   None
    *
    *     Return      :   void
    *
    *     Revision log:   V_1.0 - Created  - Prateek Bhadoria - Date-11/07/2022
    *                     
    * 
    **/ 
    public WrapperClass(){
        if(wrapAccountList == null) {
            wrapAccountList = new List<wrapAccount>();
            for(Account a: [select Id, Name,BillingState, Website, Phone from Account limit 10]) {
                // As each Account is processed we create a new wrapAccount objct
                wrapAccountList.add(new wrapAccount(a));
            }
        }
    }
    /**   Description :   Creating a method
    *
    *     Created By  :   Prateek Bhadoria
    *
    *     Arguments   :   None
    *
    *     Return      :   void
    *
    *     Revision log:   V_1.0 - Created  - Prateek Bhadoria - Date-11/07/2022
    *                     
    * 
    **/
    public void processSelected() {
    selectedAccounts = new List<Account>();

        for(wrapAccount wrapAccountObj : wrapAccountList) {
            if(wrapAccountObj.selected == true) {
                selectedAccounts.add(wrapAccountObj.acc);
            }
        }
    }


    /**
    * Description   - creating a wrapper class
    *
    * Created by    - Prateek Bhadoria
    *
    * Created Date  - 08/07/2022
    *
    * Revision log  -  V_1.0 - Created  - Prateek Bhadoria - Date-11/07/2022
    *                  
    *
    **/ 
    public class wrapAccount {
        public Account acc {get; set;}
        public Boolean selected {get; set;}

        //This is the contructor method.
        public wrapAccount(Account a) {
            acc = a;
            selected = false;
        }
    }
}