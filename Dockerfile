FROM debian:buster-slim

ENV DEBIAN_FRONTEND=noninteractive
RUN echo "APT::Get::Assume-Yes \"true\";" > /etc/apt/apt.conf.d/90assumeyes

# Accept the TEE EULA
RUN mkdir -p "/root/.microsoft/Team Foundation/4.0/Configuration/TEE-Mementos" \
 && cd "/root/.microsoft/Team Foundation/4.0/Configuration/TEE-Mementos" \
 && echo '<ProductIdData><eula-14.0 value="true"/></ProductIdData>' > "com.microsoft.tfs.client.productid.xml"

COPY install_dependencies.sh /opt/install_dependencies.sh

# Install required packages
RUN apt-get update && \
        apt-get install -y --no-install-recommends \
         ca-certificates \
         curl \
         jq \
         git \
         iputils-ping \
         libcurl4 \
         libunwind8 \
         netcat \
         libicu63 \
         unzip

# Accept EULA - needed for certain Microsoft packages like SQL Server Client Tools
ENV ACCEPT_EULA=Y

RUN /opt/install_dependencies.sh
# Clean system
RUN apt-get clean && rm -rf /var/lib/apt/lists/*

WORKDIR /vsts

COPY ./start.sh .
RUN chmod +x start.sh

CMD ["./start.sh"]
