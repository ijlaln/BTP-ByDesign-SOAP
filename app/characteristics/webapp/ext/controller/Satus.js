sap.ui.define([
    "sap/m/MessageToast"
], function(MessageToast) {
    'use strict';

    return {
        Status: function(oEvent) {
            MessageToast.show("Custom handler invoked.");
        }
    };
});
