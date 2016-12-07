control 'cis-docker-benchmark-6.4' do
  impact 1.0
  title 'Avoid image sprawl'
  desc 'Do not keep a large number of container images on the same host. Use only tagged images as appropriate.'
  ref 'http://craiccomputing.blogspot.de/2014/09/clean-up-unused-docker-containers-and.html'
  ref 'https://forums.docker.com/t/command-to-remove-all-unused-images/20/7'
  ref 'https://github.com/docker/docker/issues/9054'
  ref 'https://docs.docker.com/engine/reference/commandline/cli/#rmi'
  ref 'https://docs.docker.com/engine/reference/commandline/cli/#pull'
  ref 'https://github.com/docker/docker/pull/11109'

  instantiated_images = command('docker ps -qa | xargs docker inspect -f \'{{.Image}}\'').stdout.split
  all_images = command('docker images -q --no-trunc').stdout.split
  diff = all_images - instantiated_images

  describe diff do
    it { should be_empty }
  end
end