#!/usr/bin/env fish
#
# ls-abbr: ls abbreviations for the fish shell
#

set -g __ls_abbr_version 0.1.0

abbr l eza
abbr ls eza --icons
abbr ll eza --icons -l
abbr la eza --icons -la

abbr tree eza --icons --tree

