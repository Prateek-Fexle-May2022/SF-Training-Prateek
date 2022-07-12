/**
* Description   - Call by value and call by refrence
* Created by    - Prateek Bhadoria
* Created Date  - 12/07/2022
* Revision log  -  V_1.0 - Created  - Prateek Bhadoria - Date - 12/07/2022
*                  
**/
public with sharing class CallStudent {
    String name ;
    /**   Description :   Constructor
    *     Created By  :   Prateek Bhadoria
    *     Arguments   :   None
    *     Return      :   None
    *     Revision log:   V_1.0 - Created  - Prateek Bhadoria - Date - 12/07/2022
    *                       
    **/
    public CallStudent() {
        Student__c stData = new Student__c();
        stData.name = 'Rahul Sharama';
        integer i = 5;
        dataRefernce(stData);
        system.debug('Student Name is : '+stData.name);
        dataValue(i);
        system.debug('Check Increament Value : '+i);
    }

    /**   Description :   Method (call by refernce)
    *     Created By  :   Prateek Bhadoria
    *     Arguments   :   None
    *     Return      :   None
    *     Revision log:   V_1.0 - Created  - Prateek Bhadoria - Date - 12/07/2022
    *                      
    **/
    public void dataRefernce(Student__c studentdata){
        for(integer  i = 0; i<5;i++){
            studentdata.name = studentdata.name + i;
        }
    }
    /**   Description :   Method (call by value)
    *     Created By  :   Prateek Bhadoria
    *     Arguments   :   None
    *     Return      :   None
    *     Revision log:  V_1.0 - Created  - Prateek Bhadoria - Date - 12/07/2022
    *                     
    **/
    public void dataValue(integer i){

        i = 20;
        system.debug('Check Increament Value : '+i);
    }
}