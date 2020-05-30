sudo wget "https://get.helm.sh/helm-v3.1.2-linux-amd64.tar.gz" -O /tmp/helm.tar.gz \
    && tar zxvf /tmp/helm.tar.gz -C /tmp \
    && sudo mv /tmp/linux-amd64/helm /usr/local/bin/helm
