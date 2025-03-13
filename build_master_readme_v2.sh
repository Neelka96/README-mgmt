#!/bin/bash

# Variable Declarations for easy writing
repos_root="/Users/neelagarwal/Projects/DataClassRepos"
README_mgmt="/Users/neelagarwal/Projects/README-mgmt"

READMEs_dir="$README_mgmt/READMEs"
MASTER_README="$README_mgmt/MASTER_README.md"

# **********************************************
# 1) # Remove old README's directory and create a new one:
# **********************************************
echo -e "\n"
if [ -d "$READMEs_dir" ]; then
    rm -r "$READMEs_dir"
    echo READMEs directory already exists - deleting...
fi

mkdir "$READMEs_dir"
echo -e "READMEs directory created.\n"

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
        length=${#repo}
        newName=${repo:0:length-1}
        newName=${newName/-challenge/}_README.md
        cp "$repo"README.md "$READMEs_dir/$newName"
        echo "|   Fetching from $repo"
    fi
done
echo "|"
echo -e "Done building README directory.\n"

# **********************************************
# 3) Remove the old MASTER_README.md if it exists
#    The '-f' option won't complain if the file isn't there.
# **********************************************
rm -f "$MASTER_README"

# **********************************************
# 4) # Go to the folder containing your README files:
# **********************************************
cd "$READMEs_dir" || exit 1

echo -e "-----------------------------------------------------------\n"

# **********************************************
# 5) Concatenate all files that end with "_README.md"
#    into MASTER-README.md (Globbing)
# **********************************************
echo Looping and concatenating READMEs...
echo "|"
for file in *_README.md
do
    # If no files match, `file` will literally be '*_README.md'
    # so we skip if it's not a real file.
    [ -f "$file" ] || continue
    
    echo "|   Adding $file..."
    {
        cat "$file"
        echo -e \n#EOF\n # Add an EOF separator
    } >> ../MASTER_README.md
done

cd ~ || exit 1

echo "|"
echo -e "\nMASTER_README.md has been created/updated!\n"