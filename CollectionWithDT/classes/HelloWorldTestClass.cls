/**
* Description   - This is a test class. 
*
* Created by    - Prateek Bhadoria
*
* Created Date  - 05/07/2022
*
* Revision log  -  V_1.0 - Created  - Your name -Prateek Bhadoria, Date- 05/07/2022
*
**/
@isTest 
private class HelloWorldTestClass {
    /**   Description :  Test that the trigger correctly updated the price.
    *
    *     Created By   :  Prateek Bhadoria
    *
    *     Return       :  Void
    *
    *     Revision log :  V_1.0 - Created  - Your name - Prateek Bhadoria, Date- 05/07/2022
    * 
    **/
    static testMethod void validateHelloWorld() {
       Book__c b = new Book__c(Name='Behind the Cloud', Price__c=100);
       System.debug('Price before inserting new book: ' + b.Price__c);

       insert b;
    
       b = [SELECT Price__c FROM Book__c WHERE Id =:b.Id];
       System.debug('Price after trigger fired: ' + b.Price__c);

       // Test that the trigger correctly updated the price
       System.assertEquals(90, b.Price__c);
    }
}