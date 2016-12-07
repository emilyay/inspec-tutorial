REGISTRY_CERT_PATH = attribute(
  'registry_cert_path',
  description: 'directory contains various Docker registry directories. cis-docker-benchmark-3.7',
  default: '/etc/docker/certs.d'
)

REGISTRY_NAME = attribute(
  'registry_name',
  description: 'directory contain certificate certain Docker registry. cis-docker-benchmark-3.7',
  default: '/etc/docker/certs.d/registry_hostname:port'
)

REGISTRY_CA_FILE = attribute(
  'registry_ca_file',
  description: 'certificate file for a certain Docker registry certificate files. cis-docker-benchmark-3.7 and cis-docker-benchmark-3.8',
  default: '/etc/docker/certs.d/registry_hostname:port/ca.crt'
)

control 'cis-docker-benchmark-3.7' do
  impact 1.0
  title 'Verify that registry certificate file ownership is set to root:root'
  desc 'Verify that all the registry certificate files (usually found under /etc/docker/certs.d/<registry-name> directory) are owned and group-owned by \'root\'.'
  ref 'https://docs.docker.com/engine/security/certificates/'
  ref 'docs.docker.com/reference/commandline/cli/#insecure-registries'

  describe file(REGISTRY_CERT_PATH) do
    it { should exist }
    it { should be_directory }
    it { should be_owned_by 'root' }
    it { should be_grouped_into 'root' }
  end

  describe file(REGISTRY_NAME) do
    it { should exist }
    it { should be_directory }
    it { should be_owned_by 'root' }
    it { should be_grouped_into 'root' }
  end

  describe file(REGISTRY_CA_FILE) do
    it { should exist }
    it { should be_file }
    it { should be_owned_by 'root' }
    it { should be_grouped_into 'root' }
  end
end