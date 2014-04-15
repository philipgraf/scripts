git stash -q --keep-index
rake
RESULT=$?
git stash pop -q
[ $RESULT -ne 0 ] && exit 1
exit 0
