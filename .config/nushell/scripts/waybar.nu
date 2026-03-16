#!/usr/bin/env -S nu

def "main audio" [] {
  let sink = ( pactl -f json list sinks | from json | where state == "RUNNING" | first )
  if $sink == null {
    return ""
  }

  let card = ( pactl -f json list cards | from json | where name =~ "bluez" | first )
  if $card == null {
    return ""
  }

  let profile = ( $card.profiles | get $card.active_profile | get description | str replace -r "\\w*\\(.*$" "" )

  $"🎧 ($sink.description) - ($profile)"
}

def "main audio toggle" [] {
  let profile_high_quality = "a2dp-sink"
  let profile_headset_unit = "headset-head-unit"

  let card = ( pactl -f json list cards | from json | where name =~ "bluez" | first )
  if $card == null {
    return
  }

  if $card.active_profile == $profile_high_quality {
    pactl set-card-profile $card.index $profile_headset_unit
  } else {
    pactl set-card-profile $card.index $profile_high_quality
  }
}

def "main media" [] {
  playerctl metadata -f "{{artist}} - {{title}}"
}

def "main media image" [] {
  playerctl metadata mpris:artUrl | str replace "file://" ""
}

def main [] {
  "Custom waybar widgets"
}
