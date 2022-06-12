public class StudentData {
    	public StudentData(){
		
		//Insert Student Record
		Student__c s1 = new Student__c();
		s1.Name = 'ABC';
        //Insert Student Record in Teacher Layout
        Id recordTypeIdOfStudent = Schema.SObjectType.Student__c.getRecordTypeInfosByName().get('Teacher').getRecordTypeId();  
		s1.Roll_Number__c = 2345;
        s1.Address__c = 'Alwar';
        s1.Student_Email_Id__c = 'xyz@fexle.com';
        s1.Overall_Grade__c = 75;
        s1.Stream__c = 'M.Tech';
        s1.Pending_Fees_Amount__c = 100;
        insert s1;
		
        //Query 5 Students
		List<Student__c> studentList = [select id, name, Roll_Number__c from Student__c order by createdDate DESC LIMIT 5];
		for(Student__c student : studentList){
			system.debug('Chck Student Data ::: ' + student);
		}
	}

}