control 'cis-docker-benchmark-5.10' do
  impact 1.0
  title 'Limit memory usage for container'
  desc 'By default, all containers on a Docker host share the resources equally. By using the resource management capabilities of Docker host, such as memory limit, you can control the amount of memory that a container may consume.'
  ref 'https://goldmann.pl/blog/2014/09/11/resource-management-in-docker/'
  ref 'https://docs.docker.com/engine/reference/commandline/cli/#run'
  ref 'https://docs.docker.com/v1.8/articles/runmetrics/'

  docker.ps.each do |id|
    describe docker.inspect(id) do
      its(%w(HostConfig Memory)) { should_not eq 0 }
    end
  end
end