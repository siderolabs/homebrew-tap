cask 'osctl' do
    version '0.4.0-alpha.6'
    sha256 'a4b31ca02438fa73a5e34992a831bc3afd79195f0e7b3bb217d035dc876ea4e0'
  
    url "https://github.com/talos-systems/talos/releases/download/v#{version}/osctl-darwin-amd64"
    name 'osctl'
    homepage 'https://github.com/talos-systems/talos'
  
    binary 'osctl-darwin-amd64', target: 'osctl'
  end