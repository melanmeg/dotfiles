#!/bin/bash

# ================================
#  Added settings
# ================================

# .colorrc
# shellcheck disable=SC2046
eval $(dircolors -b ~/.colorrc)
alias ls='ls --color=auto'
