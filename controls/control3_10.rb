control 'cis-docker-benchmark-3.10' do
  impact 1.0
  title 'Verify that TLS CA certificate file permissions are set to 444 or more restrictive'
  desc 'Verify that the TLS CA certificate file (the file that is passed alongwith \'--tlscacert\' parameter) has permissions of \'444\' or more restrictive.'
  ref 'https://docs.docker.com/engine/security/certificates/'
  ref 'https://docs.docker.com/engine/security/https/'

  describe file(json('/etc/docker/daemon.json').params['tlscacert']) do
    it { should exist }
    it { should be_file }
    it { should be_readable }
    it { should_not be_executable }
    it { should_not be_writable }
  end
end