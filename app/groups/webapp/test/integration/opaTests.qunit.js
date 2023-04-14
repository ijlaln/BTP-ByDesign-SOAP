sap.ui.require(
    [
        'sap/fe/test/JourneyRunner',
        'quality/groups/groups/test/integration/FirstJourney',
		'quality/groups/groups/test/integration/pages/QualityGroupsList',
		'quality/groups/groups/test/integration/pages/QualityGroupsObjectPage',
		'quality/groups/groups/test/integration/pages/QualityGroups_operationsObjectPage'
    ],
    function(JourneyRunner, opaJourney, QualityGroupsList, QualityGroupsObjectPage, QualityGroups_operationsObjectPage) {
        'use strict';
        var JourneyRunner = new JourneyRunner({
            // start index.html in web folder
            launchUrl: sap.ui.require.toUrl('quality/groups/groups') + '/index.html'
        });

       
        JourneyRunner.run(
            {
                pages: { 
					onTheQualityGroupsList: QualityGroupsList,
					onTheQualityGroupsObjectPage: QualityGroupsObjectPage,
					onTheQualityGroups_operationsObjectPage: QualityGroups_operationsObjectPage
                }
            },
            opaJourney.run
        );
    }
);