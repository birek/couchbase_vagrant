#
# Cookbook:: ryancb
# Recipe:: default
#
# Copyright:: 2017, The Authors, All Rights Reserved.

include_recipe "couchbase::server"

service 'iptables' do
 action [:stop,:disable]
end
