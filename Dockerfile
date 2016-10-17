# Inherit from Heroku's stack
FROM heroku/cedar:14

RUN mkdir -p /app/user
WORKDIR /app/user

ENV STACK "cedar-14"
ENV HOME /app

# Install the JDK
ENV CLI_VERSION 1.0.0-preview2-003121

ENV DOTNET_INSTALL_DIR "$PWD/.dotnetcli"
RUN curl -sSL https://raw.githubusercontent.com/dotnet/cli/rel/1.0.0/scripts/obtain/dotnet-install.sh | bash /dev/stdin --version "$CLI_VERSION" --install-dir "$DOTNET_INSTALL_DIR"
ENV PATH="$DOTNET_INSTALL_DIR:$PATH"
