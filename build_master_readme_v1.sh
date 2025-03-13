#!/bin/bash

# **********************************************
# 1) Remove the old MASTER_README.md if it exists
#    The '-f' option won't complain if the file isn't there.
# **********************************************
rm -f /Users/neelagarwal/Projects/README-mgmt/MASTER_README.md

# **********************************************
# 2) # Go to the folder containing your README files:
# **********************************************
cd /Users/neelagarwal/Projects/README-mgmt/READMEs || exit 1

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