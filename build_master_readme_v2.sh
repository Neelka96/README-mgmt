#!/bin/bash

# Variable Declarations for easy writing
repos_root="/Users/neelagarwal/Projects/DataClassRepos"
README_mgmt="/Users/neelagarwal/Projects/README-mgmt"

READMEs_dir="$README_mgmt/READMEs"
MASTER_README="$README_mgmt/MASTER_README.md"

# **********************************************
# 1) # Remove old README's directory and create a new one:
# **********************************************
if [ -d "$READMEs_dir"]; then
    rm -r "$READMEs_dir"
    echo READMEs directory already exists - deleting...
fi

mkdir "$READMEs_dir"
echo READMEs directory created.

# **********************************************
# 2) # Go to the each Repo and extract the README file:
# **********************************************
# Go to main repo folder
cd "$repos_root" || exit 1
echo -e "\nWorking Dir:\n$PWD\n"

# Loop through each Repository name in the root
echo -e "Looping through existing repositories...\n"
for repo in */; do
    # Make sure it's a directory first and then...
    if [ -d "$repo" ]; then
        # Move to that repo or exit on error
        cd "$repo" || exit 1
        echo -e "Grabbing README.md from $repo\n"
        # Copy README with new name
        length=${#repo}
        newName=${repo:0:length-1}
        newName=${newName/-challenge/}_README.md
        echo "$newName"
        cp README.md "$READMEs_dir/$newName"
    else 
        exit 1
    fi
done

# **********************************************
# 3) Remove the old MASTER_README.md if it exists
#    The '-f' option won't complain if the file isn't there.
# **********************************************
rm -f "$MASTER_README"

# **********************************************
# 4) # Go to the folder containing your README files:
# **********************************************
cd "$READMEs_dir" || exit 1

# **********************************************
# 5) Concatenate all files that end with "_README.md"
#    into MASTER-README.md (Globbing)
# **********************************************
for file in *_README.md
do
    # If no files match, `file` will literally be '*_README.md'
    # so we skip if it's not a real file.
    [ -f "$file" ] || continue
    
    echo "Adding $file..."
    {
        cat "$file"
        echo -e "\n#EOF\n" # Add an EOF separator
    } >> ../MASTER_README.md
done

cd ~ || exit 1

echo -e "\nMASTER_README.md has been created/updated."