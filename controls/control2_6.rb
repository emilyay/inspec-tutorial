control 'cis-docker-benchmark-2.6' do
  impact 1.0
  title 'Configure TLS authentication for Docker daemon'
  desc 'It is possible to make the Docker daemon to listen on a specific IP and port and any other Unix socket other than default Unix socket. Configure TLS authentication to restrict access to Docker daemon via IP and port.'
  ref 'https://docs.docker.com/engine/security/https/'
  ref 'http://www.hnwatcher.com/r/1644394/Intro-to-Docker-Swarm-Part-2-Comfiguration-Modes-and-Requirements'
  ref 'http://www.blackfinsecurity.com/docker-swarm-with-tls-authentication/'
  ref 'http://tech.paulcz.net/2016/01/secure-docker-with-tls/'

  describe json('/etc/docker/daemon.json') do
    its(['tls']) { should eq(true) }
  end
  describe json('/etc/docker/daemon.json') do
    its(['tlsverify']) { should eq(true) }
  end
  describe json('/etc/docker/daemon.json') do
    its(['tlscacert']) { should eq('/etc/docker/ssl/ca.pem') }
  end
  describe json('/etc/docker/daemon.json') do
    its(['tlscert']) { should eq('/etc/docker/ssl/server_cert.pem') }
  end
  describe json('/etc/docker/daemon.json') do
    its(['tlskey']) { should eq('/etc/docker/ssl/server_key.pem') }
  end
end