SELINUX_PROFILE = attribute(
  'selinux_profile',
  description: 'define SELinux profile for Docker containers. cis-docker-benchmark-5.2',
  default:  /label\:level\:s0-s0\:c1023/
)

control 'cis-docker-benchmark-5.2' do
  impact 1.0
  title 'Verify SELinux security options, if applicable'
  desc 'SELinux is an effective and easy-to-use Linux application security system. It is available on quite a few Linux distributions by default such as Red Hat and Fedora'
  tag 'Bug: Wrong SELinux label for devmapper device https://github.com/docker/docker/issues/22826'
  tag 'Bug: selinux break docker user namespace https://bugzilla.redhat.com/show_bug.cgi?id=1312665'
  ref 'https://docs.docker.com/engine/security/security/'
  ref 'https://docs.docker.com/engine/reference/run/#security-configuration'
  ref 'https://docs.fedoraproject.org/en-US/Fedora/13/html/Security-Enhanced_Linux/'

  only_if { os[:family] == ('centos' || 'redhat') }
  describe json('/etc/docker/daemon.json') do
    its(['selinux-enabled']) { should eq(true) }
  end

  docker.ps.each do |id|
    describe docker.inspect(id) do
      its(%w(HostConfig SecurityOpt)) { should_not eq nil }
      its(%w(HostConfig SecurityOpt)) { should include(SELINUX_PROFILE) }
    end
  end
end