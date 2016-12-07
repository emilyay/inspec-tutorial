control 'cis-docker-benchmark-1.5' do
  impact 1.0
  title 'Keep Docker up to date'
  desc 'The docker container solution is evolving to maturity and stability at a rapid pace. Like any other software, the vendor releases regular updates for Docker software that address security vulnerabilities, product bugs and bring in new functionality.'
  ref 'https://github.com/docker/docker/releases/latest'

  docker_server_version = command('docker version --format \'{{.Server.Version}}\'').stdout
  docker_server_compare = Gem::Version.new('1.10.3') <= Gem::Version.new(docker_server_version)

  docker_client_version = command('docker version --format \'{{.Client.Version}}\'').stdout
  docker_client_compare = Gem::Version.new('1.10.3') <= Gem::Version.new(docker_client_version)

  describe docker_server_compare do
    it { should eq true }
  end

  describe docker_client_compare do
    it { should eq true }
  end
end
