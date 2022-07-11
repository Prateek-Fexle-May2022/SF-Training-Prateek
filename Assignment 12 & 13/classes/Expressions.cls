/**   Description :   Purpose to create this class is to implement different types of Expressions.
*
*     Created By  :   Prateek Bhadoria
*
*     Arguments   :   None
*
*     Return      :   void
*
*     Revision log:   V_1.0 - Created  - Prateek Bhadoria - Date-08/07/2022
*                     
* 
**/
public with sharing class Expressions {
    /**   Description :   implementing Different types of Expressions.
    *
    *     Created By  :   Prateek Bhadoria
    *
    *     Arguments   :   None
    *
    *     Return      :   void
    *
    *     Revision log:   V_1.0 - Created  - Prateek Bhadoria - Date-08/07/2022
    *                     
    * */
    public static void diffExpressions(integer a, integer b,integer c,integer d, integer e, boolean f, boolean g){
        system.debug('Unary Expressions are :'); 
        system.debug(~b);             
        system.debug(~d);
        system.debug(~e);             
        system.debug(!f);            
        system.debug(!g);           

        //Arithmetic Expressions -
        system.debug('Arithmetic Expressions are :');
        system.debug(a+c);  
        system.debug(a-c); 
        system.debug(c*d); 
        system.debug(e/d); 

        //Left Shift Expression -
        system.debug('Left Shift Expressions is '); 
        system.debug(c<<d);    

        //Right Shift Expression -
        system.debug('Right Shift Expressions');
        system.debug(c>>d);     

        //AND Expression -
        system.debug('AND Expressions'); 
        system.debug(a<c&&a<d);
        system.debug(a<c&a<d);

        //OR Expressions -
        system.debug('OR Expressions'); 
        system.debug(a>b||a++<e);
        system.debug(a>b|a++<e);

        //Ternary Expressions
        system.debug('Ternary Expressions');
        integer min=(a<b)?a:b;  
        system.debug(min); 

        //Assigment Expreesions -
        system.debug('Assigment Expressions');
        system.debug(a += b);
        system.debug(b -= e);
        system.debug(e *= a);
        system.debug(c /= d);
        system.debug(d *= a*b);
        system.debug(b += a-e );

        //Relation Expreessions -
        system.debug('Relation Expressions'); 
        system.debug(c == d);
        system.debug(e != b);  
        system.debug(e > a);  
        system.debug(b < a);  
        system.debug(a >= e);  
        system.debug(b <= e);

        //Type Casting:-
        System.debug('Type casting/Rule of conversion: ');
        double length1 = c; 
        decimal length2 = d;

        system.debug(length1);
        system.debug(length2); 

        double area1 = 22.14d;
        integer area2 = (integer) area1; 
        long area3 = (long) area1;

        system.debug(area2);
        system.debug(area3);

        decimal length3 = area2;

        system.debug(area3);        
    }
}