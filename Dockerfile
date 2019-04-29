# https://github.com/ianmiell/bash2py
# https://hub.docker.com/r/imiell/bash2py/dockerfile
# https://zwischenzugs.com/2016/08/29/bash-to-python-converter/

FROM debian
RUN apt-get -y update && \
    apt-get -y install zip build-essential autoconf bison python vim nano git && \
    apt-get clean
WORKDIR /opt
COPY bash2py-3.5.zip /opt
RUN unzip /opt/bash2py-3.5.zip
WORKDIR /opt/bash2py-3.5
RUN mkdir /opt/bash2py-3.5/data
RUN mkdir /root/bin
RUN sh install
ENV PATH=/usr/local/sbin:/usr/local/bin:/usr/sbin:/usr/bin:/sbin:/bin:/opt/bash2py-3.5/bash2py:/opt/bash2py-3.5/bash2py.py:
CMD ["bash"]
