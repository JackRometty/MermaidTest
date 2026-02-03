---
id: pef-001
title: Patient Equipment Order Flow
status: current
last_reviewed: 2025-02-03
---

## Notes

- Entry point: patient calls or submits web form
- Insurance API timeout is 30s, triggers manual review
- "Not Covered" patients should be offered self-pay options

## Flow

A[Patient Inquiry] --> B{Insurance Verified?}
B -->|Yes| C[Check Product Eligibility]
B -->|No| D[Request Insurance Info]
D --> B
C --> E{Eligible?}
E -->|Yes| F[Create Order]
E -->|No| G[Notify Patient - Not Covered]
F --> H[Assign to Fulfillment]
H --> I[Ship Equipment]
I --> J[Follow-up Call]
