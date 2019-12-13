cask 'osctl' do
    version '0.3.0-beta.0'
    sha256 'cf6335fd21d9ec75e8164ee3b56b5499af14ca831dae3d7de3685724e269661c'
  
    url "https://github.com/talos-systems/talos/releases/download/v#{version}/osctl-darwin-amd64"
    name 'osctl'
    homepage 'https://github.com/talos-systems/talos'
  
    binary 'osctl-darwin-amd64', target: 'osctl'
  end