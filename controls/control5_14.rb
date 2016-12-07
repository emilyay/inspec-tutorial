control 'cis-docker-benchmark-5.14' do
  impact 1.0
  title 'Set the \'on-failure\' container restart policy to 5'
  desc 'Using the \'--restart\' flag in \'docker run\' command you can specify a restart policy for how a container should or should not be restarted on exit. You should choose the \'on-failure\' restart policy and limit the restart attempts to 5.'
  ref 'https://docs.docker.com/engine/reference/commandline/cli/#restart-policies'

  docker.ps.each do |id|
    info = docker.inspect(id)
    only_if { info['HostConfig']['RestartPolicy']['Name'] != 'no' }
    describe info do
      its(%w(HostConfig RestartPolicy Name)) { should eq 'on-failure' }
    end
    describe info do
      its(%w(HostConfig RestartPolicy MaximumRetryCount)) { should eq 5 }
    end
  end
end