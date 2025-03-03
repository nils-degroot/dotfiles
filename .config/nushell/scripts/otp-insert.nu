#!/usr/bin/env -S nu

def main [ entry:string ] {
	grim -g (slurp) /tmp/otp.png
	zbarimg -q --raw /tmp/otp.png | pass otp insert $entry
}
