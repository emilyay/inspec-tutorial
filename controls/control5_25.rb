control 'cis-docker-benchmark-5.25' do
  impact 1.0
  title 'Restrict container from acquiring additional privileges'
  desc 'Restrict the container from acquiring additional privileges via suid or sgid bits.'
  ref 'https://github.com/projectatomic/atomic-site/issues/269'
  ref 'https://github.com/docker/docker/pull/20727'
  ref 'https://www.kernel.org/doc/Documentation/prctl/no_new_privs.txt'
  ref 'https://lwn.net/Articles/475678/'
  ref 'https://lwn.net/Articles/475362/'

  docker.ps.each do |id|
    describe docker.inspect(id) do
      its(%w(HostConfig SecurityOpt)) { should include(/no-new-privileges/) }
    end
  end
end