#!/bin/bash
fd . /home/michal/.config/nvim/sessions -t f --changed-before 90d --exec rm -f {} +
