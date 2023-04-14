using MyService as service from '../../srv/service';
using from '../../db/custom-codelists';
using from '../../db/quality-planning';

annotate service.Characteristics @(Common : {
    SideEffects #CharacteristicStatusChange : {
        SourceProperties : ['characteristicID'],
        TargetEntities   : [characteristicStatus]
    }
});

annotate service.Characteristics @(Common : {
    SideEffects #CharacteristicsDescriptionChange  : {
        SourceProperties : ['characteristicID'],
        TargetProperties : ['characteristicDescription']
    }
});