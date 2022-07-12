/**
* Description   - Country Map  
* Created by    - Prateek Bhadoria
* Created Date  - 12/07/2022
* Revision log  -  V_1.0 - Created  - Prateek Bhadoria - Date - 12/07/2022
*                   
**/
public with sharing class CountryMap {
	Static Map<String,Map<String, Map<String, List<String>>>> countryCodeMap = new Map<String,Map<String, Map<String, List<String>>>>();
    /**   Description :   Method to print all country 
    *
    *     Created By  :   Prateek Bhadoria
    *
    *     Return      :   Void
    *
    *     Revision log:   V_1.0 - Created  - Your name - Prateek Bhadoria, Date- 12/07/2022
    * 
    **/
    public static void codeOfCountry(String countrycode){
        
        Map<String, Map<String, List<String>>> mapOfCountry1= new Map<String, Map<String, List<String>>>();
        Map<String, Map<String, List<String>>> mapOfCountry2 = new Map<String, Map<String, List<String>>>();
        
        //Insert the country code of India, US and China
        countryCodeMap.put('+91',new Map<String, Map<String, List<String>>>());
        countryCodeMap.put('+1',new Map<String, Map<String, List<String>>>());
        countryCodeMap.put('+86',new Map<String, Map<String, List<String>>>());
        
        //India : State & Cities
        mapOfCountry2.put('India', new  Map<String, List<String>>());

        Map<String, List<String>> stateMapIndia = new Map<String, List<String>>();
        stateMapIndia.put('Rajasthan',new List<String>());
        stateMapIndia.put('Gujrat',new List<String>());
        stateMapIndia.put('Maharastra',new List<String>());
        stateMapIndia.put('Punjab',new List<String>());
        stateMapIndia.put('Bihar',new List<String>());

        List<String> cityListOfRajsthan = new List<String>{'Jaipur','Jodhpur','Kota','Alwar','Dausa'};

        List<String> cityListOfGujrat = new List<String>{'Ahmedabad','Surat','Vadodara','Rajkot','Bhavnagar'};

        List<String> cityListOfMaharastra = new List<String>{'Mumbai','Pune','Nagpur','Thane','Nashik'};

        List<String> cityListOfPunjab = new List<String>{'Ludhiana','Amritsar','Jalandhar','Patiala','Bathinda'};

        List<String> cityListOfBihar = new List<String>{'Patna','Gaya','Bhagalpur','Muzaffarpur','Darbhanga'};


        stateMapIndia.get('Rajasthan').addAll(cityListOfRajsthan);
        stateMapIndia.get('Gujrat').addAll(cityListOfGujrat);
        stateMapIndia.get('Maharastra').addAll(cityListOfMaharastra);
        stateMapIndia.get('Punjab').addAll(cityListOfPunjab);
        stateMapIndia.get('Bihar').addAll(cityListOfBihar);
        mapOfCountry2.get('India').putAll(stateMapIndia);

        mapOfCountry1.putAll(mapOfCountry2);
        countryCodeMap.get('+91').putAll(mapOfCountry1);
        mapOfCountry2.clear();
        
        //USA : State & Cities
        mapOfCountry2.put('USA', new  Map<String, List<String>>());

        Map<String, List<String>> stateMapUsa = new Map<String, List<String>>();
        stateMapUsa.put('Alabama',new List<String>());
        stateMapUsa.put('Alaska',new List<String>());
        stateMapUsa.put('Arizona',new List<String>());
        stateMapUsa.put('Arkansas',new List<String>());
        stateMapUsa.put('California',new List<String>());

        List<String> cityListOfAlabama = new List<String>{'Adamsville','Addison','Alabaster','Bakerhill','Blue Springs'};

        List<String> cityListOfAlaska = new List<String>{'Akutan','Buckland','Emmonak','Hoonah','Kasaan'};

        List<String> cityListOfArizona = new List<String>{'Phoenix','Tucson','Chandler','Gilbert','Buckeye'};

        List<String> cityListOfArkansas = new List<String>{'Fort Smith','Conway','Benton','Russellville','Paragould'};

        List<String> cityListOfCalifornia = new List<String>{'Los Angeles','San Francisco','Anaheim','Fremont','Ontario'};


        stateMapUsa.get('Alabama').addAll(cityListOfAlabama);
        stateMapUsa.get('Alaska').addAll(cityListOfAlaska);
        stateMapUsa.get('Arizona').addAll(cityListOfArizona);
        stateMapUsa.get('Arkansas').addAll(cityListOfArkansas);
        stateMapUsa.get('California').addAll(cityListOfCalifornia);
        mapOfCountry2.get('USA').putAll(stateMapUsa);

        mapOfCountry1.putAll(mapOfCountry2);
        countryCodeMap.get('+1').putAll(mapOfCountry1);
        mapOfCountry2.clear();
        
        //China : State & Cities
        mapOfCountry2.put('China', new  Map<String, List<String>>());

        Map<String, List<String>> stateMapChina = new Map<String, List<String>>();
            stateMapChina.put('Anhui',new List<String>());
        stateMapChina.put('Beijing',new List<String>());
        stateMapChina.put('Chongqing',new List<String>());
        stateMapChina.put('Guizhou',new List<String>());
        stateMapChina.put('Hunan',new List<String>());

        List<String> cityListOfAnhui = new List<String>{'Huaibei','Bengbu','Fuyang','Suzhou','Bozhou'};

        List<String> cityListOfBeijing = new List<String>{'Xicheng','Dongcheng','Chaoyang','Fengtai','Shijingshan'};

        List<String> cityListOfChongqing = new List<String>{'Wanzhou','Fuling','Yuzhong','Dadukou','Jiangbei'};

        List<String> cityListOfGuizhou = new List<String>{'Anshun','Bijie','Chishui','Liupanshui','Guiyang'};

        List<String> cityListOfHunan = new List<String>{'Hengyang','Yueyang','Changde','Yiyang','Chenzhou'};


        stateMapIndia.get('Anhui').addAll(cityListOfRajsthan);
        stateMapIndia.get('Beijing').addAll(cityListOfGujrat);
        stateMapIndia.get('Chongqing').addAll(cityListOfMaharastra);
        stateMapIndia.get('Guizhou').addAll(cityListOfPunjab);
        stateMapIndia.get('Hunan').addAll(cityListOfBihar);
        mapOfCountry2.get('China').putAll(stateMapIndia);

        mapOfCountry1.putAll(mapOfCountry2);
        countryCodeMap.get('+86').putAll(mapOfCountry1);
        mapOfCountry2.clear();
        
        system.debug(countryCodeMap.get(countrycode));
        
        
        
        
        
    }

    

}