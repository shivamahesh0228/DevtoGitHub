public class JSONClass {
    public static void getJSONFormates(){
        // -------------- Serialization -----------------------
        // Serialize ==> JSON Format
        List<Account> acc=[select Id,Name,Rating,Phone from Account LIMIT 1];
        String jsonSTR=JSON.serialize(acc);
        //System.debug('APEX 1 ===> '+acc);
        //System.debug('JSON Format 1 ===> '+jsonSTR);
        // Serialize ==> SupressNull formate
        String jsonsupressNull=JSON.serialize(acc,true);
        //System.debug('JSON SupressNulls Format 1 ===> '+jsonsupressNull);
        
        // JSON Strucutural Formt
        String jsonSTRL=JSON.serializePretty(acc);
        //System.debug('JSON Pretty Format 1 ===> '+jsonSTRL);
        
        // JSON Strucutural Formt and SupressNulls
        String jsonSTRLSuppressNull=JSON.serializePretty(acc,true);
        //System.debug('JSON SupressNulls Format 1 ===> '+jsonSTRLSuppressNull);
        
        // -------------- Deserialization ----------------------
        
        List<Account> acccList=(List<Account>)JSON.Deserialize(jsonSTRLSuppressNull,Account.Class);
        System.debug('JSON Deserialization Format 2 ===> '+acccList);        
        
        
        
        
    }
}