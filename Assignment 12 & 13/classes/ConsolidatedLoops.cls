/**   Description :   Purpose to create this class is to implement different types of loops.
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
public class ConsolidatedLoops {
    /**   Description :   implementing for loop.
    *
    *     Created By  :   Prateek Bhadoria
    *
    *     Arguments   :   None
    *
    *     Return      :   void
    *
    *     Revision log:   V_1.0 - Created  - Prateek Bhadoria - Date-08/07/2022
    *                     
    * */
    public static void forLoopMethod(){
        for(integer i=0;i<=5;i++){
            system.debug('Loop number is : ' +i);
        }
            
    }
    /**   Description :   implementing for each loop
    *
    *     Created By  :   Prateek Bhadoria
    *
    *     Arguments   :   None
    *
    *     Return      :   void
    *
    *     Revision log:   V_1.0 - Created  - Prateek Bhadoria - Date-08/07/2022
    *                     
    * */
    public static void forEachLoop(){
        List<Contact> listOfContact = New List<Contact>();
        listOfContact = [SELECT Name FROM Contact WHERE Currentcountry__c = '' LIMIT 10];
        Integer count = 0;
        
        for(Contact cont : listOfContact){
            count++;
            cont.CurrentCountry__c = 'Amsterdam';
            system.debug('Loop Number : '+count + ', Updated Current Country :' +cont.CurrentCountry__c);
            
        }
        
        update listOfContact;
    }
    /**   Description :   implementing While loop
    *
    *     Created By  :   Prateek Bhadoria
    *
    *     Arguments   :   None
    *
    *     Return      :   void
    *
    *     Revision log:   V_1.0 - Created  - Prateek Bhadoria - Date-08/07/2022
    *                     
    * */
    Public static void whileLoopMethod(){
        Integer count=0;
        System.debug('Initial value is: '+count);

        while(count<10){
            System.debug('Loop number is : '+count);
            count++;
        }
        System.debug('Final value is: '+count);
    }

    /**   Description :   implementing Do While loop
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
    public static void doWhileMethod(){
        Integer count=0;
        System.debug('Initial value is: '+count);

        do
        {
            System.debug('Loop number is : '+count);
            count++;
        }
        while(count<5);
       		System.debug('Final value is: ' +count);
    }

    /**   Description :   implementing Control flow statements 
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
    public static void controlFlowMehtod(){
        String condidateName = 'Raghu';
        Decimal cutOff = 164.5;
        Boolean eligibleForExam = false;

        if (condidateName == 'Raghu') {
            cutOff = 168.8;
            eligibleForExam = true;
            System.debug('Condidate is eligible for the exam');
        } 

        else if (condidateName == 'Prakash') {
            cutOff = 153.8;
            eligibleForExam = false;
            System.debug('Condidate is not eligible for the exam');
        }

        else 
        {
            cutOff = 120.3;
            eligibleForExam = false;
            System.debug('Condidate is not eligible for the exam');
        }
    }

    /**   Description :   implementing nested elseif loop. 
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
    public static void nestedLoopMethod(){
        String regNo = 'PR000124';
        String productType = 'Expensive';

        if (regNo == 'PR000124') 
        {
            System.debug('Registration number is : '+regNo);

            if(productType == 'Expensive') 
            {
                System.debug('This product is expensive' );

            }
            else if(productType == 'Cheap') 
            {
                System.debug('This product is cheap');

            }
        }
        else 
        {
            System.debug('Registration number not found');
        }
    }

    /**   Description :   To perform Method overloading.
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
    public static void methodOverloading(){
        system.debug('Nothing initialize from here');
    } 

    public static void methodOverloading(Integer Area){
        system.debug('Passing interger data type : '+Area);
    } 

    public static void methodOverloading(string Shape){
        system.debug('Passing string data type: '+Shape);
    } 

    public static void methodOverloading(string Shape,integer Area){
        system.debug('After passing intiger and string data types:   '+Shape +Area);
    } 

}