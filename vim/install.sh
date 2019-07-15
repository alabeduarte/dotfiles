#!/bin/bash

# Creates symbolic link
rm ~/.vimrc || true
ln -s `pwd`/.vimrc ~/.vimrc
