module log {
  export def info [ msg: string ] {
    print $"(ansi blue)INFO(ansi reset) ($msg)"
  }

  export def warn [ msg: string ] {
    print $"(ansi yellow)WARN(ansi reset) ($msg)"
  }

  export def error [ msg: string ] {
    print $"(ansi red)ERR (ansi reset) ($msg)"
  }
}

export module update { 
  use log

  # Full system update + repair
  export def main [ ] {
    system
    missing
  }

  # Performs a full system update
  export def system [ ] {
    log info "Updating all packages"
    yay -Syu
  }

  # Install any missing but required packages
  export def missing [ ] {
    log info "Checking if all required packages are installed"
    let installed = yay -Qqe | lines
    let missing = open $"($env.HOME)/dotfiles/manager-packages.json" | where { |e| $e not-in $installed }

    if ($missing | is-empty) {
      log info "All required packages are installed"
    } else {
      log warn "Detected some missing packages, installing them"
      yay -S ...$missing
    }
  } 
}

# System maintenence script
export def main [ ] {
  print "OS Manager"
}
