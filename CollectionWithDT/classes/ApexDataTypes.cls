/**
* Description   - This is a class of all types of primitive data types. 
*
* Created by    - Prateek Bhadoria
*
* Created Date  - 05/07/2022
*
* Revision log  -  V_1.0 - Created  - Your name -Prateek Bhadoria, Date- 05/07/2022
*
**/
public with sharing class ApexDataTypes {
    /**   Description :   To save a fee receipt of a student.
    *
    *     Created By  :   Prateek Bhadoria
    *
    *     Return      :   Void
    *
    *     Revision log:   V_1.0 - Created  - Your name - Prateek Bhadoria, Date- 05/07/2022
    * 
    **/
    public static void feeReceipt() 
    {
        String tStr = 'Prateek Bhadoria';  
        Blob myBlob = blob.valueOf(tStr);  
        String dStr = myBlob.toString();  
        System.debug('Student Name : ' + dStr);

        Boolean isEligible = true;  
        System.debug('Student is Eligible : ' + isEligible);

        Date todate = date.today();  
        System.debug('ToDate is : ' + todate);

        Datetime fixdatetime = Datetime.now();  
        System.debug('fixdatetime is : ' + fixdatetime);  

        Decimal feeamount = 35230.70;  
        System.debug('FeeAmount is : ' + feeamount.abs());

        Double GST = 6341.52;  
        System.debug('GST is : ' + GST);

        ID studentid = '00400002453MKSBB01';  
        System.debug('Student receipt id is : ' + studentid);

        Integer Marks = 95;  
        System.debug('Marks is : ' + Marks); 

        Long RegNo = 52412548711L;  
        System.debug('RegNo is : ' + RegNo); 

        String text = 'Jagannath Gupta Engineering & Technology';  
        System.debug('College name is : ' + text); 

        DateTime dt = Datetime.now();  
        Time myTime = Time.newInstance(dt.hour(), dt.minute(), dt.second(), dt.millisecond());  
        System.debug('Time is : ' + myTime); 

    }
}