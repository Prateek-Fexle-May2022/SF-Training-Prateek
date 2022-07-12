/**
* Description   - This class is created as an example of Instanceof Keyword.
* Created by    - Prateek Bhadoria
* Created Date  - 12/07/2022
* Revision log  -  V_1.0 - Created  - Prateek Bhadoria - Date - 12/07/2022
*                  
**/
public virtual class InstanceOfKeyWord {
    /**   Description :   Inner(Child) class extended with parent class.
    *
    *     Created By  :   Prateek Bhadoria
    *
    *     Return      :   Void
    *
    *     Revision log:   V_1.0 - Created  - Your name - Prateek Bhadoria, Date- 12/07/2022
    * 
    **/
    public virtual class Book extends InstanceOfKeyWord {
        /**   Description :   Method
        *
        *     Created By  :   Prateek Bhadoria
        *
        *     Return      :   Void
        *
        *     Revision log:   V_1.0 - Created  - Your name - Prateek Bhadoria, Date- 12/07/2022
        * 
        **/
        public void instOf(InstanceOfKeyWord education) {  
            if(education instanceof Book){  
                Book physics = (Book)education; 
                system.debug('downcasting');  
            }else {
                system.debug('Upcasting');
            }
        }
    }
}