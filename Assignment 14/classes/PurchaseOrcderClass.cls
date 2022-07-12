/**
* Description   - Outer Class 
* Created by    - Prateek Bhadoria
* Created Date  - 12/07/2022
* Revision log  - V_1.0 - Created  - Prateek Bhadoria - Date- 12/07/2022
*                   
**/
public class PurchaseOrcderClass{
    /**
    * Description   - Purchase Order Interface Inner Class 
    * Created by    - Prateek Bhadoria
    * Created Date  - 12/07/2022
    * Revision log  - V_1.0 - Created  - Prateek Bhadoria - Date- 12/07/2022
    *                  
    **/
    public Interface PurchaseOrder {

        Double discount();
    }    
    /**
    * Description   - Customer Purchase Order Inner Class implements the Purchase Order class
    * Created by    - Prateek Bhadoria
    * Created Date  - 12/07/2022
    * Revision log  - V_1.0 - Created  - Prateek Bhadoria - Date- 12/07/2022
    *                  
    **/
    public class CustomerPurchaseOrder implements PurchaseOrder {
        /**   Description :   Method Declared in the Customer purchase order class same as Interface Class
        *     Created By  :   Prateek Bhadoria
        *     Arguments   :   None
        *     Return      :   Double
        *     Revision log:   V_1.0 - Created  - Prateek Bhadoria - Date- 12/07/2022
        *                       
        **/
        public Double discount() {
            system.debug('Customer Purchase Order Discount ');
            return .05;  // Flat 5% discount
        }
    }
    /**
    * Description   - Employee Purchase Order Inner class implements the Purchase Order class
    * Created by    - Prateek Bhadoria
    * Created Date  - 12/07/2022
    * Revision log  - V_1.0 - Created  - Prateek Bhadoria - Date- 12/07/2022
    *                   
    **/
    public class EmployeePurchaseOrder implements PurchaseOrder {
        /**   Description :   Method Decalred in the Employee purchase order class same as Interface Class
        *     Created By  :   Prateek Bhadoria
        *     Arguments   :   None
        *     Return      :   Double
        *     Revision log:   V_1.0 - Created  - Prateek Bhadoria - Date- 12/07/2022
        *                      
        **/
        public Double discount() {
          system.debug('Employee Purchase Order Discount ');  
          return .10;  // It’s worth it being an employee! 10% discount
        } 
    }
    /**
    * Description   - Seller Purchase Order Inner class implements the Purchase Order class
    * Created by    - Prateek Bhadoria
    * Created Date  - 12/07/2022
    * Revision log  - V_1.0 - Created  - Prateek Bhadoria - Date- 12/07/2022
    *                   
    **/
    public class SellerPurchaseOrder implements PurchaseOrder {
        /**   Description :   Method Decalred in the Seller purchase order class same as Interface Class
        *     Created By  :   Prateek Bhadoria
        *     Arguments   :   None
        *     Return      :   Double
        *     Revision log:   V_1.0 - Created  - Prateek Bhadoria - Date- 12/07/2022
        *                      
        **/
        public Double discount() {
          system.debug('Seller Purchase Order Discount ');  
          return .20;  // It’s worth it being an Seller! 20% discount
        } 
    }
    /**
    * Description   - Process Purchase Order Inner Class
    * Created By  :   Prateek Bhadoria
    * Created Date  - 12/07/2022
    * Revision log  - V_1.0 - Created  - Prateek Bhadoria - Date- 12/07/2022
    *                  
    **/
    public class ProcessPurchaseOrder{
        /**   Description :   Constructor print the statement 
        *     Created By  :   Prateek Bhadoria
        *     Arguments   :   None
        *     Return      :   None
        *     Revision log:   V_1.0 - Created  - Prateek Bhadoria - Date- 12/07/2022
        *                     
        **/
        public processPurchaseOrder(){
            PurchaseOrder firstOrder = new CustomerPurchaseOrder();
            firstOrder.discount();
            processOrder(firstOrder);

            PurchaseOrder secondOrder = new EmployeePurchaseOrder();
            secondOrder.discount();
            processOrder(secondOrder);
            
            PurchaseOrder thirdOrder = new SellerPurchaseOrder();
            thirdOrder.discount();
            processOrder(thirdOrder);
        }
        /**   Description :   Method print the statement 
        *     Created By  :   Prateek Bhadoria
        *     Arguments   :   PurchaseOrder
        *     Return      :   None
        *     Revision log:   V_1.0 - Created  - Prateek Bhadoria - Date- 12/07/2022 
        *                      
        **/
        public void processOrder(PurchaseOrder order){
            system.debug('Check Discount :' +order.discount());
        }
        // that's the way to execute - 
        //Order.ProcessPurchaseOrder oc = new Order.ProcessPurchaseOrder();
    } 
}