sap.ui.define(['sap/fe/test/ObjectPage'], function(ObjectPage) {
    'use strict';

    var CustomPageDefinitions = {
        actions: {},
        assertions: {}
    };

    return new ObjectPage(
        {
            appId: 'sap.fe.demo.classification',
            componentId: 'Classifications_DistributionListObjectPage',
            entitySet: 'Classifications_DistributionList'
        },
        CustomPageDefinitions
    );
});