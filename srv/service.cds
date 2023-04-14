using {aqm.planning as aqm} from '../db/quality-planning';

// @protocol: 'none'
service MyService {
   
  @(restrict: [
    { grant: ['*'], to: 'authenticated-user'},
    { grant: ['READ','CREATE'], to : 'reviewer'},
    { grant: ['*'], to: 'admin'}
 ]) 
 entity Characteristics as projection on aqm.Characteristics actions {
    action SetDefaultSpecifications();
    action SetDefaulWarnings(); 
};


 function getCharacteristicsDefaults() returns Characteristics;

//@readonly 
entity DataOrigins as projection on aqm.DataOrigins;
entity SampleDrawingProcedures as projection on aqm.SampleDrawingProcedures;
entity SampleUnitOfMeasure as projection on aqm.SampleUnitOfMeasure;
entity CharacteristicTypes as projection on aqm.CharacteristicTypes;
entity Plants as projection on aqm.Plants;

entity Classifications as projection on aqm.Classifications;

//entity QualityGroups as projection on aqm.QualityGroups;

entity QualitativeCodes as projection on aqm.QualitativeCodes;
entity QualitativeCodeGroups as projection on aqm.QualitativeCodeGroups;
entity QualitativeSelectedSets as projection on aqm.QualitativeSelectedSets;

}

service QualityGroupsService {
   
  @(restrict: [
    { grant: ['*'], to: 'authenticated-user'},
    { grant: ['READ','CREATE'], to : 'reviewer'},
    { grant: ['*'], to: 'admin'}
 ]) 
entity QualityGroups as projection on aqm.QualityGroups;


entity Characteristics as projection on aqm.Characteristics;



//@readonly 
entity DataOrigins as projection on aqm.DataOrigins;
entity SampleDrawingProcedures as projection on aqm.SampleDrawingProcedures;
entity SampleUnitOfMeasure as projection on aqm.SampleUnitOfMeasure;
entity CharacteristicTypes as projection on aqm.CharacteristicTypes;
entity Plants as projection on aqm.Plants;

entity Classifications as projection on aqm.Classifications;



entity QualitativeCodes as projection on aqm.QualitativeCodes;
entity QualitativeCodeGroups as projection on aqm.QualitativeCodeGroups;
entity QualitativeSelectedSets as projection on aqm.QualitativeSelectedSets;

}



//annotate MyService with @(requires: ['authenticated-user']);
//annotate MyService.Characteristics with @(requires: ['Reviewer', 'Admin']);