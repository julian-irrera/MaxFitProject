public with sharing class TransactionLogHandler {

    public static void doHandleExeption(System.Exception ex, String processName){

        Error_Log__c transactionLog = new Error_Log__c();
        transactionLog.Log_Details__c = ex.getStackTraceString() + '<br/> <strong> Message is: </strong>' + ex.getMessage() +
        '<br/> <strong> Cause is: </strong>' + ex.getCause() + '<br/> <strong> Type is: </strong>' + ex.getTypeName() + 
        '<br/> <strong> Line Number is: </strong>' + ex.getLineNumber();
        transactionLog.Lod_DateTime__c = System.now();
        transactionLog.Process_Name__c = processName;

        if(Schema.SObjectType.Error_Log__c.isCreateable()){
            insert transactionLog;
        }        
    }
}