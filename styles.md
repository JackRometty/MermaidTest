# Process Flow Styles

## Node Types

| Type | Class | Fill | Text | Stroke | Use |
|------|-------|------|------|--------|-----|
| Start/End | `startEnd` | `#64748B` | `#FFFFFF` | `#475569` | Entry/exit points |
| Step | `step` | `#DBEAFE` | `#1E40AF` | `#93C5FD` | Default process step |
| Decision | `decision` | `#FCD34D` | `#78350F` | `#F59E0B` | Yes/no branch |
| Action | `action` | `#3B82F6` | `#FFFFFF` | `#2563EB` | Requires human input |
| Error | `error` | `#F87171` | `#7F1D1D` | `#EF4444` | Failure/exception |

## Line Styles

- **Solid** → Required path
- **Dashed** → Optional path

## Applying Classes

First node: `:::startEnd`
Last node: `:::startEnd`
Diamonds `{text}`: `:::decision`
Human input required: `:::action`
Failure states: `:::error`
Everything else: `:::step`

## Mermaid Class Definitions

```
classDef startEnd fill:#64748B,color:#FFFFFF,stroke:#475569
classDef step fill:#DBEAFE,color:#1E40AF,stroke:#93C5FD
classDef decision fill:#FCD34D,color:#78350F,stroke:#F59E0B
classDef action fill:#3B82F6,color:#FFFFFF,stroke:#2563EB
classDef error fill:#F87171,color:#7F1D1D,stroke:#EF4444
```
