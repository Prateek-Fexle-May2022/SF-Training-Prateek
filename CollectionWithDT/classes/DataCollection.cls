/**
* Description   - This is a class of collection by using various types of data types. 
*
* Created by    - Prateek Bhadoria
*
* Created Date  - 07/07/2022
*
* Revision log  -  V_1.0 - Created  - Your name -Prateek Bhadoria, Date- 07/07/2022
*
**/
public with sharing class DataCollection 
{
    /**   Description :   This Mehtod is created to use List and Set with string and Sobject data type.
    *
    *     Created By  :   Prateek Bhadoria
    *
    *     Return      :   Void
    *
    *     Revision log:   V_1.0 - Created  - Your name - Prateek Bhadoria, Date- 07/07/2022
    * 
    **/
    public static void stringCollection() 
    {
        List<String> strList1 = New List<String>();
        List<String> strList2 = New List<String>();
        List<Account> accList = New List<Account>();
        Set<String> strSet = New Set<String>();
        Boolean country;
        Sobject cont = [SELECT Name from Contact Limit 1];

        strList1.add('India');
        strList1.add('Bangladesh');
        strList1.add('Japan');
        strList1.add(1,'Russia');

        strList2.add('Germany');
        strList2.addAll(strList1);

        strSet.add('Spain');
        strList2.addAll(strSet);

        System.debug('List 1 is : '+strList1);
        System.debug('3rd Country in the index of list 1 is : '+strList1.get(3));
        System.debug('List 2 is : '+strList2);
        System.debug('Object type is : '+ cont.getSObjectType());
        system.debug(strList1.indexOf('Japan'));

        country = strList1.equals(strList2);
        System.debug('List 1 Euals to List 2? :' + country);

        country = strList1.contains('India');
        System.debug('Is List 1 Contains India? :' +country);

        strList1.clear();
        System.debug('Lets clear the list 1 : '+strList1);
        System.debug(strList1.isEmpty());

        strList1 = strList2.clone();
        System.debug('List 1 after clone with list 2 : '+ strList1);
        System.debug(strList1.isEmpty());
        System.debug(strList1.size());
        
        strList1.sort();
        system.debug(strList1);
        
        accList = [SELECT Id, Name from Account Limit 3];
        system.debug('Account list is : ' + accList);

    }
    /**   Description :   This Mehtod is created to use List and Set with integer data type.
    *
    *     Created By  :   Prateek Bhadoria
    *
    *     Return      :   Void
    *
    *     Revision log:   V_1.0 - Created  - Your name - Prateek Bhadoria, Date- 07/07/2022
    * 
    **/
    public static void integerCollection()
    {
        List<Integer> oddList = New List<Integer>{1,3,5,7,9};
        List<Integer> evenList = New List<Integer>{2,4,6,8,10};
        Set<Integer> primeSet = New Set<Integer>{1,2,3,5,7,11};
        Boolean num;

        primeSet.add(17);
        oddList.addAll(primeSet);

        System.debug('Odd number list is : ' + oddList);
        System.debug('3rd number of odd list is : ' + oddList.get(3));
        System.debug('Even number list is : ' + evenList);
        system.debug(oddList.indexOf(5));

        num = oddList.equals(evenList);
        System.debug('Odd List Euals to Even List? :' + num);

        num = oddList.contains(9);
        System.debug('Is odd List Contains 9? :' + num);

        oddList.clear();
        System.debug('Lets clear the odd list : ' + oddList);
        System.debug(oddList.isEmpty());

        oddList = evenList.clone();
        System.debug('Odd List after clone with even list : '+ oddList);
        System.debug(oddList.isEmpty());
        System.debug(oddList.size());
        
        oddList.sort();
        system.debug(oddList);
        
    }
    /**   Description :   This Mehtod is created to use List and Set with Decimal data type.
    *
    *     Created By  :   Prateek Bhadoria
    *
    *     Return      :   Void
    *
    *     Revision log:   V_1.0 - Created  - Your name - Prateek Bhadoria, Date- 07/07/2022
    * 
    **/
    public static void decimalCollection()
    {
        List<Decimal> decList1 = New List<Decimal>{1.5,3.4,5.9};
        List<Decimal> decList2 = New List<Decimal>{2.05,3.55,8.56};
        Set<Decimal> decSet = New Set<Decimal>{25.2,45.55,89.26};
        Boolean dec;

        decSet.add(3.14);
        decList1.addAll(decSet);

        System.debug('Decimal number list 1 is : ' + decList1);
        System.debug('3rd number of decimal list1 is : ' + decList1.get(3));
        System.debug('Decimal number list 2 is : ' + decList2);
        system.debug(decList1.indexOf(5.9));

        dec = decList1.equals(decList2);
        System.debug('List1 Euals to List2 ? :' + dec);

        dec = decList1.contains(3.4);
        System.debug('Is List1 Contains 9? :' + dec);

        decList1.clear();
        System.debug('Lets clear the list 1 : ' + decList1);
        System.debug(decList1.isEmpty());

        decList1 = decList2.clone();
        System.debug('List1 after clone with list2 : '+ decList1);
        System.debug(decList1.isEmpty());
        System.debug(decList1.size());
        
        decList1.sort();
        system.debug(decList1);
        
    }
    /**   Description :   This Mehtod is created to use Map with integer & string data type.
    *
    *     Created By  :   Prateek Bhadoria
    *
    *     Return      :   Void
    *
    *     Revision log:   V_1.0 - Created  - Your name - Prateek Bhadoria, Date- 07/07/2022
    * 
    **/
    public static void mapMethod()
    {
        Map<Integer,String> iccRanking = New Map<Integer,String>();
        Map<String,String> teamCaptain = New Map<String,String>();
        
        iccRanking.put(1,'India');
        iccRanking.put(2,'England');
        iccRanking.put(3,'Pakistan');
        iccRanking.put(4,'SouthAfrica');
        iccRanking.put(5,'Australia');
        
        teamCaptain.put('India','Virat');
        teamCaptain.put('England','Root');
        teamCaptain.put('Pakistan','Babar');
        teamCaptain.put('SouthAfrica','Bavuma');
        teamCaptain.put('Australia','Finch');
        
        system.debug('Top 5 T20 ICC ranking teams are :' + iccRanking);
        system.debug('Captains of these top 5 are : ' + teamCaptain);
        system.debug('Size of the map is :' + iccRanking.size());
        system.debug('Check that key 3 is contains or not? :' + iccRanking.containsKey(3));
        system.debug('Check the value of key 1 is :' + iccRanking.get(1));
        
        iccRanking.remove(3);
        system.debug('Result after removing key value 3 is :' + iccRanking);
        system.debug('List of remaining teams :' + iccRanking.values());
        system.debug('Team list as keyset : ' + teamCaptain.keyset());
        system.debug('Check thatkey 3 is contains or not? :' + iccRanking.containsKey(3));
        
        teamCaptain.clear();
        system.debug('Lets clear the map of teamcaptain : ' + teamCaptain);
        system.debug('Lets Check whether map is empty or not? : ' + teamCaptain.isEmpty());
        
        Map<Id,Account> accIdMap = New Map<Id,Account>([SELECT Id, Name From Account Limit 2]);
        system.debug('Id and name from account abject : ' + accIdMap);

    }
}