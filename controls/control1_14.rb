control 'cis-docker-benchmark-1.14' do
  impact 1.0
  title 'Audit Docker files and directories - /usr/bin/docker-containerd'
  desc 'Apart from auditing your regular Linux file system and system calls, audit all Docker related files and directories. Docker daemon runs with \'root\' privileges. Its behavior depends on some key files and directories. /usr/bin/docker-containerd is one such file. Docker now relies on containerd and runC to spawn containers. It must be audited, if applicable.'
  ref 'https://access.redhat.com/documentation/en-US/Red_Hat_Enterprise_Linux/6/html/Security_Guide/chap-system_auditing.html'
  ref 'https://github.com/docker/docker/pull/20662'
  ref 'https://containerd.tools/'

  describe auditd_rules do
    its(:lines) { should include('-w /usr/bin/docker-containerd -p rwxa -k docker') }
  end
end