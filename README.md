# 🌲 Dotfiles

A minimal, elegant, and performance-oriented Wayland desktop environment. 

## 🖥️ The Stack

| Component      | Choice         | Description                                     |
| :---           | :---           | :---                                            |
| **Compositor** | `Sway`         | Tiling Wayland compositor (i3-compatible)       |
| **Bar** | `Waybar`       | Info-dense top bar with CSS styling             |
| **Terminal** | `Foot`         | Ultra-fast, Wayland-native terminal emulator    |
| **Launcher** | `Wofi`         | GTK-based runner with monochrome icon filtering |
| **File Manager**| `Yazi`        | Blazing fast TUI file manager with previews     |
| **Calendar** | `Calcurse`     | TUI-based calendar with Waybar integration      |
| **Torrents** | `rTorrent`     | Lightweight, terminal-based BitTorrent client   |
| **Exit Menu** | `Wlogout`      | Wayland logout script with Gruvbox-tinted icons |

---

## 🎨 Design Philosophy
This setup is built on the **Gruvbox Material** palette (Cream #ebdbb2 / Dark Gray #282828). 

* **Zen Layout**: Waybar center modules are removed to reduce cognitive load.
* **Hardware Insight**: Real-time Wi-Fi SSID and Battery time-remaining estimation.
* **Unified Borders**: A consistent `2px` Aqua (#8ec07c) border identifies focused windows.
* **Monochrome UI**: Icons in Wofi and Wlogout are desaturated via CSS to prevent "color clashing" with the Gruvbox theme.

---

## 🔧 Key Features

### 📅 Calendar Integration
Clicking the Waybar clock launches a floating `calcurse` instance. It is configured with `Layout 2` (Agenda on left, Calendar/Todo on right) and inherits the terminal's Gruvbox colors for a native feel.

### 📂 File Management & Downloads
* **Yazi**: Custom `theme.toml` applied to highlight directories in Aqua and archives in Orange.
* **rTorrent**: Integrated into the workflow for low-resource background downloading.

### 🔋 Smart Status Bar
Waybar is configured to show:
* **Wi-Fi**: `{essid}` directly in the bar.
* **Power**: `{time}` remaining (e.g., `3h 20min`) to avoid "percentage anxiety."

---
