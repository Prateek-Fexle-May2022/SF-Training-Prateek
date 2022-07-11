/**
* Description   - This class is being created to implement utility class concept
*
* Created by    - Prateek Bhadoria
*
* Created Date  - 08/07/2022
*
* Revision log  -  V_1.0 - Created  - Prateek Bhadoria - Date-08/07/2022
*                 
*
**/
public class ConstantsUtility {
    static final Double pieValue = 3.14;
    static Double areaOfCircle = 0;

    /**   Description :   Creating a method
    *
    *     Created By  :   Prateek Bhadoria
    *
    *     Arguments   :   Integer
    *   
    *     Return      :   Double
    *
    *     Revision log:   V_1.0 - Created  - Prateek Bhadoria - Date-08/07/2022    
    *                 
    * 
    **/ 
    public static Double radiusOfCircle(Integer radius) {

        areaOfCircle = pieValue*radius*radius;
        return areaOfCircle;
    }
}