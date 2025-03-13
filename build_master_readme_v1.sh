#!/bin/bash

cd /Users/neelagarwal/Projects/DataClassRepos || exit 1



# **********************************************
# 1) # Go to the folder containing your README files:
# **********************************************
cd READMEs || exit 1

# **********************************************
# 2) Remove the old MASTER_README.md if it exists
#    The '-f' option won't complain if the file isn't there.
# **********************************************
rm -f ../Users/neelagarwal/Projects//MASTER_README.md

# **********************************************
# 3) Concatenate all files that end with "_README.md"
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
        echo ""  # Add a blank line separator
        echo "#EOF" # Add an EOF separator too
        echo ""
    } >> ../MASTER_README.md
done

cd ~ || exit 1

echo ""
echo "MASTER_README.md has been created/updated."