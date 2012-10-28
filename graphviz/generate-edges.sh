# generate the edges of a process graph
echo ""
ps axo ppid,pid | sed 's/\b /->/g' | grep -v PID
