#!/bin/bash
# install.sh - ContextKit Global Installation Script
# 
# ContextKit Context Engineering System Installation
# Installs global templates, development guidelines, and Claude Code integration
# 
# Usage: curl -fsSL https://raw.githubusercontent.com/FlineDev/ContextKit/main/install.sh | sh
# Usage: git clone https://github.com/FlineDev/ContextKit.git && ./ContextKit/install.sh

set -e  # Exit on any error

# Color definitions for output formatting
readonly RED='\033[0;31m'
readonly GREEN='\033[0;32m'
readonly YELLOW='\033[1;33m'
readonly BLUE='\033[0;34m'
readonly MAGENTA='\033[0;35m'
readonly CYAN='\033[0;36m'
readonly WHITE='\033[1;37m'
readonly NC='\033[0m' # No Color

# Global variables
readonly CONTEXTKIT_DIR="$HOME/.ContextKit"
readonly SCRIPT_DIR="$(cd "$(dirname "${BASH_SOURCE[0]}")" &> /dev/null && pwd)"
readonly MIN_BASH_VERSION=4
readonly CONTEXTKIT_VERSION="1.0.0"

###########################################
# Utility Functions
###########################################

# Print colored status messages
print_status() {
   local color=$1
   shift
   echo -e "${color}$*${NC}"
}

print_error() {
   print_status "$RED" "❌ ERROR: $*" >&2
}

print_success() {
   print_status "$GREEN" "✅ $*"
}

print_warning() {
   print_status "$YELLOW" "⚠️  WARNING: $*"
}

print_info() {
   print_status "$CYAN" "ℹ️  $*"
}

print_step() {
   print_status "$BLUE" "🔄 $*"
}

print_header() {
   echo
   print_status "$MAGENTA" "━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━"
   print_status "$WHITE" "$*"
   print_status "$MAGENTA" "━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━"
   echo
}

###########################################
# Execution Flow (main)
# Following install-design.md specifications
###########################################

## Step 1: Validate environment and dependencies
validate_environment() {
   print_step "Step 1: Validating environment and dependencies..."
   
   # Check bash version >= 4.0
   local bash_major_version="${BASH_VERSION%%.*}"
   if [[ $bash_major_version -lt $MIN_BASH_VERSION ]]; then
      print_error "Bash $MIN_BASH_VERSION.0+ required (found $BASH_VERSION)"
      print_info "macOS: brew install bash"
      print_info "Ubuntu: sudo apt update && sudo apt install bash"
      exit 1
   fi
   
   # Verify required tools availability
   local missing_tools=()
   for tool in curl git mkdir cp find; do
      if ! command -v "$tool" &> /dev/null; then
         missing_tools+=("$tool")
      fi
   done
   
   if [[ ${#missing_tools[@]} -gt 0 ]]; then
      print_error "Required tools missing: ${missing_tools[*]}"
      print_info "Please install missing tools and try again"
      exit 1
   fi
   
   print_success "Environment validation complete"
   print_info "Bash $BASH_VERSION, all required tools available"
}

## Step 2: Setup global directory structure
setup_directory_structure() {
   print_step "Step 2: Setting up global directory structure..."
   
   # Detect existing installation
   if [[ -d "$CONTEXTKIT_DIR" ]]; then
      print_warning "Existing ContextKit installation detected at $CONTEXTKIT_DIR"
      print_info "This will update all global templates. Continue? (Y/n)"
      read -r response
      if [[ "$response" =~ ^[Nn]$ ]]; then
         print_info "Installation cancelled by user"
         exit 0
      fi
      print_info "Updating ContextKit templates..."
   fi
   
   # Create ~/.ContextKit/ if not exists
   if ! mkdir -p "$CONTEXTKIT_DIR" 2>/dev/null; then
      print_error "Cannot create $CONTEXTKIT_DIR directory"
      print_info "Check permissions for $HOME"
      exit 1
   fi
   
   # Create Templates/ subdirectories
   local template_dirs=(
      "ContextKit"
      "Guidelines" 
      "Templates"
      "Templates/Commands"
      "Templates/Commands/Plan"
      "Templates/Commands/Implement" 
      "Templates/Commands/Backlog"
      "Templates/Hooks"
      "Templates/Subagents"
      "Templates/Features"
      "Templates/Contexts"
      "Templates/Formatters"
   )
   
   for dir in "${template_dirs[@]}"; do
      local full_path="$CONTEXTKIT_DIR/$dir"
      if ! mkdir -p "$full_path" 2>/dev/null; then
         print_error "Cannot create directory: $full_path"
         exit 1
      fi
   done
   
   print_success "Directory structure created successfully"
   print_info "Global ContextKit directory: $CONTEXTKIT_DIR"
}

## Step 3: Install template infrastructure
install_template_infrastructure() {
   print_step "Step 3: Installing template infrastructure..."
   
   # Copy Templates/ from repository
   local template_categories=(
      "Commands"
      "Hooks"
      "Subagents"
      "Features"
      "Contexts"
      "Formatters"
   )
   
   for category in "${template_categories[@]}"; do
      local source_dir="$SCRIPT_DIR/Templates/$category"
      local dest_dir="$CONTEXTKIT_DIR/Templates/$category"
      
      if [[ -d "$source_dir" ]]; then
         if ! cp -R "$source_dir"/* "$dest_dir/" 2>/dev/null; then
            print_error "Failed to copy $category templates"
            print_info "Source: $source_dir"
            print_info "Destination: $dest_dir"
            exit 1
         fi
         print_info "✓ Installed $category templates"
      else
         print_warning "Source directory not found: $source_dir"
      fi
   done
   
   print_success "Template infrastructure installed"
}

## Step 4: Install global ContextKit commands
install_global_commands() {
   print_step "Step 4: Installing global ContextKit commands..."
   
   # Check if Claude Code is available
   local claude_commands_dir="$HOME/.claude/commands"
   
   if [[ ! -d "$claude_commands_dir" ]]; then
      print_warning "Claude Code commands directory not found at $claude_commands_dir"
      print_info "ContextKit commands will be available after Claude Code setup"
      print_info "Manual setup: Create commands in ~/.claude/commands/"
      return 0
   fi
   
   # Create /ContextKit/ command namespace directory  
   local contextkit_commands_dir="$claude_commands_dir/ContextKit"
   mkdir -p "$contextkit_commands_dir"
   
   # Install global ContextKit commands (these will be implemented in T038-T041)
   local global_commands=(
      "setup"
      "setup-workspace" 
      "migrate"
      "verify"
   )
   
   for command in "${global_commands[@]}"; do
      local command_file="$contextkit_commands_dir/$command.md"
      cat > "$command_file" << EOF
# Command: /ContextKit/$command

## Description
$command command - Implementation pending in Phase 3.6

## Status
🚧 Command template placeholder - Full implementation in T038-T041

## Usage
This command will be fully implemented in Phase 3.6 of ContextKit development.

## Next Steps
Run \`/ContextKit/verify\` after implementation to validate setup.
EOF
      print_info "✓ Installed /ContextKit/$command command template"
   done
   
   print_success "Global ContextKit commands installed"
   print_info "Commands available: /ContextKit/setup, /ContextKit/setup-workspace, /ContextKit/migrate, /ContextKit/verify"
}

## Step 5: Setup constitutional framework
setup_constitutional_framework() {
   print_step "Step 5: Setting up constitutional framework..."
   
   # Copy constitutional documents
   local framework_files=(
      "ContextKit/Constitution.md"
      "ContextKit/Changelog.md"
   )
   
   for file in "${framework_files[@]}"; do
      local source_file="$SCRIPT_DIR/$file"
      local dest_file="$CONTEXTKIT_DIR/$file"
      
      if [[ -f "$source_file" ]]; then
         if ! cp "$source_file" "$dest_file" 2>/dev/null; then
            print_error "Failed to copy $file"
            exit 1
         fi
         print_info "✓ Installed $file"
      else
         print_warning "Source file not found: $source_file"
      fi
   done
   
   # Copy Guidelines/ directory (Swift.md, SwiftUI.md)
   local guidelines_dir="$SCRIPT_DIR/Guidelines"
   if [[ -d "$guidelines_dir" ]]; then
      if ! cp -R "$guidelines_dir"/* "$CONTEXTKIT_DIR/Guidelines/" 2>/dev/null; then
         print_error "Failed to copy Guidelines directory"
         exit 1
      fi
      print_info "✓ Installed development guidelines"
   fi
   
   print_success "Constitutional framework installed"
   print_info "Constitution, Changelog, and Guidelines available"
}

## Step 6: Verify installation integrity
verify_installation() {
   print_step "Step 6: Verifying installation integrity..."
   
   # Check core structure exists
   local expected_files=(
      "ContextKit/Constitution.md"
      "ContextKit/Changelog.md"
      "Guidelines/Swift.md"
      "Guidelines/SwiftUI.md"
      "Templates/Commands/Plan/create-spec.md"
      "Templates/Commands/Implement/commit-changes.md"
      "Templates/Hooks/auto-format.sh"
      "Templates/Subagents/build-project.md"
      "Templates/Features/Spec.md"
      "Templates/Contexts/Project.md"
      "Templates/Formatters/.swift-format"
   )
   
   local missing_files=()
   for file in "${expected_files[@]}"; do
      if [[ ! -f "$CONTEXTKIT_DIR/$file" ]]; then
         missing_files+=("$file")
      fi
   done
   
   if [[ ${#missing_files[@]} -gt 0 ]]; then
      print_error "Installation incomplete - missing files:"
      for file in "${missing_files[@]}"; do
         print_error "  - $file"
      done
      exit 1
   fi
   
   # Validate file permissions
   if [[ ! -r "$CONTEXTKIT_DIR/ContextKit/Constitution.md" ]]; then
      print_error "Constitutional framework not readable"
      exit 1
   fi
   
   # Test basic functionality
   local test_template="$CONTEXTKIT_DIR/Templates/Features/Spec.md"
   if ! grep -q "Execution Flow" "$test_template" 2>/dev/null; then
      print_error "Template validation failed - invalid template format"
      exit 1
   fi
   
   print_success "Installation integrity verified"
   print_info "All core files present and readable"
}

## Step 7: Display success message and next steps
display_completion() {
   print_step "Step 7: Installation complete!"
   
   print_header "🧠 ContextKit Installation Successful!"
   
   print_success "ContextKit $CONTEXTKIT_VERSION installed successfully!"
   echo
   print_info "📁 Global templates: $CONTEXTKIT_DIR"
   print_info "🔧 Commands available: /ContextKit/setup, /ContextKit/setup-workspace, /ContextKit/migrate, /ContextKit/verify"
   print_info "📚 Documentation: https://github.com/FlineDev/ContextKit"
   echo
   print_status "$WHITE" "Next steps:"
   print_info "1. Navigate to an existing project directory"
   print_info "2. Start Claude Code with 'claude' command"  
   print_info "3. Run '/ContextKit/setup' to initialize project"
   print_info "4. Begin feature planning with '/Plan/create-spec'"
   echo
   print_info "For help and validation: /ContextKit/verify"
   echo
   print_status "$CYAN" "Constitutional Principles Enabled:"
   print_info "✓ Accessibility-first design"
   print_info "✓ Privacy by design"
   print_info "✓ Localizability from day one" 
   print_info "✓ Code maintainability"
   print_info "✓ Platform-appropriate UX"
   print_info "✓ Anti-speculation enforcement"
   echo
   print_status "$GREEN" "🚀 Ready for intelligent development workflows!"
}

###########################################
# Error Handling and Cleanup
###########################################

cleanup_on_error() {
   print_error "Installation failed - cleaning up..."
   
   # Only remove if we created it in this session
   if [[ -n "$CONTEXTKIT_CREATED" && -d "$CONTEXTKIT_DIR" ]]; then
      print_info "Removing incomplete installation..."
      rm -rf "$CONTEXTKIT_DIR" 2>/dev/null || true
   fi
   
   print_error "Please check the error messages above and try again"
   print_info "For support: https://github.com/FlineDev/ContextKit/issues"
   exit 1
}

# Set trap for cleanup on error
trap cleanup_on_error ERR

###########################################
# Cross-Platform Compatibility 
###########################################

detect_platform() {
   case "$(uname -s)" in
      Darwin*)
         PLATFORM="macOS"
         print_info "Detected platform: macOS"
         ;;
      Linux*)
         PLATFORM="Linux"  
         print_info "Detected platform: Linux"
         # Check for WSL
         if grep -q microsoft /proc/version 2>/dev/null; then
            PLATFORM="WSL"
            print_info "Windows Subsystem for Linux detected"
         fi
         ;;
      CYGWIN*|MINGW32*|MSYS*|MINGW*)
         print_error "Windows native shell not supported"
         print_info "Please use Windows Subsystem for Linux (WSL2)"
         exit 1
         ;;
      *)
         PLATFORM="Unknown"
         print_warning "Unknown platform detected - proceeding with Linux compatibility"
         ;;
   esac
}

###########################################
# Main Execution
###########################################

main() {
   print_header "🧠 ContextKit Global Installation"
   print_info "Installing ContextKit $CONTEXTKIT_VERSION - Context Engineering System"
   print_info "Repository: https://github.com/FlineDev/ContextKit"
   echo
   
   # Platform detection
   detect_platform
   
   # Mark if we're creating ContextKit directory (for cleanup)
   if [[ ! -d "$CONTEXTKIT_DIR" ]]; then
      export CONTEXTKIT_CREATED=true
   fi
   
   # Execute installation steps following install-design.md
   validate_environment
   setup_directory_structure  
   install_template_infrastructure
   install_global_commands
   setup_constitutional_framework
   verify_installation
   display_completion
   
   # Clear cleanup flag - successful installation
   unset CONTEXTKIT_CREATED
}

# Only execute main if script is run directly (not sourced)
if [[ "${BASH_SOURCE[0]}" == "${0}" ]]; then
   main "$@"
fi