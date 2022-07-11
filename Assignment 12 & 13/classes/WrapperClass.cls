/**
* Description   - This class is being created to implement the concept of wrapper class
*
* Created by    - Prateek Bhadoria
*
* Created Date  - 11/07/2022
*
* Revision log  -  V_1.0 - Created  - Prateek Bhadoria - Date-11/07/2022
*                  
*
**/
public class WrapperClass{
	public list<productwrapper> recordlist { get; set;}
    public list<selectoption> status;
    public string selectedstatus { get; set;}
    /**   Description :   Creating a Constructor
    *
    *     Created By  :   Prateek Bhadoria
    *
    *     Arguments   :   None
    *
    *     Return      :   void
    *
    *     Revision log:   V_1.0 - Created  - Prateek Bhadoria - Date-11/07/2022
    *                     
    * 
    **/ 
    public WrapperClass(){
        list<product2> pro = [select id, name, isactive from product2];
        if(pro.size()!=0){
            recordlist = new list<productwrapper>();
        }
        for(product2 p:pro){
            recordlist.add(new productwrapper(p));
        }
        
        selectedstatus = 'active';
        
    }
    /**   Description :   Creating a Constructor
    *
    *     Created By  :   Prateek Bhadoria
    *
    *     Arguments   :   None
    *
    *     Return      :   void
    *
    *     Revision log:   V_1.0 - Created  - Prateek Bhadoria - Date-11/07/2022
    *                     
    * 
    **/ 
    public list<selectoption> getStatus(){
        status = new list<selectoption>();
        status.add(new selectoption('active','Active'));
        status.add(new selectoption('inactive','In-Active'));
        return status;
    }
    /**   Description :   Creating a method
    *
    *     Created By  :   Prateek Bhadoria
    *
    *     Arguments   :   None
    *
    *     Return      :   void
    *
    *     Revision log:   V_1.0 - Created  - Prateek Bhadoria - Date-11/07/2022
    *                     
    * 
    **/ 
    public void changestatus(){
        list<product2> prolist = new list<product2>();
        for(productwrapper pw: recordlist){
            if(pw.selected){
                if(selectedstatus == 'active'){
                    pw.record.isactive = true;
                }else if(selectedstatus == 'inactive'){
                    pw.record.isactive = false;
                }
                pw.selected=false;
                prolist.add(pw.record);
            }
        }
        update prolist;
    }
    /**   Description :   Creating a method
    *
    *     Created By  :   Prateek Bhadoria
    *
    *     Arguments   :   None
    *
    *     Return      :   void
    *
    *     Revision log:   V_1.0 - Created  - Prateek Bhadoria - Date-11/07/2022
    *                     
    * 
    **/ 
    public class productwrapper{
        public boolean selected { get; set;}
        public product2 record  { get; set;}
        public productwrapper(product2 record){
            this.record = record;
            selected = false;
        }
    }
}