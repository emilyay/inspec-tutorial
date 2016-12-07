control 'cis-docker-benchmark-5.20' do
  impact 1.0
  title 'Do not share the host\'s UTS namespace'
  desc 'UTS namespaces provide isolation of two system identifiers: the hostname and the NIS domain name. It is used for setting the hostname and the domain that is visible to running processes in that namespace. Processes running within containers do not typically require to know hostname and domain name. Hence, the namespace should not be shared with the host.'
  ref 'https://docs.docker.com/engine/reference/run/'
  ref 'http://man7.org/linux/man-pages/man7/pid_namespaces.7.html'

  docker.ps.each do |id|
    describe docker.inspect(id) do
      its(%w(HostConfig UTSMode)) { should_not eq 'host' }
    end
  end
end