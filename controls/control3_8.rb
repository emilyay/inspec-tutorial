REGISTRY_CA_FILE = attribute(
  'registry_ca_file',
  description: 'certificate file for a certain Docker registry certificate files. cis-docker-benchmark-3.7 and cis-docker-benchmark-3.8',
  default: '/etc/docker/certs.d/registry_hostname:port/ca.crt'
)

control 'cis-docker-benchmark-3.8' do
  impact 1.0
  title 'Verify that registry certificate file permissions are set to 444 or more restrictive'
  desc 'Verify that all the registry certificate files (usually found under /etc/docker/certs.d/<registry-name> directory) have permissions of \'444\' or more restrictive.'
  ref 'https://docs.docker.com/engine/security/certificates/'
  ref 'docs.docker.com/reference/commandline/cli/#insecure-registries'

  describe file(REGISTRY_CA_FILE) do
    it { should exist }
    it { should be_file }
    it { should be_readable }
    it { should_not be_executable }
    it { should_not be_writable }
  end
end