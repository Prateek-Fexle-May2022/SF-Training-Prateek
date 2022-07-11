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

    /**   Description :   Creating a method for inserting lead
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
    public static Lead createLead(Boolean doInsert)
    {
        Lead newLead = new Lead() ;
        newLead.FirstName = 'Cole';
        newLead.LastName = 'Swain';
        newLead.Company = 'BlueWave';
        newLead.Status = 'contacted';
        if(doInsert){
            insert newLead;
        }
        return newLead;
    }
    /**   Description :   Creating a method for new leads
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
    public static Void convertLead(Lead newLead )
    {
        database.leadConvert lc = new database.leadConvert();
        lc.setLeadId(newLead.id);
        leadStatus convertStatus = [SELECT Id, MasterLabel FROM LeadStatus WHERE IsConverted=true LIMIT 1];
        lc.setConvertedStatus(convertStatus.MasterLabel);
        
        Database.LeadConvertResult lcr = Database.convertLead(lc);
        System.assert(lcr.isSuccess());
        lc.setOpportunityName('Cole Swain');
        
    }
        
    /**   Description :   This method is test data for create Account
    *
    *     Created By  :   Prateek Bhadoria
    *
    *     Arguments   :   None
    *
    *     Return      :   acc
    *
    *     Revision log:   V_1.0 - Created  - Prateek Bhadoria - Date-11/07/2022
    *                     
    * 
    **/
    public static Account createAccount(Boolean doInsert)
    {
        Account acc = new Account();
        acc.Name = 'Test Account';
        if(doInsert){
            insert acc;
        }
        return acc;
    }
       
    /**   Description :   This method is test data for create contact object
    *
    *     Created By  :   Prateek Bhadoria
    *
    *     Arguments   :   None
    *
    *     Return      :   createcontact
    *
    *     Revision log:   V_1.0 - Created  - Prateek Bhadoria - Date-11/07/2022
    *                     
    * 
    **/ 
    public static Contact createContact(Boolean doInsert)
    {
        return createContact(doInsert, createAccount(true).Id);
    }
    /**   Description :   This method is test data for create contact object
    *
    *     Created By  :   Prateek Bhadoria
    *
    *     Arguments   :   None
    *
    *     Return      :   con
    *
    *     Revision log:   V_1.0 - Created  - Prateek Bhadoria - Date-11/07/2022
    *                     
    * 
    **/ 
    public static Contact createContact(Boolean doInsert, Id accId)
    {
        Contact con = new Contact();
        con.AccountId = accId;
        con.FirstName = 'FirstName';
        con.LastName = 'LastName';
        con.Email = 'prateek.bhadoria@Fexle.com' + Math.floor(Math.random() * 1000);
        if(doInsert)
        {
            insert con;
        }
        return con;
    }

    /**   Description :   This method is test data for create Opportunity object
    *
    *     Created By  :   Prateek Bhadoria
    *
    *     Arguments   :   None
    *
    *     Return      :   oppt
    *
    *     Revision log:   V_1.0 - Created  - Prateek Bhadoria - Date-11/07/2022
    *                     
    * 
    **/ 
    public static Opportunity createOpportunity(Boolean doInsert, Id accId)
    {
        Opportunity oppt = new Opportunity(Name ='New mAWS Deal',
                            AccountID = accId,
                            StageName = 'Customer Won',
                            Amount = 3000,
                            CloseDate = System.today()
                            );
        if(doInsert)
        {
            insert oppt;
        }
        return oppt;
    }   
    
    /**   Description :   This method is test data for create Case object
    *
    *     Created By  :   Prateek Bhadoria
    *
    *     Arguments   :   None
    *
    *     Return      :   cas
    *
    *     Revision log:   V_1.0 - Created  - Prateek Bhadoria - Date-11/07/2022
    *                     
    * 
    **/ 
    public static Case  createCase(Boolean doInsert )
    {
        Case cas = new Case(Status ='New', Priority = 'Medium', Origin = 'Email');
        if(doInsert)
        {
            insert cas ;
        }
        return cas ;
    }    
    
}