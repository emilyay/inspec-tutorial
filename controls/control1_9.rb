control 'cis-docker-benchmark-1.9' do
  impact 1.0
  title 'Audit Docker files and directories - /etc/docker'
  desc 'Apart from auditing your regular Linux file system and system calls, audit all Docker related files and directories. Docker daemon runs with \'root\' privileges. Its behavior depends on some key files and directories. /etc/docker is one such directory. It holds various certificates and keys used for TLS communication between Docker daemon and Docker client. It must be audited.'
  ref 'https://access.redhat.com/documentation/en-US/Red_Hat_Enterprise_Linux/6/html/Security_Guide/chap-system_auditing.html'

  describe auditd_rules do
    its(:lines) { should include('-w /etc/docker/ -p rwxa -k docker') }
  end
end