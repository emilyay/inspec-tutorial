control 'cis-docker-benchmark-5.12' do
  impact 1.0
  title 'Mount container\'s root filesystem as read only'
  desc 'The container\'s root file system should be treated as a \'golden image\' and any writes to the root filesystem should be avoided. You should explicitly define a container volume for writing.'
  ref 'https://docs.docker.com/engine/reference/commandline/cli/#run'

  docker.ps.each do |id|
    describe docker.inspect(id) do
      its(%w(HostConfig ReadonlyRootfs)) { should eq true }
    end
  end
end