#!/usr/bin/env bash

# Jenkins executes its scripts with "bash -xe" by default. The "-x" option causes Bash to echo every command to STDERR
# before executing it. We don't want the "/etc/profile*" scripts echoed (they're way too spammy), so we simply discard
# that output. See https://www.gnu.org/software/bash/manual/html_node/The-Set-Builtin.html
. /etc/profile 2> /dev/null
