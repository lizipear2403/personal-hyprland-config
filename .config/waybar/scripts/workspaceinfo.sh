#!/bin/bash
info=$(hyprctl activeworkspace -j)
layout=$(echo "$info" | jq -r '.tiledLayout')
title=$(echo "$info" | jq -r '.lastwindowtitle')
