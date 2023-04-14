using MyService as service from '../../srv/service';
using from '../../db/custom-codelists';
using from '../../db/quality-planning';

annotate service.Characteristics with @odata.draft.enabled;

annotate service.Characteristics with @(
    UI.LineItem : [
        {
            $Type : 'UI.DataField',
            Value : characteristicID,
            Label : '{i18n>Characteristicid}',
        },
        {
            $Type : 'UI.DataField',
            Value : characteristicDescription,
            Label : '{i18n>CharacteristicDescription}',
        },
        {
            $Type : 'UI.DataField',
            Value : plant_ID,
            Label : '{i18n>Plant}',
        },
        {
            $Type : 'UI.DataField',
            Value : qualitative,
            Label : '{i18n>Qualitative}',
        },
        {
            $Type : 'UI.DataField',
            Value : quantitative,
            Label : '{i18n>Quantitative}',
        },
        {
            $Type : 'UI.DataField',
            Value : createdAt,
            Label : '{i18n>CreatedAt}',
        },
    ]
);
annotate service.Characteristics with @(
    UI.FieldGroup #GeneratedGroup1 : {
        $Type : 'UI.FieldGroupType',
        Data : [
            {
                 $Type : 'UI.DataField',
                Label : '{i18n>Plant}',
                Value : plant_ID,
            },
            {
                $Type : 'UI.DataField',
                Value : dataOriginID.characteristics.characteristicID,
                Label : '{i18n>Characteristicid}',
            },
            {
                $Type : 'UI.DataField',
                Value : characteristicStatus_value,
                Label : '{i18n>Characteristicstatusvalue}',
            },
            {
                $Type : 'UI.DataField',
                Value : characteristicTypeID_ID,
                Label : '{i18n>CharacteristicType}',
            },
            {
                $Type : 'UI.DataField',
                Value : controlIndicatorCode_value,
                Label : '{i18n>Controlindicatorcodevalue}',
            },
            {
                $Type : 'UI.DataField',
                Value : controlIndicatorReference,
                Label : '{i18n>Controlindicatorreference}',
            },
            {
                $Type : 'UI.DataField',
                Value : characteristicSamplingProcedureID_ID,
                Label : '{i18n>SampleDrawingProcedure}',
            },
            {
                $Type : 'UI.DataField',
                Label : '{i18n>Nooflabel}',
                Value : noOfLabel,
            },
            {
                $Type : 'UI.DataField',
                Label : '{i18n>Assay/Potency Result}',
                Value : assayResult,
            },
            {
                $Type : 'UI.DataField',
                Value : formula,
                Label : '{i18n>Formula}',
            },
        
        ],
    },
    UI.Facets : [
        {
            $Type : 'UI.CollectionFacet',
            Label : 'General Information',
            ID : 'GeneralInformation1',
            Facets : [
                {
                    $Type : 'UI.ReferenceFacet',
                    Label : 'Indicators',
                    ID : 'Indicators',
                    Target : '@UI.FieldGroup#Indicators',
                },
                {
                    $Type : 'UI.ReferenceFacet',
                    Label : 'Info',
                    ID : 'Info',
                    Target : '@UI.FieldGroup#Info',
                },],
        },
        {
            $Type : 'UI.CollectionFacet',
            Label : 'Quantitative Characteristics',
            ID : 'QuanititativeInformation',
            Facets : [
                {
                    $Type : 'UI.ReferenceFacet',
                    Label : 'General Information',
                    ID : 'GeneralInformation',
                    Target : '@UI.FieldGroup#GeneralInformation1',
                },
                {
                            $Type : 'UI.ReferenceFacet',
                            Label : 'Specifications',
                            ID : 'Spe',
                            Target : '@UI.FieldGroup#Spe',
                        },
                {
                            $Type : 'UI.ReferenceFacet',
                            Label : 'Warnings',
                            ID : 'warn',
                            Target : '@UI.FieldGroup#warn',
                        },],
        },
        {
            $Type : 'UI.ReferenceFacet',
            Label : '{i18n>Qualitativecharacteristics}',
            ID : 'QualitativeCharacteristics',
            Target : '@UI.FieldGroup#QualitativeCharacteristics',
        },
        {
            $Type : 'UI.CollectionFacet',
            Label : '{i18n>CharacteristicsDetail}',
            ID : 'AdditionalInfo',
            Facets : [
                {
                    $Type : 'UI.ReferenceFacet',
                    Label : '{i18n>DetailedTextualInformation}',
                    ID : 'AdditionalFields',
                    Target : '@UI.FieldGroup#AdditionalFields',
                },
                {
                    $Type : 'UI.ReferenceFacet',
                    Label : '{i18n>AdministrativeInformation1}',
                    ID : 'i18nAdministrativeInformation1',
                    Target : '@UI.FieldGroup#i18nAdministrativeInformation11',
                },],
        },
    ]
);
// annotate service.Characteristics with @(
//     UI.HeaderInfo : 
//     // {
//     //     TypeName : '{i18n>Characteristics}',
//     //     TypeNamePlural : '{i18n>Characteristics}',
    
//     // }
// );
annotate service.Characteristics with @(
    UI.HeaderFacets : [
        {
            $Type : 'UI.ReferenceFacet',
            ID : 'characteristicID',
            Target : '@UI.DataPoint#characteristicID1',
        },
        { $Type : 'UI.CollectionFacet',
            Facets : [
        
           { $Type : 'UI.ReferenceFacet',
            Label : 'General Data',
            ID : 'HeaderFacets1',
            Target : '@UI.FieldGroup#HeaderFacets1',
    }]},],

    UI.FieldGroup #i18nCreateNew : {
        $Type : 'UI.FieldGroupType',
        Data : [
        ],
    }
);
annotate service.Characteristics with @(
    UI.FieldGroup #HeaderForm : {
        $Type : 'UI.FieldGroupType',
        Data : [],
    }
);
annotate service.Characteristics with @(
    UI.DataPoint #quantitative_LowerSpecificationLimit : {
        $Type : 'UI.DataPointType',
        Value : quantitative_LowerSpecificationLimit,
        Title : '{i18n>Lowerspecificationlimit}',
    },
    UI.DataPoint #quantitative_UpperSpecificationLimit : {
        $Type : 'UI.DataPointType',
        Value : quantitative_UpperSpecificationLimit,
        Title : '{i18n>Upperspecificationlimit}',
    }
);
annotate service.Characteristics with @(
    UI.DataPoint #progress : {
        $Type : 'UI.DataPointType',
        Value : noOfLabel,
        Title : '{i18n>Nooflabel}',
        TargetValue : 100,
        Visualization : #Progress,
    },
    UI.DataPoint #progress1 : {
        $Type : 'UI.DataPointType',
        Value : quantitative,
        Title : '{i18n>Quantitative}',
        TargetValue : 100,
        Visualization : #Progress,
    }
);
annotate service.Characteristics with @(
    UI.DataPoint #rating : {
        $Type : 'UI.DataPointType',
        Value : inspectionCharID,
        Title : '{i18n>InspectionCharId}',
        TargetValue : 5,
        Visualization : #Rating,
    }
);
annotate service.Characteristics with @(
    UI.DataPoint #noOfLabel : {
        Value : noOfLabel,
        MinimumValue : 0,
        MaximumValue : 10,
    },
    UI.Chart #noOfLabel : {
        ChartType : #Bullet,
        Title : '{i18n>Nooflabel}',
        Measures : [
            noOfLabel,
        ],
        MeasureAttributes : [
            {
                DataPoint : '@UI.DataPoint#noOfLabel',
                Role : #Axis1,
                Measure : noOfLabel,
            },
        ],
    }
);
annotate service.Characteristics with @(
    UI.FieldGroup #QualitativeCharacteristics : {
        $Type : 'UI.FieldGroupType',
        Data : [
            {
                $Type : 'UI.DataField',
                Value : qualitative,
                Label : '{i18n>Qualitative}',
            },
            {
                $Type : 'UI.DataField',
                Value : qualitativeSelectedSet.selectedSetID,
                Label : '{i18n>SelectedSetId1}',
            },
        
                ],
    },
);
annotate service.Characteristics with @(
    UI.FieldGroup #QuantitativeCharacteristics : {
        $Type : 'UI.FieldGroupType',
        Data : [],
    }
);
annotate service.Characteristics with {
    characteristicID @Common.FieldControl : #Mandatory
};

annotate service.EventTypes with {
    name @Common.Text : {
            $value : name,
            ![@UI.TextArrangement] : #TextSeparate,
        }
};
annotate service.Characteristics with {
    controlIndicatorCode @Common.FieldControl : #Mandatory
};
annotate service.Characteristics with {
    controlIndicatorReference @(Common.ValueList : {
            $Type : 'Common.ValueListType',
            CollectionPath : 'Classifications',
            Parameters : [
                {
                    $Type : 'Common.ValueListParameterInOut',
                    LocalDataProperty : controlIndicatorReference,
                    ValueListProperty : 'classificationDescription',
                },
            ],
        },
        Common.ValueListWithFixedValues : false
)};
annotate service.Characteristics with {
    characteristicSamplingProcedureID @(Common.ValueList : {
            $Type : 'Common.ValueListType',
            CollectionPath : 'SampleDrawingProcedures',
            Parameters : [
                    {
                        $Type : 'Common.ValueListParameterInOut',
                        LocalDataProperty : characteristicSamplingProcedureID_ID,
                        ValueListProperty : 'ID',
                    },
                {
                    $Type : 'Common.ValueListParameterDisplayOnly',
                    ValueListProperty : 'sampleDrawingProcedureID',
                },
                    {
                        $Type : 'Common.ValueListParameterDisplayOnly',
                        ValueListProperty : 'sampleDrawingProcedureDescription',
                    },
                ],
        },
        Common.ValueListWithFixedValues : false
)};
annotate service.Characteristics with {
    quantitative_CharacteristicUnitOfMeasure @(Common.ValueList : {
            $Type : 'Common.ValueListType',
            CollectionPath : 'SampleUnitOfMeasure',
            Parameters : [
                    {
                        $Type : 'Common.ValueListParameterInOut',
                        LocalDataProperty : quantitative_CharacteristicUnitOfMeasure,
                        ValueListProperty : 'sampleUnitOfMeasureID',
                    },
                {
                    $Type : 'Common.ValueListParameterDisplayOnly',
                    ValueListProperty : 'sampleUnitOfMeasureDetails',
                },
                ],
        },
        Common.ValueListWithFixedValues : false
)};
annotate service.Characteristics with {
    qualitativeSelectedSetID @(Common.ValueList : {
            $Type : 'Common.ValueListType',
            CollectionPath : 'QualitativeSelectedSets',
            Parameters : [
                    {
                        $Type : 'Common.ValueListParameterInOut',
                        LocalDataProperty : qualitativeSelectedSetID_ID,
                        ValueListProperty : 'ID',
                    },
                    {
                        $Type : 'Common.ValueListParameterDisplayOnly',
                        ValueListProperty : 'selectedSetID',
                    },
                    {
                        $Type : 'Common.ValueListParameterDisplayOnly',
                        ValueListProperty : 'selectedSetDescription',
                    },
                ],
        },
        Common.ValueListWithFixedValues : false
)};
annotate service.Characteristics with @(
    Communication.Contact #contact : {
        $Type : 'Communication.ContactType',
        fn : createdBy,
    }
);
annotate service.Characteristics with @(
    UI.FieldGroup #AdditionalFields : {
        $Type : 'UI.FieldGroupType',
        Data : [
            {
                $Type : 'UI.DataField',
                Value : characterisitcsDetails,
                Label : '{i18n>Characterisitcsdetails}',
            },
            {
                $Type : 'UI.DataField',
                Value : infoField1,
                Label : '{i18n>Infofield1}',
            },{
                $Type : 'UI.DataField',
                Value : infoField2,
                Label : '{i18n>Infofield2}',
            },],
    }
);
annotate service.Characteristics with {
    characterisitcsDetails @UI.MultiLineText : true
};

annotate service.Characteristics with @(
    UI.DataPoint #createdAt : {
        $Type : 'UI.DataPointType',
        Value : createdAt,
        Title : 'createdAt',
    },
    UI.DataPoint #createdBy : {
        $Type : 'UI.DataPointType',
        Value : createdBy,
        Title : 'createdBy',
    }
);
annotate service.Characteristics with @(
    UI.FieldGroup #i18nCharacteristics : {
        $Type : 'UI.FieldGroupType',
        Data : [],
    }
);
annotate service.Characteristics with @(
    UI.FieldGroup #AdministrativeInformation : {
        $Type : 'UI.FieldGroupType',
        Data : [
            {
                $Type : 'UI.DataField',
                Value : createdAt,
                Label : '{i18n>CreatedAt}',
            },{
                $Type : 'UI.DataField',
                Value : createdBy,
                Label : '{i18n>UserID}',
            },{
                $Type : 'UI.DataField',
                Value : modifiedAt,
                Label : '{i18n>ChangedAt}',
            },{
                $Type : 'UI.DataField',
                Value : modifiedBy,
                Label : '{i18n>UserID}',
            },],
    }
);
annotate service.CharacteristicStatus with @(
    Communication.Contact #contact : {
        $Type : 'Communication.ContactType',
        fn : descr,
    }
);
annotate service.Characteristics with @(
    UI.SelectionPresentationVariant #table : {
        $Type : 'UI.SelectionPresentationVariantType',
        PresentationVariant : {
            $Type : 'UI.PresentationVariantType',
            Visualizations : [
                '@UI.LineItem',
            ],
        },
        SelectionVariant : {
            $Type : 'UI.SelectionVariantType',
            SelectOptions : [
                ],
        },
    }
);
annotate service.Characteristics with @(
    UI.SelectionPresentationVariant #table1 : {
        $Type : 'UI.SelectionPresentationVariantType',
        PresentationVariant : {
            $Type : 'UI.PresentationVariantType',
            Visualizations : [
                '@UI.LineItem',
            ],
        },
        SelectionVariant : {
            $Type : 'UI.SelectionVariantType',
            SelectOptions : [
            ],
        },
    }
);
annotate service.Characteristics with @(
    UI.SelectionPresentationVariant #tableView : {
        $Type : 'UI.SelectionPresentationVariantType',
        PresentationVariant : {
            $Type : 'UI.PresentationVariantType',
            Visualizations : [
                '@UI.LineItem',
            ],
        },
        SelectionVariant : {
            $Type : 'UI.SelectionVariantType',
            SelectOptions : [
            ],
        },
        Text : 'Table View',
    },
    UI.LineItem #tableView : [
    ],
    UI.SelectionPresentationVariant #tableView1 : {
        $Type : 'UI.SelectionPresentationVariantType',
        PresentationVariant : {
            $Type : 'UI.PresentationVariantType',
            Visualizations : [
                '@UI.LineItem#tableView',
            ],
        },
        SelectionVariant : {
            $Type : 'UI.SelectionVariantType',
            SelectOptions : [
            ],
        },
        Text : 'Table View 1',
    }
);
annotate service.Characteristics with {
    characteristicTypeID @(Common.ValueList : {
            $Type : 'Common.ValueListType',
            CollectionPath : 'CharacteristicTypes',
            Parameters : [
                {
                    $Type : 'Common.ValueListParameterInOut',
                    LocalDataProperty : characteristicTypeID_ID,
                    ValueListProperty : 'ID',
                },
                {
                    $Type : 'Common.ValueListParameterDisplayOnly',
                    ValueListProperty : 'characteristicTypeID',
                },
                {
                    $Type : 'Common.ValueListParameterDisplayOnly',
                    ValueListProperty : 'characteristicTypeDescription',
                },
            ],
        },
        Common.ValueListWithFixedValues : false
)};
annotate service.CharacteristicStatus with {
    name @Common.FieldControl : #ReadOnly
};
annotate MyService.QualitativeSelectedSets.qualitativeGroupsList.qualitativeGroupsCodesList with {
    up_ @Common.Text : {
        $value : codeID,
        ![@UI.TextArrangement] : #TextFirst,
    }
};
annotate service.QualitativeSelectedSets with @(
    Communication.Contact #contact : {
        $Type : 'Communication.ContactType',
        fn : selectedSetID,
    }
);
annotate service.QualitativeSelectedSets with {
    selectedSetID @(Common.ValueList : {
            $Type : 'Common.ValueListType',
            CollectionPath : 'QualitativeSelectedSets',
            Parameters : [
                    {
                        $Type : 'Common.ValueListParameterInOut',
                        LocalDataProperty : selectedSetID,
                        ValueListProperty : 'selectedSetID',
                    },
                    {
                        $Type : 'Common.ValueListParameterDisplayOnly',
                        ValueListProperty : 'selectedSetDescription',
                    },
                ],
        },
        Common.ValueListWithFixedValues : false
)};

annotate service.QualitativeSelectedSets with {
    ID @Common.Text : {
            $value : selectedSetID,
            ![@UI.TextArrangement] : #TextLast,
        }
};
annotate MyService.QualitativeSelectedSets.qualitativeGroupsList.qualitativeGroupsCodesList with {
    valuationCode @Common.Text : {
        $value : codeDescription,
        ![@UI.TextArrangement] : #TextLast,
    }
};
annotate service.QualitativeSelectedSets with {
    selectedSetID @Common.FieldControl : #Mandatory
};
annotate service.QualitativeSelectedSets with {
    selectedSetID @Common.Text : selectedSetDescription
};
annotate service.SampleUnitOfMeasure with {
    sampleUnitOfMeasureID @Common.Text : {
            $value : sampleUnitOfMeasureDescription,
            ![@UI.TextArrangement] : #TextLast,
        }
};
annotate service.Characteristics with {
    quantitative_CharacteristicUnitOfMeasure @Common.Text : {
            $value : quantitativeCharacteristicUnitOfMeasure.sampleUnitOfMeasureID,
            ![@UI.TextArrangement] : #TextLast,
        }
};
annotate service.Characteristics with @(
    Communication.Contact #contact1 : {
        $Type : 'Communication.ContactType',
        fn : characterisitcsDetails,
    }
);
annotate service.Characteristics with @(
    UI.FieldGroup #GeneralInformation : {
        $Type : 'UI.FieldGroupType',
        Data : [
        ],
    }
);
annotate service.Characteristics with @(
    UI.Identification : [
        {
            $Type : 'UI.DataField',
            Value : characteristicSamplingProcedureID_ID,
        },{
            $Type : 'UI.DataField',
            Value : characteristicTypeID_ID,
        },]
);
annotate service.Characteristics with @(
    UI.FieldGroup #i18nGeneralInformation : {
        $Type : 'UI.FieldGroupType',
        Data : [],
    }
);
annotate service.Characteristics with @(
    UI.FieldGroup #i18nAdministrativeInformation1 : {
        $Type : 'UI.FieldGroupType',
        Data : [],
    }
);
annotate service.Characteristics with @(
    UI.FieldGroup #i18nAdministrativeInformation11 : {
        $Type : 'UI.FieldGroupType',
        Data : [
            {
                $Type : 'UI.DataField',
                Value : createdAt,
            },{
                $Type : 'UI.DataField',
                Value : createdBy,
            },{
                $Type : 'UI.DataField',
                Value : modifiedAt,
            },{
                $Type : 'UI.DataField',
                Value : modifiedBy,
            },],
    }
);
annotate service.CharacteristicsControlList with {
    name @Common.Text : {
            $value : value,
            ![@UI.TextArrangement] : #TextLast,
        }
};
annotate service.Characteristics with {
    controlIndicatorCode @Common.Text : {
            $value : controlIndicatorCode.name,
            ![@UI.TextArrangement] : #TextLast,
        }
};
annotate service.Characteristics with @(
    UI.FieldGroup #Specifications : {
        $Type : 'UI.FieldGroupType',
        Data : [],
    }
);
annotate service.Characteristics with @(
    UI.FieldGroup #Warnings : {
        $Type : 'UI.FieldGroupType',
        Data : [],
    }
);
annotate service.Characteristics with @(
    UI.FieldGroup #Spe : {
        $Type : 'UI.FieldGroupType',
        Data : [
            {
                $Type : 'UI.DataField',
                Value : quantitative_LowerSpecificationLimit,
                Label : '{i18n>LowerSpecificationLimit}',
            },
            {
                $Type : 'UI.DataField',
                Value : quantitative_UpperSpecificationLimit,
                Label : '{i18n>Upperspecificationlimit}',
            },
            {
                $Type : 'UI.DataFieldForAction',
                Action : 'MyService.SetDefaultSpecifications',
                Label : 'Set Default Specifications',
            },],
    }
);
annotate service.Characteristics with @(
    UI.FieldGroup #warn : {
        $Type : 'UI.FieldGroupType',
        Data : [
            {
                $Type : 'UI.DataField',
                Value : quantitative_LowerWarningLimit,
                Label : '{i18n>LowerWarningLimit}',
            },
            {
                $Type : 'UI.DataField',
                Value : quantitative_UpperWarningLimit,
                Label : '{i18n>UpperWarningLimit}',
            },
            {
                $Type : 'UI.DataFieldForAction',
                Action : 'MyService.SetDefaulWarnings',
                Label : 'Set Default Warnings',
            },],
    }
);
annotate service.Characteristics with @(
    UI.FieldGroup #Warnings1 : {
        $Type : 'UI.FieldGroupType',
        Data : [],
    }
);
annotate service.Characteristics with @(
    UI.FieldGroup #QUlaitative : {
        $Type : 'UI.FieldGroupType',
        Data : [],
    }
);
annotate service.Characteristics with @(
    UI.FieldGroup #GeneralInformation1 : {
        $Type : 'UI.FieldGroupType',
        Data : [
            {
                $Type : 'UI.DataField',
                Value : quantitative,
                Label : '{i18n>Quantitative}',
            },
            {
                $Type : 'UI.DataField',
                Value : quantitative_SingleResultValuation,
                Label : '{i18n>SingleResultValuation}',
            },
            {
                $Type : 'UI.DataField',
                Value : quantitative_QuantitativeDecimalsValue,
                Label : '{i18n>Decimals}',
            },
            {
                $Type : 'UI.DataField',
                Value : quantitativeCharacteristicUnitOfMeasure.characteristics.quantitative_CharacteristicUnitOfMeasure,
                Label : '{i18n>UnitOfMeasure}',
            },
            {
                $Type : 'UI.DataField',
                Value : quantitative_TargetValue,
                Label : '{i18n>Targetvalue}',
            },],
    }
);
annotate service.Characteristics with @(
    UI.FieldGroup #Indicators : {
        $Type : 'UI.FieldGroupType',
        Data : [
            {
                $Type : 'UI.DataField',
                Value : formula,
            },
            {
                $Type : 'UI.DataField',
                Value : partialsample,
                Label : '{i18n>PartialSample1}',
            },
            {
                $Type : 'UI.DataField',
                Value : assayResult,
            },],
    }
);
annotate service.Characteristics with @(
    UI.FieldGroup #Info : {
        $Type : 'UI.FieldGroupType',
        Data : [
             {
                $Type : 'UI.DataField',
                Value : quantitativeCharacteristicUnitOfMeasure.characteristics.characteristicDescription,
            },
            {
                $Type : 'UI.DataField',
                Value : plant_ID,
                Label : '{i18n>Plant}',
            },
            {
                $Type : 'UI.DataField',
                Value : characteristicStatus_value,
                Label : '{i18n>Characteristicstatusvalue}',
            },
            {
                $Type : 'UI.DataField',
                Value : characteristicTypeID_ID,
            },
            {
                $Type : 'UI.DataField',
                Value : controlIndicatorCode_value,
                Label : '{i18n>Controlindicatorcodevalue}',
            },
            {
                $Type : 'UI.DataField',
                Value : controlIndicatorReference,
                Label : '{i18n>Controlindicatorreference}',
            },
            {
                $Type : 'UI.DataField',
                Value : characteristicSamplingProcedureID_ID,
            },
            {
                $Type : 'UI.DataField',
                Value : noOfLabel,
                Label : '{i18n>NoOfLabels}',
            },],
    }
);
annotate MyService.QualityGroups.operations.characteristics with {
    qualitative @Common.Text : quantitative_LowerSpecificationLimit
};
annotate service.Characteristics with {
    characteristicStatus @Common.ValueListWithFixedValues : true
};


annotate service.Characteristics with @(
    UI.SelectionFields : []
);
annotate service.Characteristics with {
    characteristicTypeID @Common.Text : characteristicTypeID.characteristicTypeID
};
annotate service.Characteristics with {
    characteristicStatus @Common.Text : {
            $value : characteristicStatus.name,
            ![@UI.TextArrangement] : #TextLast,
        }
};
annotate service.Characteristics with {
    controlIndicatorCode @Common.ValueListWithFixedValues : true
};
annotate service.EventTypes with {
    value @Common.Text : {
        $value : name,
        ![@UI.TextArrangement] : #TextLast,
    }
};
annotate service.Characteristics with {
    plant @Common.Text : {
            $value : plant.plantID,
            ![@UI.TextArrangement] : #TextOnly,
        }
};
annotate service.Characteristics with @(
    Common.SideEffects #Quantitative_to_qualitative_qualifier : {
        SourceProperties : [
            'quantitative',
        ],
        TargetProperties : [
            'qualitative',
        ],
    }
);
annotate service.Characteristics with @(
    Common.SideEffects #qualitative_to_Quantitative_qualifier : {
        SourceProperties : [
            'qualitative',
        ],
        TargetProperties : [
            'quantitative',
        ],
    }
);

annotate service.Characteristics with @(
    Common.DefaultValuesFunction : 'getCharacteristicsDefaults'
);
annotate service.QualitativeSelectedSets with @(
    Communication.Contact #contact1 : {
        $Type : 'Communication.ContactType',
        fn : plant,
    }
);

annotate service.Plants with @ 
(
    UI.FieldGroup #plantdata : 
    {
        Data : 
        [
            {Value : plantName},
            {Value : plantID},
            {Value : plantLocation},
            
        ],
    },
);

/**UI.HeaderInfo
    Search-Term: #QuickView
 *///Header Info is also displayed in a quick view facet

annotate service.Plants with @
(
       UI.HeaderInfo : 
    {
        TypeName        : 'Plant',
        TypeNamePlural  : 'Plants',
        Title           : 
        {
            $Type : 'UI.DataField',
            Value : 'Plant Information',
        },
        Description     : 
        {
            $Type : 'UI.DataField',
            Value : plantName,
        },
        ImageUrl        : '',
        TypeImageUrl    : 'sap-icon://blank-tag',
    },
);
    /*
    When a semantic object for the entity is defined, the related apps will be shown 
    below the quick view facet on the panel.
    */
annotate service.Plants with @
(    
    UI.QuickViewFacets : 
    [
        {
            $Type   : 'UI.ReferenceFacet',
            Target  : '@UI.FieldGroup#plantdata',
            Label   : 'Plant',
        }
    ],
);

annotate service.Characteristics with @(
    UI.DataPoint #characteristicID : {
        $Type : 'UI.DataPointType',
        Value : characteristicID,
        Title : 'characteristicID',
    }
);
annotate service.Characteristics with @(
    UI.DataPoint #characteristicID1 : {
        $Type : 'UI.DataPointType',
        Value : characteristicID,
        Title : '{i18n>Characteristicid}',
        Criticality : noOfLabel,
        ![@Common.QuickInfo] : 'Characteristics ',
    }
);
annotate service.Characteristics with @(
    UI.FieldGroup #h : {
        $Type : 'UI.FieldGroupType',
        Data : [
        ],
    }
);
annotate service.Characteristics with @(
    UI.FieldGroup #HeaderFacets1 : {
        $Type : 'UI.FieldGroupType',
        Data : [
            {
                $Type : 'UI.DataField',
                Value : characteristicID,
                Label : '{i18n>Characteristicid}',
            },
            {
                $Type : 'UI.DataField',
                Value : characteristicDescription,
                Label : '{i18n>CharacteristicsDescription}',
            },
            {
                $Type : 'UI.DataField',
                Value : quantitativeCharacteristicUnitOfMeasure.characteristics.characteristicStatus_value,
            },
            {
                $Type : 'UI.DataField',
                Value : plant_ID,
            },],
    }
);
annotate service.Characteristics with @(
    UI.FieldGroup #Subsect : {
        $Type : 'UI.FieldGroupType',
        Data : [
        ],
    }
);
annotate service.Characteristics with @(
    UI.FieldGroup #l : {
        $Type : 'UI.FieldGroupType',
        Data : [
        ],
    }
);
annotate service.Characteristics with @(
    UI.DataPoint #progress2 : {
        $Type : 'UI.DataPointType',
        Value : noOfLabel,
        Title : 'noOfLabel',
        TargetValue : 100,
        Visualization : #Progress,
    }
);
annotate service.Characteristics with @(
    UI.DataPoint #noOfLabel1 : {
        Value : noOfLabel,
        MinimumValue : 0,
        MaximumValue : 4,
    },
    UI.Chart #noOfLabel1 : {
        ChartType : #Bullet,
        Title : '{i18n>NoofLabels}',
        Measures : [
            noOfLabel,
        ],
        MeasureAttributes : [
            {
                DataPoint : '@UI.DataPoint#noOfLabel1',
                Role : #Axis1,
                Measure : noOfLabel,
            },
        ],
    }
);
annotate service.Characteristics with @(
    UI.DataPoint #progress3 : {
        $Type : 'UI.DataPointType',
        Value : masterInspectionCharID,
        Title : 'masterInspectionCharID',
        TargetValue : 100,
        Visualization : #Progress,
    }
);
annotate service.Characteristics with {
    plant @(Common.ValueList : {
            $Type : 'Common.ValueListType',
            CollectionPath : 'Plants',
            Parameters : [
                {
                    $Type : 'Common.ValueListParameterInOut',
                    LocalDataProperty : plant_ID,
                    ValueListProperty : 'ID',
                },
                {
                    $Type : 'Common.ValueListParameterDisplayOnly',
                    ValueListProperty : 'plantID',
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
        Common.ValueListWithFixedValues : false
)};
annotate service.Characteristics with {
    characteristicSamplingProcedureID @Common.Text : characteristicSamplingProcedureID.sampleDrawingProcedureDescription
};
annotate service.SampleDrawingProcedures with {
    ID @Common.Text : sampleDrawingProcedureID
};



 
    // {
    //     characteristicDescription @Common.Text : characteristicStatus_value @Common.TextArrangement #TextFirst;
    // };
 
annotate service.Characteristics with @ (
     
     UI.FieldGroup #data : {
        Data    : [
            {Value : characteristicStatus_value},
            {Value : characteristicTypeID_ID},
            {Value : controlIndicatorCode_value},
            {Value : characteristicDescription}
        ],
    },
    UI.HeaderInfo    :
    {
        TypeName            : 'characteristicID',
        TypeNamePlural      : 'characteristics',
        Title :
        {
            $Type : 'UI.DataField',
            Value : 'Characteristics',
        },
        
        //  Description :
        // {    
        //     $Type : 'UI.DataField',
        //     Value       : '{i18n>CharacteristicDescription}',   
        // },
        ImageUrl        : '',
        TypeImageUrl    : 'sap-icon://blank-tag',
        
    },

    UI.QuickViewFacets :
    [
        {
            $Type : 'UI.ReferenceFacet',
            Target : '@UI.FieldGroup#data',
            Label : 'Characteristics',
        }

    ]
);

annotate service.Plants with {
    ID @Common.Text : plantID
};
// annotate service.Characteristics with @ (
//  UI.QuickViewFacets : [
//         {
//             $Type   : 'UI.ReferenceFacet',
//             Target  : '@UI.FieldGroup#data',
//             Label   : '{i18n>ChildEntity2}',
//         }
//     ],
// );
