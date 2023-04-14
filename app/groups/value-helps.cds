using { aqm.planning as QualityPlaning }  from '../../db/quality-planning';
using QualityGroupsService as service from '../../srv/service';


annotate service.QualityGroups with {
    Plant @(Common.ValueList : {
            $Type : 'Common.ValueListType',
            CollectionPath : 'Plants',
            Parameters : [
                {
                    $Type : 'Common.ValueListParameterInOut',
                    LocalDataProperty : Plant_ID,
                    ValueListProperty : 'ID',
                },
                {
                    $Type : 'Common.ValueListParameterDisplayOnly',
                    ValueListProperty : 'plantName',
                },
                {
                    $Type : 'Common.ValueListParameterDisplayOnly',
                    ValueListProperty : 'plantLocation',
                },
            ],
        },
        Common.ValueListWithFixedValues : true
)};
annotate service.Plants with {
    ID @Common.Text : {
        $value : plantName,
        ![@UI.TextArrangement] : #TextFirst,
    }
};