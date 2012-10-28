def proc_data
  pid_ppid_comm = `ps axo ppid,pid,comm | grep -v PID`
  ppcs = pid_ppid_comm.split("\n")
end

class Node < Struct.new(:ppid, :pid, :command); end

class Graph
  attr_reader :nodes
  
  def initialize(node_list)
    @nodes = []
    node_list.each do |ppc|
      /(^(\s*)(?<ppid>\d+))\s+(?<pid>\d+)\s+(?<comm>(.*))$/ =~ ppc
      @nodes << Node.new(ppid, pid, comm)
    end
  end
  
  def to_arborjs
  end

  def to_graphviz
  end
end
