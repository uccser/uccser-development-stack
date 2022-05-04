#!/bin/bash
mkcert -install
mkdir certs
mkcert -key-file certs/key.pem -cert-file certs/cert.pem proxy.localhost email.localhost cs-unplugged.localhost *.cs-unplugged.localhost cs-field-guide.localhost *.cs-field-guide.localhost codewof.localhost *.codewof.localhost dthm4kaiako.localhost *.dthm4kaiako.localhost
