#!/bin/bash

sed -E "s/{{USER_PATH}}/\/Users\/$(whoami)/" iterm2/iterm2-config > \
  "iterm2/$(whoami)-iterm2-config.plist"
