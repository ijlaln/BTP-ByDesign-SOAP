using MyService as service from '../../srv/service';

annotate service.Classifications with @odata.draft.enabled ;


annotate service.Classifications with @(
    UI.FieldGroup #GeneratedGroup1 : {
        $Type : 'UI.FieldGroupType',
        Data : [
            {
                $Type : 'UI.DataField',
                Value : classificationID,
            },
            {
                $Type : 'UI.DataField',
                Label : '{i18n>classificationDescription}',
                Value : classificationDescription,
            },
            {
                $Type : 'UI.DataField',
                Label : '{i18n>Plant}',
                Value : plant,
            },
            {
                $Type : 'UI.DataField',
                Label : '{i18n>isActive}',
                Value : isActive,
            },
        ],
    },
    UI.Facets : [
        {
            $Type : 'UI.ReferenceFacet',
            ID : 'GeneratedFacet1',
            Label : 'General Information',
            Target : '@UI.FieldGroup#GeneratedGroup1',
        },
    ]
);

annotate service.Classifications with @(
    UI.LineItem : [
        {
            $Type : 'UI.DataField',
            Label : 'classificationDescription',
            Value : classificationDescription,
        },
        {
            $Type : 'UI.DataField',
            Label : 'plant',
            Value : plant,
        },
        {
            $Type : 'UI.DataField',
            Label : 'monograpgh',
            Value : monograpgh,
        },
        {
            $Type : 'UI.DataField',
            Label : 'revisionNo',
            Value : revisionNo,
        },
        {
            $Type : 'UI.DataField',
            Label : 'masterInspectionCharID',
            Value : masterInspectionCharID,
        },
        
    ]
);
annotate service.Classifications with @(
    UI.DataPoint #plant : {
        $Type : 'UI.DataPointType',
        Value : plant,
        Title : 'plant',
    },
    
);
