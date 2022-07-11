/**   Description :   Purpose to create this virtual class is to perform overriding
*
*     Created By  :   Prateek Bhadoria
*
*     Arguments   :   None
*
*     Return      :   void
*
*     Revision log:   V_1.0 - Created  - Prateek Bhadoria - Date-08/07/2022
*                     
* 
**/
public Virtual class Overriding1 {
    /**   Description :   creating a method
    *
    *     Created By  :   Prateek Bhadoria
    *
    *     Arguments   :   None
    *
    *     Return      :   void
    *
    *     Revision log:   V_1.0 - Created  - Prateek Bhadoria - Date-08/07/2022
    * 
    **/ 
    public virtual void write() {
        System.debug('Lets start overriding: ');
    }

    /**   Description :   creating a method to return double.
    *
    *     Created By  :   Prateek Bhadoria
    *
    *     Arguments   :   None
    *
    *     Return      :   Double
    *
    *     Revision log:   V_1.0 - Created  - Prateek Bhadoria - Date-08/07/2022
    *                     
    **/ 
    public virtual Double cutOff() {
        return 75.55;
    }
}