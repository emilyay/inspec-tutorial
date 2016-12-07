control 'cis-docker-benchmark-4.3' do
  impact 0.0
  title 'Do not install unnecessary packages in the container'
  desc 'Containers tend to be minimal and slim down versions of the Operating System. Do not install anything that does not justify the purpose of container.'
  ref 'https://docs.docker.com/engine/userguide/containers/dockerimages/'
  ref 'http://www.livewyer.com/blog/2015/02/24/slimming-down-your-docker-containers-alpine-linux'
  ref 'https://github.com/progrium/busybox'
end