control 'cis-docker-benchmark-5.21' do
  impact 1.0
  title 'Do not disable default seccomp profile'
  desc 'Seccomp filtering provides a means for a process to specify a filter for incoming system calls. The default Docker seccomp profile disables 44 system calls, out of 313. It should not be disabled unless it hinders your container application usage.'
  ref 'https://docs.docker.com/engine/reference/run/'
  ref 'http://blog.aquasec.com/new-docker-security-features-and-what-they-mean-seccomp-profiles'
  ref 'https://github.com/docker/docker/blob/master/profiles/seccomp/default.json'
  ref 'https://docs.docker.com/engine/security/seccomp/'
  ref 'https://www.kernel.org/doc/Documentation/prctl/seccomp_filter.txt'
  ref 'https://github.com/docker/docker/pull/17034'

  docker.ps.each do |id|
    describe docker.inspect(id) do
      its(%w(HostConfig SecurityOpt)) { should include(/seccomp/) }
      its(%w(HostConfig SecurityOpt)) { should_not include(/seccomp[=|:]unconfined/) }
    end
  end
end