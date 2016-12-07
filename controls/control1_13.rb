control 'cis-docker-benchmark-1.13' do
  impact 1.0
  title 'Audit Docker files and directories - /etc/docker/daemon.json'
  desc 'Apart from auditing your regular Linux file system and system calls, audit all Docker related files and directories. Docker daemon runs with \'root\' privileges. Its behavior depends on some key files and directories. /etc/docker/daemon.json is one such file. It holds various parameters for Docker daemon. It must be audited, if applicable.'
  ref 'https://access.redhat.com/documentation/en-US/Red_Hat_Enterprise_Linux/6/html/Security_Guide/chap-system_auditing.html'

  describe auditd_rules do
    its(:lines) { should include('-w /etc/docker/daemon.json -p rwxa -k docker') }
  end
end
