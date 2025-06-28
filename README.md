 # 🌟 Wavings's Dotfiles – `.config/`

 This repository contains my personal Linux configuration files, optimized for a minimal, fast, and beautiful development experience. These dotfiles cover window management, terminal, code editing, and visual theming.

 ---

 ## 📁 Folder Structure

 ```
 .config/
 ├── alacritty/        # Alacritty terminal configuration
 ├── i3/               # i3 Window Manager config
 ├── i3blocks/         # Status bar scripts and config for i3blocks
 ├── lockscreen/       # Custom lock screen script
 ├── nvim/             # Neovim configuration (Lua-based)
 ├── picom/            # Compositor configuration (transparency, blur, etc.)
 └── wallpapers/       # Wallpaper rotation script
 ```
 ---

 ## 🚀 Getting Started

 Clone this repo and copy/symlink `.config` contents to your home:

I am using GNU Stow for my dotfiles management
 ```bash
 git clone https://github.com/WavingRoger/dotfiles.git
cd dotfiles
stow .
 ```

 ---

 ## 📌 Requirements

 - i3-gaps / i3
 - i3blocks
 - picom
 - alacritty
 - neovim (>= 0.8 recommended)
 - Nerd Fonts
 - feh / nitrogen (for wallpapers)
 - betterlockscreen or i3lock

 ---

 ## 🤖 Optional Tools
 
 - `playerctl` for media keys
 -  or `dmenu` for app launching

 --- 

 ## 🧠 License

 MIT License — feel free to use and modify.

 ---

 ## 🔥 Author

 Made with ❤️ by [WavingRoger](https://github.com/WavingRoger)

