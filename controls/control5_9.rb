control 'cis-docker-benchmark-5.9' do
  impact 1.0
  title 'Do not share the host\'s network namespace'
  desc 'The networking mode on a container when set to \'--net=host\', skips placing the container inside separate network stack. In essence, this choice tells Docker to not containerize the container\'s networking. This would network-wise mean that the container lives "outside" in the main Docker host and has full access to its network interfaces.'
  ref 'https://docs.docker.com/engine/userguide/networking/dockernetworks/'
  ref 'https://github.com/docker/docker/issues/6401'

  docker.ps.each do |id|
    describe docker.inspect(id) do
      its(%w(HostConfig NetworkMode)) { should_not eq 'host' }
    end
  end
end