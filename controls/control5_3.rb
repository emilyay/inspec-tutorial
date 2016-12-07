CONTAINER_CAPADD = attribute(
  'container_capadd',
  description: 'define needed capabilities for containers. cis-docker-benchmark-5.3'
)

control 'cis-docker-benchmark-5.3' do
  impact 1.0
  title 'Restrict Linux Kernel Capabilities within containers'
  desc 'By default, Docker starts containers with a restricted set of Linux Kernel Capabilities. It means that any process may be granted the required capabilities instead of root access. Using Linux Kernel Capabilities, the processes do not have to run as root for almost all the specific areas where root privileges are usually needed.'
  ref 'https://docs.docker.com/engine/security/security/'
  ref 'http://man7.org/linux/man-pages/man7/capabilities.7.html'
  ref 'https://github.com/docker/docker/blob/master/oci/defaults_linux.go#L64-L79'

  docker.ps.each do |id|
    describe docker.inspect(id) do
      its(%w(HostConfig CapDrop)) { should include(/all/) }
      its(%w(HostConfig CapDrop)) { should_not eq nil }
      its(%w(HostConfig CapAdd)) { should eq CONTAINER_CAPADD }
    end
  end
end