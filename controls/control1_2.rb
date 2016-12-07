control 'cis-docker-benchmark-1.2' do
  impact 1.0
  title 'Use the updated Linux Kernel'
  desc 'Docker in daemon mode has specific kernel requirements. A 3.10 Linux kernel is the minimum requirement for Docker.'
  ref 'https://docs.docker.com/engine/installation/binaries/#check-kernel-dependencies'
  ref 'https://docs.docker.com/engine/installation/#installation-list'

  kernel_version = command('uname -r | grep -o \'^\w\.\w*\.\w*\'').stdout
  kernel_compare = Gem::Version.new('3.10') <= Gem::Version.new(kernel_version)

  describe kernel_compare do
    it { should eq true }
  end
end