control 'cis-docker-benchmark-3.19' do
  impact 1.0
  title 'Verify that /etc/default/docker file ownership is set to root:root'
  desc '\'/etc/default/docker\' file contains sensitive parameters that may alter the behavior of docker daemon. Hence, it should be owned and group-owned by \'root\' to maintain the integrity of the file.'
  ref 'https://docs.docker.com/engine/admin/configuring/'

  only_if { os[:family] != 'centos' }
  describe file('/etc/default/docker') do
    it { should exist }
    it { should be_file }
    it { should be_owned_by 'root' }
    it { should be_grouped_into 'root' }
  end
end