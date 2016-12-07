control 'cis-docker-benchmark-5.18' do
  impact 1.0
  title 'Override default ulimit at runtime only if needed'
  desc 'The default ulimit is set at the Docker daemon level. However, you may override the default ulimit setting, if needed, during container runtime.'
  ref 'https://docs.docker.com/engine/reference/commandline/cli/#setting-ulimits-in-a-container'

  docker.ps.each do |id|
    describe docker.inspect(id) do
      its(%w(HostConfig Ulimits)) { should eq nil }
    end
  end
end