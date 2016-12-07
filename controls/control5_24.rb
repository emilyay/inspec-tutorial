control 'cis-docker-benchmark-5.24' do
  impact 1.0
  title 'Confirm cgroup usage'
  desc 'It is possible to attach to a particular cgroup on container run. Confirming cgroup usage would ensure that containers are running under defined cgroups.'
  ref 'https://docs.docker.com/engine/reference/run/#specifying-custom-cgroups'
  ref 'https://access.redhat.com/documentation/en-US/Red_Hat_Enterprise_Linux/6/html/Resource_Management_Guide/ch01.html'

  docker.ps.each do |id|
    describe docker.inspect(id) do
      its(%w(HostConfig CgroupParent)) { should be_empty }
    end
  end
end