control 'cis-docker-benchmark-5.7' do
  impact 1.0
  title 'Do not map privileged ports within containers'
  desc 'The TCP/IP port numbers below 1024 are considered privileged ports. Normal users and processes are not allowed to use them for various security reasons. Docker allows a container port to be mapped to a privileged port.'
  ref 'https://docs.docker.com/engine/userguide/networking/default_network/binding/'
  ref 'https://www.adayinthelifeof.nl/2012/03/12/why-putting-ssh-on-another-port-than-22-is-bad-idea/'

  docker.ps.each do |id|
    info = docker.inspect(id)
    ports = info['NetworkSettings']['Ports'].keys
    ports.each do |item|
      info['NetworkSettings']['Ports'][item].each do |hostport|
        describe hostport['HostPort'].to_i.between?(1, 1024) do
          it { should eq false }
        end
      end
    end
  end
end