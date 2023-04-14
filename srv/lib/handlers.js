const { getSoapService } = require('./soap-service');

// let salesOrdersReadServicePromise = null;

// (async function () {
//     // Connect to external S/4HC SOAP service
//     salesOrdersReadServicePromise = getSoapService('SalesOrdersRead', './srv/external/QuerySalesOrderIn.wsdl', salesOrdersReadServiceEndpoint);
// })();

/*** HANDLERS ***/
async function readSalesOrdersFromSAP(req) {
    try {
        // Set the parameters for the FindByElements method of the Query Sales Order WEbService 
        const param = {

            "SalesOrderSelectionByElements": {
                "SelectionByID": {
                    "InclusionExclusionCode": "I",
                    "IntervalBoundaryTypeCode": 1,
                    "LowerBoundaryID": "*"
                }
            },
            "ProcessingConditions": {
                "QueryHitsMaximumNumberValue": 5,
                "QueryHitsUnlimitedIndicator": false
            }

        };

        let salesOrdersReadServiceEndpoint = { url: null };
        // Get the SOAP client for the SalesOrdersRead service
        const salesOrderReadService = await getSoapService('SalesOrdersRead', './srv/external/QuerySalesOrderIn.wsdl', salesOrdersReadServiceEndpoint);
        // const salesOrderReadService =  salesOrdersReadServicePromise;
        salesOrderReadService.setEndpoint(salesOrdersReadServiceEndpoint.url);

        // Invoke method asynchronously and wait for the response
        const resp = await salesOrderReadService.FindByElementsAsync(param);

        // Prepare the actual service response
        const SalesOrders = [];
        if (resp && resp[0] && resp[0].SalesOrder) 
        {
            resp[0].SalesOrder.forEach(SOInst => 
            {               
                
                SalesOrders.push(
                    {
                        ID: SOInst.ID,
                        PostingDate: SOInst.PostingDate,
                        ItemListCustomerOrderLifeCycleStatusName: SOInst.Status.ItemListCustomerOrderLifeCycleStatusName,
                        AccountParty : ((SOInst.AccountParty) ?
                        {
                            PartyID:  ((SOInst.AccountParty.PartyID) ? SOInst.AccountParty.PartyID : "") ,
                            DisplayName: SOInst.AccountParty.Address.DisplayName[0].FormattedName.$value
                            //DisplayName: ((SOInst.AccountParty.Address.DisplayName.FormattedName) ? SOInst.AccountParty.Address.DisplayName.FormattedName : "") 
                        }: null),

                        BillToParty : ((SOInst.BillToParty) ?
                        {
                            PartyID:  ((SOInst.BillToParty.PartyID) ? SOInst.BillToParty.PartyID : "" ),
                            DisplayName: SOInst.BillToParty.Address.DisplayName[0].FormattedName.$value
 
                        } : null),
                       
                     } 
                );
            });
        }

        return SalesOrders;
    } 
    catch (err) 
    {
        req.error(err.code, err.message);
    }
}

module.exports = {
    readSalesOrdersFromSAP
}