#!/bin/bash

echo -e "Running full master pkg update/clean.\n"

echo "For brew..."
( brew update && brew upgrade ) > /dev/null 2>&1 || { echo "Brew update failed!"; exit 1; }
echo -e "Done!\n"

echo "For conda..."
conda clean --all -y > /dev/null 2>&1 || { echo "Conda cleaning failed!"; exit 1; }
echo -e "Done!\n"



while true; do
    read -p "Do you want to update your local DataViz repo?(y/n)" response
    response=$( echo "$response" | tr '[:upper:]' '[:lower:]')

    case "$response" in
        y|yes)
            echo "For DataViz repo..."

            cd /Users/neelagarwal/UTA-VIRT-DATA-PT-11-2024-U-LOLC || exit 1
            ( git stash && git stash clear && git clean -f -d && git pull ) > /dev/null 2>&1 || { echo -e "DataViz repo updated failed!"; exit 1; }
            echo -e "Done!\n"
            break
            ;;
        n|no)
            echo -e "You selected no, moving on.\n"
            break
            ;;
        *)
            echo -e "Invalid response. Please answer y or n."
            ;;
    esac
done
