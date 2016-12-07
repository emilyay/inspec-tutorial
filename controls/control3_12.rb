control 'cis-docker-benchmark-3.12' do
  impact 1.0
  title 'Verify that Docker server certificate file permissions are set to 444 or more restrictive'
  desc 'Verify that the Docker server certificate file (the file that is passed alongwith \'--tlscert\' parameter) has permissions of \'444\' or more restrictive.'
  ref 'https://docs.docker.com/engine/security/certificates/'
  ref 'https://docs.docker.com/engine/security/https/'

  describe file(json('/etc/docker/daemon.json').params['tlscert']) do
    it { should exist }
    it { should be_file }
    it { should be_readable }
    it { should_not be_executable }
    it { should_not be_writable }
  end
end