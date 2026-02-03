---
id: inv-001
title: Insurance Verification
status: current
last_reviewed: 2025-02-03
---

## Notes

- Called by: Patient Equipment Order Flow
- Primary API: Availity
- Fallback: Manual payer portal lookup

## Flow

A[Receive Patient Info] --> B[Query Insurance API]
B --> C{API Response?}
C -->|Success| D[Parse Coverage Details]
C -->|Timeout| E[Flag for Manual Review]
C -->|Invalid| F[Request Corrected Info]
F --> A
D --> G{Coverage Active?}
G -->|Yes| H[Return Verified]
G -->|No| I[Return Not Covered]
E --> J[Manual Lookup]
J --> G
