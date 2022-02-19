FROM ubuntu:latest

WORKDIR /setup
COPY . .

CMD "/bin/zsh"
