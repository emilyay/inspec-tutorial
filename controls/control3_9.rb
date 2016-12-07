control 'cis-docker-benchmark-3.9' do
  impact 1.0
  title 'Verify that TLS CA certificate file ownership is set to root:root'
  desc 'Verify that the TLS CA certificate file (the file that is passed alongwith \'--tlscacert\' parameter) is owned and group-owned by \'root\'.'
  ref 'https://docs.docker.com/engine/security/certificates/'
  ref 'https://docs.docker.com/engine/security/https/'

  json('/etc/docker/daemon.json').params['tlscacert']

  describe file(json('/etc/docker/daemon.json').params['tlscacert']) do
    it { should exist }
    it { should be_file }
    it { should be_owned_by 'root' }
    it { should be_grouped_into 'root' }
  end
end