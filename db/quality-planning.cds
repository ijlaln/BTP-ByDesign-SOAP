namespace aqm.planning;

using {
    managed,
    sap
} from '@sap/cds/common';

using {
    aqm.codelists.AuthorizationLevel,
    aqm.codelists.BatchStatus,
    aqm.codelists.CharacteristicCategoryTypes,
    aqm.codelists.CharacteristicsCoC,
    aqm.codelists.CharacteristicsControlList,
    aqm.codelists.CharacteristicStatus,
    aqm.codelists.ControlKeys,
    aqm.codelists.ElectronicSignatureDocumentType,
    aqm.codelists.EventTypes,
    aqm.codelists.GroupTypes,
    aqm.codelists.InspectionStatusType,
    aqm.codelists.InventoryStatusAfterDecision,
    aqm.codelists.OperationStatusType,
    aqm.codelists.PinValidateMsg,
    aqm.codelists.PrintQueueDocumentType,
    aqm.codelists.QualitativeDefectClasses,
    aqm.codelists.QualitativeValuationCodes
} from './custom-codelists';

using {
    aqm.customtype.ID,
    aqm.customtype.NumID,
    aqm.customtype.MaterialID,
    aqm.customtype.OrganisationalCenterId,
    aqm.customtype.Name,
    aqm.customtype.DescriptionText,
    aqm.customtype.ExtendedText,
    aqm.customtype.DecimalValue,
    aqm.customtype.Indicator
} from './custom-types';

aspect Qualitative_Characteristics {
    qualitative            : Indicator                              @title: '{i18n>Qualitative}';
    qualitativeSelectedSet : Association to QualitativeSelectedSets @title: '{i18n>QualitativeSelectedSet}';
}

aspect Quantitative_Characteristics {
    quantitative                              : Indicator    @title: '{i18n>Quantitative}';
    quantitative_DependantCharacteristicSpecs : Indicator    @title: '{i18n>DependentCharacteristics}';
    quantitative_QuantitativeDecimalsValue    : DecimalValue @title: '{i18n>Decimals}';
    quantitative_CharacteristicUnitOfMeasure  : ID           @title: '{i18n>UnitofMeasure}';
    quantitative_LowerSpecificationLimit      : Name         @title: '{i18n>LowerSpecificationLimit}';
    quantitative_UpperSpecificationLimit      : Name         @title: '{i18n>UpeerSpecificationLimit}';
    quantitative_TargetValue                  : Name         @title: '{i18n>TargetValue}';
    quantitative_LowerWarningLimit            : Name         @title: '{i18n>LowerWarningLimit}';
    quantitative_UpperWarningLimit            : Name         @title: '{i18n>UpperWarningLimit}';
    quantitative_SingleResultValuation        : Indicator    @title: '{i18n>SingleResultValuation}';
}

entity Characteristics : managed, Qualitative_Characteristics, Quantitative_Characteristics {
    @mandatory key characteristicID                        : ID                                        @title: '{i18n>characteristicsID}'; //@(Core.Computed: true);
                   characteristicDescription               : DescriptionText                           @title: '{i18n>CharacteristicsDescription}';
                   characteristicStatus                    : Association to CharacteristicStatus       @title: '{i18n>CharacteristicStatus}';
                   characteristicTypeID                    : Association to CharacteristicTypes        @title: '{i18n>CharacteristicTypes}';
                   inspectionCharID                        : DecimalValue                              @title: '{i18n>InspectionCharID}';
                   masterInspectionCharID                  : DecimalValue                              @title: '{i18n>MasterInspectionChar ID}';
                   controlIndicatorCode                    : Association to CharacteristicsControlList @title: '{i18n>ControlIndicator}';
                   controlIndicatorReference               : ID                                        @title: '{i18n>ControlIndicatorReference}';
                   partialsample                           : Indicator default false                   @title: '{i18n>PartialSample}';
                   characteristicSamplingProcedureID       : Association to SampleDrawingProcedures    @title: '{i18n>SampleDrawingProcedure}';
                   formula                                 : Indicator default false                   @title: '{i18n>Formula}';
                   dataOriginID                            : Association to DataOrigins                @title: '{i18n>DataOrigin}';
                   quantitativeCharacteristicUnitOfMeasure : Association to SampleUnitOfMeasure        @title: '{i18n>UnitofMeasure}';
                   characterisitcsDetails                  : ExtendedText                              @title: '{i18n>ChacacteristicsDetails}';
                   characterisitcsLongText                 : DescriptionText                           @title: '{i18n>CharacteristicsLongText}';
                   infoField1                              : DescriptionText                           @title: '{i18n>InfoField1}';
                   infoField2                              : DescriptionText                           @title: '{i18n>InfoField2}';
                   noOfLabel                               : Integer                                   @title: '{i18n>NoofLabels}';
                   assayResult                             : Indicator                                 @title: '{i18n>Assay/PotencyResult}';
                   plant                                   : Association to Plants                     @title: '{i18n>Plant}';
};

//@cds.autoexpose
entity DataOrigins                                                @(Capabilities: {
    // entity-level
    InsertRestrictions.Insertable: true,
    UpdateRestrictions.Updatable : false,
    DeleteRestrictions.Deletable : false
}) : managed {
    @mandatory key ID                    : UUID @UI.Hidden        @(Core.Computed: true);
                   dataOriginID          : ID                     @title: '{i18n>DataOriginID}';
                   dataOriginDescription : ExtendedText           @title: '{i18n>DataOriginDescription}';
                   isActive              : Indicator default true @title: '{i18n>IsActive}';
                   characteristics       : Association to many Characteristics
                                               on characteristics.dataOriginID = $self;
};

entity SampleUnitOfMeasure : managed {
    @mandatory key ID                             : UUID @UI.Hidden      @(Core.Computed: true);
                   sampleUnitOfMeasureID          : ID                   @title: '{i18n>SampleUnitofMeasureID}';
                   sampleUnitOfMeasureDescription : DescriptionText      @title: '{i18n>SampleUnitofMeasureDescription}';
                   sampleUnitOfMeasureDetails     : ExtendedText         @title: '{i18n>SampleUnitofMeasureDetail}';
                   isActive                       : Boolean default true @title: '{i18n>IsActive}';
                   characteristics                : Association to many Characteristics
                                                        on characteristics.quantitativeCharacteristicUnitOfMeasure = $self;
};

entity Plants : managed {
    @mandatory key ID            : UUID  @UI.Hidden     @(Core.Computed: true);
                   plantID       : ID                   @title: '{i18n>PlantID}';
                   plantName     : DescriptionText      @title: '{i18n>PlantName}';
                   plantLocation : DescriptionText      @title: '{i18n>PlantLocation}';
                   isActive      : Boolean default true @title: '{i18n>IsActive}';
                   characteristics                   : Association to many Characteristics
                                                           on characteristics.plant = $self;
};

entity SampleDrawingProcedures : managed {
    @mandatory key ID                                : UUID @UI.Hidden        @(Core.Computed: true);
                   sampleDrawingProcedureID          : ID                     @title: '{i18n>SampleDrawingProcedureID}';
                   sampleDrawingProcedureDescription : ExtendedText           @title: '{i18n>SampleDrawingProcedureDescription}';
                   isActive                          : Indicator default true @title: '{i18n>IsActive}';
                   characteristics                   : Association to many Characteristics
                                                           on characteristics.characteristicSamplingProcedureID = $self;
}

entity CharacteristicTypes : managed {
    @mandatory key ID                            : UUID @UI.Hidden        @(Core.Computed: true);
                   characteristicTypeID          : ID                     @title: '{i18n>CharacteristicTypeID}';
                   characteristicTypeDescription : ExtendedText           @title: '{i18n>CharacteristicTypeDescription}';
                   isActive                      : Indicator default true @title: '{i18n>IsActive}';
                   characteristics               : Association to many Characteristics
                                                       on characteristics.characteristicTypeID = $self;
}

entity QualitativeCodes : managed {
    @mandatory key ID              : UUID   @UI.Hidden                        @(Core.Computed: true);
                   plant           : OrganisationalCenterId                   @title: '{i18n>Plant}';
                   codeID          : ID                                       @title: '{i18n>CodeID}';
                   codeDescription : ExtendedText                             @title: '{i18n>CodeDescription}';
                   valuationCode   : Association to QualitativeValuationCodes @title: '{i18n>ValuationCode}';
                   defectClass     : Association to QualitativeDefectClasses  @title: '{i18n>DefectClass}';
                   isActive        : Indicator default true;
};

entity QualitativeCodeGroups : managed {
    @mandatory key ID                   : UUID  @UI.Hidden @(Core.Computed: true);
                   plant                : OrganisationalCenterId;
                   codeGroupID          : ID                                    @title: '{i18n>CodeGroupID}';
                   codeGroupDescription : ExtendedText                          @title: '{i18n>CodeGroupDescription}';
                   isActive             : Indicator default true;
                   qualitativeCodesList : Composition of many {
                                              key QualitativeCodesListID : Integer;
                                                  qualitativeCodes       : Association to QualitativeCodes;
                                          }
};

entity QualitativeSelectedSets : managed {
    @mandatory key ID                     : UUID      @UI.Hidden                 @(Core.Computed: true);
                   plant                  : OrganisationalCenterId;
                   selectedSetID          : ID                                   @title: '{i18>SelectedSetID}';
                   selectedSetDescription : ExtendedText                         @title: '{i18n>SelectedSetDescription}';
                   isActive               : Indicator default true               @title: '{i18n>IsActive}';
                   qualitativeGroupsList  : Composition of many QualitativeSelectSet_QualitativeGroups;
};

aspect QualitativeSelectSet_QualitativeGroups {
    @mandatory key  qualitativeCodesGroupsListID       :  UUID    @UI.Hidden;                                                                        
                    qualitativeCodeGroups              : Association to QualitativeCodeGroups           @title : '{i18n>QualitativeCodeGroups}';
                    qualitativeGroupsCodesList         : Composition of many QualitativeSelectSet_QualitativeGroups_QualitativeCodes;
}

aspect QualitativeSelectSet_QualitativeGroups_QualitativeCodes {
    @mandatory key QualitativeCodesListID : UUID @UI.Hidden @(Core.Computed: true);
    qualitativeCodes                      : Association to QualitativeCodes;
    codeID                                : ID                                                            @title : '{i18n>CodeID}';
    codeDescription                       : ExtendedText                                                  @title : '{i18n>CodeDescription}';
    valuationCode                         : Association to QualitativeValuationCodes                      @title : '{i18n>ValuatiopnCode}';
    defectClass                           : Association to QualitativeDefectClasses                       @title : '{i18n>DefectClass}';
    isActive                              : Indicator default true;
}

entity QualityGroups : managed {
    @mandatory key  ID          : UUID  @UI.Hidden @(Core.Computed: true);
                    groupID                     : ID                                          ;
                    GroupDescription            : ExtendedText;                                          
                    groupTypes                  : Association to GroupTypes; 
                    Plant                       : Association to Plants;
                    classifications             : Association to Classifications;
                    GroupStatus_value           : Association to CharacteristicStatus;
                    ValidFrom                   : DateTime;           
                    ValidTo                     : DateTime;
                    MonoGraph                   : DescriptionText;
                    revisionNumber              : NumID;
                    RevisionEffectiveDate       : DateTime;
                    operations                  : Composition of many QualityGroup_Operations;         
};

aspect QualityGroup_Operations {
    @mandatory key  ID                          : NumID @(Core.Computed: true); 
                    OperationDescription        : ExtendedText;
                    operationID                 : ID;
                    operationStatus             : Association to OperationStatusType;
                    groupsUnitOfMeasure         : Association to SampleUnitOfMeasure;
                    workCenter                  : ExtendedText;
                    ControlKeys                  : Association to ControlKeys;
                    authorizationLevel          : Association to AuthorizationLevel;
                    lableprinting               : Indicator;
                    ValidFrom                   : Association to QualityGroups;           
                    ValidTo                     : Association to QualityGroups;
                    characteristics             : Composition of many QualityGroup_Operations_Characteristics;
                    plant                       : Association to Plants;
}


aspect QualityGroup_Operations_Characteristics : Qualitative_Characteristics, Quantitative_Characteristics {
    @mandatory key  ID                                    : UUID;
                    groupscharacteristicID                : ID;
                    groupscharacteristicDescription       : ExtendedText;
                    formuText                             : ExtendedText;
                    CoCDeviation                          : Association to CharacteristicsCoC;
                    CoCChangeControl                      : Association to CharacteristicsCoC;
                    //inspectionMethodID                    :

                    sequenceNo                            : NumID;
                    dependentCharacteristics              : Composition of many QualityGroup_Operation_Characteristic_DependentCharacteristics;
}

aspect QualityGroup_Operation_Characteristic_DependentCharacteristics : Quantitative_Characteristics {
    @mandatory key  dependentCharacteristicID           : UUID;
                    materialID                          : MaterialID;
                    characteristicDescription           : ExtendedText;
                    
}

entity Classifications : managed {
    @mandatory key ID          : UUID @UI.Hidden @(Core.Computed: true)                      @title : '{i18n>ClassificationID}';
                   classificationID          : ID;
                   classificationDescription : DescriptionText                                             @title : '{i18n>ClassificationDescription}';
                   plant                     : Association to Plants                                       @title : '{i18n>Plant}';
                   monograpgh                : DescriptionText                                             @title : '{i18n>MonoGraph}';
                   revisionNo                : DescriptionText                                             @title : '{i18n>RevisionNO}';
                   masterInspectionCharID    : DecimalValue                                                @title : '{i18n>MasterInspectionID}';
                   isActive                  : Indicator default true                                      @title : '{i18n>Active}';
                   distributionList          : Composition of many Classifications_DistributionList
                                                   on distributionList.parent = $self;
                qualityGroups               : Composition of many QualityGroups
                                                   on qualityGroups.classifications = $self;
};

entity Classifications_DistributionList {
    @mandatory key distributionGroupID : UUID   @UI.Hidden                                                  @title : '{i18n>DistributionGroupID}';
    key            parent              : Association to Classifications                                     @title : '{i18n>Parent}';
                   eventType           : Association to EventTypes                                          @title : '{i18n>EventTypes}';
                   isActive            : Indicator default true                                             @title : '{i18n>Active}';
};
