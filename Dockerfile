FROM quay.io/parkside-securities/docker-parkside-runtime:ubuntu
RUN  curl -sL https://deb.nodesource.com/setup_8.x | bash - && \
    apt-get update -yq && apt-get upgrade -yq && \
    apt-get install -yq git netcat rsync graphviz openvpn zsh direnv && \
    curl "https://s3.amazonaws.com/aws-cli/awscli-bundle.zip" -o "awscli-bundle.zip" && \
    unzip awscli-bundle.zip && \
    ./awscli-bundle/install -i /usr/local/aws -b /usr/local/bin/aws && \
    rm -rf awscli-bundle* && \
    apt-get install -yq nodejs build-essential && \
    npm i npm@latest -g && \
    npm install --unsafe-perm -g @juxt/mach && \
    wget https://raw.githubusercontent.com/technomancy/leiningen/stable/bin/lein && \
    chmod +x lein && \
    mv lein /usr/local/bin && \
    lein -v && \
    mkdir -p /root/repos && \
    git clone https://github.com/ingydotnet/git-subrepo /root/repos/git-subrepo && \
    apt-get clean
ENV GIT_SUBREPO_ROOT /root/repos/git-subrepo
ENV PATH /root/repos/git-subrepo/lib:${PATH}
ENV MANPATH /root/repos/git-subrepo/man:$MANPATH
COPY client.ovpn /etc/openvpn
COPY entrypoint.sh /usr/local/bin
COPY gitignore_global /root/gitignore_global
COPY gitconfig /root/.gitconfig
COPY bashrc /root/.bashrc
COPY zshrc /root/.zshrc
WORKDIR /parkside
ENTRYPOINT ["/usr/local/bin/entrypoint.sh"]
