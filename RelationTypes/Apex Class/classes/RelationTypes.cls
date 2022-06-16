/**
                    * Description   - This is a class of all relation types i.e. one to one,one to many, many to many, self relation and Hierarchical relations by using lookup and master-detail fields.
                    *
                    * Created by    - Prateek Bhadoria
                    *
                    * Created Date  - 15/06/2022
                    *
                    * Revision log  -  V_1.0 - Created  - Your name -Prateek Bhadoria, Date- 15/06/2022
                    *
                    **/
                    public class RelationTypes {
                    /**   Description :   To insert Pancard, One to One Realtionship(Lookup Relatioship)
                    *
                    *     Created By  :   Prateek Bhadoria
                    *
                    *     Arguments   :   
                    *
                    *     Return      :   Void
                    *
                    *     Revision log:   V_1.0 - Created  - Your name - Prateek Bhadoria, Date- 15/06/2022
                    * 
                    **/
                    public static void insertPanCard(){
                    Pan_Card__c pancard = new Pan_Card__c();
                    pancard.Name = 'Prateek Bhadoria';
                    pancard.Pan_Number__c = 'EAJPB9511C';
                    pancard.Father_Name__c = 'Vimlesh Singh Bhadoria';
                    
                    insert pancard;
                    system.debug('Inserted PanCard Data :' + pancard.id);
                    
                     //Weak Realtionship
                    //Year of Class Info
                    Year_Of_Class__c yearofclass = new Year_Of_Class__c();
                    yearofclass.Name = '3rd Year';
                    
                    insert yearofclass;
                    system.debug('Inserted Year Of Class  :' + yearofclass.id);
                    
                    // ContactInfo
                    Contact contact = new Contact();
                    contact.Pan_Card__c = pancard.Id;
                    contact.FirstName = 'Prateek';
                    contact.LastName = 'Bhadoria';
                    contact.MobilePhone = '9588977678';
                    contact.Languages__c = 'English';
                    contact.Year_of_Class__c = yearofclass.Id;
                   
                    insert contact;
                    system.debug('Inserted Contact Data :' + contact.id);
                    
                    }
                    /**   Description :   To insert College info, one to many (Strong relationship)
                    *
                    *     Created By  :   Prateek Bhadoria
                    *
                    *     Arguments   :   
                    *
                    *     Return      :   Void
                    *
                    *     Revision log:   V_1.0 - Created  - Your name - Prateek Bhadoria, Date- 15/06/2022
                    * 
                    **/
                    public static void insertCollegeInfo(){
                    College__c college = new College__c();
                    college.Name = 'Jagannath Gupta Institute of Engineering and Technology';
                    
                    insert college;
                    system.debug('Inserted  College Info :' + college.id);
                    
                    //Teacher Info
                    Teacher__c teacher = new Teacher__c();
                    teacher.Name = 'Y C Bhatt';
                    teacher.College__c = college.Id;
                    
                    insert teacher;
                    system.debug('Inserted Teacher Info :' + teacher.id);
                   
                    //Student Info
                    Student__c student = new Student__c();
                    student.Name = 'Prateek Bhadoria';
                    
                    insert student;
                    system.debug('Inserted Student Info  :' + student.id);
                   
                    //Many to Many Realtionship
                    //Subject Info
                    Subject__c subject = new Subject__c();
                    subject.Name = 'Physics';
                    
                    insert subject;
                    system.debug('Inseted Subject Info :' + subject.id);
                    
                    //StudentSubjects Info 
                    StudentSubject__c stusubs = new StudentSubject__c();
                    stusubs.Name = 'PHY007';
                    stusubs.Student__c = student.Id;
                    stusubs.Subject__c = subject.Id;
                    
                    insert stusubs;
                    system.debug('Inseted StudentSubjects Info :' + stusubs.id);
                    }
                    /**   Description :   To insert Hierarchical data
                    *
                    *     Created By  :   Prateek Bhadoria
                    *
                    *     Arguments   :   
                    *
                    *     Return      :   Void
                    *
                    *     Revision log:   V_1.0 - Created  - Your name - Prateek Bhadoria, Date- 15/06/2022
                    * 
                    **/
                    public static void insertHierarchical(){    
                    //Account Hierarchy RelationType
                    //Employees Info
                    
                    Contact contact = [SELECT Id FROM Contact WHERE Name Like 'Prateek Bhadoria' Limit 1];
                    Account accId = [SELECT Id,ParentId FROM Account WHERE Name Like 'General Electric New York US' LIMIT 1];
                    Employee__c employee = [SELECT Mentor__c,Trainer__c FROM Employee__c WHERE Name LIKE 'Sushil Choudhary' LIMIT 1];
                    
                    Employee__c empl = new Employee__c();
                    empl.Name = 'Sagar Nirwal';
                    empl.Mentor__c = employee.Id ;
                    empl.Trainer__c = employee.Mentor__c ;
                    
                    insert empl;
                    system.debug('Inserted Employees Info :' + empl.id);
                    
                    //Account Info
                    
                    Account account = new Account();
                    account.Name = 'GE India';
                    account.ParentId = accId.ParentId;
                        
                    insert account;
                    system.debug('Inseted Employees Info :' + account.id);
                    
                    //Leads Info
                    Lead lead = new Lead();
                    lead.FirstName = 'Prateek';
                    lead.LastName = 'Bhadoria';
                    lead.Company = 'Fexle Services Private Limited';
                    lead.LeadSource = 'Phone';
                    lead.Industry = 'IT Industry';
                    lead.AnnualRevenue = 1000000;
                    lead.Phone = '+919588977678';
                    lead.Email = 'prateek.bhadoria@fexle.com';
                    lead.Status = 'Working - Contacted';
                    lead.Rating = 'Warm';
                    
                    insert lead;
                    system.debug('Inseted Lead Info :' + lead.id);
                    
                    //One Contact Headquarter account Update
                    Contact con = new Contact();
                    con.Id = contact.Id;
                    con.AccountId = accId.Id;
                    
                    update con;
                    system.debug('Update Contact :' + con.id);      
                }   
            
            }