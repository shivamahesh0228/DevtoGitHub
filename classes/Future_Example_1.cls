/*
* Future method is using with @futre annotation keywork
* Return type void only
* Future method allow only static method
* Future method does not support Non primitive Datatypes or SObjects only allow Primitive datatype
* isolating DML and Mixed DML issues (setup and Nonsetup)Objects
* setup Objects --> ObjectPermission,PermissionSet,PermissionsetAssignment and User etc...
* Non setup Object --> Account, contact ectc...
* Future method will not return any JobId in the apex class
* Future method cannot cal from another future method.
* Future method cannot support sobject as Parameters
* With in a transaction we call 50 fututre methods.
* Pass RecordId instead of record
* Serialize the sobject as string using JSON/xml and Pass string as parameter to future method
* To invoke Asyncronous webservice from Trigger
* To invoke Asynchronous webservice from Schedule apex
* To handle Bulk DML operations
*/
public class Future_Example_1 {
    @future
    public static void callMe(){
        System.debug('Call Me One');
        System.debug('Call Me Two');
        System.debug('Call Me Three');
    }
    @future
    public static void invokeMe(){
        System.debug('invoke Me One');
        System.debug('invoke Me Two');
        System.debug('invoke Me Three');
    } 
    public void showMe(){
        System.debug('Show Me One');
        System.debug('Show Me Two');
        callMe();
        System.debug('Show Me Three');
        System.debug('Show Me Four');
        System.debug('Show Me Five');
        invokeMe();
        System.debug('Show Me Six');
        System.debug('Show Me Seven');
    }
}