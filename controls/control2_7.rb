control 'cis-docker-benchmark-2.7' do
  impact 1.0
  title 'Set default ulimit as appropriate'
  desc 'ulimit provides control over the resources available to the shell and to processes started by it. Setting system resource limits judiciously saves you from many disasters such as a fork bomb. Sometimes, even friendly users and legitimate processes can overuse system resources and in-turn can make the system unusable.'
  tag 'Bug: default-ulimits seems broken in daemon.json https://github.com/docker/docker/issues/22309'
  ref 'https://docs.docker.com/engine/reference/commandline/daemon/#default-ulimits'

  describe json('/etc/docker/daemon.json') do
    its(['default-ulimits', 'nproc']) { should eq('1024:2408') }
  end
  describe json('/etc/docker/daemon.json') do
    its(['default-ulimits', 'nofile']) { should eq('100:200') }
  end
end