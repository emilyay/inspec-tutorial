control 'cis-docker-benchmark-5.4' do
  impact 1.0
  title 'Do not use privileged containers'
  desc 'Using the --privileged flag gives all Linux Kernel Capabilities to the container thus overwriting the --cap-add and --cap-drop flags. Ensure that it is not used.'
  ref 'https://docs.docker.com/engine/reference/commandline/cli/'

  docker.ps.each do |id|
    describe docker.inspect(id) do
      its(%w(HostConfig Privileged)) { should eq false }
      its(%w(HostConfig Privileged)) { should_not eq true }
    end
  end
end