control 'cis-docker-benchmark-5.8' do
  impact 0.0
  title 'Open only needed ports on container'
  desc 'Dockerfile for a container image defines the ports to be opened by default on a container instance. The list of ports may or may not be relevant to the application you are running within the container.'
  ref 'https://docs.docker.com/engine/userguide/networking/default_network/binding/'
end