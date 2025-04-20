# server.py
from mcp.server.fastmcp import FastMCP



import sys
print("✅ MCP server running with:", sys.version)


# Create an MCP server
mcp = FastMCP("Demo")


# Add an addition tool
@mcp.tool()
def add(a: int, b: int) -> int:
    """Add two numbers"""
    return a + b