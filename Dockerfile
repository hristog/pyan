FROM debian:buster-slim

WORKDIR /tmp/pyan

COPY . .
COPY graph.sh /pyan

RUN apt-get -y update \
	&& apt-get install -y --no-install-recommends \
		build-essential \
		git \
		graphviz \
		python3 \
		python3-pip \
		python-apt \
	&& rm -rf /var/lib/apt/lists \
	&& chmod +x /pyan/graph.sh

RUN python3 -m pip install --upgrade \
		pip \
		setuptools \
		wheel \
	&& python3 -m pip install --no-index --find-links file:///tmp/pyan \
	&& rm -rf /tmp/pyan

ENTRYPOINT ["/pyan/graph.sh"]

