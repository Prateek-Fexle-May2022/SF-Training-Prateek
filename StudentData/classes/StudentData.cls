/**
* Description   - This is a class of student record of college for teacher and registrar.
*
* Created by    - Prateek Bhadoria
*
* Created Date  - 08/06/2022
*
* Revision log  -  V_1.0 - Created  - Youe name -Prateek Bhadoria, Date- 15/10/2022
*
**/
public class StudentData {
   
    /**   Description :   To insert student's records
    *
    *     Created By  :   Prateek Bhadoria
    *
    *     Arguments   :   
    *
    *     Return      :   Void
    *
    *     Revision log:   V_1.0 - Created  - Youe name - Prateek Bhadoria, Date- 15/10/2022
    * 
    **/
    public StudentData(){
        
        //Insert Student Record
        Student__c s1 = new Student__c();
        s1.Name = 'ABC';
        //Insert Student Record in Teacher Layout
        Id recordTypeIdOfStudent = Schema.SObjectType.Student__c.getRecordTypeInfosByName().get('Teacher').getRecordTypeId();
        s1.RecordTypeId = recordTypeIdOfStudent;
        s1.Roll_Number__c = 2345;
        s1.Address__c = 'Alwar';
        s1.Student_Email_Id__c = 'xyz@fexle.com';
        s1.Overall_Grade__c = 75;
        s1.Stream__c = 'M.Tech';
        s1.Pending_Fees_Amount__c = 100;
        insert s1;
        
        //Query 5 Students
        for(Student__c student : [select id, name, Roll_Number__c from Student__c order by createdDate DESC LIMIT 5])
            system.debug('Check Student Data ::: ' + student);
    }
}