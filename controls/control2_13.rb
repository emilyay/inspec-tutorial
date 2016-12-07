control 'cis-docker-benchmark-2.13' do
  impact 1.0
  title 'Disable operations on legacy registry (v1)'
  desc 'The latest Docker registry is v2. All operations on the legacy registry version (v1) should be restricted.'
  ref 'https://docs.docker.com/engine/reference/commandline/daemon/'
  ref 'https://github.com/docker/docker/issues/8093'
  ref 'https://github.com/docker/docker/issues/9015'
  ref 'https://github.com/docker/docker-registry/issues/612'

  describe json('/etc/docker/daemon.json') do
    its(['disable-legacy-registry']) { should eq(true) }
  end
end