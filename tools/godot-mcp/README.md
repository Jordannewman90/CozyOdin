# Godot MCP Server Setup

This directory contains the Godot MCP (Model Context Protocol) server that allows AI agents to directly interface with the Godot engine.

## What This Does

The MCP server gives AI agents the ability to:
- **Launch the Godot editor** for the project
- **Run the game** in debug mode
- **Capture debug output** (console logs, errors)
- **Create and modify scenes** programmatically
- **Add nodes** to existing scenes
- **Load sprites** into Sprite2D nodes
- **Stop/start** the running project

## Project Structure

```
tools/godot-mcp/
├── mcp-config.json       ← MCP config (Godot path, debug settings)
├── package.json          ← npm dependencies
├── package-lock.json     ← lockfile
├── node_modules/         ← installed packages (gitignored)
└── README.md             ← this file

.cursor/mcp.json          ← Cursor auto-detects this for MCP integration
```

## Prerequisites

- **Node.js ≥18** (you have v22.15.0 via nvm)
- **Godot Engine** at `/Applications/Godot.app/Contents/MacOS/Godot`

## How To Use With Cursor

If you use Cursor IDE, it will auto-detect `.cursor/mcp.json` at the project root. Just open the project in Cursor and the MCP tools will be available.

## How To Use With Cline (VS Code)

Copy the contents of `mcp-config.json` into:
```
~/Library/Application Support/Code/User/globalStorage/saoudrizwan.claude-dev/settings/cline_mcp_settings.json
```

## How To Use With Claude Code

```bash
claude mcp add godot -e GODOT_PATH=/Applications/Godot.app/Contents/MacOS/Godot -e DEBUG=true -- npx @coding-solo/godot-mcp
```

## Manual Test

```bash
export NVM_DIR="$HOME/.nvm" && source "$NVM_DIR/nvm.sh"
GODOT_PATH="/Applications/Godot.app/Contents/MacOS/Godot" npx @coding-solo/godot-mcp
```

You should see:
```
[SERVER] Using Godot at: /Applications/Godot.app/Contents/MacOS/Godot
Godot MCP server running on stdio
```

## Available MCP Tools

| Tool | Description |
|:-----|:------------|
| `launch_editor` | Open the Godot editor for the project |
| `run_project` | Execute the project in debug mode |
| `get_debug_output` | Retrieve console output and errors |
| `stop_project` | Stop a running project |
| `get_godot_version` | Get installed Godot version |
| `list_projects` | Find Godot projects in a directory |
| `get_project_info` | Detailed project structure analysis |
| `create_scene` | Create a new scene with specified root node |
| `add_node` | Add nodes to existing scenes |
| `load_sprite` | Load sprites/textures into Sprite2D nodes |
| `save_scene` | Save scenes with variant options |
| `export_mesh_library` | Export 3D scenes as MeshLibrary |
| `get_uid` | Get UID for specific files (Godot 4.4+) |
| `update_project_uids` | Update UID references |
