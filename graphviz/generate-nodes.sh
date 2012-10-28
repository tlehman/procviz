# generate the labeled process nodes
echo ""
ps -eo "%p [label=\"%c\"]" | grep -v PID
