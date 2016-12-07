control 'cis-docker-benchmark-3.11' do
  impact 1.0
  title 'Verify that Docker server certificate file ownership is set to root:root'
  desc 'Verify that the Docker server certificate file (the file that is passed alongwith \'--tlscert\' parameter) is owned and group-owned by \'root\'.'
  ref 'https://docs.docker.com/engine/security/certificates/'
  ref 'https://docs.docker.com/engine/security/https/'

  describe file(json('/etc/docker/daemon.json').params['tlscert']) do
    it { should exist }
    it { should be_file }
    it { should be_owned_by 'root' }
    it { should be_grouped_into 'root' }
  end
end