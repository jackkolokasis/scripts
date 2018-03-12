
###################################################
#
# file: rmDuplicates.sh
#
# @Author:   Iacovos G. Kolokasis
# @Version:  12-03-2018
# @email:    kolokasis@ics.forth.gr
#
# Check for duplicates records in a file and ask the
# user to remove them or keep them.
# 
# How to run:
# -----------
# ./rmDuplicates.sh <file>
#   
###################################################


inputFile=$1            # Input File


# Check for duplicates 
awk 'a[$0]++{exit 1}' $inputFile

# $? contains the return value of the last command
if [ $? != 0 ] ; then
    echo -n "remove duplicates? [y/n] "
    read answer

    # check answer
    if [ "$answer" == "y" ] ; then
        uniq $inputFile > uniq_$inputFile            
    fi
fi
