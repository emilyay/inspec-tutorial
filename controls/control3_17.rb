control 'cis-docker-benchmark-3.17' do
  impact 1.0
  title 'Verify that daemon.json file ownership is set to root:root'
  desc '\'daemon.json\' file contains sensitive parameters that may alter the behavior of docker daemon. Hence, it should be owned and group-owned by \'root\' to maintain the integrity of the file.'
  ref 'https://docs.docker.com/engine/reference/commandline/daemon/#daemon-configuration-file'

  describe file('/etc/docker/daemon.json') do
    it { should exist }
    it { should be_file }
    it { should be_owned_by 'root' }
    it { should be_grouped_into 'root' }
  end
end