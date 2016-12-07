control 'cis-docker-benchmark-1.11' do
  impact 1.0
  title 'Audit Docker files and directories - docker.service'
  desc 'Apart from auditing your regular Linux file system and system calls, audit all Docker related files and directories. Docker daemon runs with \'root\' privileges. Its behavior depends on some key files and directories. docker.service is one such file. The docker.service file might be present if the daemon parameters have been changed by an administrator. It holds various parameters for Docker daemon. It must be audited, if applicable.'
  ref 'https://access.redhat.com/documentation/en-US/Red_Hat_Enterprise_Linux/6/html/Security_Guide/chap-system_auditing.html'

  if docker.path
    rule = '-w ' + docker.socket + ' -p rwxa -k docker'
    describe auditd_rules do
      its(:lines) { should include(rule) }
    end
  else
    describe 'audit docker service' do
      skip 'Cannot determine docker socket'
    end
  end
end