FROM python-35-centos7-custom-alpine-candidate

COPY requirements.txt /opt/app-root/src
RUN pip install --no-cache-dir -r requirements.txt
COPY . /opt/app-root/src
