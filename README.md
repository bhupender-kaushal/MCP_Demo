# 🤖 Claude-Compatible MCP Server Setup

This guide walks you through setting up a Claude-compatible MCP server using Python, `FastMCP`, and [`uv`](https://astral.sh), with support for both **Windows** and **macOS/Linux**.

---

## ✅ Prerequisites

- **Python ≥ 3.12** (required by `mcp-example`)
- `uv` installed
- A terminal (Command Prompt, PowerShell, or Bash)

---

## 📁 Step 1: Create Your MCP Server (`main.py`)

In your project folder, create a file named `main.py`:

```python
from mcp.server.fastmcp import FastMCP
import sys

print("✅ MCP server running with:", sys.version)

# Create the MCP server
mcp = FastMCP("Demo")

# Add a simple tool
@mcp.tool()
def add(a: int, b: int) -> int:
    """Add two numbers"""
    return a + b

# Add a dynamic greeting resource
@mcp.resource("greeting://{name}")
def get_greeting(name: str) -> str:
    """Return a personalized greeting"""
    return f"Hello, {name}!"
```

---

## 📦 Step 2: Install `uv`

### 🪟 Windows

1. Open **PowerShell as Administrator**
2. Run:

```powershell
irm https://astral.sh/uv/install.ps1 | iex
```

This will install `uv` to `%USERPROFILE%\.cargo\bin\uv`.

**Optional:** Add it to your `PATH` manually if needed:

```powershell
$env:Path += ";$HOME\.cargo\bin"
```

Then close and reopen your terminal.

---

### 🍎 macOS / 🐧 Linux

Run in your terminal:

```bash
curl -Ls https://astral.sh/uv/install.sh | sh
```

Add to your shell’s config if needed:

```bash
export PATH="$HOME/.local/bin:$PATH"
```

Test it:

```bash
uv --version
```

✅ If you see a version, you're good to go.

---

## 🚀 Step 3: Launch Your MCP Server

Now register and run your Claude-compatible server:

```bash
uv run mcp install main.py
```

This will:

- Dynamically install `mcp[cli]` using `uv`
- Validate your `main.py` server
- Register it for Claude (if integrated)

---

## 🧪 Step 4 (Optional): Test it manually

To verify it runs correctly:

```bash
uv run --python 3.12 --with "mcp[cli]" mcp run main.py
```

Expected output:

```
✅ MCP server running with: 3.12.x
👋 Server started, waiting for client...
```

---

## 🛠️ Troubleshooting

### ❌ `spawn uv ENOENT`

**Cause:** `uv` is not on your system `PATH`

**Fix:**

#### On macOS/Linux:
```bash
export PATH="$HOME/.local/bin:$PATH"
```

#### On Windows:
```powershell
$env:Path += ";$HOME\.cargo\bin"
```

---

### ❌ `spawn uv EACCES`

**Cause:** `uv` exists but isn't executable (macOS/Linux)

**Fix:**

```bash
chmod +x ~/.local/bin/uv
```

---

### ❌ Python version error: `Python 3.9.6 does not satisfy Python>=3.12`

**Cause:** Your default Python is outdated

**Fix:**

- Install Python 3.12 from [python.org](https://www.python.org/downloads/)
- OR use `pyenv` or Anaconda to manage Python versions
- OR force `uv` to use the correct Python:

```bash
uv run --python 3.12 ...
```

You can also create a `.python-version` file in your project:

```bash
echo "3.12" > .python-version
```

---

### ❌ Claude doesn't connect

- Make sure your server name (`FastMCP("Demo")`) matches what Claude expects
- Add logging to confirm the server is running and accepting requests:

```python
print("👋 Server ready and waiting for Claude...")
```

---

## 🧠 Tips

- You can use any name in `FastMCP("YourName")`
- You can register multiple servers with different entry files
- You don’t need to write `.mcp/config.json` manually — `mcp install` handles that for you

---

## 🎉 You're Done!

You now have a Claude-compatible MCP server that supports:

- 🔧 Tools (like `add(a, b)`)
- 🔗 Resources (like `greeting://name`)
- ✅ `uv`-based install/run flow
- 💬 Claude compatibility out of the box






