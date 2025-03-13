#!/bin/bash

repos_root="/Users/neelagarwal/Projects/DataClassRepos"
README_mgmt="/Users/neelagarwal/Projects/README-mgmt"

READMEs_dir="$README_mgmt/READMEs"
MASTER_README="$README_mgmt/MASTER_README.md"

# **********************************************
# 1) # Go to the folder containing your README files:
# **********************************************
cd "$repos_root" || exit 1
echo -e "\nWorking Dir:\n$PWD\n"

# i=2
echo -e "Looping through existing repositories...\n"
for repo in */; do
    if [ -d "$repo" ]; then
        cd "$repo" || exit 1
        echo -e "Grabbing README.md from $repo\n"
        # if [ "$i" -lt 10 ]; then
        #     file_name=0"$i""${repo//"-challenge"/""}"_README.md
        # else
        #     file_name="$i""${repo//"-challenge"/""}"_README.md
        # fi
        cp README.md "$READMEs_dir/$repo-README.md"
    fi
    # i=$((i+1))
done

# **********************************************
# 2) Remove the old MASTER_README.md if it exists
#    The '-f' option won't complain if the file isn't there.
# **********************************************
rm -f "$MASTER_README"

# **********************************************
# 3) # Go to the folder containing your README files:
# **********************************************
cd "$READMEs_dir" || exit 1

# **********************************************
# 4) Concatenate all files that end with "_README.md"
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