/**
* Description   - Use of Super Keyword 
* Created by    - Prateek Bhadoria
* Created Date  - 12/07/2022
* Revision log  -  V_1.0 - Created  - Prateek Bhadoria - Date - 12/07/2022
*                   
**/
public virtual class SuperClass
{
    integer num = 100;
	/**
	* Description   - SubClass extends the SuperClass 
	* Created by    - Prateek Bhadoria
	* Created Date  - 12/07/2022
	* Revision log  -  V_1.0 - Created  - Prateek Bhadoria - Date - 12/07/2022
	*                   
	**/
	public class SubClass extends SuperClass
	{
    	integer num = 110;
    	void printNumber()
    	{
        	system.debug('Parent class number is : ' +super.num);
    	}
        /**   Description :   To Print
    	*     Created By  :   Prateek Bhadoria
    	*     Arguments   :   None
   	 	*     Return      :   None
    	*     Revision log:   V_1.0 - Created  - Prateek Bhadoria - Date - 12/07/2022
    	*                       
    	**/
    	public void printMethod() {
        	SubClass obj = New SubClass();
        	obj.printNumber();
   	 	}
	}
}