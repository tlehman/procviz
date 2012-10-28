# this is the data we will use to construct the arborjs graph
pid_ppid_comm = `ps axo ppid,pid,comm | grep -v PID`

ppcs = pid_ppid_comm.split("\n")

class Node < Struct.new(:ppid, :pid, :command); end
nodes = Array.new

ppcs.each do |ppc|
  /(^(\s*)(?<ppid>\d+))\s+(?<pid>\d+)\s+(?<comm>(.*))$/ =~ ppc
  nodes << Node.new(ppid, pid, comm)
end


