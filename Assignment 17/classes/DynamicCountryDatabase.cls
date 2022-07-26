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
    public DynamicCountryDatabase(String startingKeyWord, String countryName) {
        
        List<String> combiList = new List<String>();
        
        //SOQL Parent(Country) to child(State) and child(District) to Parent(State) 
        List<State__c>  stList = [SELECT Name, State_Code__c, State_s_Country__c, 
                                  Country_Name__r.Name, Country_Name__r.Country_Code__c, 
                                  (SELECT Name, District_Code__c, State_Name__r.Name 
                                  FROM Districts__r) 
                                  FROM State__c];
        for(State__c state :stList) {
            if(!contMap.containsKey(state.Country_Name__r.Name)){
            	contMap.put(state.Country_Name__r.Name,new Map<String, List<String>>());
            }
            Map<String ,List<String>> stMap = contMap.get(state.Country_Name__r.Name);
            stMap.put(state.Name, new List<String>());
            for(District__c district : state.Districts__r){
                stMap.get(district.State_Name__r.Name).add(district.Name);
                
                if(state.Country_Name__r.Name.startsWith(startingKeyWord) && state.Name.startswith(startingKeyWord) 
                   && district.Name.startsWith(startingKeyWord) )
                {
                    combiList.add(state.Country_Name__r.Name+', '+state.Name+ ', '+district.Name);
                }
            }
            contMap.put(state.Country_Name__r.Name, stMap);
            
        }
    	if(!combiList.isEmpty()){
        	System.debug('Country, State and District in Combination : '+combiList);
        }
        for(String str : contMap.keySet()){
            system.debug(str+'===========>'+contMap.get(str));	    
        }
        
        
        aggregateQurey();
        countryDatabase(countryName);
    }
    
    /**   Description :  Aggregate query method to rollup total number of states and districts. 
    *     Created By  :   Prateek Bhadoria
    *     Arguments   :   Integer
    *     Return      :   void
    *     Revision log:   V_1.0 - Created  - Prateek Bhadoria - 21/07/2022
    *                     
    **/
    public static void aggregateQurey(){
        
        Map<Id,State__c> updateStMap=new Map<Id,State__c>();
        
        AggregateResult[] stAggregate = [SELECT Count(Name) totalDist, State_Name__c 
                                         FROM District__c
                                         GROUP BY State_Name__c];
        for(AggregateResult aggresult : stAggregate) {
            updateStMap.put((Id)aggresult.get('State_Name__c'), new State__c(Id = (Id)aggresult.get('State_Name__c'), 
            Total_Number_of_Districts__c = (Integer)aggresult.get('totalDist')));
        }
        if(!updateStMap.isEmpty()){
            update updateStMap.values();
        }
        
        Map<Id,Country__c> updateContMap=new Map<Id,Country__c>();

        AggregateResult[] aggDistAndSt = [SELECT Count(Name) totalSt, SUM(Total_Number_of_Districts__c) totalDistrict,Country_Name__c  
                                                       FROM State__c
                                                       GROUP BY Country_Name__c];
        
        for(AggregateResult agresult : aggDistAndSt) {
                updateContMap.put((Id)agresult.get('Country_Name__c'),new Country__c(Id=(Id)agresult.get('Country_Name__c'),
                Total_Number_of_States__c = (Decimal)agresult.get('totalSt'),
                Total_Number_of_Districts__c=(Decimal)agresult.get('totalDistrict')));
            }  
        
        if(!updateContMap.isEmpty()){
            update updateContMap.values();   
        }
    }
    /**   Description :   Method to fill the JSON Data.
    *     Created By  :   Prateek Bhadoria
    *     Arguments   :   String
    *     Return      :   void
    *     Revision log:   V_1.0 - Created  - Prateek Bhadoria - 21/07/2022
    *                      
    **/    
    public static void countryDatabase(String countryName){ 
        
        List<State__c> stateList = [SELECT Id, Name, Country_Name__r.Country_Code__c,
                                     country_Name__r.Name,country_Name__r.Total_Number_of_States__c,
                                     Country_Name__r.Total_Number_of_Districts__c
                                     FROM State__c 
                                     WHERE Country_Name__r.Name = :countryName];
        
        if(!stateList.isEmpty()){
            Country wrapCountry = new Country();
            wrapCountry.countryName = stateList[0].Country_Name__r.Name;
            wrapCountry.countryCode = stateList[0].Country_Name__r.Country_Code__c;
            wrapCountry.totalStates = stateList[0].Country_Name__r.Total_Number_of_States__c;
            wrapCountry.totalDistricts = stateList[0].Country_Name__r.Total_Number_of_Districts__c;
            wrapCountry.states = new List<State>();
            for(State__c st : stateList){
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
        stateList[0].country_Name__r.Country_JSON_Data__c = JSONDatabase;
        
       Country__c  countryData = new Country__c();
            countryData.Id =  stateList[0].Country_Name__r.Id;
            countryData.Country_JSON_Data__c = JSONDatabase;
            update countryData;

            // Create URL for Records on UI.
            String userInterfaceLink = URL.getSalesforceBaseUrl().toExternalForm()+'/'+countryData.Id;
            System.debug(userInterfaceLink);
        
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