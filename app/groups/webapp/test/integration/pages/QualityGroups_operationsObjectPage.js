sap.ui.define(['sap/fe/test/ObjectPage'], function(ObjectPage) {
    'use strict';

    var CustomPageDefinitions = {
        actions: {},
        assertions: {}
    };

    return new ObjectPage(
        {
            appId: 'quality.groups.groups',
            componentId: 'QualityGroups_operationsObjectPage',
            entitySet: 'QualityGroups_operations'
        },
        CustomPageDefinitions
    );
});