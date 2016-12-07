control 'cis-docker-benchmark-5.13' do
  impact 1.0
  title 'Bind incoming container traffic to a specific host interface'
  desc 'By default, Docker containers can make connections to the outside world, but the outside world cannot connect to containers. Each outgoing connection will appear to originate from one of the host machine\'s own IP addresses. Only allow container services to be contacted through a specific external interface on the host machine.'
  ref 'https://docs.docker.com/engine/userguide/networking/default_network/binding/'

  docker.ps.each do |id|
    info = docker.inspect(id)
    ports = info['NetworkSettings']['Ports'].keys
    ports.each do |item|
      info['NetworkSettings']['Ports'][item].each do |hostip|
        describe hostip['HostIp'] do
          it { should_not eq '0.0.0.0' }
        end
      end
    end
  end
end