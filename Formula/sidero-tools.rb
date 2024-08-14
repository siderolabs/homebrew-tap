class SideroTools < Formula
    desc "Meta Package for common Sidero Labs tools"
    version "1.0.0"
    homepage "https://github.com/siderolabs/"
    url "file:///dev/null"
    sha256 "e3b0c44298fc1c149afbf4c8996fb92427ae41e4649b934ca495991b7852b855"

    depends_on "kubelogin"
    depends_on "kubernetes-cli"
    depends_on "siderolabs/tap/omnictl"
    depends_on "siderolabs/tap/talosctl"

    def install
        (bin+"siderotools").write <<-EOS
            #!/bin/sh

            echo "The Sidero Labs Tools were installed installed!"
        EOS
    end
end
