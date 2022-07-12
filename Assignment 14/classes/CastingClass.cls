/**
* Description   - This class is created as an example of member casting
* Created by    - Prateek Bhadoria
* Created Date  - 12/07/2022
* Revision log  -  V_1.0 - Created  - Prateek Bhadoria - Date - 12/07/2022
*                  
**/
public virtual class CastingClass {
    String productName;
    Integer price;
    void cart(){
         /**   Description :   Method
         *     Created By  :   Prateek Bhadoria
         *     Arguments   :   None
         *     Return      :   None
         *     Revision log:   V_1.0 - Created  - Prateek Bhadoria - Date - 12/07/2022
         *                       
         **/
        System.debug(productName + ' : Adding a product into the cart');
    }
     /**   Description :   Inner class extended with the parent class.
    *     Created By  :   Prateek Bhadoria
    *     Arguments   :   None
    *     Return      :   None
    *     Revision log:   V_1.0 - Created  - Prateek Bhadoria - Date - 12/07/2022
    *                       
    **/
	public class CustomerInfo extends CastingClass 
    {
        /**   Description :   Method
        *     Created By  :   Prateek Bhadoria
        *     Arguments   :   None
        *     Return      :   None
        *     Revision log:   V_1.0 - Created  - Prateek Bhadoria - Date - 12/07/2022
        *                       
        **/
        void addProduct()
        {
        	System.debug(productName + ' : adding a product');
        }
    }
    /**   Description :   Inner class main method.
    *     Created By  :   Prateek Bhadoria
    *     Arguments   :   None
    *     Return      :   None
    *     Revision log:   V_1.0 - Created  - Prateek Bhadoria - Date - 12/07/2022
    *                       
    **/
    public class Main {
         /**   Description :   Constructor
         *     Created By  :   Prateek Bhadoria
         *     Arguments   :   None
         *     Return      :   None
         *     Revision log:   V_1.0 - Created  - Prateek Bhadoria - Date - 12/07/2022
         *                       
         **/
         public  Main(){
            CastingClass product = new CustomerInfo();

            product.productName = 'Laptop';
            product.price = 45000;
            product.cart();

            CustomerInfo adInfo = (CustomerInfo)product;

            adInfo.addProduct();
        }
    }
}