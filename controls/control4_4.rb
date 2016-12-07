control 'cis-docker-benchmark-4.4' do
  impact 0.0
  title 'Rebuild the images to include security patches'
  desc 'Instead of patching your containers and images, rebuild the images from scratch and instantiate new containers from it.'
  ref 'https://docs.docker.com/engine/userguide/containers/dockerimages/'
end