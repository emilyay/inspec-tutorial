APP_ARMOR_PROFILE = attribute(
  'app_armor_profile',
  description: 'define apparmor profile for Docker containers. cis-docker-benchmark-5.1',
  default: 'docker-default'
)

control 'cis-docker-benchmark-5.1' do
  impact 1.0
  title 'Verify AppArmor Profile, if applicable'
  desc 'AppArmor is an effective and easy-to-use Linux application security system. It is available on quite a few Linux distributions by default such as Debian and Ubuntu.'
  ref 'https://docs.docker.com/engine/security/security/'
  ref 'https://docs.docker.com/engine/reference/run/#security-configuration'
  ref 'http://wiki.apparmor.net/index.php/Main_Page'

  only_if { os[:family] == ('ubuntu' || 'debian') }
  docker.ps.each do |id|
    describe docker.inspect(id) do
      its(['AppArmorProfile']) { should include(APP_ARMOR_PROFILE) }
      its(['AppArmorProfile']) { should_not eq nil }
    end
  end
end