/**
* Description   - Outer Class  
* Created by    - Prateek Bhadoria
* Created Date  - 12/07/2022
* Revision log  -  V_1.0 - Created  - Prateek Bhadoria - Date - 12/07/2022
*                   
**/
public class GameLevelClass{
 	/**
    * Description   - Inner Class  
    * Created by    - Prateek Bhadoria
    * Created Date  - 12/07/2022
    * Revision log  -  V_1.0 - Created  - Prateek Bhadoria - Date - 12/07/2022
    *                   
    **/   
	public interface GameLevel 
	{ 
    	void levelNumber(); 
    	void environment();
	}
    /**
    * Description   - Level_Underground implemented the GameLevel class  
    * Created by    - Prateek Bhadoria
    * Created Date  - 12/07/2022
    * Revision log  -  V_1.0 - Created  - Prateek Bhadoria - Date - 12/07/2022
    *                   
    **/
	public class Level_Underground implements GameLevel 
	{
    	/**   Description :   Method
        *
        *     Created By  :   Prateek Bhadoria
        *
        *     Return      :   Void
        *
        *     Revision log:   V_1.0 - Created  - Your name - Prateek Bhadoria, Date- 12/07/2022
        * 
        **/
    	public void levelNumber()
    	{ 
        	System.debug('Level 1'); 
    	}
    	/**   Description :   Method
        *
        *     Created By  :   Prateek Bhadoria
        *
        *     Return      :   Void
        *
        *     Revision log:   V_1.0 - Created  - Your name - Prateek Bhadoria, Date- 12/07/2022
        * 
        **/
    	public void environment()
    	{ 
        	System.debug('This level will be played Underground'); 
    	} 
	} 
	/**
    * Description   - Level_UnderWater implemented the GameLevel class  
    * Created by    - Prateek Bhadoria
    * Created Date  - 12/07/2022
    * Revision log  -  V_1.0 - Created  - Prateek Bhadoria - Date - 12/07/2022
    *                   
    **/ 
	public class Level_UnderWater implements GameLevel 
	{
    	/**   Description :   Method
        *
        *     Created By  :   Prateek Bhadoria
        *
        *     Return      :   Void
        *
        *     Revision log:   V_1.0 - Created  - Your name - Prateek Bhadoria, Date- 12/07/2022
        * 
        **/
    	public void levelNumber()
    	{ 
        	System.debug('Level 2'); 
    	}
    	/**   Description :   Method
        *
        *     Created By  :   Prateek Bhadoria
        *
        *     Return      :   Void
        *
        *     Revision log:   V_1.0 - Created  - Your name - Prateek Bhadoria, Date- 12/07/2022
        * 
        **/
    	public void environment()
    	{ 
       		System.debug('This level will be played Under Water'); 
    	} 
	}
}