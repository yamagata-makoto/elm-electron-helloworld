#!/usr/bin/env python
# -*- coding: utf-8 -*-

from bottle import route, run, template, static_file


@route('/static/<file_path:path>')
def static(file_path):
    return static_file(file_path, root='./static')

@route('/')
def index():
    return template('index')

if __name__ == '__main__':
    run(host='localhost', port=5000, debug=True)

