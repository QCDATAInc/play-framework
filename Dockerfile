FROM qcdatainc/centos-jdk
MAINTAINER QCData Inc <den-developers@qcdata.com>

RUN yum update -y && yum install -y \
    unzip
    
RUN curl -O http://downloads.typesafe.com/typesafe-activator/1.3.2/typesafe-activator-1.3.2.zip
RUN unzip typesafe-activator-1.3.2.zip -d / && rm typesafe-activator-1.3.2.zip

RUN chmod a+x /activator-1.3.2/activator
RUN mkdir /playroom

ENV PATH $PATH:/activator-1.3.2

EXPOSE 9000

WORKDIR /playroom
CMD ["activator", "run"]