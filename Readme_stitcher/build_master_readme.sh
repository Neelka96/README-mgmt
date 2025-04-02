#!/bin/bash

# Version 3 (Current)
# Variable Declarations for easy writing
repos_root="/Users/neelagarwal/Projects/DataClassRepos"
README_mgmt="/Users/neelagarwal/Projects/Shellies/Readme_stitcher"
MASTER_README="$README_mgmt/MASTER_README.md"


# **********************************************
# 1) Remove the old MASTER_README.md if it exists
#    The '-f' option won't complain if the file isn't there.
# **********************************************
rm -f "$MASTER_README"


# **********************************************
# 2) # Go to the each Repo and extract the README file:
# **********************************************
# Go to main repo folder
cd "$repos_root" || exit 1

# Loop through each Repository name in the root
echo Looping through existing repositories...
echo "|"
for repo in */; do
    # Make sure it's a directory first and then...
    if [ -d "$repo" ]; then
        # Copy README with new name
        echo "|   Fetching from $repo"
        file="$repo"/README.md

        [ -f "$file" ] || continue
        {
            cat "$file"
            echo -e "\n#EOF\n" # Add an EOF separator
        } >> "$MASTER_README"
    fi
done

cd ~ || exit 1
echo -e "|\nDone building master README.\n"