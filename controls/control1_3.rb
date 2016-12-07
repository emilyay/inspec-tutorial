control 'cis-docker-benchmark-1.3' do
  impact 0.0
  title 'Harden the container host'
  desc 'Containers run on a Linux host. A container host can run one or more containers. It is of utmost importance to harden the host to mitigate host security misconfiguration'
  ref 'http://dev-sec.io'
  ref 'https://docs.docker.com/engine/security/security/'
end