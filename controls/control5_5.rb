control 'cis-docker-benchmark-5.5' do
  impact 1.0
  title 'Do not mount sensitive host system directories on containers'
  desc 'Sensitive host system directories such as \'/, /boot, /dev, /etc, /lib, /proc, /sys, /usr\' should not be allowed to be mounted as container volumes especially in read-write mode.'
  ref 'https://docs.docker.com/engine/userguide/containers/dockervolumes/'

  docker.ps.each do |id|
    info = docker.inspect(id)
    info['Mounts'].each do |mounts|
      describe mounts['Source'] do
        it { should_not eq '/' }
        it { should_not match(%r{\/boot}) }
        it { should_not match(%r{\/dev}) }
        it { should_not match(%r{\/etc}) }
        it { should_not match(%r{\/lib}) }
        it { should_not match(%r{\/proc}) }
        it { should_not match(%r{\/sys}) }
        it { should_not match(%r{\/usr}) }
      end
    end
  end
end