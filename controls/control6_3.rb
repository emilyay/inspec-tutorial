control 'cis-docker-benchmark-6.3' do
  impact 0.0
  title 'Backup container data'
  desc 'Take regular backups of your container data volumes.'
  ref 'https://docs.docker.com/engine/userguide/containers/dockervolumes/'
  ref 'http://stackoverflow.com/questions/26331651/how-can-i-backup-a-docker-container-with-its-data-volumes'
  ref 'https://docs.docker.com/engine/reference/commandline/cli/#diff'
end