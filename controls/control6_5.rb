MANAGEABLE_CONTAINER_NUMBER = attribute(
  'managable_container_number',
  description: 'keep number of containers on a host to a manageable total. cis-docker-benchmark-6.5',
  default: 25
)

control 'cis-docker-benchmark-6.5' do
  impact 1.0
  title 'Avoid container sprawl'
  desc 'Do not keep a large number of containers on the same host.'
  ref 'https://zeltser.com/security-risks-and-benefits-of-docker-application/'
  ref 'http://searchsdn.techtarget.com/feature/Docker-networking-How-Linux-containers-will-change-your-network'

  total_on_host = command('docker info').stdout.split[1].to_i
  total_running = command('docker ps -q').stdout.split.length
  diff = total_on_host - total_running

  describe diff do
    it { should be <= MANAGEABLE_CONTAINER_NUMBER }
  end
end