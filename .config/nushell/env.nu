# Nushell Environment Config File
#
# version = 0.78.1

# Specifies how environment variables are:
# - converted from a string to a value on Nushell startup (from_string)
# - converted from a value back to a string when running external commands (to_string)
# Note: The conversions happen *after* config.nu is loaded
$env.ENV_CONVERSIONS = {
  "PATH": {
    from_string: { |s| $s | split row (char esep) | path expand -n }
    to_string: { |v| $v | path expand -n | str join (char esep) }
  }
  "Path": {
    from_string: { |s| $s | split row (char esep) | path expand -n }
    to_string: { |v| $v | path expand -n | str join (char esep) }
  }
}

# Directories to search for scripts when calling source or use
#
# By default, <nushell-config-dir>/scripts is added
$env.NU_LIB_DIRS = [
    ($nu.config-path | path dirname | path join 'lib')
]

# Directories to search for plugin binaries when calling register
#
# By default, <nushell-config-dir>/plugins is added
$env.NU_PLUGIN_DIRS = [
    ($nu.config-path | path dirname | path join 'plugins')
]

# To add entries to PATH (on Windows you might use Path), you can use the following pattern:
$env.PATH = ($env.PATH | split row (char esep) | prepend [
	"~/.local/share/bin"
	"~/bin/"
	"~/Documents/src/google-cloud-sdk/bin/"
	"~/.config/nushell/scripts/"
	"~/.cargo/bin/"
])

$env.DOCKER_HOST = "unix:///run/user/1000/docker.sock"
$env.EDITOR = "nvim"
$env.GIT_EXTERNAL_DIFF = "difft"
$env.DO_NOT_TRACK = 1

# Program setup
mkdir ~/.cache/carapace
carapace _carapace nushell | save -f ~/.cache/carapace/init.nu

mkdir ~/.cache/starship
starship init nu | save -f ~/.cache/starship/init.nu

mkdir ~/.cache/jujutsu
jj util completion nushell | save -f ~/.cache/jujutsu/init.nu
