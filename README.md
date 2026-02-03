# Process Flows

Lightweight system for documenting operational processes.

## Structure

```
/flows          → Source files (edit these)
/rendered       → Styled Mermaid output (generated)
styles.md       → Design system reference
render.sh       → Build script
```

## Usage

### View raw flow
Open any file in `/flows/` and copy the Flow section into a Mermaid renderer.

### Generate styled versions
```bash
./render.sh
```
Outputs styled Mermaid files to `/rendered/`.

### For presentations
Designer rebuilds from styled Mermaid in Figma as needed.

## Conventions

- One flow per file
- Keep notes brief—context, not documentation
- Review quarterly (check `last_reviewed` dates)
