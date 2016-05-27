# Start from a Debian image with the latest version of Go installed
# and a workspace (GOPATH) configured at /go.
FROM golang:1.6.2

# Install Node and Glide and PhantomJS, then cleanup
RUN curl -sL https://deb.nodesource.com/setup_4.x | bash - && \
    apt-get install -yq --no-install-recommends nodejs bzip2 libfontconfig && \
    go get github.com/Masterminds/glide && \

    # PhantomJS
    curl -sL https://bitbucket.org/ariya/phantomjs/downloads/phantomjs-2.1.1-linux-x86_64.tar.bz2 | \
    tar -xjf - -C /opt && \
    ln -s /opt/phantomjs-2.1.1-linux-x86_64/bin/phantomjs /usr/local/bin/phantomjs && \

    # Cleanup
    apt-get clean && \
    rm -rf /var/lib/apt/lists/* /tmp/* /var/tmp/*

# Override this later
CMD echo "Ta da!"
