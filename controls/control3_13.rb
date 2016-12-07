control 'cis-docker-benchmark-3.13' do
  impact 1.0
  title 'Verify that Docker server certificate key file ownership is set to root:root'
  desc 'Verify that the Docker server certificate key file (the file that is passed alongwith \'--tlskey\' parameter) is owned and group-owned by \'root\'.'
  ref 'https://docs.docker.com/engine/security/certificates/'
  ref 'https://docs.docker.com/engine/security/https/'

  describe file(json('/etc/docker/daemon.json').params['tlskey']) do
    it { should exist }
    it { should be_file }
    it { should be_owned_by 'root' }
    it { should be_grouped_into 'root' }
  end
end