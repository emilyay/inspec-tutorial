TRUSTED_USER = attribute(
  'trusted_user',
  description: 'define trusted user to control Docker daemon. cis-docker-benchmark-1.6',
  default: 'vagrant'
)

control 'cis-docker-benchmark-1.6' do
  impact 1.0
  title 'Only allow trusted users to control Docker daemon'
  desc 'The Docker daemon currently requires \'root\' privileges. A user added to the \'docker\' group gives him full \'root\' access rights'
  ref 'https://docs.docker.com/engine/security/security/'
  ref 'https://www.andreas-jung.com/contents/on-docker-security-docker-group-considered-harmful'
  ref 'http://www.projectatomic.io/blog/2015/08/why-we-dont-let-non-root-users-run-docker-in-centos-fedora-or-rhel/'

  describe group('docker') do
    it { should exist }
  end

  describe etc_group.where(group_name: 'docker') do
    its('users') { should include TRUSTED_USER }
  end
end