sap.ui.require(
    [
        'sap/fe/test/JourneyRunner',
        'sap/fe/demo/classification/test/integration/FirstJourney',
		'sap/fe/demo/classification/test/integration/pages/ClassificationsList',
		'sap/fe/demo/classification/test/integration/pages/ClassificationsObjectPage',
		'sap/fe/demo/classification/test/integration/pages/Classifications_DistributionListObjectPage'
    ],
    function(JourneyRunner, opaJourney, ClassificationsList, ClassificationsObjectPage, Classifications_DistributionListObjectPage) {
        'use strict';
        var JourneyRunner = new JourneyRunner({
            // start index.html in web folder
            launchUrl: sap.ui.require.toUrl('sap/fe/demo/classification') + '/index.html'
        });

       
        JourneyRunner.run(
            {
                pages: { 
					onTheClassificationsList: ClassificationsList,
					onTheClassificationsObjectPage: ClassificationsObjectPage,
					onTheClassifications_DistributionListObjectPage: Classifications_DistributionListObjectPage
                }
            },
            opaJourney.run
        );
    }
);