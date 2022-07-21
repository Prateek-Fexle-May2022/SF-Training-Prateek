/**
* Description   - Dynamic Map of Country which is in master detail relationship with states and district.   
* Created by    - Prateek Bhadoria
* Created Date  - 21/07/2022
* Revision log  -  V_1.0 - Created  - Prateek Bhadoria - 21/07/2022
**/
public with sharing class DynamicCountryDatabase {
    Static String JSONDatabase;

    Static Map<String, Map<String, List<String>>> contMap =  new  Map<String, Map<String, List<String>>>(); // Nested Country Map
    
    Static Map<String ,List<String>> stMap = new Map<String ,List<String>>(); // State Map
    
    /**   Description :  Constructor which used to query the map and print the data of given startingkeyword.
    *     Created By  :   Prateek Bhadoria
    *     Arguments   :   String,String,String
    *     Return      :   void
    *     Revision log:   V_1.0 - Created  - Prateek Bhadoria - 21/07/2022
    *                      
    **/
    public DynamicCountryDatabase(String startingKeyWord,String countryName) {
        
        //SOQL Parent(Country) to child(State) and child(District) to Parent(State) 
        List<State__c>  stList = [SELECT Name, State_Code__c, State_s_Country__c, 
                                  Country_Name__r.Name, Country_Name__r.Country_Code__c, 
                                  (SELECT Name, District_Code__c, State_Name__r.Name 
                                  FROM Districts__r) 
                                  FROM State__c
                                  WHERE country_Name__r.Name = :countryName];
        for(State__c state :stList) {
            
            // Country Record Link of Salesforce UI
            String recordUrl = URL.getSalesforceBaseUrl().toExternalForm() + '/' + state.Country_Name__r.Id;
            system.debug('Link of Country record is => ' +recordUrl);
            
            if(contMap.size() == 0){
                contMap.put(state.Country_Name__r.Name,new Map<String, List<String>>());
            }
            stMap.put(state.Name, new List<String>());
            for(District__c district : state.Districts__r){
                stMap.get(district.State_Name__r.Name).add(district.Name);
            }
            
        }
        contMap.get(stList[0].Country_Name__r.Name).putAll(stMap);
        
        List<String> combiList = new List<String>();
        for(String contName : contMap.keySet()){
            for(String stName : contMap.get(contName).keySet()){
                for(String distName : contMap.get(contName).get(stName) ){
                    if(contName.startsWith(startingKeyWord) && stName.startswith(startingKeyWord)
                       && distName.startsWith(startingKeyWord) ){
                           combiList.add(contName+', '+stName+ ', '+distName);
                    }
                }  	  
            }
        }
        if(!combiList.isEmpty()){
            System.debug('Country, State and District in Combination : '+combiList);
        }
        aggregateQurey();
        countryJsonDatabase(countryName);
    }
    
    /**   Description :  Aggregate query method to rollup total number of states and districts. 
    *     Created By  :   Prateek Bhadoria
    *     Arguments   :   Integer
    *     Return      :   void
    *     Revision log:   V_1.0 - Created  - Prateek Bhadoria - 21/07/2022
    *                     
    **/
    public static void aggregateQurey(){
        
        Map<Id,State__c> stMap=new Map<Id,State__c>();
        AggregateResult[] stAggregate = [SELECT Count(Name) totalDist, State_Name__c 
                                         FROM District__c
                                         GROUP BY State_Name__c];
        for(AggregateResult aggresult : stAggregate) {
            stMap.put((Id)aggresult.get('State_Name__c'), new State__c(Id = (Id)aggresult.get('State_Name__c'), 
            Total_Number_of_Districts__c = (Integer)aggresult.get('totalDist')));
        }
        if(!stMap.isEmpty()){
            update stMap.values();
        }
        
        Map<Id,Country__c> contMap=new Map<Id,Country__c>();
        AggregateResult[] districtAggregateForState = [SELECT Count(Name) totalSt, SUM(Total_Number_of_Districts__c),Country_Name__c 
                                                       FROM State__c
                                                       GROUP BY Country_Name__c];
        for(AggregateResult aggresult : districtAggregateForState) {
            Country__c country = new Country__c();
            Country.Id = (Id)aggresult.get('Country_Name__c');
            Country.Total_Number_of_States__c = (Integer)aggresult.get('totalSt');
            contMap.put(country.Id,country);
        }
        if(!contMap.isEmpty()){
            update contMap.values();   
        }
    }
    /**   Description :   Method to fill the JSON Data.
    *     Created By  :   Prateek Bhadoria
    *     Arguments   :   String
    *     Return      :   void
    *     Revision log:   V_1.0 - Created  - Prateek Bhadoria - 21/07/2022
    *                      
    **/    
    public static void countryJsonDatabase(String countryName){ 
        
        List<State__c> stJsonList = [SELECT Id, Name, Country_Name__r.Country_Code__c,
                                     country_Name__r.Name,country_Name__r.Total_Number_of_States__c,
                                     Total_Number_of_Districts__c
                                     FROM State__c 
                                     WHERE Country_Name__r.Name = :countryName];
        
        if(!stJsonList.isEmpty()){
            Country wrapCountry = new Country();
            wrapCountry.countryName = stJsonList[0].Country_Name__r.Name;
            wrapCountry.countryCode = stJsonList[0].Country_Name__r.Country_Code__c;
            wrapCountry.totalStates = stJsonList[0].Country_Name__r.Total_Number_of_States__c;
            wrapCountry.totalDistricts = stJsonList[0].Total_Number_of_Districts__c;
            wrapCountry.states = new List<State>();
            for(State__c st : stJsonList){
                State wrapState = new State();
                wrapState.stateName = st.Name;
                wrapState.districts = new List<District>();
                if(contMap.containsKey(countryName)&& contMap.get(countryName).containsKey(st.name)){
                    for(String dist: contMap.get(countryName).get(st.Name)){
                        District wrapDistrict = new District();
                        wrapDistrict.districtName = dist;
                        wrapState.districts.add(wrapDistrict);
                    }
                }
                wrapCountry.states.add(wrapState);
            }
            JSONDatabase = JSON.serialize(wrapCountry);
            System.debug('===>>>'+JSONDatabase);   
        }
        stJsonList[0].country_Name__r.Country_JSON_Data__c = JSONDatabase;
        
        // update the data in 'Country_JSON_Data__c' field into the country object
        List<Country__c> contList = [SELECT Id,Name,Country_JSON_Data__c 
                                     FROM Country__c 
                                     WHERE Name = :countryName];
        contList[0].Country_JSON_Data__c = JSONDatabase ;
        
        update contList;
        
    }
    //Wrapper Classes
    
    public class CountryData{
        public List<Country> country{get; set;}
    }
    public class Country {
        public String countryName{get; set;}
        public String countryCode{get; set;}
        public Decimal totalStates{get; set;}
        public Decimal totalDistricts{get; set;}
        public List<State> states{get; set;}
    }
    public class State {
        public String stateName{get; set;}
        public List<District> districts{get; set;}
    }
    public class District {
        public String districtName{get; set;}
    } 
}