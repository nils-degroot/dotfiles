config.load_autoconfig()

# Load theme
config.source("custom/theme.py")

# Bindings
config.bind("b", "set-cmd-text -sr :tab-focus")
config.unbind("T")

# Other config
c.editor.command = ["alacritty", "-e", "nvim", "{file}"]

c.downloads.position = "bottom"

c.fonts.default_family = ["Iosevka", "Noto Emoji Color"]

c.url.start_pages = ["http://localhost"]
c.url.searchengines = {"DEFAULT": "https://startpage.com/do/search?query={}"}
