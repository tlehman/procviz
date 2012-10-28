# generate the edges of a process graph
ps axo ppid,pid | sed 's/\b /->/g' | grep -v PID
