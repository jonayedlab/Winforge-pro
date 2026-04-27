<p align="center">
  <img src="https://img.shields.io/badge/Platform-Windows%2010%20%7C%2011-blue?style=for-the-badge&logo=windows" />
  <img src="https://img.shields.io/badge/Version-1.0.0-green?style=for-the-badge" />
  <img src="https://img.shields.io/badge/License-MIT-yellow?style=for-the-badge" />
  <img src="https://img.shields.io/badge/Author-Jonayed-purple?style=for-the-badge" />
  <img src="https://img.shields.io/badge/Lab-Jonayed%20Lab-crimson?style=for-the-badge" />
</p>

<h1 align="center">⚡ WinForge Pro v1.0</h1>
<h3 align="center">Advanced Windows Optimization & Management Suite</h3>
<p align="center"><i>A Product of Jonayed Lab — "Optimize your Windows, your way."</i></p>

---

## 🔍 What is WinForge Pro?

**WinForge Pro** is an all-in-one Windows optimization command-line toolkit that combines privacy tweaks, UI customization, startup management, and Windows Update control into a single, elegant, modular interface. Built entirely with native Windows batch scripting — zero dependencies, fully portable, and completely open-source.

WinForge Pro merges two standalone tools — **Windows Tweaker** and **Windows Update Manager** — into one unified, professional-grade suite with a modern box-drawn CLI interface, modular navigation, and a one-click Quick Optimize mode.

---

## ✨ Key Features

| Feature | Description |
|:--------|:------------|
| 🧩 **Modular Design** | 6 organized modules, each accessible from a central dashboard |
| ⚡ **Quick Optimize** | One-click application of all 7 recommended privacy & performance tweaks |
| 🔎 **Search & Cortana Manager** | Disable Bing web results, search highlights, cloud suggestions, and Cortana |
| 🛡️ **Privacy & UI Tweaks** | Control recent files, frequent folders, Windows tips, and toast notifications |
| 🖼️ **Lock Screen Manager** | Toggle fun facts, Spotlight images, tips overlay, and lock screen notifications |
| 🚀 **Startup Apps Manager** | Remove/restore OneDrive, Teams, Skype with smart app detection + view all entries |
| 🔄 **Windows Update Manager** | Enable/disable automatic updates, control OS upgrade policy, live status reporting |
| 🔐 **Auto-Elevation** | Automatically requests admin privileges via UAC on launch |
| 📊 **Live Status Detection** | Real-time display of Windows Update state (ON/OFF) in the module |
| 🎨 **Box-Drawn UI** | Professional CLI interface with Unicode box-drawing characters and ASCII art |
| 🎯 **Color-Coded Feedback** | Red = disabling, Green = enabling, Cyan = info, Yellow = warnings |
| 📋 **Startup Entry Viewer** | Browse all current HKCU startup entries directly from the tool |
| ℹ️ **About Screen** | Built-in credits, version info, and module documentation |
| 📦 **Zero Dependencies** | Pure batch script — no Python, no Node.js, no PowerShell modules |
| 🔁 **Fully Reversible** | Every tweak can be undone with a matching "Enable" option |

---

## 💻 System Requirements

| Requirement | Details |
|:------------|:--------|
| **OS** | Windows 10 (version 1903+) or Windows 11 |
| **Privileges** | Administrator (auto-requested via UAC) |
| **Dependencies** | None — uses only built-in Windows commands |
| **Disk Space** | < 25 KB |
| **Terminal** | Standard `cmd.exe` (auto-configured by the tool) |

---

## 📥 Installation

No installation needed. WinForge Pro is fully portable.

### Option 1: Direct Download
1. Download `WinForge Pro.cmd`
2. Save it anywhere (Desktop, USB drive, project folder)
3. Double-click to run — that's it!

### Option 2: Clone Repository
```bash
git clone https://github.com/jonayedlab/winforge-pro.git
cd winforge-pro
```

---

## 🚀 How to Use

### Launching
1. **Double-click** `WinForge Pro.cmd`
2. Accept the **UAC prompt** (the tool auto-elevates)
3. The main dashboard appears with 6 modules

### Navigation
```
╔════════════════════════════════════════════════════════════════════╗
║                                                                  ║
║            ██╗    ██╗██╗███╗   ██╗███████╗ ██████╗               ║
║            ██║    ██║██║████╗  ██║██╔════╝██╔═══██╗              ║
║            ██║ █╗ ██║██║██╔██╗ ██║█████╗  ██║   ██║              ║
║            ██║███╗██║██║██║╚██╗██║██╔══╝  ██║   ██║              ║
║            ╚███╔███╔╝██║██║ ╚████║██║     ╚██████╔╝              ║
║             ╚══╝╚══╝ ╚═╝╚═╝  ╚═══╝╚═╝      ╚═════╝              ║
║                  R  G  E       P  R  O    v1.0                   ║
║                                                                  ║
║           Advanced Windows Optimization Suite                    ║
║              A Product of Jonayed Lab                            ║
║                                                                  ║
╠════════════════════════════════════════════════════════════════════╣
║                                                                  ║
║   [1]  Search & Cortana Manager                                  ║
║   [2]  Privacy & UI Tweaks                                       ║
║   [3]  Lock Screen Manager                                       ║
║   [4]  Startup Apps Manager                                      ║
║   [5]  Windows Update Manager                                    ║
║   [6]  Quick Optimize (Apply All Recommended)                    ║
║                                                                  ║
║   [A]  About WinForge Pro                                        ║
║   [0]  Exit                                                      ║
║                                                                  ║
╚════════════════════════════════════════════════════════════════════╝
```

- **Type a number** (1–6) and press **Enter** to open a module
- **Type `A`** for the About screen
- **Type `0`** to exit
- Each module has its own sub-menu with back-to-main navigation (`0`)

---

## 📖 Module Reference

### Module 1: Search & Cortana Manager 🔎

Controls Bing web search, search highlights, cloud suggestions, and Cortana integration.

| Option | Action | Details |
|:------:|:-------|:--------|
| `1` | **Disable** Web Search + Highlights | Removes Bing results from Start Menu search, disables dynamic search box and cloud suggestions. Restarts Explorer. |
| `2` | **Enable** Web Search + Highlights | Restores all default search behaviors. Restarts Explorer. |
| `3` | **Disable** Legacy Web + Cloud Search | Disables Bing, location search, Cortana consent, and cloud search (for older Windows 10 builds). |
| `4` | **Enable** Legacy Web + Cloud Search | Restores all legacy search features. |

**Registry paths modified:**
- `HKCU\Software\Policies\Microsoft\Windows\Explorer`
- `HKCU\Software\Microsoft\Windows\CurrentVersion\SearchSettings`
- `HKCU\Software\Microsoft\Windows\CurrentVersion\Search`

---

### Module 2: Privacy & UI Tweaks 🛡️

Manages Quick Access history and Windows notification behavior.

| Option | Action | Details |
|:------:|:-------|:--------|
| `1` | **Disable** Recent Files | Hides recent files and frequent folders from File Explorer Quick Access. |
| `2` | **Enable** Recent Files | Restores recent files and frequent folders. |
| `3` | **Disable** Windows Tips | Stops tip popups and toast notifications. |
| `4` | **Enable** Windows Tips | Restores tips and toast notifications. |

---

### Module 3: Lock Screen Manager 🖼️

Controls lock screen content delivery including Spotlight, fun facts, and notification overlays.

| Option | Action | Details |
|:------:|:-------|:--------|
| `1` | **Disable** Fun Facts | Removes trivia and fun facts from the lock screen. |
| `2` | **Enable** Fun Facts | Restores lock screen fun facts. |
| `3` | **Disable** Lock Screen Info | Removes Spotlight images, tips overlay, rotating content, and notification toasts above lock screen. Only clock remains. |
| `4` | **Enable** Lock Screen Info | Restores all lock screen content and overlays. |

---

### Module 4: Startup Apps Manager 🚀

Smart startup application control with detection capabilities.

| Option | Action | Details |
|:------:|:-------|:--------|
| `1` | **Disable** Startup Apps | Removes OneDrive, Microsoft Teams, and Skype from auto-start registry. Shows per-app status. |
| `2` | **Enable** Startup Apps | Smart detection — scans installed apps and only restores entries for apps that exist on the system. |
| `3` | **View** Startup Entries | Displays all current user startup entries from `HKCU\...\Run`. |

> **Smart Detection:** Option 2 checks default install paths for each app before creating startup entries. Apps not found on the system are skipped with a `[--]` indicator.

---

### Module 5: Windows Update Manager 🔄

Full Windows Update control with live status reporting — inherited from Windows Update Manager 4.0.

| Option | Action | Details |
|:------:|:-------|:--------|
| `1` | **Disable** Automatic Updates | Stops `wuauserv` service, sets `NoAutoUpdate=1`, sets `AUOptions=2` (notify only), enables `DisableOSUpgrade`. |
| `2` | **Enable** Automatic Updates | Sets `NoAutoUpdate=0`, sets `AUOptions=4` (auto-install), removes OS upgrade block, restarts service. |
| `3` | **Check** Status | Shows live registry policy values and Windows Update service state. |

**Live status indicator:** The module header displays the current state (`ON` / `OFF`) when you enter it.

**Registry paths modified:**
- `HKLM\SOFTWARE\Policies\Microsoft\Windows\WindowsUpdate\AU`
- `HKLM\SOFTWARE\Policies\Microsoft\Windows\WindowsUpdate`

> ⚠️ **Note:** This module modifies `HKLM` (machine-level) keys and controls the Windows Update service. Changes affect all users on the system.

---

### Module 6: Quick Optimize ⚡

One-click application of all 7 recommended tweaks for maximum privacy and performance.

**What it applies:**

| # | Optimization |
|:-:|:-------------|
| 1 | Disable Web Search & Bing Highlights |
| 2 | Disable Legacy Cloud Search & Cortana |
| 3 | Disable Recent Files in Quick Access |
| 4 | Disable Windows Tips & Notifications |
| 5 | Disable Lock Screen Fun Facts |
| 6 | Disable Lock Screen Spotlight & Info Overlay |
| 7 | Remove Startup Bloat (OneDrive, Teams, Skype) |

> **Note:** Quick Optimize does **NOT** modify Windows Update settings. Use Module 5 separately for update control.

---

## ⚙️ How It Works

```
┌─────────────────────────────────────┐
│     User launches WinForge Pro      │
└──────────────┬──────────────────────┘
               ▼
┌─────────────────────────────────────┐
│  Admin check (net session)          │
│  Auto-elevates via VBS + UAC        │
└──────────────┬──────────────────────┘
               ▼
┌─────────────────────────────────────┐
│  Detect Windows Update status       │
│  (reads HKLM registry policy)       │
└──────────────┬──────────────────────┘
               ▼
┌─────────────────────────────────────┐
│  Main Dashboard (6 Modules + About) │
│  User selects a module              │
└──────────────┬──────────────────────┘
               ▼
┌─────────────────────────────────────┐
│  Module Sub-Menu                    │
│  User selects an action             │
└──────────────┬──────────────────────┘
               ▼
┌─────────────────────────────────────┐
│  Registry keys modified / services  │
│  controlled via reg.exe & net.exe   │
└──────────────┬──────────────────────┘
               ▼
┌─────────────────────────────────────┐
│  Color-coded confirmation           │
│  Returns to module sub-menu         │
└─────────────────────────────────────┘
```

---

## 🔒 Safety & Reversibility

### Is WinForge Pro safe?

✅ **Yes.** The tool is fully transparent — every command is visible in the `.cmd` file.

- **Modules 1–4** only modify `HKCU` (current user) registry keys — safe and user-scoped
- **Module 5** modifies `HKLM` (machine-level) Windows Update policies — requires admin but is standard practice
- **No files are deleted** (except temporary VBS elevation script)
- **No internet connections** are made
- **No third-party software** is installed

### Can I undo everything?

✅ **Yes.** Every "Disable" action has a matching "Enable" action that restores Windows defaults.

### Create a Restore Point (Recommended)

Before running Quick Optimize or disabling Windows Updates:

1. Press `Win + S` → Search **"Create a restore point"**
2. Click **"Create"** in System Protection
3. Enter a description (e.g., "Before WinForge Pro") → Click **Create**

---

## 🔧 Troubleshooting

| Problem | Solution |
|:--------|:---------|
| **UAC prompt won't appear** | Right-click the `.cmd` file → **Run as administrator** |
| **"Access Denied" errors** | Ensure you clicked "Yes" on the UAC prompt |
| **Taskbar disappears briefly** | Normal — Explorer restarts to apply search changes (Modules 1 & 6) |
| **Changes don't take effect** | Some settings require a full PC restart to apply |
| **Antivirus blocks the script** | Add an exception for `WinForge Pro.cmd` in your antivirus settings |
| **Startup restore shows "not found"** | The app must be installed for its startup entry to be restored |
| **Windows Update status incorrect** | Open Module 5, Option 3 to see the actual registry values and service state |
| **Box characters look broken** | Ensure your terminal uses a Unicode-capable font (Consolas, Cascadia Code, etc.) |

---

## ❓ FAQ

**Q: Will this break my Windows installation?**
> No. All modifications use standard registry keys and can be reversed.

**Q: Does Quick Optimize disable Windows Updates?**
> No. Windows Update control is intentionally separated into its own module (Module 5) because it's a higher-impact change.

**Q: Can I run this from a USB drive on multiple PCs?**
> Yes! WinForge Pro is fully portable. Copy the single `.cmd` file and run it anywhere.

**Q: Does it work on Windows Server?**
> It may work on Windows Server with Desktop Experience, but it's designed for Windows 10/11 consumer/pro editions.

**Q: How do I customize which startup apps are managed?**
> Open `WinForge Pro.cmd` in any text editor and modify the `:st_disable` and `:st_enable` sections.

**Q: Is the source code auditable?**
> Yes! It's a single `.cmd` file. Open it in Notepad or VS Code — every registry command is readable and documented.

---

## 📁 Project Structure

```
WinForge Pro/
├── WinForge Pro.cmd                 # The main tool (all-in-one)
├── README.md                        # This documentation
```

> **Note:** The legacy standalone scripts are kept for reference. `WinForge Pro.cmd` contains all their features and more.

---

## 📝 Changelog

### v1.0.0 — WinForge Pro (Current)
- 🔀 **Merged** Windows Tweaker v3.2 + Windows Update Manager 4.0 into one unified tool
- 🧩 **Modular architecture** — 6 organized modules with sub-menus
- ⚡ **Quick Optimize** — one-click apply all 7 recommended tweaks
- 🎨 **Box-drawn Unicode UI** with ASCII art branding
- 📊 **Live status detection** for Windows Update state
- 📋 **Startup Entry Viewer** — browse all current startup registry entries
- ℹ️ **About screen** with version, credits, and module descriptions
- 🔐 **VBS-based auto-elevation** (more reliable than PowerShell method)
- 🎯 **Per-step progress messages** showing exactly what's being modified
- 🔴🟢 **Color-coded modules** — each module has its own color identity
- ✅ **Error handling** on Windows Update registry modifications
- 📖 **Inline documentation** with section headers and comments

### Legacy Versions
- **Windows Tweaker v3.2** — Standalone privacy/UI tweaker (14 options)
- **Windows Update Manager 4.0** — Standalone update toggle with auto-detection

---

## 📄 License

```
MIT License

Copyright (c) 2026 Jonayed — Jonayed Lab

Permission is hereby granted, free of charge, to any person obtaining a copy
of this software and associated documentation files (the "Software"), to deal
in the Software without restriction, including without limitation the rights
to use, copy, modify, merge, publish, distribute, sublicense, and/or sell
copies of the Software, and to permit persons to whom the Software is
furnished to do so, subject to the following conditions:

The above copyright notice and this permission notice shall be included in all
copies or substantial portions of the Software.

THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND, EXPRESS OR
IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF MERCHANTABILITY,
FITNESS FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT.
```

---

## 👤 Author

<p align="center">
  <b>Jonayed</b><br/>
  <i>A Product of Jonayed Lab</i><br/><br/>
  🛠️ Built with pure Windows Batch scripting<br/>
  💡 Designed for power users who value control<br/>
  🎯 "Optimize your Windows, your way."
</p>

---

<p align="center">
  <b>⭐ If you find WinForge Pro useful, consider giving it a star on GitHub!</b>
</p>
