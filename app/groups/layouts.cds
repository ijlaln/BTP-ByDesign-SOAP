using QualityGroupsService as service from '../../srv/service';

using from './value-helps';
using from './capabilities';
using from './field-control';
using from './labels';


annotate service.QualityGroups with @(
    UI.LineItem : [
        {
            $Type : 'UI.DataField',
            Value : groupID,
        },
        {
            $Type : 'UI.DataField',
            Value : GroupDescription,
        },
        {
            $Type : 'UI.DataField',
            Value : groupTypes_value,
        },
        {
            $Type : 'UI.DataField',
            Value : Plant_ID,
        },
    ]
);
annotate service.QualityGroups with @(
    UI.Facets : [
        {
            $Type : 'UI.ReferenceFacet',
            Label : 'General Group Section',
            ID : 'GeneralGroupSection',
            Target : '@UI.FieldGroup#GeneralGroupSection',
        },
    ],
    UI.FieldGroup #GeneralGroupSection : {
        $Type : 'UI.FieldGroupType',
        Data : [
            {
                $Type : 'UI.DataField',
                Value : groupID,
            },{
                $Type : 'UI.DataField',
                Value : GroupDescription,
            },{
                $Type : 'UI.DataField',
                Value : Plant_ID,
            },],
    }
);
