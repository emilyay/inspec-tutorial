AUTHORIZATION_PLUGIN = attribute(
  'authorization_plugin',
  description: 'define authorization plugin to manage access to Docker daemon. cis-docker-benchmark-2.11',
  default: 'authz-broker'
)

control 'cis-docker-benchmark-2.11' do
  impact 1.0
  title 'Use authorization plugin'
  desc 'Docker’s out-of-the-box authorization model is all or nothing. Any user with permission to access the Docker daemon can run any Docker client command. The same is true for callers using Docker’s remote API to contact the daemon. If you require greater access control, you can create authorization plugins and add them to your Docker daemon configuration. Using an authorization plugin, a Docker administrator can configure granular access policies for managing access to Docker daemon.'
  ref 'https://docs.docker.com/engine/reference/commandline/daemon/#access-authorization'
  ref 'https://docs.docker.com/engine/extend/plugins_authorization/'
  ref 'https://github.com/twistlock/authz'
  ref 'https://sreeninet.wordpress.com/2016/03/06/docker-security-part-3engine-access/'

  describe json('/etc/docker/daemon.json') do
    its(['authorization-plugins']) { should_not be_empty }
  end
  describe json('/etc/docker/daemon.json') do
    its(['authorization-plugins']) { should eq([AUTHORIZATION_PLUGIN]) }
  end
end