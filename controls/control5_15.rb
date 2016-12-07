control 'cis-docker-benchmark-5.15' do
  impact 1.0
  title 'Do not share the host\'s process namespace'
  desc 'Process ID (PID) namespaces isolate the process ID number space, meaning that processes in different PID namespaces can have the same PID. This is process level isolation between containers and the host.'
  ref 'https://docs.docker.com/engine/reference/run/#pid-settings'
  ref 'http://man7.org/linux/man-pages/man7/pid_namespaces.7.html'

  docker.ps.each do |id|
    describe docker.inspect(id) do
      its(%w(HostConfig PidMode)) { should_not eq 'host' }
    end
  end
end