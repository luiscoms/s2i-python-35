FROM centos/python-35-centos7

# Set a privileged user to install another dependencies
USER root
RUN yum -y install epel-release &&\
    yum install -y libffi-devel &&\
    yum clean all -y

RUN pip install -U pip

# This default user after all instalation
USER 1001
