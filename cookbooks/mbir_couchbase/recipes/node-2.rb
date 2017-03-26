cb_ip_node1   = node['couchbase']['node1']['ipaddress']
cb_ip_node2   = node['couchbase']['node2']['ipaddress']
cb_user       = node['couchbase']['server']['username']
cb_pass       = node['couchbase']['server']['password']


execute 'connect_to_cluster' do
  command <<-EOM.gsub(/\s+/,' ').strip!
        sudo /opt/couchbase/bin/couchbase-cli server-add
		--cluster=#{cb_ip_node1}:8091  
		--user #{cb_user}
		--password #{cb_pass}
		--server-add=#{cb_ip_node2}:8091
		--server-add-username=#{cb_user}
            	--server-add-password=#{cb_pass}
     EOM
  retries 3
  retry_delay 5
end

execute 'rebalance_cluster' do
  command <<-EOM.gsub(/\s+/,' ').strip!
        sudo /opt/couchbase/bin/couchbase-cli rebalance
                --cluster=#{cb_ip_node1}:8091
                --user #{cb_user}
                --password #{cb_pass}
                --server-add-username=#{cb_user}
                --server-add-password=#{cb_pass}
     EOM
  retries 3
  retry_delay 5
end

execute 'create_bucket' do
  command <<-EOM.gsub(/\s+/,' ').strip!
        sudo /opt/couchbase/bin/couchbase-cli bucket-create
		--cluster=#{cb_ip_node1}:8091  
		--user #{cb_user}
		--password #{cb_pass}
		--bucket=my_protected_bucket
		--bucket-type=couchbase
		--bucket-password="pass123@"
		--bucket-ramsize=200
		--bucket-replica=1
     EOM
  retries 3
  retry_delay 10
end


