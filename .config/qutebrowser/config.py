# =========================
#  QUTEBROWSER CONFIG
# =========================

# Load autoconfig (keeps :set changes)
config.load_autoconfig()

# -------------------------
# General behavior
# -------------------------
c.auto_save.session = True
c.scrolling.smooth = True
c.tabs.background = True
c.tabs.select_on_remove = "last-used"
c.tabs.position = "top"
c.tabs.show = "multiple"
c.window.hide_decoration = False
c.colors.webpage.preferred_color_scheme = "dark"


# -------------------------
# Transparency
# -------------------------
c.window.transparent = True
c.colors.webpage.bg = "transparent"

# -------------------------
# Colors (with alpha)
# -------------------------
c.colors.tabs.bar.bg = "rgba(46, 52, 64, 0.6)"
c.colors.tabs.even.bg = "rgba(46, 52, 64, 0.4)"
c.colors.tabs.odd.bg = "rgba(46, 52, 64, 0.4)"
c.colors.tabs.selected.even.bg = "rgba(59, 66, 82, 0.7)"
c.colors.tabs.selected.odd.bg = "rgba(59, 66, 82, 0.7)"

c.colors.statusbar.normal.bg = "rgba(46, 52, 64, 0.6)"
c.colors.statusbar.command.bg = "rgba(46, 52, 64, 0.7)"
c.colors.statusbar.insert.bg = "rgba(59, 66, 82, 0.7)"

c.colors.completion.category.bg = "rgba(46, 52, 64, 0.8)"
c.colors.completion.item.selected.bg = "rgba(59, 66, 82, 0.8)"
# -------------------------
# Search engines
# -------------------------
c.url.searchengines = {
    "DEFAULT": "https://duckduckgo.com/?q={}",
    "g": "https://www.google.com/search?q={}",
    "w": "https://en.wikipedia.org/wiki/{}",
}

# -------------------------
# Downloads
# -------------------------
c.downloads.location.directory = "~/Downloads"
c.downloads.position = "bottom"
c.downloads.remove_finished = 3000

# -------------------------
# Privacy & security
# -------------------------
c.content.autoplay = False
c.content.webrtc_ip_handling_policy = "disable-non-proxied-udp"
c.content.geolocation = False
c.content.notifications.enabled = False
c.content.canvas_reading = False

# -------------------------
# Ad & tracker blocking
# -------------------------
c.content.blocking.method = "auto"
c.content.blocking.adblock.lists = [
    "https://easylist.to/easylist/easylist.txt",
    "https://easylist.to/easylist/easyprivacy.txt",
]


# -------------------------
# Fonts
# -------------------------
c.fonts.default_family = ["JetBrainsMono Nerd Font"]
c.fonts.default_size = "11pt"

# -------------------------
# Status bar & hints
# -------------------------
c.statusbar.show = "always"
c.hints.border = "1px solid #5e81ac"
c.hints.chars = "asdfghjkl"

# -------------------------
# Key bindings
# -------------------------

# Tab management
config.bind("<Ctrl-t>", "open -t")
config.bind("<Ctrl-w>", "tab-close")
config.bind("<Ctrl-Shift-t>", "undo")
config.bind("J", "tab-prev")
config.bind("K", "tab-next")

# Reload
config.bind("<Ctrl-r>", "reload")

# Quick commands
config.bind("xx", "tab-close")
config.bind("xb", "set tabs.show never")
config.bind("xs", "set tabs.show multiple")

# Open config quickly
config.bind("ec", "config-edit")
config.bind("er", "config-source")

# -------------------------
# External editor (optional)
# -------------------------
# Uncomment if you use nvim / vim
c.editor.command = ["alacritty", "-e", "nvim", "{}"]

# -------------------------
# Google compatibility
# -------------------------
config.set(
    "content.headers.user_agent",
    "Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 "
    "(KHTML, like Gecko) Chrome/120.0.0.0 Safari/537.36",
    "https://accounts.google.com/*"
)

config.set(
    "content.headers.user_agent",
    "Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 "
    "(KHTML, like Gecko) Chrome/120.0.0.0 Safari/537.36",
    "https://*.google.com/*"
)
# =========================
#  END CONFIG
# =========================
