control 'cis-docker-benchmark-3.18' do
  impact 1.0
  title 'Verify that /etc/docker/daemon.json file permissions are set to 644 or more restrictive'
  desc '\'daemon.json\' file contains sensitive parameters that may alter the behavior of docker daemon. Hence, it should be writable only by \'root\' to maintain the integrity of the file.'
  ref 'https://docs.docker.com/engine/reference/commandline/cli/#daemon-socket-option'
  ref 'https://docs.docker.com/engine/quickstart/'

  describe file('/etc/docker/daemon.json') do
    it { should exist }
    it { should be_file }
    it { should be_readable.by('owner') }
    it { should be_writable.by('owner') }
    it { should_not be_executable.by('owner') }
    it { should be_readable.by('group') }
    it { should_not be_writable.by('group') }
    it { should_not be_executable.by('group') }
    it { should be_readable.by('other') }
    it { should_not be_writable.by('other') }
    it { should_not be_executable.by('other') }
  end
end