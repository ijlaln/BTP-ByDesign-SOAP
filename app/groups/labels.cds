using  { aqm.planning  as QualityPlaning}  from '../../db/quality-planning';



annotate QualityPlaning.QualityGroups with 
{
                    groupID                    @title : '{i18n>GroupID}';
                    GroupDescription           @title : '{i18n>GroupDescription}';
                    groupTypes                 @title : '{i18n>GroupTypes}';
                    Plant                      @title : '{i18n>Plant}';
                    classifications            @title : '{i18n>ClassifcationID}';
                    GroupStatus_value          @title : '{i18n>Status}';                    
                    ValidFrom                  @title : '{i18n>ValidFram}';                    
                    ValidTo                    @title : '{i18n>ValidTo}';
                    MonoGraph                  @title : '{i18n>MonoGraph}';
                    revisionNumber             @title : '{i18n>RevisionNo}';
                    RevisionEffectiveDate      @title : '{i18n>RevisionEffectiveDate}';
                    operations                 @title : '{i18n>Operations}';         

};

annotate QualityPlaning.QualityGroup_Operations with 
{
                    operationID                @title : '{i18n>OperationID}';
                    OperationDescription       @title : '{i18n>OperationDescription}';
                    operationStatus            @title : '{i18n>Status}';
                    groupsUnitOfMeasure        @title : '{i18n>UnitofMeasure}';
                    workCenter                 @title : '{i18n>WorkCenter}';
                    authorizationLevel         @title : '{i18n>AuthorizationLevel}';
                    ControlKeys                @title : '{i18n>ControlKeys}';
                    lableprinting              @title : '{i18n>LabelPrinting}';
                    characteristics            @title : '{i18n>Characteristics}';
};

