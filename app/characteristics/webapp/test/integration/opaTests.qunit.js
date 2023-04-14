sap.ui.require(
    [
        'sap/fe/test/JourneyRunner',
        'sap/fe/demo/characteristics/test/integration/FirstJourney',
		'sap/fe/demo/characteristics/test/integration/pages/CharacteristicsList',
		'sap/fe/demo/characteristics/test/integration/pages/CharacteristicsObjectPage'
    ],
    function(JourneyRunner, opaJourney, CharacteristicsList, CharacteristicsObjectPage) {
        'use strict';
        var JourneyRunner = new JourneyRunner({
            // start index.html in web folder
            launchUrl: sap.ui.require.toUrl('sap/fe/demo/characteristics') + '/index.html'
        });

       
        JourneyRunner.run(
            {
                pages: { 
					onTheCharacteristicsList: CharacteristicsList,
					onTheCharacteristicsObjectPage: CharacteristicsObjectPage
                }
            },
            opaJourney.run
        );
    }
);