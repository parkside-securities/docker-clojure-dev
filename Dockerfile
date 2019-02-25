FROM quay.io/parkside-securities/docker-parkside-runtime:ubuntu
ENV GOROOT /usr/local/go
ENV GOPATH /root/go
ENV GIT_SUBREPO_ROOT /root/repos/git-subrepo
ENV PATH /root/repos/git-subrepo/lib:/usr/local/go/bin:/root/go/bin:${PATH}
ENV MANPATH /root/repos/git-subrepo/man:$MANPATH
RUN curl -sL https://deb.nodesource.com/setup_8.x | bash - && \
    curl -s https://packages.cloud.google.com/apt/doc/apt-key.gpg | apt-key add - && \
    echo "deb https://apt.kubernetes.io/ kubernetes-xenial main" | tee -a /etc/apt/sources.list.d/kubernetes.list && \
    apt-get update -yq && apt-get upgrade -yq && \
    apt-get install -yq git netcat rsync graphviz zsh direnv emacs25 silversearcher-ag \ 
                        kubectl less zlib1g-dev libffi-dev libssl-dev vim-nox && \
    curl -s "https://s3.amazonaws.com/aws-cli/awscli-bundle.zip" -o "awscli-bundle.zip" && \
    unzip awscli-bundle.zip && \
    ./awscli-bundle/install -i /usr/local/aws -b /usr/local/bin/aws && \
    rm -rf awscli-bundle* && \
    wget -q https://dl.google.com/go/go1.11.5.linux-amd64.tar.gz && \
    tar -xvf go1.11.5.linux-amd64.tar.gz && \
    mv go /usr/local && \
    /usr/local/go/bin/go get -u -v github.com/kubernetes-sigs/aws-iam-authenticator/cmd/aws-iam-authenticator && \
    rm go1.11.5.linux-amd64.tar.gz && \
    apt-get install -yq nodejs build-essential && \
    npm i npm@latest -g && \
    npm install --unsafe-perm -g @juxt/mach && \
    wget -q https://raw.githubusercontent.com/technomancy/leiningen/stable/bin/lein && \
    chmod +x lein && \
    mv lein /usr/local/bin && \
    lein -v && \
    mkdir -p /root/repos && \
    git clone https://github.com/ingydotnet/git-subrepo /root/repos/git-subrepo && \
    git clone https://github.com/awslabs/git-secrets.git /root/repos/git-secrets && \
    git clone https://github.com/magicmonty/bash-git-prompt.git /root/.bash-git-prompt --depth=1 && \
    git clone https://github.com/olivierverdier/zsh-git-prompt.git /root/.zsh-git-prompt && \
    git clone https://github.com/ahmetb/kubectx /root/repos/kubectx && \
    chmod +x /root/repos/kubectx/kubectx && \
    chmod +x /root/repos/kubens/kubens && \
    ln -s /root/repos/kubectx/kubectx /usr/local/bin/kubectx && \
    ln -s /root/repos/kubens/kubens /usr/local/bin/kubens && \
    cd /root/repos/git-secrets && make install && cd - && \
    curl https://pyenv.run | bash && \
    /root/.pyenv/bin/pyenv install 3.7.2 && \
    /root/.pyenv/bin/pyenv global 3.7.2 && \
    apt-get clean
COPY entrypoint.sh /usr/local/bin
COPY gitignore_global /root/gitignore_global
COPY gitconfig /root/.gitconfig
COPY bashrc /root/.bashrc
COPY zshrc /root/.zshrc
WORKDIR /parkside
ENTRYPOINT ["/usr/local/bin/entrypoint.sh"]
