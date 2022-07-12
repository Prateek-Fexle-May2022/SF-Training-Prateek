/**
* Description   - Use of This Keyword 
* Created by    - Prateek Bhadoria
* Created Date  - 12/07/2022
* Revision log  -  V_1.0 - Created  - Prateek Bhadoria - Date - 12/07/2022
*                   
**/
public class ThisKeyWords
{
    String str  = 'Use This Keyword';
    /**   Description :   Method
    *
    *     Created By  :   Prateek Bhadoria
    *
    *     Return      :   Void
    *
    *     Revision log:   V_1.0 - Created  - Your name - Prateek Bhadoria, Date- 12/07/2022
    * 
    **/
    public void strMethod(String str)
    {
        System.debug('Parameter Value : '+str);
        System.debug('Current Instance Value :'+this.str);
    }
   
}