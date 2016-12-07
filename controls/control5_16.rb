control 'cis-docker-benchmark-5.16' do
  impact 1.0
  title 'Do not share the host\'s IPC namespace'
  desc 'IPC (POSIX/SysV IPC) namespace provides separation of named shared memory segments, semaphores and message queues. IPC namespace on the host thus should not be shared with the containers and should remain isolated.'
  ref 'https://docs.docker.com/engine/reference/run/#ipc-settings'
  ref 'http://man7.org/linux/man-pages/man7/pid_namespaces.7.html'

  docker.ps.each do |id|
    describe docker.inspect(id) do
      its(%w(HostConfig IpcMode)) { should_not eq 'host' }
    end
  end
end