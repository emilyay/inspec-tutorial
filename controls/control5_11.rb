control 'cis-docker-benchmark-5.11' do
  impact 1.0
  title 'Set container CPU priority appropriately'
  desc 'By default, all containers on a Docker host share the resources equally. By using the resource management capabilities of Docker host, such as CPU shares, you can control the host CPU resources that a container may consume.'
  ref 'https://goldmann.pl/blog/2014/09/11/resource-management-in-docker/'
  ref 'https://docs.docker.com/engine/reference/commandline/cli/#run'
  ref 'https://docs.docker.com/v1.8/articles/runmetrics/'

  docker.ps.each do |id|
    describe docker.inspect(id) do
      its(%w(HostConfig CpuShares)) { should_not eq 0 }
      its(%w(HostConfig CpuShares)) { should_not eq 1024 }
    end
  end
end