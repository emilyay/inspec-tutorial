control 'cis-docker-benchmark-1.4' do
  impact 0.0
  title 'Remove all non-essential services from the host'
  desc 'Ensure that the host running the docker daemon is running only the essential services.'
  ref 'https://blog.docker.com/2013/08/containers-docker-how-secure-are-they/'
end