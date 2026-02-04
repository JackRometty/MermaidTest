---
title: Returns & Exchange
nav_order: 4
---

# Returns & Exchange

Handling equipment returns and exchanges.

```mermaid
flowchart TD
    A[Return Request Received] --> B{Request Source?}
    B -->|Phone| C[Log Call Details]
    B -->|Web Portal| D[Validate Portal Session]
    B -->|Email| E[Parse Email Content]
    B -->|In-Person| F[Scan Equipment Barcode]

    C --> G[Pull Customer Record]
    D --> G
    E --> G
    F --> G

    G --> H{Customer Found?}
    H -->|No| I[Search by Equipment Serial]
    H -->|Yes| J[Verify Purchase History]
    I --> K{Equipment Found?}
    K -->|No| L[Escalate to Supervisor]
    K -->|Yes| M[Link to Original Order]
    M --> J

    J --> N{Within Return Window?}
    N -->|Yes - Standard| O[Standard Return Process]
    N -->|Yes - Extended Warranty| P[Warranty Return Process]
    N -->|No| Q{Exception Review}

    Q --> R{Exception Type?}
    R -->|Medical Necessity| S[Request Doctor Note]
    R -->|Product Defect| T[Initiate QA Review]
    R -->|Customer Loyalty| U[Check Account Standing]
    R -->|Other| V[Manager Approval Required]

    S --> W{Documentation Valid?}
    W -->|Yes| O
    W -->|No| X[Deny Return - Document Reason]

    T --> Y[QA Inspection Queue]
    Y --> Z{Defect Confirmed?}
    Z -->|Yes| AA[Full Refund + Replacement]
    Z -->|No| AB[Standard Policy Applies]
    AB --> Q

    U --> AC{Account Score?}
    AC -->|Platinum| O
    AC -->|Gold| AD[Partial Credit Offered]
    AC -->|Standard| X

    V --> AE{Manager Decision?}
    AE -->|Approve| O
    AE -->|Deny| X
    AE -->|Escalate| AF[Director Review]
    AF --> AG{Director Decision?}
    AG -->|Approve| O
    AG -->|Deny| X

    O --> AH[Generate RMA Number]
    P --> AH

    AH --> AI{Return Method?}
    AI -->|Ship Back| AJ[Generate Prepaid Label]
    AI -->|Drop Off| AK[Locate Nearest Facility]
    AI -->|Pickup| AL[Schedule Courier]

    AJ --> AM[Email Label to Customer]
    AK --> AN[Send Location Details]
    AL --> AO[Confirm Pickup Window]

    AM --> AP[Await Equipment Receipt]
    AN --> AP
    AO --> AP

    AP --> AQ[Equipment Received]
    AQ --> AR[Log Receipt in System]
    AR --> AS[Initial Visual Inspection]

    AS --> AT{Packaging Intact?}
    AT -->|No| AU[Document Damage - Photo]
    AT -->|Yes| AV[Proceed to Detailed Inspection]
    AU --> AV

    AV --> AW{Equipment Condition?}
    AW -->|Like New| AX[Full Credit Processing]
    AW -->|Minor Wear| AY[Standard Credit Processing]
    AW -->|Damaged| AZ[Damage Assessment]
    AW -->|Missing Parts| BA[Parts Inventory Check]

    AZ --> BB{Damage Cause?}
    BB -->|Shipping| BC[File Carrier Claim]
    BB -->|Customer| BD[Calculate Restocking Fee]
    BB -->|Manufacturing| AA

    BC --> BE[Carrier Claim Process]
    BE --> BF{Claim Outcome?}
    BF -->|Approved| AX
    BF -->|Denied| BD

    BD --> BG[Apply Fee to Credit]
    BG --> AY

    BA --> BH{Parts Available?}
    BH -->|Yes| BI[Deduct Parts Cost]
    BH -->|No| BJ[Extended Assessment]
    BI --> AY
    BJ --> AZ

    AX --> BK[Process Full Refund]
    AY --> BL[Process Adjusted Credit]
    AD --> BL

    BK --> BM{Original Payment Method?}
    BL --> BM

    BM -->|Credit Card| BN[Initiate Card Refund]
    BM -->|Insurance| BO[Submit Insurance Reversal]
    BM -->|Check| BP[Issue Refund Check]
    BM -->|Store Credit| BQ[Add to Account Balance]

    BN --> BR[Refund Confirmation]
    BO --> BS[Insurance Processing Queue]
    BP --> BT[Mail Check - Track Delivery]
    BQ --> BR

    BS --> BU{Insurance Approved?}
    BU -->|Yes| BR
    BU -->|No| BV[Patient Responsibility Notice]
    BV --> BM

    BT --> BR

    BR --> BW[Update Inventory System]
    BW --> BX{Equipment Disposition?}
    BX -->|Resell| BY[Refurbishment Queue]
    BX -->|Donate| BZ[Charity Coordination]
    BX -->|Recycle| CA[E-Waste Processing]
    BX -->|Destroy| CB[Destruction Certificate]

    BY --> CC[Refurb Complete]
    CC --> CD[Return to Inventory]

    BZ --> CE[Donation Receipt]
    CA --> CF[Recycling Confirmation]
    CB --> CG[Destruction Log]

    CD --> CH[Close Return Case]
    CE --> CH
    CF --> CH
    CG --> CH

    CH --> CI[Customer Satisfaction Survey]
    CI --> CJ[Archive Case]

    X --> CK[Denial Letter Generated]
    CK --> CL{Appeal Requested?}
    CL -->|Yes| AF
    CL -->|No| CJ

    L --> CM[Supervisor Review]
    CM --> CN{Resolution?}
    CN -->|Found Record| G
    CN -->|No Record| CO[Manual Case Creation]
    CO --> J
```
