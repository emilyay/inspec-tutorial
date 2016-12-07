control 'cis-docker-benchmark-2.5' do
  impact 1.0
  title 'Do not use the aufs storage driver'
  desc 'The \'aufs\' storage driver is the oldest storage driver. It is based on a Linux kernel patch-set that is unlikely to be merged into the main Linux kernel. \'aufs\' driver is also known to cause some serious kernel crashes. \'aufs\' just has legacy support from Docker. Most importantly, \'aufs\' is not a supported driver in many Linux distributions using latest Linux kernels.'
  ref 'https://docs.docker.com/engine/reference/commandline/cli/#daemon-storage-driver-option'
  ref 'https://github.com/docker/docker/issues/6047'
  ref 'http://muehe.org/posts/switching-docker-from-aufs-to-devicemapper/'
  ref 'http://jpetazzo.github.io/assets/2015-03-05-deep-dive-into-docker-storage-drivers.html#1'

  describe json('/etc/docker/daemon.json') do
    its(['storage-driver']) { should_not eq('aufs') }
  end
end