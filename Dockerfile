FROM clojure:tools-deps
RUN  curl -sL https://deb.nodesource.com/setup_8.x | bash - && \
    apt-get update -yq && apt-get upgrade -yq && \
    apt-get install -yq netcat rsync graphviz openvpn && \
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
    lein -v 
COPY client.ovpn /etc/openvpn
COPY msk-bastion-us-west-2.pem /root
