control 'cis-docker-benchmark-3.3' do
  impact 1.0
  title 'Verify that docker.socket file ownership is set to root:root'
  desc 'Verify that the \'docker.socket\' file ownership and group-ownership are correctly set to \'root\''
  ref 'https://docs.docker.com/engine/quickstart/'
  ref 'https://github.com/YungSang/fedora-atomic-packer/blob/master/oem/docker.socket'
  ref 'https://daviddaeschler.com/2014/12/14/centos-7rhel-7-and-docker-containers-on-boot/'

  describe file(docker.socket) do
    it { should exist }
    it { should be_file }
    it { should be_owned_by 'root' }
    it { should be_grouped_into 'root' }
  end
end