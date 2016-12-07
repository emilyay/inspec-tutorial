control 'cis-docker-benchmark-3.15' do
  impact 1.0
  title 'Verify that Docker socket file ownership is set to root:docker'
  desc 'Verify that the Docker socket file is owned by \'root\' and group-owned by \'docker\'.'
  ref 'https://docs.docker.com/engine/reference/commandline/cli/#daemon-socket-option'
  ref 'https://docs.docker.com/engine/quickstart/'

  describe file('/var/run/docker.sock') do
    it { should exist }
    it { should be_socket }
    it { should be_owned_by 'root' }
    it { should be_grouped_into 'docker' }
  end
end