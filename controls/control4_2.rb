control 'cis-docker-benchmark-4.2' do
  impact 0.0
  title 'Use trusted base images for containers'
  desc 'Ensure that the container image is written either from scratch or is based on another established and trusted base image downloaded over a secure channel.'
  ref 'https://titanous.com/posts/docker-insecurity'
  ref 'https://hub.docker.com/'
  ref 'https://blog.docker.com/2014/10/docker-1-3-signed-images-process-injection-security-options-mac-shared-directories/'
  ref 'https://github.com/docker/docker/issues/8093'
  ref 'https://docs.docker.com/engine/reference/commandline/cli/#pull'
  ref 'https://github.com/docker/docker/pull/11109'
  ref 'https://blog.docker.com/2015/11/docker-trusted-registry-1-4/'
end