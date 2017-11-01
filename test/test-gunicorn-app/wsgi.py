#!/usr/bin/env python
# -*- coding: utf-8 -*-
from flask import Flask
application = Flask(__name__)


@application.route('/')
def hello_world():
    return 'Hello, World!'


if __name__ == '__main__':
    application.run(host='0.0.0.0', port=8080, debug=True)
