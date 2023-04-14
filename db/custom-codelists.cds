namespace aqm.codelists;
using {sap} from '@sap/cds/common';

entity AuthorizationLevel : sap.common.CodeList {
  key value : String enum {
    DOC = 'Document';
    QC = 'Quality Control';
    QA  = 'Quality Assurance';
    QCR  = 'Quality Control Release';
    QAR = 'Quality Assurance Release';
  };
}

entity CharacteristicCategoryTypes : sap.common.CodeList {
  key value : String enum {
    REQ = 'Required';
    OPT = 'Optional';
    DEP  = 'Dependent';
    DEP_R  = 'Dependednt Required';
    DEP_N_R = 'Dependednt Not Required';
  };
}

entity BatchStatus : sap.common.CodeList {
  key value : String enum {
    O = 'Open';
    C = 'Close';
  };
}

entity CharacteristicsCoC : sap.common.CodeList {
  key value : String enum {
    CoC_D = 'CoC Deviation';
    CoC_CC = 'CoC Change Control';
  };
}

entity CharacteristicsControlList : sap.common.CodeList {
  key value : String enum {
    RC = 'Required Characteristic';
    OC = 'Optional Characteristic';
    AA  = 'After Accept';
    AR  = 'After Reject';
  };
}

entity CharacteristicStatus : sap.common.CodeList {
  key value : String enum {
    IP = 'In Process';
    R  = 'Released';
    B  = 'Blocked';
  };
}

entity ControlKeys : sap.common.CodeList {
  key value : String enum {
    C0 = '0';
    C1 = '1';
    C2 = '2';
  };
}

entity ElectronicSignatureDocumentType : sap.common.CodeList {
  key value : String enum {
    ESDT1 = 'Operation Characteristics Sign 1';
    ESDT2 = 'Operation Characteristics Sign 2';
    ESDT3  = 'Operations Characterisitcs Sign UnLock';
    ESDT4  = 'Complete Operation';
    ESDT5 = 'Reopen Operation';
    ESDT6 = 'Inspection Lot - Make Decision';
    ESDT7 = 'QP Team Member';
    ESDT8 = 'Maintain Characteristics';
    ESDT9  = 'Cancel Inspection Lot';
    ESDT10 = 'Batch Stability Protocol Study Decision';
    ESDT11 = 'CoA Profile Creation';
    ESDT12 = 'CoC Profile Creation';
    ESDT13 = 'Batch Stability Protocol Close Study';
    ESDT14 = 'Record Manufacturing Date Sign 1';
    ESDT15 = 'Record Manufacturing Date Sign 2';
    ESDT16 = 'Delete Maintained Characteristics';
    ESDT17 = 'Force Close Operation';
    ESDT18  = 'QC Access';
    ESDT19 = 'QA Access';
    ESDT20 = 'QCR Access';
    ESDT21 = 'QAR Access';
    ESDT22 = 'DOC Access';
  };
}

entity ElectronicSignatureType : sap.common.CodeList {
  key value : String enum {
    EST1 = 'Operation Characteristics Sign 1';
    EST2 = 'Operation Characteristics Sign 2';
  };
}

entity EventTypes : sap.common.CodeList {
  key value : String enum {
    OC = 'Operations Complete';
    UDM = 'Usage Decision Made';
    ER  = 'Error Reporting';
  };
}

entity GroupTypes : sap.common.CodeList {
  key value : String enum {
    BRG = 'Batch Release Group';
    SSG = 'Stability Study Group';
  };
}

entity InspectionStatusType : sap.common.CodeList {
  key value : String enum {
    O = 'Open';
    I = 'In Process';
    C = 'Complete';
    D = 'Descision Complete';
    X = 'Cancelled';
  };
}

entity InventoryStatusAfterDecision : sap.common.CodeList {
  key value : String enum {
    NR = 'No Restrictions';
    InS = 'Inspection Status';
    RS = 'Restricted Status';
  };
}

entity OperationStatusType : sap.common.CodeList {
  key value : String enum {
    O = 'Open';
    IP = 'In Process';
    V = 'Verified';
    L = 'Locked';
    C = 'Completed';
  };
}

entity PinValidateMsg : sap.common.CodeList {
  key value : String enum {
    P1 = 'Pin has been Validated';
    P2 = 'Pin is invalid';
    P3 = 'Pin is locked';
    P4 = 'No Pin is available for this user';
    P5 = 'Pin is not active';
    P6 = 'No authorization on this action';
    P7 = 'Pin has been locked due to invalid tries';
  };
}

entity PrintQueueDocumentType : sap.common.CodeList {
  key value : String enum {
    L = 'Label';
  };
}

entity QualitativeDefectClasses : sap.common.CodeList {
  key value : String enum {
    A = 'A';
    B = 'B';
    C = 'C';
    D = 'D';
  };
}

entity QualitativeValuationCodes : sap.common.CodeList {
  key value : String enum {
    NV = 'Not Valuated';
    A = 'Accept';
    R = 'Reject';
  };
}