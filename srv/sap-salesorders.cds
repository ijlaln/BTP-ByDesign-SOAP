namespace sap.extensions.soap.busers;

service SAPSalesOrders @(path: '/sap-salesorders') {
    entity SalesOrder {
        ID                                       : String(12);
        PostingDate                              : DateTime;
        ItemListCustomerOrderLifeCycleStatusName : String(128);
        BillToParty                              : Association to Party;
        AccountParty                             : Association to Party;
    }

    entity Party {
        PartyID             : String(100);
        AddressHostUUID     : String(100);
        Email               : String(100);
        Facsimile           : String(100);
        Telephone           : String(100);
        DisplayName         : String(100);
        Name                : String(100);
        CountryCode         : String(100);
        RegionCode          : String(100);
        CityName            : String(100);
        StreetPostalCode    : String(100);
        StreetName          : String(100);
        HouseID             : String(100);
        TaxJurisdictionCode : String(100);
        TimeZoneCode        : String(100)
    }
}
