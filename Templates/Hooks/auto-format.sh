#!/bin/bash
# auto-format.sh - Auto-format edited files
# Called by PostToolUse hook after Claude Code edits files

## Purpose
# When file edits occur, detect if it's a Swift file and run SwiftFormat + swift-format 
# only on that specific file (not entire project) to ensure immediate code consistency 
# without performance impact.

set -e

# Get edited files from hook context (passed as arguments)
EDITED_FILES=("$@")

# Exit early if no files were edited
if [ ${#EDITED_FILES[@]} -eq 0 ]; then
    exit 0
fi

echo "🔧 Auto-formatting ${#EDITED_FILES[@]} edited file(s)..."

# Process each edited file
for file in "${EDITED_FILES[@]}"; do
    # Skip if file doesn't exist (might have been deleted)
    if [ ! -f "$file" ]; then
        continue
    fi
    
    # Only format Swift files
    case "$file" in
        *.swift)
            format_swift_file "$file"
            ;;
        *)
            # Skip non-Swift files silently
            ;;
    esac
done

format_swift_file() {
    local file="$1"
    
    echo "📝 Formatting Swift file: $file"
    
    # Apply SwiftFormat first (adds explicit self, structure)
    if command -v swiftformat &> /dev/null; then
        if [ -f ".swiftformat" ]; then
            swiftformat "$file" --config .swiftformat --quiet
        else
            swiftformat "$file" --quiet
        fi
        echo "  ✅ SwiftFormat applied"
    fi
    
    # Apply swift-format second (line breaks, Apple style)  
    if command -v swift-format &> /dev/null; then
        if [ -f ".swift-format" ]; then
            swift-format --in-place "$file" --configuration .swift-format
        else
            swift-format --in-place "$file"
        fi
        echo "  ✅ swift-format applied"
    fi
    
    # Warn if no formatters available
    if ! command -v swiftformat &> /dev/null && ! command -v swift-format &> /dev/null; then
        echo "  ⚠️  No Swift formatters available - install SwiftFormat and swift-format for auto-formatting"
    fi
}