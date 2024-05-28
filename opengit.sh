#!/bin/bash

# Set the default directory to current directory if $1 is not provided
directory=${1:-.}

# Get the git remote URL from the specified directory
url=$(git -C "$directory" config --get remote.origin.url)

# Check if the URL was successfully retrieved
if [ -z "$url" ]; then
  echo "No git remote origin URL found in the specified directory."
  open "https://github.com"
  exit 1
fi

# Extract the repository path using sed
repo_path=$(echo $url | sed 's/git@github\.com:\(.*\)\.git/\1/' | sed 's/https:\/\/github.com\///' | sed 's/\.git//')

# Concatenate with the base URL
full_url="https://github.com/$repo_path"

# Open Google Chrome with the URL
open -a "Google Chrome" "$full_url"

