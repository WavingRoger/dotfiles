# 🌟 Dotfiles Repository 🌟

Welcome to my dotfiles repository!

---

## 📂 Folder Structure

Here's an overview of the directories inside the `.config` folder, with links to their respective configuration files:

| Folder                          | Description                                                                 | Link                                                                                     |
|---------------------------------|-----------------------------------------------------------------------------|------------------------------------------------------------------------------------------|
| **[alacritty](.config/alacritty/)**  | Configuration files for [Alacritty](https://alacritty.org/), a GPU-accelerated terminal emulator. | [View Config](.config/alacritty/alacritty.yml)                                         |
| **[backgrounds](.config/backgrounds/)** | Custom wallpapers and background images for personalizing your desktop.                  | [View Backgrounds](.config/backgrounds/)                                               |
| **[i3](.config/i3/)**           | Config files for the [i3](https://i3wm.org/) tiling window manager.                        | [View Config](.config/i3/config)                                                       |
| **[i3status](.config/i3status/)**   | Status bar configuration for [i3status](https://i3wm.org/i3status/).                      | [View Config](.config/i3status/config)                                                 |
| **[nvim](.config/nvim/)**       | Configuration for [Neovim](https://neovim.io/), a hyperextensible Vim-based text editor.    | [View Init File](.config/nvim/init.vim)                                                |
| **[picom](.config/picom/)**      | Config files for [Picom](https://github.com/yshui/picom), a lightweight compositor.         | [View Config](.config/picom/picom.conf)                                                |
| **[rofi](.config/rofi/)**       | Configuration for [Rofi](https://github.com/davatorium/rofi), a window switcher and app launcher. | [View Config](.config/rofi/config.rasi)                                                |

---

## 🚀 Installation

1. Clone this repository:
   ```bash
   git clone https://github.com/yourusername/dotfiles.git
   ```
2. Use GNU Stow
 ```bash
cd dotfiles
stow .
```
3. Enjoy

## 🛠 Tools and Applications

This dotfiles setup makes use of several powerful tools to create a seamless and efficient environment. Below are the key applications that this setup relies on:

- **Terminal Emulator:**  
  [Alacritty](https://alacritty.org/)  
  A fast and GPU-accelerated terminal emulator.

- **Window Manager:**  
  [i3](https://i3wm.org/)  
  A dynamic tiling window manager that makes efficient use of screen real estate.

- **Compositor:**  
  [Picom](https://github.com/yshui/picom)  
  A lightweight compositor for X11, used for providing transparency and animations.

- **Launcher:**  
  [Rofi](https://github.com/davatorium/rofi)  
  A window switcher, application launcher, and more, designed to be simple and efficient.

- **Text Editor:**  
  [Neovim](https://neovim.io/)  
  An extensible, customizable text editor built to enable power users to efficiently edit text.

- **Status Bar:**  
  [i3status](https://i3wm.org/i3status/)  
  A simple, lightweight status bar for the i3 window manager, providing vital system information at a glance.

Feel free to explore and install these tools to replicate or customize your own Linux setup.
