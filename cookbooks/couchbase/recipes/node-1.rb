cb_user=node['couchbase']['server']['username']
cb_pass=node['couchbase']['server']['password']

execute 'init_cluster' do
  command <<-EOM.gsub(/\s+/,' ').strip!
	sudo /opt/couchbase/bin/couchbase-cli cluster-init
	--cluster-username=#{cb_user}
	--cluster-password=#{cb_pass}
	--cluster-ramsize=512
     EOM
  retries 3
  retry_delay 5
  not_if '/opt/couchbase/bin/couchbase-cli server-list -c localhost' ,:environment => {
    'CB_REST_USERNAME' => cb_user,
    'CB_REST_PASSWORD' => cb_pass
  }
end
