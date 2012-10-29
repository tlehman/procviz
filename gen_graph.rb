require 'pry'

class Node < Struct.new(:ppid, :pid, :command); end

class Graph
  attr_reader :nodes
  
  def initialize
    @nodes = []
    proc_data.each do |pd|
      /(^(\s*)(?<ppid>\d+))\s+(?<pid>\d+)\s+(?<comm>(.*))$/ =~ pd
      @nodes << Node.new(ppid, pid, comm.strip)
    end
    binding.pry
  end
  
  def to_arborjs
  end

  def to_graphviz
    dot_file = "digraph proc { \n"

    # nodes 
    nodes.map do |node|
     dot_file << "#{node.pid} [label=\"#{node.command}\"] \n"
    end
    
    # edges
    nodes.map do |node|
      dot_file << " #{node.ppid} -> #{node.pid} \n"
    end

    dot_file << "}"
  end

  private

  def proc_data
    pid_ppid_comm = `ps axo ppid,pid,ucomm | grep -v PID`
    ppcs = pid_ppid_comm.split("\n")
  end
end

g = Graph.new
puts g.to_graphviz
