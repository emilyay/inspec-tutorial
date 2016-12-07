control 'cis-docker-benchmark-3.20' do
  impact 1.0
  title 'Verify that /etc/default/docker file permissions are set to 644 or more restrictive'
  desc 'Verify that the \'/etc/default/docker\' file permissions are correctly set to \'644\' or more restrictive.'
  ref 'https://docs.docker.com/engine/admin/configuring/'

  only_if { os[:family] != 'centos' }
  describe file('/etc/default/docker') do
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