LOG_DRIVER = attribute(
  'log_driver',
  description: 'define preferable way to store logs. cis-docker-benchmark-2.12',
  default: 'syslog'
)

LOG_OPTS = attribute(
  'log_opts',
  description: 'define Docker daemon log-opts. cis-docker-benchmark-2.12',
  default: /syslog-address/
)

control 'cis-docker-benchmark-2.12' do
  impact 1.0
  title 'Configure centralized and remote logging'
  desc 'Docker now supports various log drivers. A preferable way to store logs is the one that supports centralized and remote logging.'
  tag 'Bug: logs-opts seems broken in daemon.json https://github.com/docker/docker/issues/22311'
  ref 'https://docs.docker.com/engine/admin/logging/overview/'

  describe json('/etc/docker/daemon.json') do
    its(['log-driver']) { should_not be_empty }
  end
  describe json('/etc/docker/daemon.json') do
    its(['log-driver']) { should eq(LOG_DRIVER) }
  end
  describe json('/etc/docker/daemon.json') do
    its(['log-opts']) { should include(LOG_OPTS) }
  end
end