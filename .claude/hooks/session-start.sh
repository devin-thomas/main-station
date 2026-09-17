#!/bin/bash
set -euo pipefail

# The environment setup script already runs npm install before Claude Code
# launches in cloud sessions. This hook ensures deps are present for local
# sessions too, and is safe to run again (npm skips unchanged packages).

cd "$CLAUDE_PROJECT_DIR"
npm install
