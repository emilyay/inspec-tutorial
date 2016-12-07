control 'cis-docker-benchmark-benchmark-1.7' do
  impact 1.0
  title 'Audit docker daemon'
  desc 'Apart from auditing your regular Linux file system and system calls, audit Docker daemon as well. Docker daemon runs with \'root\' privileges. It is thus necessary to audit its activities and usage.'
  ref 'https://access.redhat.com/documentation/en-US/Red_Hat_Enterprise_Linux/6/html/Security_Guide/chap-system_auditing.html'

  describe auditd_rules do
    its(:lines) { should include('-w /usr/bin/docker -p rwxa -k docker') }
  end
end