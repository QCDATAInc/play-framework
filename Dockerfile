FROM qcdatainc/centos-jdk
MAINTAINER QCData Inc <den-developers@qcdata.com>

RUN yum update -y && yum install -y \
    unzip
    
RUN curl -O http://downloads.typesafe.com/typesafe-activator/1.3.5/typesafe-activator-1.3.5.zip
RUN unzip typesafe-activator-1.3.5.zip -d / && rm typesafe-activator-1.3.5.zip

RUN chmod a+x /activator-dist-1.3.5/activator
RUN mkdir /playroom

ENV PATH $PATH:/activator-dist-1.3.5

EXPOSE 9000

WORKDIR /playroom

CMD ["activator", "run"]
