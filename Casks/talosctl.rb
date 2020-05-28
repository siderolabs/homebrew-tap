cask 'talosctl' do
    version '0.5.0'
    sha256 '1205691984cb5ecb3f06d8e19267a00f51353ce219e001d9f854794eb0923e54'
  
    url "https://github.com/talos-systems/talos/releases/download/v#{version}/talosctl-darwin-amd64"
    name 'talosctl'
    homepage 'https://github.com/talos-systems/talos'
  
    binary 'talosctl-darwin-amd64', target: 'talosctl'
  end