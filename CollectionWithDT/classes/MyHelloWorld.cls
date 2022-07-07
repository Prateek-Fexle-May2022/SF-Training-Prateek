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
public class MyHelloWorld
{
    /**   Description :  To apply discount in the book object.
    *
    *     Created By   :  Prateek Bhadoria
    *
    *     Return       :  Void
    *
    *     Revision log :  V_1.0 - Created  - Your name - Prateek Bhadoria, Date- 05/07/2022
    * 
    **/
    public static void applyDiscount(Book__c[] books) {
    for (Book__c b :books)
    {
        b.Price__c *= 0.9;
   }
}
}