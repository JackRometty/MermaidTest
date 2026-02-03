#!/bin/bash

# Process Flow Renderer
# Reads /flows/*.md, extracts flow section, applies styles, outputs to /rendered/

SCRIPT_DIR="$(cd "$(dirname "${BASH_SOURCE[0]}")" && pwd)"
FLOWS_DIR="$SCRIPT_DIR/flows"
OUTPUT_DIR="$SCRIPT_DIR/rendered"

# Style definitions
CLASSES='    classDef startEnd fill:#64748B,color:#FFFFFF,stroke:#475569
    classDef step fill:#DBEAFE,color:#1E40AF,stroke:#93C5FD
    classDef decision fill:#FCD34D,color:#78350F,stroke:#F59E0B
    classDef action fill:#3B82F6,color:#FFFFFF,stroke:#2563EB
    classDef error fill:#F87171,color:#7F1D1D,stroke:#EF4444'

mkdir -p "$OUTPUT_DIR"

for file in "$FLOWS_DIR"/*.md; do
    [ -f "$file" ] || continue
    
    filename=$(basename "$file" .md)
    
    # Extract title from frontmatter
    title=$(grep "^title:" "$file" | sed 's/title: *//')
    
    # Extract flow section (everything after "## Flow")
    flow=$(awk '/^## Flow$/,0 { if (!/^## Flow$/) print }' "$file" | sed '/^$/d')
    
    # Apply class conventions
    styled_flow="$flow"
    
    # First node gets startEnd
    styled_flow=$(echo "$styled_flow" | sed '0,/\[/{s/\]/]:::startEnd/}')
    
    # Decisions get decision class
    styled_flow=$(echo "$styled_flow" | sed 's/{\([^}]*\)}/{\1}:::decision/g')
    
    # Generate output
    cat > "$OUTPUT_DIR/$filename.md" << EOF
# $title

\`\`\`mermaid
flowchart TD
$(echo "$styled_flow" | sed 's/^/    /')

$CLASSES
\`\`\`
EOF

    echo "Rendered: $filename.md"
done

echo "Done. Output in $OUTPUT_DIR/"
