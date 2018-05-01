FROM clojure:tools-deps
RUN  curl -sL https://deb.nodesource.com/setup_8.x | bash - && \
    apt-get update -yq && apt-get upgrade -yq && \
    apt-get install -yq nodejs build-essential && \
    npm install --unsafe-perm -g @juxt/mach
ENV GITLIBS=.gitlibs
