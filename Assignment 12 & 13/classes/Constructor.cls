/**
* Description   - This class is being created to implement the constructor
*
* Created by    - Prateek Bhadoria
*
* Created Date  - 08/07/2022
*
* Revision log  -  V_1.0 - Created  - Prateek Bhadoria - Date-08/07/2022
*                 
*
**/
public class Constructor
{
    string Name;
    String FatherName;
    String PanNo;

    /**   Description :   Creating a Constructor
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
    Public Constructor() 
    {
        Name = 'Prakash';
        FatherName='Mr Rakesh';
        PanNo = 'EAJPB9511C';
    }

    /**   Description :   To print the data. 
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
    public void print() 
    {
        System.debug('Name on adhar card : ' +Name);
        System.debug('Father Name : ' +FatherName);
        system.debug('Adhar card number : '+PanNo);
    }
}