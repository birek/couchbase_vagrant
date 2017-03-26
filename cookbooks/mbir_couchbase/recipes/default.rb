#
# Cookbook:: couchbase
# Recipe:: default
#
# Copyright:: 2017, The Authors, All Rights Reserved.

couchbase_repo_package=node['couchbase']['server']['repo_package_file']
cb_user=node['couchbase']['server']['username']
cb_pass=node['couchbase']['server']['password']

remote_file '/tmp/#{couchbase_repo_package}' do
  source node['couchbase']['server']['repo_package_url']
end

rpm_package 'couchbase-release-1.0-2-x86_64' do
  source '/tmp/#{couchbase_repo_package}'
end

package 'couchbase-server-community' do
	version '4.5.0-2601'
end

service 'couchbase-server' do
  action [:enable, :start]
end

service 'iptables' do
  action [:stop, :disable]
end
