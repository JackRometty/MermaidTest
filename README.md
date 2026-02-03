# Process Flows

Source of truth for how things work. Markdown files in, multiple outputs out.
```mermaid
flowchart TD
    A[Start Here] --> B[Find the process you need]
    B --> C{Does a markdown file exist?}
    C -->|Yes| D[Open the .md file]
    C -->|No| E[Request it or create it]
    D --> F{What do you need?}
    F -->|Quick reference| G[Read the markdown directly]
    F -->|Visual diagram| H[View rendered Mermaid]
    F -->|Presentation| I[Export to Figma]
    F -->|Ask a question| J[Query the RAG system]
```

## Quick start

1. Go to `/flows/`
2. Find your process
3. Read the markdown, or paste the Mermaid block into [mermaid.live](https://mermaid.live) to see the diagram

## Adding or updating a flow

Edit the markdown in `/flows/`. That's it. Everything else derives from there.

## Questions?

Ask Jack, Alex or check the RAG system.