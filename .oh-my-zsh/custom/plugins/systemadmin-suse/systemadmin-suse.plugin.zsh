# ------------------------------------------------------------------------------
# Description
# -----------
#
# This is one for the system administrator, operation and maintenance.
# Some of which come from http://justinlilly.com/dotfiles/zsh.html
#
# Adapted for OpenSUSE environments by Claus Es (01/07/2015).
#
# ------------------------------------------------------------------------------
# Authors
# -------
#
# * Dongweiming <ciici123@gmail.com>
# * Claus Es <clauses@gmail.com>
#
# ------------------------------------------------------------------------------

function retval() {
if [[ -z $1 ]];then
	echo '.'
else
	echo $1
fi
}

function retlog() {
if [[ -z $1 ]];then
	echo '/var/log/apache2/access_log'
else
	echo $1
fi
}

# Determine the name of the internet-facing Network Interface Card (NIC)
function nicname() {
if [[ -z $1 ]];then
	ip a | grep 'inet ' | grep -v '127.0.0.1' | awk '{print $7}'
else
	echo $1
fi
}

alias ping='ping -c 5'
alias clr='clear;echo "$fg[default]You are currently logged in on $fg[green]$(tty)$fg[default], as $fg[magenta]$USER $fg[default]in directory $fg[blue]$PWD"'
alias path='echo -e ${PATH//:/\\n}'
alias mkdir='mkdir -pv'
# get top process eating memory
alias psmem='ps -e -orss=,args= | sort -b -k1,1n'
alias psmem10='ps -e -orss=,args= | sort -b -k1,1n |  head -10'
# get top process eating cpu if not work try excute : export LC_ALL='C'
alias pscpu='ps -e -o pcpu,cpu,nice,state,cputime,args | sort -k1 -nr'
alias pscpu10='ps -e -o pcpu,cpu,nice,state,cputime,args | sort -k1 -nr | head -10'
# top10 of the history
alias hist10='print -l ${(o)history%% *} | uniq -c | sort -nr | head -n 10'

# Directory `ls`
dls () {
	echo $fg[blue]`ls -l | grep "^d" | awk '{print $9}'` | sed 's/ /\n/g' 
}

# Run grep on `ps aux`. Enter `psgrep <something>`
psgrep() {
	ps aux | grep "$(retval $1)" | grep -v grep
}

# Kills any process that matches a regexp passed to it
killit() {
	ps aux | grep -v "grep" | grep "$@" | awk '{print $2}' | xargs sudo kill
}

# List contents of directories in a tree-like format
if [ -z "\${which tree}" ]; then
	tree () {
		find $@ -print | sed -e 's;[^/]*/; | ____;g;s;____ | ;  | ;g'
	}
fi

# Sort connection state
sortcons() {
	# netstat -nat  | awk '{print $6}' | sort | uniq -c | sort -rn
	sudo ss -nat | awk '{print $6}' | sort | uniq -c | sort -rn	
}

# View all 80 Port Connections
con80() {
	# netstat -nat | grep -i ":80" | wc -l
	sudo ss -nat | grep -i ":80" 
}

# On the connected IP sorted by the number of connections
sortconip() {
	# netstat -ntu | awk '{print $5}' | cut -d: -f1 | sort | uniq -c | sort -n
	sudo ss -ntu | awk '{print $5}' | cut -d: -f1 | sort | uniq -c | sort -n
}

# top20 of Find the number of requests on 80 port
req20() {
	# netstat -anlp | grep 80 | grep tcp | awk '{print $5}' | awk -F: '{print $1}' | sort | uniq -c | sort -nr | head -n20
	sudo ss -ntu | grep 80 | grep tcp | awk '{print $5}' | awk -F: '{print$1}' | sort | uniq -c | sort -nr | head -n20
}

# Echo http traffic
httpdump() {
	sudo tcpdump -i "$(nicname $1)" -tnn dst port 80 -c 1000
}

# Echo https traffic
httpsdump() {
	sudo tcpdump -i "$(nicname $1)" -tnn dst port 443 -c 1000
}

# top20 of Using tcpdump port 80 access to view
http20() {
	sudo tcpdump -i "$(nicname $1)" -tnn dst port 80 -c 1000 | awk -F"." '{print $1"."$2"."$3"."$4}' | sort | uniq -c | sort -nr  | head -20
}

# top20 of Find time_wait connection
timewait20() {
	# netstat -n | grep TIME_WAIT | awk '{print $5}' | sort | uniq -c | sort -rn | head -n20
	sudo ss -n | grep TIME_WAIT | awk '{print $5}' | sort | uniq -c | sort -rn | head -n20
}

# top20 of Find SYN connection
syn20() {
	# netstat -an | grep SYN | awk '{print $5}' | awk -F: '{print $1}' | sort | uniq -c | sort -nr | head -n20
	sudo ss -an | grep SYN | awk '{print $5}' | awk -F: '{print $1}' | sort | uniq -c | sort -nr | head -n20
}

# Printing process according to the port number
port_pro() {
	# netstat -ntlp | grep "$(retval $1)" | awk '{print $7}' | cut -d/ -f1
	sudo ss -ntlp | grep "$(retval $1)" | awk '{print $7}' | cut -d/ -f1
}

# Print connections to `http` (port 80)
porthttp() {
	sudo ss -o state established '( dport = :http )'
}

# Print connections to `https` (port 443)
porthttps() {
	sudo ss -o state established '( dport = :https )'
}

# Print number of connections to port 80
porthttpn() {
	sudo ss -o state established '( dport = :http )' | awk -F"[\t :]+" 'NR!=1{ ip[$5]+=1 } END{ for (i in ip){n++};print n }'
}

# Top 25 most served URLs from the `httpd` log
toppages() {
	sudo awk '{print $11}' "$(retlog)" | sort | uniq -c | sort -nr | head -25
}

# Top 100 of Page lists the most time-consuming (more than 60 seconds) as well as the corresponding page number of occurrences
consume100() {
	sudo awk '($NF > 60 && $7~/\.php/){print $7}' "$(retlog)"  | sort -n | uniq -c | sort -nr | head -100
	# if django website or other webiste make by no suffix language
	# awk '{print $7}' "$(retlog)"  | sort -n | uniq -c | sort -nr | head -100
}

# Website traffic statistics (This one was supposed to sum the bytes, but in the Apache2 log size is not a recorded field).
# webtraffic() {
# 	sudo awk "{sum+=$10} END {print sum/1024/1024/1024}" "$(retlog)"
# }

# Statistical connections 404
c404() {
	sudo awk '($9 ~/404/)' "$(retlog)" | awk '{print $9,$7}' | sort
}

# Statistical http status.
httpstatus() {
	sudo awk '{counts[$(9)]+=1}; END {for(code in counts) print code, counts[code]}' "$(retlog)"
}

# Delete 0 byte file
d0() {
	find "$(retval $1)" -type f -size 0 -exec rm -rf {} \;
}

# Echo name of local NIC card
getnic() {
	echo "$(nicname $1)"
}

# Determine local IP address
getip() {
	# ifconfig  | grep 'inet addr:' |  grep -v '127.0.0.1' | cut -d: -f2 | awk '{ print $1}'
	ip a | grep 'inet ' |  grep -v '127.0.0.1' | cut -d: -f2 | awk '{print $2}' | sed 's/\/.*//'	
}

# gather external ip address
geteip() {
	# curl http://ifconfig.me
	# curl http://bot.whatismyipaddress.com
	# curl http://icanhazip.com 
	curl http://checkip.amazonaws.com 
	# curl https://wtfismyip.com/text 
	# curl http://checkip.dyndns.com 
}

# Determine router
router() {
	ip route | awk '{print $3}' | awk 'NR==1{print $1}' 
}

# Clear zombie processes
clrz() {
	# ps -eal | awk '{ if ($2 == "Z") {print $4}}' | kill -9
	sudo ps -eal | awk '{ if ($2 == "Z") {print $4}}' | xargs kill -9	
}

# Second concurrent
conssec() {
	sudo awk '{if($9~/200 | 30 | 404/)COUNT[$4]++}END{for( a in COUNT) print a,COUNT[a]}' "$(retlog)" | sort -k 2 -nr | head -n10
}

