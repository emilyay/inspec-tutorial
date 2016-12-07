control 'cis-docker-benchmark-5.17' do
  impact 1.0
  title 'Do not directly expose host devices to containers'
  desc 'Host devices can be directly exposed to containers at runtime. Do not directly expose host devices to containers especially for containers that are not trusted.'
  ref 'https://docs.docker.com/engine/reference/commandline/cli/#run'

  docker.ps.each do |id|
    describe docker.inspect(id) do
      its(%w(HostConfig Devices)) { should be_empty }
    end
  end
end