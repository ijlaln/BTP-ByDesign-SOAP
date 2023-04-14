

const {
    readSalesOrdersFromSAP
} = require('./lib/handlers');

module.exports = cds.service.impl(async function () {
    /*** SERVICE ENTITIES ***/
    const {
      SalesOrder
    } = this.entities;

    /*** HANDLERS REGISTRATION ***/
    // ON events
    this.on('READ', SalesOrder, readSalesOrdersFromSAP);
});