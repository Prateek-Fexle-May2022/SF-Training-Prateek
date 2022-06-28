/**
* Description   - This is a class of all patterns(star and numeric). 
*
* Created by    - Prateek Bhadoria
*
* Created Date  - 28/06/2022
*
* Revision log  -  V_1.0 - Created  - Your name -Prateek Bhadoria, Date- 28/06/2022
*
**/
public with sharing class ConsolidatedPatterns {
    /**   Description :   To print following pattern(using one loop only) i.e. Right side triangle star pattern-
                           *
                           * *
                           * * *
                           * * * *
                           * * * * *
    *
    *     Created By  :   Prateek Bhadoria
    *
    *     Return      :   Void
    *
    *     Revision log:   V_1.0 - Created  - Your name - Prateek Bhadoria, Date- 28/06/2022
    * 
    **/
	public static void rightStarPattern(){
    	integer x=1;
        integer j=1;
        string s=' ';
        string b=' ';
        for(integer i=1;x<=5;){
        	if(!(j<=i)){
            	j=1;
                i++;
            }
            else{
                s = s + '*';
                x++;
                j++;
                system.debug(s);
            }
        }
    }
    /**   Description :   To print following pattern i.e. Hollow star triangle pattern-
                              *
                             * *
                            *   *
                           *     *
                          *********
    *     Created By  :   Prateek Bhadoria
    *
    *     Return      :   Void
    *
    *     Revision log:   V_1.0 - Created  - Your name - Prateek Bhadoria, Date- 28/06/2022
    * 
    **/
    public static void hollowtrianglepattern(){
		boolean b=true;
		for(integer i=1;i<=5;i++)
   	 	{
        string s=' ';
        string w='   ';
        for(integer j=1;j<=9;j++)
        {
            if(i>=2 && i<=4){if(j>=7-i && j<=3+i){b=false;}else{b=true;}}else{b=true;}
            
            if(j>=6-i && j<=4+i && b )
            {
                s = s + '* ';
              
            }
            else
            {
                 s = s + preserveWhitespace(w);
               
            }
        }
        
        system.debug(s);
        
        }
}
    /**   Description :   To print following pattern i.e. Left star triangle pattern-
                                     * 
                                   * * 
                                 * * * 
                               * * * * 
                             * * * * *
    *     Created By  :   Prateek Bhadoria
    *
    *     Return      :   Void
    *
    *     Revision log:   V_1.0 - Created  - Your name - Prateek Bhadoria, Date- 28/06/2022
    * 
    **/
    public static void leftstarpattern(){
        for(integer i=1;i<=5;i++)
    {
        string s='  ';
        string w='   ';
        for(integer j=1;j<=5;j++)
        {
            if(j>=6-i )
            {
                s = s + '* ';
            }
            else
            {
                 s = s + preserveWhitespace(w);
            }
        }
        
        system.debug(s);
        
    }
    }
    /**   Description :   To print following pattern i.e. Downward star triangle pattern-
                                 * * * * * 
                                 * * * * 
                                 * * * 
                                 * * 
                                 *
    *     Created By  :   Prateek Bhadoria
    *
    *     Return      :   Void
    *
    *     Revision log:   V_1.0 - Created  - Your name - Prateek Bhadoria, Date- 28/06/2022
    * 
    **/
    public static void downwardstarpattern(){
        for(integer i=1;i<=5;i++)
        {
        string s='  ';
        string w='   ';
        for(integer j=1;j<=5;j++)
        {
            if(j<=6-i)
            {
                s = s + '* ';
            }
            else
            {
                s = s + preserveWhitespace(w);
            }
        }
        
        system.debug(s);
        
    	}
    }
     /**   Description :   To print following pattern i.e. Reversed pyramids star pattern-
                                 * * * * * 
                                  * * * * 
                                   * * * 
                                    * * 
                                     *
    *     Created By  :   Prateek Bhadoria
    *
    *     Return      :   Void
    *
    *     Revision log:   V_1.0 - Created  - Your name - Prateek Bhadoria, Date- 28/06/2022
    * 
    **/
    public static void reversedpyramidpattern(){
        for(integer i=1;i<=5;i++){
    	string s='  ';
        string w='   ';
    	boolean k=true;
    
    	for(integer j=1;j<=9;j++) {
        	if(j>=i && j<=10-i && k){
            s = s + '* ';
            k=false;
        }
        else{
            s = s + preserveWhitespace(w);
            k=true;
        }
    	}
    		system.debug(s);
		}
    }
    /**   Description :   To print following pattern i.e. Right pascal's triangle star pattern-
                                 * 
                                 * * 
                                 * * * 
                                 * * * * 
                                 * * * * * 
                                 * * * * 
                                 * * * 
                                 * * 
                                 *
    *     Created By  :   Prateek Bhadoria
    *
    *     Return      :   Void
    *
    *     Revision log:   V_1.0 - Created  - Your name - Prateek Bhadoria, Date- 28/06/2022
    * 
    **/
    public static void rightpascalpattern(){
        integer k=0;
		for(integer i=1;i<=10;i++)
    	{
        	if(i<=5){k++;} else{k--;}
        	string s='  ';
            string w='   ';
        for(integer j=1;j<=5;j++)
        {
            	if(j<=k)
            {
                s = s + '* ';
            }
            else
            {
                 s = s + preserveWhitespace(w);
            }
        }
        
        		system.debug(s);
        
    }
    }
    /**   Description :   To print following pattern i.e. Sandglass star pattern-
                                 * * * * * 
                                  * * * * 
                                   * * * 
                                    * * 
                                     * 
                                     * 
                                    * * 
                                   * * * 
                                  * * * * 
                                 * * * * *
    *     Created By  :   Prateek Bhadoria
    *
    *     Return      :   Void
    *
    *     Revision log:   V_1.0 - Created  - Your name - Prateek Bhadoria, Date- 28/06/2022
    * 
    **/
    public static void sandglassstarpattern(){
        integer k=0;
		for(integer i=1;i<=10;i++)
    	{
        	if(i<=5){k++;} else{k--;}
            
        	if(i==6){k++;} 
        	string s='  ';
        	string w='   ';
        for(integer j=1;j<=9;j++)
        {
            if(j>=k && j<=10-k)
            {
                s = s + '* ';
            }
            else
            {
                 s = s + preserveWhitespace(w);
            }
        }
        
           		 system.debug(s);
        
    	}
    }
    /**   Description :   To print following pattern i.e. Alphabet 'A' star pattern-
                                 * 
                                * *
                                ***
                                * *
                                * *
                                * *
    *     Created By  :   Prateek Bhadoria
    *
    *     Return      :   Void
    *
    *     Revision log:   V_1.0 - Created  - Your name - Prateek Bhadoria, Date- 28/06/2022
    * 
    **/
    public static void alphbetApattern(){
        integer k=2,t=2;
		boolean m = true;
		for(integer i=1;i<=6;i++)
    	{
        	string s='  ';
        	string w='   ';
        	if(i==2){k--; t++;}
            
        for(integer j=1;j<=3;j++)
        {
            if((i==2||i>=4) && j==2){m=false;}else{m=true;}
            
            if(j>=k && j<=t && m )
            {
                s = s + '* ';  
            }
            else
            {
                 s = s + preserveWhitespace(w);
            }
            
        }
        		 system.debug(s);
        
    }
    }
    /**   Description :   To print following pattern i.e. Dimond star pattern-
                                   *
                                  * *
                                 *   *
                                *     *
                           	   *       *
                                *     *
                                 *   *
                                  * *
                                   *
    *     Created By  :   Prateek Bhadoria
    *
    *     Return      :   Void
    *
    *     Revision log:   V_1.0 - Created  - Your name - Prateek Bhadoria, Date- 28/06/2022
    * 
    **/
    public static void dimondstarpattern(){
        integer k=6, t=4, d=6, v=4;
		boolean b=true;

		for(integer i=1;i<=9;i++)
   	 	{
        	string s='  ';
            string w='   ';
        
        	if(i<=d){k--; t++;}else{k++; t--;}
        
        	if(i>=2 && i<=8) {if(i<=d) {d--; v++;} else{d++; v--;}}
        
        for(integer j=1;j<=9;j++)
        {
            if(j>=d && j<=v){b=false;}else{b=true;}
            
            if(j>=k && j<=t && b)
            {
                s = s + '* ';
              
            }
            else
            {
                 s = s + preserveWhitespace(w);
               
            }
        }
        
        		 system.debug(s);
        
        }
    }
    /**   Description :   To print following pattern i.e. Number pattern-
                               1 
                               2 3 
                               4 5 6 
                               7 8 9 10 
                               11 12 13 14 15
    *     Created By  :   Prateek Bhadoria
    *
    *     Return      :   Void
    *
    *     Revision log:   V_1.0 - Created  - Your name - Prateek Bhadoria, Date- 28/06/2022
    * 
    **/
    public static void numberpattern(){
        integer k=1;

 		for(integer i=1;i<=5;i++)
    	{
        string s = '';
        for(integer j=1;j<=i;j++)
        {
            if(j<=i)
            {
                s = s + k;
                k++;
            }
        }
        
        		system.debug(s);
        
    }
    }
    /**   Description :   To print following pattern i.e. Binary number pattern-
                             10101
                             01010
                             10101
                             01010
                             10101
    *     Created By  :   Prateek Bhadoria
    *
    *     Return      :   Void
    *
    *     Revision log:   V_1.0 - Created  - Your name - Prateek Bhadoria, Date- 28/06/2022
    * 
    **/
    public static void binarynumberpattern(){
        for(integer i=1;i<=5;i++)
		{
    	string s='  ';
    	for(integer j=1; j<=5; j++)
    	{
        
      		if(j==1 || j==3 || j==5)
        	{
           		s=s+'1';
        	} 
        	else
        	{
            	s=s+'0';
        	}
    	}
    			system.debug(s);
		}
    }
    /**   Description :   To print whitespace
    *
    *     Created By  :   Prateek Bhadoria
    *
    *     Return      :   return String 
    *
    *     Revision log:   V_1.0 - Created  - Youe name - Prateek Bhadoria , Date- 28/06/2022
    * 
    **/
    public static String preserveWhitespace(String s){
		if(s!= null)
        s = s.replace(' ',String.fromCharArray( new Integer[] { 160 }));

    	return s;
      }
}