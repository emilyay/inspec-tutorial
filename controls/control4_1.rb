CONTAINER_USER = attribute(
  'container_user',
  description: 'define user within containers. cis-docker-benchmark-4.1',
  default: 'ubuntu'
)

control 'cis-docker-benchmark-4.1' do
  impact 1.0
  title 'Create a user for the container'
  desc 'Create a non-root user for the container in the Dockerfile for the container image.'
  ref 'https://github.com/docker/docker/issues/2918'
  ref 'https://github.com/docker/docker/pull/4572'
  ref 'https://github.com/docker/docker/issues/7906'
  ref 'https://www.altiscale.com/blog/making-docker-work-yarn/'

  docker.ps.each do |id|
    describe docker.inspect(id) do
      its(%w(Config User)) { should eq CONTAINER_USER }
      its(%w(Config User)) { should_not eq nil }
    end
  end
end