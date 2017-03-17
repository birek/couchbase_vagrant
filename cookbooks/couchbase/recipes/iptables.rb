#
# Cookbook:: couchbase
# Recipe:: default
#
# Copyright:: 2017, The Authors, All Rights Reserved.

include_recipe 'iptables::default'

iptables_rule 'cbw_8091' do
  lines [ 
'-A INPUT -p tcp -m state --state NEW -m tcp --dport 8091 -j ACCEPT',
'-A INPUT -p tcp -m state --state NEW -m tcp --dport 4369 -j ACCEPT',
'-A INPUT -p tcp -m state --state NEW -m tcp --dport 8093 -j ACCEPT',
'-A INPUT -p tcp -m state --state NEW -m tcp --dport 8092 -j ACCEPT',
'-A INPUT -p tcp -m state --state NEW -m tcp --dport 11209 -j ACCEPT',
'-A INPUT -p tcp -m state --state NEW -m tcp --dport 11210 -j ACCEPT',
'-A INPUT -p tcp -m state --state NEW -m tcp --dport 11211 -j ACCEPT',
'-A INPUT -p tcp -m state --state NEW -m tcp --dport 11214 -j ACCEPT',
'-A INPUT -p tcp -m state --state NEW -m tcp --dport 11215 -j ACCEPT',
'-A INPUT -p tcp -m state --state NEW -m tcp --dport 18091 -j ACCEPT',
'-A INPUT -p tcp -m state --state NEW -m tcp --dport 18092 -j ACCEPT',
'-A INPUT -p tcp -m state --state NEW -m tcp --dport 21100:21199 -j ACCEPT',
].flatten.join("\n")
end

service 'iptables' do
  action [:reload]
end

