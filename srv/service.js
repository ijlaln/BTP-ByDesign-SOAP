const cds = require('@sap/cds'); require('./workarounds')
class MyService extends cds.ApplicationService {
  init() {
    const { Characteristics } = this.entities;


    cds.on('bootstrap', app => {
      app.get('/health', (_, res) => {
        res.status(200).send('OK....')
      })
    })


    this.before('PATCH', 'Characteristics', async (req) => 
    {

      const { plant, qualitative, quantitative, quantitative_LowerSpecificationLimit, quantitative_UpperSpecificationLimit, quantitative_LowerWarningLimit, quantitative_UpperWarningLimit, quantitative_TargetValue } = req.data

      if (qualitative === true ) 
      {
        req.data.quantitative = false;
      } 
    else 
      if (quantitative === true) 
      {
      req.data.qualitative = false;
      }

    }
  );


    this.on('getCharacteristicsDefaults', async req => {
      return {
      characteristicStatus_value : 'IP' };
    });

    this.on('SetDefaultSpecifications', Characteristics, async req => {
      //await cds.update(Orders, req.params[0].ID).set({status: 'In Process'});
      await cds.update(Characteristics, req.params[0].characteristicID).set(
        {
          quantitative_LowerSpecificationLimit : '4',
          quantitative_UpperSpecificationLimit : '15',
          quantitative_TargetValue : '8'
      });

    });
    
    this.on('SetDefaulWarnings', Characteristics, async req => {
      await cds.update(Characteristics, req.params[0].characteristicID).set(
        {
          quantitative_LowerWarningLimit : '2',
          quantitative_UpperWarningLimit : '18',
          quantitative_TargetValue : '8'
      });

    });


    this.before('SAVE', 'Characteristics', async (req) => {
      //const { charID } = await SELECT.one`max(characteristicID) as charID`.from(Characteristics)
      //req.data.characteristicID = charID + 10;
      // const { qualitativeIndicator } = await SELECT`qualitative as qualitativeIndicator`.from(Characteristics);
      // const { quantitativeIndicator } = await SELECT`quantitative as quantitativeIndicator`.from(Characteristics);
      // const { lowerWarnLimit } = await SELECT`quantitative_LowerWarningLimit as lowerWarnLimit`.from(Characteristics);
      // const { upperWarnLimit } = await SELECT`quantitative_UpperWarningLimit as upperWarnLimit`.from(Characteristics);

      const { plant, qualitative, quantitative, quantitative_LowerSpecificationLimit, quantitative_UpperSpecificationLimit, quantitative_LowerWarningLimit, quantitative_UpperWarningLimit, quantitative_TargetValue } = req.data

      // if (plant == null) {
      //   throw req.error(400, 'Plant is mandatory');
      // }
      if (qualitative === true && quantitative === true) {
        throw req.error(400, 'Both Qualitative and Quantitative cannot be selected')
      } else if (
        qualitative === false && quantitative === false) {
        throw req.error(400, 'At least one from Qualitative or Quantitative must be selected')
      }
      if (quantitative === true) {
        if (quantitative_LowerSpecificationLimit !== null && quantitative_UpperSpecificationLimit !== null) {
          if (parseInt(quantitative_LowerSpecificationLimit) > parseInt(quantitative_UpperSpecificationLimit)) {
            throw req.error(400, 'Lower Specification Limit cannot be greater than Upper Specification Limit')
          }
        }
        if (quantitative_LowerWarningLimit !== null && quantitative_UpperWarningLimit !== null) {
          if (parseInt(quantitative_LowerWarningLimit) > parseInt(quantitative_UpperWarningLimit)) {
            throw req.error(400, 'Lower Warning Limit cannot be greater than Upper Warning Limit')
          }
        }
        if (quantitative_UpperSpecificationLimit !== null && quantitative_TargetValue !== null) {
          if (parseInt(quantitative_TargetValue) >= parseInt(quantitative_UpperSpecificationLimit)) {
            throw req.error(400, 'Upper Specification Limit must be greater than Target Value')
          }
        }
        if (quantitative_UpperWarningLimit !== null && quantitative_TargetValue !== null) {
          if (parseInt(quantitative_TargetValue) >= parseInt(quantitative_UpperWarningLimit)) {
            throw req.error(400, 'Upper Warning Limit must be greater than Target Value')
          }
        }
        if (quantitative_LowerSpecificationLimit !== null && quantitative_TargetValue !== null) {
          if (parseInt(quantitative_LowerSpecificationLimit) > parseInt(quantitative_TargetValue)) {
            throw req.error(400, 'Lower Specification Limit must be lesser than or equal to Target Value')
          }
        }
        if (quantitative_LowerWarningLimit !== null && quantitative_TargetValue !== null) {
          if (parseInt(quantitative_LowerWarningLimit) > parseInt(quantitative_TargetValue)) {
            throw req.error(400, 'Lower Warning Limit must be lesser than or equal to Target Value')
          }
        }
      }

    });
    // Add base class's handlers. Handlers registered above go first.
    return super.init();
  }

}
module.exports = { MyService };
