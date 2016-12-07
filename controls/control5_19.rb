control 'cis-docker-benchmark-5.19' do
  impact 1.0
  title 'Do not set mount propagation mode to shared'
  desc 'Mount propagation mode allows mounting volumes in shared, slave or private mode on a container. Do not use shared mount propagation mode until needed.'
  ref 'https://github.com/docker/docker/pull/17034'
  ref 'https://docs.docker.com/engine/reference/run/'
  ref 'https://www.kernel.org/doc/Documentation/filesystems/sharedsubtree.txt'

  docker.ps.each do |id|
    raw = command("docker inspect --format '{{range $mnt := .Mounts}} {{json $mnt.Propagation}} {{end}}' #{id}").stdout
    describe raw.delete("\n").delete('\"').delete(' ') do
      it { should_not eq 'shared' }
    end
  end
end
