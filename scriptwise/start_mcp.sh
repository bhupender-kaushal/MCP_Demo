#!/bin/bash

# Ensure the right Python is used with pyenv or manually specify it
export PATH="$HOME/.local/bin:$PATH"

# Optional: If you're using pyenv, force it
export PYENV_VERSION=3.12.2

# Optional: If using pyenv or conda, activate here

# Run the MCP server using uv + mcp[cli]
/Users/mackaushal/.local/bin/uv run --python 3.12 --with "mcp[cli]" mcp run /Users/mackaushal/Documents/CODES/MCP_Example/main.py