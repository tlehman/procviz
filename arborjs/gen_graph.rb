# this is the data we will use to construct the arborjs graph
pid_ppid_comm = `ps axo ppid,pid,comm | grep -v PID`
